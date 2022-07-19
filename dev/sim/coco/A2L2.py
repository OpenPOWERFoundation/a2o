# A2L2 Interface

import cocotb
from cocotb.triggers import Timer, RisingEdge
from cocotb.binary import BinaryValue
from cocotb.handle import Force
from cocotb.handle import Release

from dotmap import DotMap
import itertools

from OPEnv import *

# ------------------------------------------------------------------------------------------------
# Classes

'''
Data return timings from spec:

* Reload Data Coming
Indicates that reload data is coming in three cycles. This signal is required for L2 designs that return data in consecutive cycles, but can be
tied to a logic ‘0’ for designs that return data in every other cycle. For L2 designs that return data in consecutive cycles, this signal should be
asserted three cycles ahead of the first of two paired data beats. If more than two data beats will be presented consecutively, this signal should be
asserted once for the first set of two (paired) data beats and once for the second set of two (paired) data beats. Each assertion
should be three cycles ahead of the first beat of the paired set of data beats. This signal allows the A2 core to insert an issue bubble for the second
reload data beat to avoid flushing the processor pipe. This signal is not required to be asserted as described above for DITC return data.
For non-cacheable (I=1) reloads of one or two beats, this signal should be asserted three cycles ahead of the first (and possibly only) data beat transfer.

* Reload Data Valid
Indicates that reload data is coming in two cycles.  This signal qualifies the other reload interface signals sent in this cycle: reld_ditc, reld_core_tag, reld_crit_qw, and reld_qw.
If reld_data_vld is not active, then the qualified signals should be ignored.

* Reload Direct Inter-Thread Communication
Indicates that the reload data is associated with a DITC transfer instead of a standard load-ttype reload. This signal is qualified by reld_data_vld and determines the
interpretation of the reld_core_tag bus. DITC reload data transfers are always 64-Byte transfers that follow the same consecutive cycle or every-other-cycle behavior
as standard load-ttype reloads for the attached L2.

**i believe this means ditc can use either 1of2/2of2 or 1of2/-/-/2of2 pattern, but never requires data_coming (probs because pipe considerations not important for ditc)**

======
Cycles:

* d-3 (reld_data_coming)
Loads:
1. I=1: assert 3 cycs ahead of first transfer (two transfers only if 32B allowed)
2. I=0 data every other cycle: not asserted
3. I=0 data consecutive cycles: assert 3 cycs ahead of the 1of2 paired beats; if more than 2 beats are consecutive, assert 3 cycs ahead of each paired beat
DITC:
1. assertion not required **(or used by core?)**

* d-2 (reld_data_vld and qualified signals)
Loads:
1. assert 2 cycs ahead of data
DITC:
1. assert 2 cycs ahead of data and also assert reld_ditc

Cacheable Return Modes:
1. no back-to-back: coming=0
2. all back-to-back: coming=1/0/1
3. interleaved back-to-back: coming=1/0/0/0/1
4. mixed: legal cases for subxfers (?) **i think the 'mixed' aren't valid - xucr0[52] selects b2b mode**
   * 1 1 1 1   (no b2b)
   * 1 2 1     (mixed)
   * 1 1 2     (mixed)
   * 2 1 1     (mixed)
   * 2 2       (full b2b)
5. between subxfers a delay or other transaction can be inserted

?? xucr0[52] definition selects b2b but also says crit first; i guess this means crit first is allowed, but not required?? a2l2 spec says it is not required to send crit first

'''
class A2L2Trans(DotMap):
   '''A2L2 Transaction'''
   nextID = itertools.count()
   def __init__(self, sim, tid, tt, tag=None, addr=None, length=0, wimg=0, cycD=None, be=None, data=None, le=False):
      super().__init__()
      self.sim = sim
      self.id = next(A2L2Trans.nextID)
      self.tid = tid
      self.tt = tt
      self.tag = tag
      self.addr = addr
      if length == 0 or length == 3:
         raise Exception(f'A2L2Trans: bad length encode: {length}')
      elif length == 5:
         self.len = 8
      elif length == 6:
         self.len = 16
      elif length == 7:
         self.len = 32
      else:
         self.len = length
      self.wimg = wimg
      self.xfers = 1
      self.xferNum = 0
      self.xferCrit = 1
      self.beatNum = 1
      if cycD is not None:
         self.cycC = cycD - 3
         self.cycV = cycD - 2
         self.cycD = cycD
      self.be = f'{int(be, 16):032b}' if be is not None else None
      self.data = data
      self.LE = le
      self.done = False

      self.ieq1 = wimg & 0x4 == 0x4

      self.load = tt == 0x00 or tt == 0x08 or tt == 0x22 or tt == 0x09 or tt == 0x0B   # IF, LD, DITC, LARX, LARX_HINT
      self.store = tt == 0x20 or tt == 0x29                                            # ST, STCX

      if self.load:
         self.addr = self.addr & 0xFFFFFFF0
      elif self.store:
         #self.addr = self.addr & 0xFFFFFFE0 #wtf definitely 16B-aligned occurring
         #self.addr = self.addr & 0xFFFFFFF0 # keep low bits for 1B and 2B stores
         if self.be == None or self.data == None:
            raise Exception('A2L2Trans: store must have BE and data')
         else:
            self.len = 0
            self.storeStart = None
            for i in range(len(self.be)):
               if self.be[i] == '1':
                  if self.storeStart is None:
                     self.storeStart = i
                  self.len += 1
               elif self.storeStart is not None:
                  break
      else:
         raise Exception(f'A2L2Trans: unsupported ttype={tt}')

      self.ditc = tt == 0x22

      if self.ieq1:
         if tt == 0x00 or tt == 0x08:                    # IF, LD
            if len == 7:
               self.xfers = 2
         elif tt == 0x22:                                # DITC
               self.xfers = 4
      else:
         if self.load:
            self.xfers = 4
            self.xferCrit = ((self.addr & 0x30) >> 4) + 1
            self.addr = self.addr & 0xFFFFFFC0

   def readXfer(self):
      # read() returns this qw crit-first if cacheable!
      w0 = self.sim.mem.read(self.addr)
      w1 = self.sim.mem.read(self.addr+4)
      w2 = self.sim.mem.read(self.addr+8)
      w3 = self.sim.mem.read(self.addr+12)
      beatNum = self.beatNum
      if self.beatNum < self.xfers:
         self.beatNum += 1
         self.cycD += 1
         self.addr += 16        #wtf this is wrong - going to need to schedule the pattern when the trans is created!!!!!!!!!!!!!!!!!!!!!!!!
      return w0,w1,w2,w3,beatNum

   def doStore(self):
      addr = (((self.addr & 0xFFFFFFF0) + self.storeStart) >> 2) << 2   # word-align
      dataStart = self.storeStart*2
      if self.len == 1:
         word = self.sim.mem.read(addr)
         byte = self.addr & 0x3
         if self.LE:
            if byte == 0:
               mask = 0xFFFFFF00
            elif byte == 1:
               mask = 0xFFFF00FF
            elif byte == 2:
               mask = 0xFF00FFFF
            else:
               mask = 0x00FFFFFF
            word = (word & mask) | (int(self.data[dataStart:dataStart+2], 16) << (byte*8))
         else:
            if byte == 0:
               mask = 0x00FFFFFF
            elif byte == 1:
               mask = 0xFF00FFFF
            elif byte == 2:
               mask = 0xFFFF00FF
            else:
               mask = 0xFFFFFF00
            print(word, mask, dataStart, byte)
            word = (word & mask) | (int(self.data[dataStart:dataStart+2], 16) << ((3-byte)*8))
         self.sim.mem.write(addr, word)
         print(addr,word)
         #quit()

      elif self.len == 2:
         word = self.sim.mem.read(addr)
         hw = (self.addr & 0x2) >> 1
         if self.LE:
            if hw == 0:
               mask = 0xFFFF0000
            else:
               mask = 0x0000FFFF
            word = (word & mask) | (int(self.data[dataStart:dataStart+4], 16) << (hw*16))
         else:
            if hw == 0:
               mask = 0x0000FFFF
            else:
               mask = 0xFFFF0000
            word = (word & mask) | (int(self.data[dataStart:dataStart+4], 16) << ((1-hw)*16))
         self.sim.mem.write(addr, word)

      elif self.len == 4:
         self.sim.mem.write(addr, int(self.data[dataStart:dataStart+8], 16))

      elif self.len == 8:
         if self.LE:
            self.sim.mem.write(addr, int(self.data[dataStart:dataStart+16], 16))
            self.sim.mem.write(addr+4, int(self.data[dataStart+16:dataStart+32], 16))
         else:
            self.sim.mem.write(addr+4, int(self.data[dataStart:dataStart+16], 16))
            self.sim.mem.write(addr, int(self.data[dataStart+16:dataStart+32], 16))

      elif self.len == 16:
         if self.LE:
            self.sim.mem.write(addr, int(self.data[0:8], 16))
            self.sim.mem.write(addr+4, int(self.data[8:16], 16))
            self.sim.mem.write(addr+8, int(self.data[16:24], 16))
            self.sim.mem.write(addr+12, int(self.data[24:32], 16))
         else:
            self.sim.mem.write(addr+12, int(self.data[0:8], 16))
            self.sim.mem.write(addr+8, int(self.data[8:16], 16))
            self.sim.mem.write(addr+4, int(self.data[16:24], 16))
            self.sim.mem.write(addr, int(self.data[24:32], 16))

      elif self.len == 32:
         if self.LE:
            self.sim.mem.write(addr, int(self.data[0:8], 16))
            self.sim.mem.write(addr+4, int(self.data[8:16], 16))
            self.sim.mem.write(addr+8, int(self.data[16:24], 16))
            self.sim.mem.write(addr+12, int(self.data[24:32], 16))
            self.sim.mem.write(addr+16, int(self.data[32:40], 16))
            self.sim.mem.write(addr+20, int(self.data[40:48], 16))
            self.sim.mem.write(addr+24, int(self.data[48:56], 16))
            self.sim.mem.write(addr+28, int(self.data[56:64], 16))
         else:
            self.sim.mem.write(addr+28, int(self.data[0:8], 16))
            self.sim.mem.write(addr+24, int(self.data[8:16], 16))
            self.sim.mem.write(addr+20, int(self.data[16:24], 16))
            self.sim.mem.write(addr+16, int(self.data[24:32], 16))
            self.sim.mem.write(addr+12, int(self.data[32:40], 16))
            self.sim.mem.write(addr+8, int(self.data[40:48], 16))
            self.sim.mem.write(addr+4, int(self.data[48:56], 16))
            self.sim.mem.write(addr, int(self.data[56:64], 16))

      else:
            raise Exception(f'A2L2Trans: unsupported store len={self.len}')

# ------------------------------------------------------------------------------------------------
# Tasks

async def A2L2Driver(dut, sim):
   """A2L2 node interface"""

   transTypes = {
      '00': 'IFETCH',
      '08': 'LOAD',
      '20': 'STORE'
   }

   ok = True
   readPending = []
   countReads = 0
   mem = {}
   sim.msg('A2L2 Driver: started.')

   dut.an_ac_flh2l2_gate.value = 0

   while ok and not sim.done:

      await RisingEdge(dut.clk_1x)

      dut.an_ac_req_ld_pop.value = 0
      dut.an_ac_req_st_pop.value = 0
      dut.an_ac_req_st_gather.value = 0

      dut.an_ac_reld_data_coming.value = 0
      dut.an_ac_reld_data_vld.value = 0
      dut.an_ac_reld_ecc_err.value = 0
      dut.an_ac_reld_ecc_err_ue.value = 0
      dut.an_ac_reld_ditc.value = 0
      dut.an_ac_reld_l1_dump.value = 0
      dut.an_ac_req_spare_ctrl_a1.value = 0

      if sim.threads == 1:
         dut.an_ac_reservation_vld.value = 0
         dut.an_ac_stcx_complete.value = 0
         dut.an_ac_stcx_pass.value = 0
      else:
         for i in range(sim.threads):
            dut.an_ac_reservation_vld[i].value = 0
            dut.an_ac_stcx_complete[i].value = 0
            dut.an_ac_stcx_pass[i].value = 0

      dut.an_ac_sync_ack.value = 0
      dut.an_ac_icbi_ack.value = 0
      dut.an_ac_back_inv.value = 0

      # bummer IndexError: Slice indexing is not supported
      #dut.an_ac_reld_data[0:31].value = 0x48000000
      #dut.an_ac_reld_data[32:63].value = 0x48000000
      #dut.an_ac_reld_data[64:95].value = 0x48000000
      #dut.an_ac_reld_data[96:127].value = 0x48000000
      # bummer TypeError: Unsupported type for value assignment: <class 'str'> ('48000000480000004800000048000000')
      #dut.an_ac_reld_data.value = '48000000480000004800000048000000'
      #v = 0x48000000
      # bummer TypeError: Unsupported type for value assignment: <class 'str'> ('01001000000000000000000000000000010010000000000000000000000000000100100000000000000000000000000001001000000000000000000000000000')
      #dut.an_ac_reld_data.value = f'{v:0>32b}{v:0>32b}{v:0>32b}{v:0>32b}'
      # otay!
      #v1 = cocotb.binary.BinaryValue()
      #v1.assign(f'{v:0>32b}{v:0>32b}{v:0>32b}{v:0>32b}')
      #dut.an_ac_reld_data.value = v1.value

      if dut.ac_an_req.value:             # should first check ac_an_req_pwr_token prev cyc

         tt = hex(dut.ac_an_req_ttype, 2)
         transType = transTypes[tt]
         tid = hex(dut.ac_an_req_thread)
         ra = hex(dut.ac_an_req_ra, 8)
         tag = hex(dut.ac_an_req_ld_core_tag, 2)
         lenEnc = hex(dut.ac_an_req_ld_xfr_len)
         le = 'LE ' if dut.ac_an_req_endian.value else ''
         wimg_w = dut.ac_an_req_wimg_w.value
         wimg_i = dut.ac_an_req_wimg_i.value
         wimg_m = dut.ac_an_req_wimg_m.value
         wimg_g = dut.ac_an_req_wimg_g.value
         wimg = 0
         if wimg_w:
            wimg += 8
         if wimg_i:
            wimg += 4
         if wimg_m:
            wimg += 2
         if wimg_g:
            wimg += 1

         if transType == 'IFETCH' or transType == 'LOAD':
            # when allowing out-of-order, schedule reld once added
            if len(readPending) == 0:
               reldCyc = sim.cycle + 6                   # const for now
            else:
               reldCyc = readPending[-1].cycD + 4        # worst-case const for now
            trans = A2L2Trans(sim, tid, int(tt, 16), int(tag, 16), int(ra, 16), int(lenEnc, 16), wimg, reldCyc, le=le)
            readPending.append(trans)
            sim.msg(f'T{tid} {transType} {ra} tag={tag} len={trans.len} {le}WIMG:{wimg:X} reld data:{trans.cycD}')
         elif transType == 'STORE':
            # should verify st_data_pwr_token prev cycle
            be = hex(dut.ac_an_st_byte_enbl, 8)
            data = hex(dut.ac_an_st_data, 64)
            trans = A2L2Trans(sim, tid, int(tt, 16), int(tag, 16), int(ra, 16), int(lenEnc, 16), wimg, None, be=be, data=data, le=le)
            sim.msg(f'T{tid} {transType} {ra} tag={tag} len={trans.len} be={be} data={data} {le}WIMG:{wimg:X}')
            trans.doStore()
            dut.an_ac_req_st_pop.value = 1   #wtf can randomize, etc.
            #assert False, 'got a store'

      # data early indicator (d-3)
      dut.an_ac_reld_data_coming.value = 0
      for i in range(len(readPending)):
         trans = readPending[i]
         if trans.cycC == sim.cycle:
            dut.an_ac_reld_data_coming.value = 1
            if trans.xferNum == 0 and trans.xfers == 4:  # 4 beats b2b - need diff scheduling for all modes
               trans.cycC += 2

      # data valid indicator (d-2)
      dut.an_ac_reld_data_vld.value = 0
      dut.an_ac_reld_core_tag.value = 0x1F
      dut.an_ac_reld_ditc.value = 1
      dut.an_ac_reld_qw.value = 3
      dut.an_ac_reld_crit_qw.value = 1

      for i in range(len(readPending)):
         trans = readPending[i]
         if trans.cycV == sim.cycle:
            trans.xferNum += 1
            dut.an_ac_reld_data_vld.value = 1
            dut.an_ac_reld_core_tag.value = trans.tag
            dut.an_ac_reld_ditc.value = 1 if trans.ditc else 0
            dut.an_ac_reld_qw.value = trans.xferNum - 1
            dut.an_ac_reld_crit_qw.value = 1 if trans.xferNum == trans.xferCrit else 0
            if trans.xferNum < 4 and trans.xfers == 4:
               trans.cycV += 1

      # data beat
      if len(readPending) > 0 and readPending[0].cycD == sim.cycle:   # ordered

         trans = readPending[0]
         w0,w1,w2,w3,beatNum = trans.readXfer()

         v1 = cocotb.binary.BinaryValue()
         v1.assign(f'{w0:0>32b}{w1:0>32b}{w2:0>32b}{w3:0>32b}')
         dut.an_ac_reld_data.value = v1.value

         sim.msg(f'RELD tag={trans.tag:02X} {w0:08X}{w1:08X}{w2:08X}{w3:08X} {beatNum}of{trans.xfers}{" crit" if beatNum == trans.xferCrit else ""}')

         if beatNum == trans.xfers:
            trans.done = True
            countReads += 1   #wtf do this in monitor
            if len(readPending) == 1:
               readPending = []
            else:
               readPending = readPending[1:]
            dut.an_ac_req_ld_pop.value = 1   #wtf can randomize, etc.


# A2L2 Checker
# check protocol, etc.
async def A2L2Checker(dut, sim):
   """A2L2 interface checker """

   me = 'A2L2 Checker'
   ok = True
   sim.msg(f'{me}: started.')

   while ok:
      await RisingEdge(dut.clk_1x)


# A2L2 Monitor
# count transactions, etc.
# fail on bad addresses
async def A2L2Monitor(dut, sim):
   """A2L2 interface monitor"""

   me = 'A2L2 Monitor'
   ok = True
   start = len(sim.config.a2l2.badAddr) > 0
   sim.msg(f'{me}: started.')

   while start and ok:

      await RisingEdge(dut.clk_1x)

      if dut.ac_an_req.value:             # should first check ac_an_req_pwr_token prev cyc

         tt = hex(dut.ac_an_req_ttype, 2)
         if tt == '00':    #wtf someone should make this a enum/class
            ra = dut.ac_an_req_ra.value.integer
            for i in range(len(sim.config.a2l2.badAddr)):
               blk = sim.config.a2l2.badAddr[i]
               if 'I' in blk[2].upper():
                  blkStart = int(blk[0], 16)
                  blkEnd = int(blk[1], 16)
                  if ra >= blkStart and ra <= blkEnd:
                     ok = False
                     assert False, (f'{me}: Bad IFetch @={ra:08X}')  #wtf want this to end back in main code for summary

class A2L2:
   driver = A2L2Driver
   checker = A2L2Checker
   monitor = A2L2Monitor

   def __init__(self):
      pass

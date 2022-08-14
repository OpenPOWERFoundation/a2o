# OP Environment

import math

import cocotb
from cocotb.triggers import Timer
from cocotb.handle import Force
from cocotb.handle import Release

from dotmap import DotMap

# ------------------------------------------------------------------------------------------------
# Classes

class Sim(DotMap):

   def msg(self, m):
     self.dut._log.info(f'[{self.cycle:08d}] {m}')  #wtf do multiline if /n in m

   def __init__(self, dut, cfg=None):
      super().__init__()
      self.dut = dut
      self.resetDone = False

      # defaults

      self.sigClk = None
      self.sigRst = None
      self.sigClk2x = None
      self.sigClk4x = None

      self.threads = None
      self.resetAddr = None # 0xFFFFFFFC
      self.resetOp = 0x48000002
      self.memFiles = None

      self.resetCycle = 10
      self.hbCycles = 100
      self.maxCycles = 500

      self.config = DotMap()

      # json
      if cfg is not None:
         pass

      # runtime
      self.cycle = 0
      self.ok = True
      self.fail = None
      self.done = False

      if self.threads is None:
         try:
            v = dut.an_ac_pm_thread_stop[1].value
            self.threads = 2
         except:
            self.threads = 1
         self.msg(f'Set threads={self.threads}.')

   # helpers
   # wtf: assertFail doesn't work??#@#!!
   def safeint(self, v, n=10, assertFail=True, rc=False):
      try:
         res = int(v, n)
         ok = True
      except:
         self.ok = False
         self.fail = f'Bad integer conversion: {v},{n}'
         if assertFail:
            assert(False, self.fail)
         res = 0
         ok = False
      if rc:
         return (ok, res)
      else:
         return res


class TransQ(DotMap):
   def __init__(self):
      super().__init__()

# could allow registering callback for loads and/or stores in range
class Memory(DotMap):

   def __init__(self, sim, default=0, logReads=False, logStores=True):
      super().__init__()
      self.sim = sim
      self.data = {}
      self.le = False
      self.default = default  # default word data for unloaded
      self.logReads = logReads
      self.logStores = logStores

   def loadFile(self, filename, format='ascii', addr=0, le=0):
      # format # binary, ascii, ascii w/addr
      # le: reverse bytes
      try:
         if format == 'ascii':
            with open(filename, 'r') as f:
               lines = f.readlines()
               for line in lines:
                  self.data[addr] = int(line, 16)  # key is int
                  addr += 4
         elif format == 'binary':
            pass
         elif format == 'addrdata':
            pass
      except Exception as e:
         self.sim.msg(f'Error reading {filename}:\n{e}')
         raise IOError

   # word-aligned byte address
   def read(self, addr):
      try:
         addr = addr + 0
      except:
         addr = int(addr, 16)
      if self.logReads:
         if addr not in self.data:
            self.sim.msg(f'Mem Read: @{addr:08X} XXXXXXXX')
         else:
            self.sim.msg(f'Mem Read: @{addr:08X} {self.data[addr]:08X}')
      if addr in self.data:
         return self.data[addr]
      else:
         return self.default

   # word-aligned byte address + data
   def write(self, addr, data, be=None):
      try:
         addr = addr + 0
      except:
         addr = int(addr, 16)
      try:
         data = data + 0
      except:
         data = int(data, 16)

      if be is not None:
         try:
            be = be + 0
            be = f'{be:04b}'
         except:
            pass
         if be == '0000':
            return
         mask = 0
         for i in range(4):
            mask = mask << 8
            if be[i] == '1':
               mask += 0xFF
         data = (self.read(addr) & ~mask) | (data & mask)

      if self.logStores:
         if addr not in self.data:
            self.sim.msg(f'Mem Update: @{addr:08X} XXXXXXXX->{data:08X}')
         else:
            self.sim.msg(f'Mem Update: @{addr:08X} {self.data[addr]:08X}->{data:08X}')
      self.data[addr] = data

   def dump(self, start, end, cols=4, ascii=True, trimLeadingZeros=False, trimTrailingZeros=False):
      #wtf check for start>end and do in reverse
      #wtf trimTrailingZeros

      # word-align
      wordstart = (start >> 2) << 2
      wordend = (end >> 2) << 2
      # column align (handles powers of 2)
      c = int(math.log2(cols))
      # address of column 0 of first line
      linestart = (wordstart >> 2 >> c) << c << 2
      # column of wordstart
      colstart = (wordstart>>2) - (linestart>>2)
      # word address
      word = wordstart>>2

      text = ''
      row = ''
      rowTransDict = {}
      for i in range(32):
         rowTransDict[i] = '.'
      for i in range(127, 256):
         rowTransDict[i] = '.'

      # first line may be unaligned by row
      zeros = True
      if colstart != 0:
         textRow += f'{linestart:08X}: '
         for i in range(colstart):
            textRow += f'{"":8s} '
            row += f'{"":8s} '
         for i in range(colstart, cols):
            v = f'{self.read(word<<2):08X}'
            textRow += v + ' '
            if v != '00000000':
               zeros = False
            row += v
            word +=1
         rowb = bytearray.fromhex(row)
         rowb = rowb.decode('iso-8859-1').translate(rowTransDict)
         textRow += ('   ' +  rowb) if ascii else ''
         textRow += '\n'
         if not trimLeadingZeros or not zeros:
            text += textRow

      lastword = wordend >> 2
      while (word <= lastword):
         textRow = f'{word<<2:08X}: '
         row = ''
         for j in range(cols):
            v = f'{self.read(word<<2):08X}'
            textRow += v + ' '
            if v != '00000000':
               zeros = False
            row += v
            word += 1
            if (word > lastword):
               break
         rowb = bytearray.fromhex(row)
         rowb = rowb.decode('iso-8859-1').translate(rowTransDict)
         textRow += ('   ' + rowb) if ascii else ''
         textRow += '\n'
         if not trimLeadingZeros or not zeros:
            text += textRow

      return text

# ------------------------------------------------------------------------------------------------
# Functions

# the zero char pad should be based on pad value; currently 64 max
def hex(n, pad=0):
   if pad:
      return f'0000000000000000000000000000000000000000000000000000000000000000{n.value.hex()[2:].upper()}'[-pad:]
   else:
      return n.value.hex()[2:].upper()

# a2o test tb
# a2owb with external sim mem interface

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer
from cocotb.triggers import FallingEdge
from cocotb.handle import Force
from cocotb.handle import Release

import itertools
from dotmap import DotMap

from OPEnv import *
from A2O import *
from A2L2 import *

# ------------------------------------------------------------------------------------------------
# Tasks

# get rid of z on anything that will be sampled here
# is there a func to get all inputs?
async def init(dut, sim):
   """Initialize inputs. """

   dut.scan_in.value = 0
   dut.an_ac_reset_1_complete.value = 0
   dut.an_ac_reset_2_complete.value = 0
   dut.an_ac_reset_3_complete.value = 0
   dut.an_ac_reset_wd_complete.value = 0

   dut.an_ac_pm_fetch_halt.value = 0
   dut.an_ac_debug_stop.value = 0

   dut.an_ac_tb_update_enable.value = 1
   dut.an_ac_tb_update_pulse.value = 0 # tb clock if xucr0[tcs]=1 (must be <1/2 proc clk; tb pulse is 2x this clock)

   # why is coco turning [0] into non-vector??? or is that gpi/vpi/icarus/???
   if sim.threads == 1:
      dut.an_ac_pm_thread_stop.value = 0x1
      dut.an_ac_external_mchk.value = 0
      dut.an_ac_sleep_en.value = 0
      dut.an_ac_ext_interrupt.value = 0
      dut.an_ac_crit_interrupt.value = 0
      dut.an_ac_perf_interrupt.value = 0
      dut.an_ac_hang_pulse.value = 0
      dut.an_ac_uncond_dbg_event.value = 0
   else:
      for i in range(sim.threads):
         dut.an_ac_pm_thread_stop[i].value = 0x1
         dut.an_ac_external_mchk[i].value = 0
         dut.an_ac_sleep_en[i].value = 0
         dut.an_ac_ext_interrupt[i].value = 0
         dut.an_ac_crit_interrupt[i].value = 0
         dut.an_ac_perf_interrupt[i].value = 0
         dut.an_ac_hang_pulse[i].value = 0
         dut.an_ac_uncond_dbg_event[i].value = 0

   dut.wb_datr = 0x08675309

   await Timer(9, units='ns')

async def config(dut, sim):
   """Configure node, etc. """

   await RisingEdge(sim.sigClk)

async def genReset(dut, sim):
   """Generate reset. """

   first = True
   done = False

   while not done:
      await RisingEdge(sim.sigClk)
      if sim.cycle < sim.resetCycle:
         if first:
            dut._log.info(f'[{sim.cycle:08d}] Resetting...')
            first = False
         sim.sigRst.value = 1
      elif not done:
         dut._log.info(f'[{sim.cycle:08d}] Releasing reset.')
         sim.sigRst.value = 0
         done = True
         sim.resetDone = True

async def genClocks(dut, sim):
   """Generate 1x, 2x, 4x clock pulses, depending on parms. """

   if sim.sigClk2x is not None and sim.sigClk4x is not None:
      sim.clk1x = Clock(sim.sigClk, 8, 'ns')
      await cocotb.start(sim.clk1x.start())
      sim.clk2x = Clock(sim.sigClk2x, 4, 'ns')
      await cocotb.start(sim.clk2x.start())
      sim.clk4x = Clock(sim.sigClk4x, 2, 'ns')
      await cocotb.start(sim.clk4x.start())
   elif sim.sigClk2x is not None:
      sim.clk1x = Clock(sim.sigClk, 8, 'ns')
      await cocotb.start(sim.clk1x.start())
      sim.clk2x = Clock(sim.sigClk2x, 4, 'ns')
      await cocotb.start(sim.clk2x.start())
   else:
      sim.clk1x = Clock(sim.sigClk, 8, 'ns')
      await cocotb.start(sim.clk1x.start())


   for cycle in range(sim.maxCycles):

      sim.cycle = cycle

      if cycle % sim.hbCycles == 0:
         dut._log.info(f'[{cycle:08d}] ...tick...')

      await RisingEdge(sim.sigClk)

   dut._log.info(f'[{sim.cycle:08d}] Reached max cycle.  Clocks stopped.')
   sim.ok = False
   sim.fail = 'Max cycle reached.'

# 16B interface
async def memory(dut, sim):
   """Handle external memory interface (BE)"""

   me = 'Memory'
   ok = True
   sim.msg(f'{me}: started.')

   while ok:
      await RisingEdge(sim.sigClk)

      try:
         addr = dut.mem_adr.value.integer
         w0 = sim.mem.read(addr)
         w1 = sim.mem.read(addr+4)
         w2 = sim.mem.read(addr+8)
         w3 = sim.mem.read(addr+12)
         v = cocotb.binary.BinaryValue()
         v.assign(f'{w0:0>32b}{w1:0>32b}{w2:0>32b}{w3:0>32b}')
         dut.mem_dat.value = v.value
      except Exception as e:
         #print(e)
         dut.mem_dat.value = 0

      if dut.mem_wr_val.value:
         addr = dut.mem_adr.value.integer & 0xFFFFFF0
         dat = hex(dut.mem_wr_dat, 32)
         be = f'{dut.mem_wr_be.value.integer:016b}'
         for i in range(4):
            sim.mem.write(addr, dat[i*8:i*8+8], be[i*4:i*4+4])
            addr += 4

   sim.msg(f'{me}: ended.')

async def checker(dut, sim):
   """Watch for error indicators"""

   me = 'Node Checker'
   ok = True
   sim.msg(f'{me}: started.')

   # errors
   nodeCheckstop = dut.an_ac_checkstop
   errors = [
      {'name': 'A2Node Checkstop', 'sig': nodeCheckstop}
   ]

   while ok:

      await RisingEdge(sim.sigClk)

      if not sim.resetDone:
         continue

      for i in range(len(errors)):
          assert errors[i]['sig'].value == 0, f'{me} Error: {errors[i]["name"]}'


# ------------------------------------------------------------------------------------------------
# Interfaces

# SCOM
async def scom(dut, sim):
   """scom interface"""

   #dut.an_ac_scom_dch.value = 0
   #dut.an_ac_scom_cch.value = 0
   pass


# ------------------------------------------------------------------------------------------------
# Do something

# ************************************************************************************************
@cocotb.test()
async def tb_node(dut):
   """A Vulgar Display of OpenPower"""

   sim = Sim(dut)
   sim.mem = Memory(sim)
   sim.maxCycles = 20000
   sim.sigClk = dut.clk
   sim.sigRst = dut.rst
   sim.resetAddr = 0xFFFFFFFC

   '''
   # rom
   sim.memFiles = ['../mem/boot.bin.hex'] #wtf cmdline parm

   for i in range(len(sim.memFiles)):  #wtf el should be object with name, format, etc.
      sim.mem.loadFile(sim.memFiles[i])
   '''

   '''
   # rom+test; should end at 700
   sim.memFiles = [
      {
      'addr': 0x00000000,
      'file' : '../mem/test1/rom.init'
      },
      {
      'addr': 0x10000000,
      'file' : '../mem/test1/test.init'
      }
   ]
   '''
   '''
   # rom+bios; should end at 7FC
   sim.memFiles = [
      {
      'addr': 0x00000000,
      'file' : '../mem/test2/rom.init'
      }
   ]
   '''

   # rom+bios+arcitst
   sim.memFiles = [
      {
      'addr': 0x00000000,
      'file' : '../mem/test3/rom.init'
      }
   ]

   sim.a2o = A2OCore(sim, dut.c0.c0)
   sim.a2o.traceFacUpdates =  True
   sim.a2o.stopOnHang = 200
   sim.a2o.stopOnLoop = 50
   sim.a2o.iarPass = 0x7F0
   sim.a2o.iarFail = 0x7F4

   for i in range(len(sim.memFiles)):  #wtf el should be object with name, format, etc.
      sim.mem.loadFile(sim.memFiles[i]['file'], addr=sim.memFiles[i]['addr'])

   if sim.resetAddr is not None and sim.mem.read(sim.resetAddr) == sim.mem.default:
      sim.mem.write(sim.resetAddr, sim.resetOp)
      sim.msg(f'Set reset fetch @{sim.resetAddr:08X} to {sim.resetOp:08X}.')

   # init stuff
   await init(dut, sim)

   # start clocks,reset
   await cocotb.start(genClocks(dut, sim))
   await cocotb.start(genReset(dut, sim))

   # start interfaces
   await cocotb.start(scom(dut, sim))

   await cocotb.start(A2O.driver(dut, sim))

   await cocotb.start(memory(dut, sim))
   #await cocotb.start(A2L2.driver(dut, sim))
   await cocotb.start(A2L2.checker(dut, sim))
   await cocotb.start(A2L2.monitor(dut, sim, watchTrans=True))

   await Timer((sim.resetCycle + 5)*8, units='ns')
   if sim.sigRst.value != 0:
      sim.ok = False
      sim.fail = 'Reset active too long!'

   # config stuff

   # config'd in tri_a2o.vh

   # config for a2onode w/1 req buffer
   #sim.a2o.config.creditsLd = 1
   #sim.a2o.config.creditsSt = 1
   #sim.a2o.config.creditsLdStSingle = True

   # original fpga design needed 4 cred, no fwd (set in logic currently)
   #sim.a2o.lsDataForward = 0   # disable=1

   await A2O.config(dut, sim)

   await cocotb.start(A2O.checker(dut, sim))
   await cocotb.start(A2O.monitor(dut, sim))

   await cocotb.start(checker(dut, sim))

   # release thread(s)
   dut.an_ac_pm_thread_stop.value = 0
   await RisingEdge(sim.sigClk)
   dut._log.info(f'[{sim.cycle:08d}] Threads enabled.')

   # should await sim.done
   await Timer((sim.maxCycles+100)*8, units='ns')

   if sim.ok:
      dut._log.info(f'[{sim.cycle:08d}] You has opulence.')
   else:
      dut._log.info(f'[{sim.cycle:08d}] You are worthless and weak!')
      dut._log.info(f'[{sim.cycle:08d}] {sim.fail}')
      assert False

# ************************************************************************************************
@cocotb.test()
async def tb_node_wb(dut):
   """A2O with WB and cocoext slave"""

   sim = Sim(dut)
   sim.mem = Memory(sim)
   sim.maxCycles = 20000
   sim.sigClk = dut.clk
   sim.sigRst = dut.rst

   # rom+bios+arcitst
   sim.memFiles = [
      {
      'addr': 0x00000000,
      'file' : '../mem/test3/rom.init'
      }
   ]

   sim.a2o = A2OCore(sim, dut.c0.c0)
   sim.a2o.traceFacUpdates =  True
   sim.a2o.stopOnHang = 200
   sim.a2o.stopOnLoop = 50
   sim.a2o.iarPass = 0x7F0
   sim.a2o.iarFail = 0x7F4

   for i in range(len(sim.memFiles)):  #wtf el should be object with name, format, etc.
      sim.mem.loadFile(sim.memFiles[i]['file'], addr=sim.memFiles[i]['addr'])

   if sim.resetAddr is not None and sim.mem.read(sim.resetAddr) == sim.mem.default:
      sim.mem.write(sim.resetAddr, sim.resetOp)
      sim.msg(f'Set reset fetch @{sim.resetAddr:08X} to {sim.resetOp:08X}.')

   # init stuff
   await init(dut, sim)

   # start clocks,reset
   await cocotb.start(genClocks(dut, sim))
   await cocotb.start(genReset(dut, sim))

   # start interfaces
   await cocotb.start(scom(dut, sim))

   await cocotb.start(A2O.driver(dut, sim))

   # wishbone memory
   from cocotbext.wishbone.monitor import WishboneSlave
   # slave should take non-iterator for datgen and call it with f(self.bus) if next(f) fails
   wbSignals = {"cyc": "wb_cyc",
                "stb": "wb_stb",
                "adr": "wb_adr",
                "we":  "wb_we",
                "sel": "wb_sel",
                "datwr": "wb_datw",
                "ack":  "wb_ack",
                "datrd": "wb_datr"
               }
   a2l2Iterable = A2L2Iterable()
   wbs = WishboneSlave(dut, None, sim.sigClk, width=32, signals_dict=wbSignals, datgen=iter(a2l2Iterable))
   A2L2.addWBSlave(dut, sim, wbSignals)
   wbs.add_callback(A2L2.wbSlave)

   #await cocotb.start(A2L2.driver(dut, sim))
   await cocotb.start(A2L2.checker(dut, sim))
   await cocotb.start(A2L2.monitor(dut, sim, watchTrans=True))

   await Timer((sim.resetCycle + 5)*8, units='ns')
   if sim.sigRst.value != 0:
      sim.ok = False
      sim.fail = 'Reset active too long!'

   await A2O.config(dut, sim)

   await cocotb.start(A2O.checker(dut, sim))
   await cocotb.start(A2O.monitor(dut, sim))

   await cocotb.start(checker(dut, sim))

   # release thread(s)
   dut.an_ac_pm_thread_stop.value = 0
   await RisingEdge(sim.sigClk)
   dut._log.info(f'[{sim.cycle:08d}] Threads enabled.')

   # should await sim.done
   await Timer((sim.maxCycles+100)*8, units='ns')

   if sim.ok:
      dut._log.info(f'[{sim.cycle:08d}] You has opulence.')
   else:
      dut._log.info(f'[{sim.cycle:08d}] You are worthless and weak!')
      dut._log.info(f'[{sim.cycle:08d}] {sim.fail}')
      assert False

# ************************************************************************************************
@cocotb.test()
async def tb_litex(dut):
   """A2O with litex interface"""

   sim = Sim(dut)
   sim.mem = Memory(sim)
   sim.maxCycles = 20000
   sim.resetAddr = None    # set to 00000000 in rtl define
   sim.sigClk = dut.clk
   sim.sigRst = dut.rst

   # rom+bios+arcitst
   sim.memFiles = [
      {
      'addr': 0x00000000,
      'file' : '../mem/test3/rom.init'
      }
   ]

   sim.config.a2l2 = DotMap({
         'badAddr': [('E0','E0', 'IRW')]
   })

   sim.a2o = A2OCore(sim, dut.c0.c0)
   sim.a2o.traceFacUpdates =  True
   sim.a2o.stopOnHang = 200
   sim.a2o.stopOnLoop = 50
   sim.a2o.iarPass = 0x7F0
   sim.a2o.iarFail = 0x7F4

   for i in range(len(sim.memFiles)):
      sim.mem.loadFile(sim.memFiles[i]['file'], addr=sim.memFiles[i]['addr'])

   if sim.resetAddr is not None and sim.mem.read(sim.resetAddr) == sim.mem.default:
      sim.mem.write(sim.resetAddr, sim.resetOp)
      sim.msg(f'Set reset fetch @{sim.resetAddr:08X} to {sim.resetOp:08X}.')

   # init stuff
   dut.externalInterrupt.value = 0
   dut.externalInterruptS.value = 0
   dut.timerInterrupt.value = 0
   dut.softwareInterrupt.value = 0
   dut.cfg_wr.value = 0

   # start clocks,reset
   await cocotb.start(genClocks(dut, sim))
   await cocotb.start(genReset(dut, sim))

   # start interfaces
   await cocotb.start(scom(dut, sim))

   await cocotb.start(A2O.driver(dut, sim))

   # wishbone memory
   from cocotbext.wishbone.monitor import WishboneSlave
   # slave should take non-iterator for datgen and call it with f(self.bus) if next(f) fails
   wbSignals = {"cyc": "wb_cyc",
                "stb": "wb_stb",
                "adr": "wb_adr",
                "we":  "wb_we",
                "sel": "wb_sel",
                "datwr": "wb_datw",
                "ack":  "wb_ack",
                "datrd": "wb_datr"
               }
   a2l2Iterable = A2L2Iterable()
   wbs = WishboneSlave(dut, None, sim.sigClk, width=32, signals_dict=wbSignals, datgen=iter(a2l2Iterable))
   A2L2.addWBSlave(dut, sim, wbSignals)
   wbs.add_callback(A2L2.wbSlave)

   #await cocotb.start(A2L2.driver(dut, sim))
   await cocotb.start(A2L2.checker(dut, sim))
   await cocotb.start(A2L2.monitor(dut, sim, watchTrans=True))

   await Timer((sim.resetCycle + 5)*8, units='ns')
   if dut.rst.value != 0:
      sim.ok = False
      sim.fail = 'Reset active too long!'

   # config stuff

   await A2O.config(dut, sim)

   await cocotb.start(A2O.checker(dut, sim))
   await cocotb.start(A2O.monitor(dut, sim))

   # should await sim.done
   await Timer((sim.maxCycles+100)*8, units='ns')

   if sim.ok:
      dut._log.info(f'[{sim.cycle:08d}] You has opulence.')
   else:
      dut._log.info(f'[{sim.cycle:08d}] You are worthless and weak!')
      dut._log.info(f'[{sim.cycle:08d}] {sim.fail}')
      assert False

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

   dut.nclk.value = 0
   dut.scan_in.value = 0
   #dut.an_ac_scan_type_dc.value = 0x0
   #dut.an_ac_chipid_dc.value = 0x0
   #dut.an_ac_coreid.value = 0x0
   #dut.an_ac_scom_sat_id.value = 0x0

   #dut.an_ac_lbist_ary_wrt_thru_dc.value = 0
   #dut.an_ac_gsd_test_enable_dc.value = 0
   #dut.an_ac_gsd_test_acmode_dc.value = 0
   #dut.an_ac_ccflush_dc.value = 0
   #dut.an_ac_ccenable_dc.value = 0
   #dut.an_ac_lbist_en_dc.value = 0
   #dut.an_ac_lbist_ip_dc.value = 0
   #dut.an_ac_lbist_ac_mode_dc.value = 0
   #dut.an_ac_scan_diag_dc.value = 0
   #dut.an_ac_scan_dis_dc_b.value = 0

   #dut.an_ac_rtim_sl_thold_8.value = 0
   #dut.an_ac_func_sl_thold_8.value = 0
   #dut.an_ac_func_nsl_thold_8.value = 0
   #dut.an_ac_ary_nsl_thold_8.value = 0
   #dut.an_ac_sg_8.value = 0
   #dut.an_ac_fce_8.value = 0
   #dut.an_ac_abst_scan_in.value = 0

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

   await Timer(9, units='ns')

async def config(dut, sim):
   """Configure node, etc. """

   await RisingEdge(dut.clk_1x)

# trilib/tri.vh:`define  NCLK_WIDTH  6   // 0  1xClk, 1  Reset, 2  2xClk, 3  4xClk,  4  Even .5xClk,  5 Odd .5xClk
async def genReset(dut, sim):
   """Generate reset. """

   first = True
   done = False

   while not done:
      await RisingEdge(dut.clk_1x)
      if sim.cycle < sim.resetCycle:
         if first:
            dut._log.info(f'[{sim.cycle:08d}] Resetting...')
            first = False
         dut.nclk[1].value = 1
      elif not done:
         dut._log.info(f'[{sim.cycle:08d}] Releasing reset.')
         dut.nclk[1].value = 0
         done = True
         sim.resetDone = True

async def genClocks(dut, sim):
   """Generate 1x, 2x, 4x clock pulses, depending on parms. """

   if sim.clk2x and sim.clk4x:
      sim.clk1x = Clock(dut.nclk[0], 8, 'ns')
      await cocotb.start(sim.clk1x.start())
      sim.clk2x = Clock(dut.nclk[2], 4, 'ns')
      await cocotb.start(sim.clk2x.start())
      sim.clk4x = Clock(dut.nclk[3], 2, 'ns')
      await cocotb.start(sim.clk4x.start())
   elif sim.clk2x:
      sim.clk1x = Clock(dut.nclk[0], 8, 'ns')
      await cocotb.start(sim.clk1x.start())
      sim.clk2x = Clock(dut.nclk[2], 4, 'ns')
      await cocotb.start(sim.clk2x.start())
   else:
      sim.clk1x = Clock(dut.nclk[0], 8, 'ns')
      await cocotb.start(sim.clk1x.start())


   for cycle in range(sim.maxCycles):

      sim.cycle = cycle

      if cycle % sim.hbCycles == 0:
         dut._log.info(f'[{cycle:08d}] ...tick...')

      await RisingEdge(dut.clk_1x)

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
      await RisingEdge(dut.clk_1x)

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

      await RisingEdge(dut.clk_1x)

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

@cocotb.test()
async def tb_node(dut):
   """A Vulgar Display of OpenPower"""

   sim = Sim(dut)
   sim.mem = Memory(sim)
   sim.maxCycles = 20000

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

   sim.a2o = A2OCore(sim, dut.c0.c0)
   sim.a2o.traceFacUpdates =  True
   sim.a2o.stopOnHang = 200
   sim.a2o.stopOnLoop = 50
   sim.a2o.iarPass = 0x7F0
   sim.a2o.iarFail = 0x7F4

   await cocotb.start(A2O.driver(dut, sim))

   await cocotb.start(memory(dut, sim))
   #await cocotb.start(A2L2.driver(dut, sim))
   await cocotb.start(A2L2.checker(dut, sim))
   await cocotb.start(A2L2.monitor(dut, sim, watchTrans=True))

   await Timer((sim.resetCycle + 5)*8, units='ns')
   if dut.nclk[1].value != 0:
      sim.ok = False
      sim.fail = 'Reset active too long!'

   # config stuff

   # config for a2onode w/1 req buffer
   # a2node_verilotor defines have these set already
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
   await RisingEdge(dut.clk_1x)
   dut._log.info(f'[{sim.cycle:08d}] Threads enabled.')

   # should await sim.done
   await Timer((sim.maxCycles+100)*8, units='ns')

   if sim.ok:
      dut._log.info(f'[{sim.cycle:08d}] You has opulence.')
   else:
      dut._log.info(f'[{sim.cycle:08d}] You are worthless and weak!')
      dut._log.info(f'[{sim.cycle:08d}] {sim.fail}')
      assert False

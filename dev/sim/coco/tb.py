# a2o test tb

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
   dut.an_ac_scan_type_dc.value = 0x0
   dut.an_ac_chipid_dc.value = 0x0
   dut.an_ac_coreid.value = 0x0
   dut.an_ac_scom_sat_id.value = 0x0

   dut.an_ac_lbist_ary_wrt_thru_dc.value = 0
   dut.an_ac_gsd_test_enable_dc.value = 0
   dut.an_ac_gsd_test_acmode_dc.value = 0
   dut.an_ac_ccflush_dc.value = 0
   dut.an_ac_ccenable_dc.value = 0
   dut.an_ac_lbist_en_dc.value = 0
   dut.an_ac_lbist_ip_dc.value = 0
   dut.an_ac_lbist_ac_mode_dc.value = 0
   dut.an_ac_scan_diag_dc.value = 0
   dut.an_ac_scan_dis_dc_b.value = 0

   dut.an_ac_rtim_sl_thold_8.value = 0
   dut.an_ac_func_sl_thold_8.value = 0
   dut.an_ac_func_nsl_thold_8.value = 0
   dut.an_ac_ary_nsl_thold_8.value = 0
   dut.an_ac_sg_8.value = 0
   dut.an_ac_fce_8.value = 0
   dut.an_ac_abst_scan_in.value = 0

   dut.an_ac_checkstop.value = 0

   dut.an_ac_reset_1_complete.value = 0
   dut.an_ac_reset_2_complete.value = 0
   dut.an_ac_reset_3_complete.value = 0
   dut.an_ac_reset_wd_complete.value = 0

   dut.an_ac_pm_fetch_halt.value = 0
   dut.an_ac_debug_stop.value = 0

   dut.an_ac_tb_update_enable.value = 1
   dut.an_ac_tb_update_pulse.value = 0 # tb clock if xucr0[tcs]=1 (must be <1/2 proc clk; tb pulse is 2x this clock)

   # why is coco turning [0] into non-vector??? or is that gpi/vpi/icarus/???
   if sim.a2o.config.threads == 1:
      dut.an_ac_pm_thread_stop.value = 0x1
      dut.an_ac_external_mchk.value = 0
      dut.an_ac_sleep_en.value = 0
      dut.an_ac_ext_interrupt.value = 0
      dut.an_ac_crit_interrupt.value = 0
      dut.an_ac_perf_interrupt.value = 0
      dut.an_ac_hang_pulse.value = 0
      dut.an_ac_uncond_dbg_event.value = 0
   else:
      for i in range(sim.a2o.config.threads):
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
   """Configure core, etc. """

   #wtf make A2 module to do core-specific stuff
   # A2L2 load/store credits
   creditsLd = dut.c0.lq0.lsq.arb.load_cred_cnt_d           # 8 max
   creditsLdMax = dut.c0.lq0.lsq.arb.ld_cred_max            # hdw check
   creditsSt = dut.c0.lq0.lsq.arb.store_cred_cnt_d          # 32 max
   creditsStMax = dut.c0.lq0.lsq.arb.st_cred_max            # hdw check
   creditsLdStSingle = dut.c0.lq0.lsq.arb.spr_xucr0_cred_d  # 1 total credit
   #wtf this affects A2L2 - default=1
   #  dut.c0.lq0.lsq.arb.spr_lsucr0_b2b_q   # 0=crit first, every other 1=crit first, b2b **the a2l2 spec does not say crit must be first**
   lsucr0_d = dut.c0.lq0.ctl.spr.lq_spr_cspr.lsucr0_d
   lsucr0_q = dut.c0.lq0.ctl.spr.lq_spr_cspr.lsucr0_q
   cpcr2_d = dut.c0.iuq0.iuq_ifetch0.iuq_spr0.cpcr2_d
   cpcr2_q = dut.c0.iuq0.iuq_ifetch0.iuq_spr0.cpcr2_l2
   cpcr2_act = dut.c0.iuq0.iuq_ifetch0.iuq_spr0.cpcr2_wren
   cpcr4_d = dut.c0.iuq0.iuq_ifetch0.iuq_spr0.cpcr4_d
   cpcr4_q = dut.c0.iuq0.iuq_ifetch0.iuq_spr0.cpcr4_l2
   cpcr4_act = dut.c0.iuq0.iuq_ifetch0.iuq_spr0.cpcr4_wren

   await RisingEdge(sim.sigClk)

   if sim.config.core.creditsLd is not None:
      creditsLd.value = Force(sim.config.core.creditsLd)
      creditsLdMax.value = Force(sim.config.core.creditsLd)
      sim.msg(f'A2L2: load credits changed from {creditsLd.value.integer} to {sim.config.core.creditsLd}.')
      await RisingEdge(sim.sigClk)
      creditsLd.value = Release()

   if sim.config.core.creditsSt is not None:
      creditsSt.value = Force(sim.config.core.creditsSt)
      creditsStMax.value = Force(sim.config.core.creditsSt)
      sim.msg(f'A2L2: store credits changed from {creditsSt.value.integer} to {sim.config.core.creditsSt}.')
      await RisingEdge(sim.sigClk)
      creditsSt.value = Release()

   if sim.config.core.creditsLdStSingle is not None:
      v = 1 if sim.config.core.creditsLdStSingle else 0
      creditsLdStSingle.value = Force(v)
      sim.msg(f'A2L2: only one load OR store allowed when credits=1/1.')
      await RisingEdge(sim.sigClk)
      creditsLdStSingle.value = Release()

   #wtf make a function - needs mask,thread
   if sim.config.core.lsDataForward is not None:
      v = 1 if sim.config.core.lsDataForward else 0
      sim.msg(f'LSUCR0 = {hex(lsucr0_q.value), 8}')
      sim.msg(f'Setting LSUCR0[DFWD] = {v}.')
      v = v << 2
      v = (lsucr0_q.value.integer & ~0x4) | v
      lsucr0_d.value = Force(v)
      await RisingEdge(sim.sigClk)
      lsucr0_d.value = Release()
      sim.msg(f'LSUCR0 = {hex(lsucr0_q.value), 8}')

   if sim.config.core.cpcr4_sq_cnt is not None:
      v = sim.config.core.cpcr4_sq_cnt
      sim.msg(f'CPCR4 = {hex(cpcr4_q[0], 8)}')
      sim.msg(f'Setting CPCR4[SQ_CNT] = {v}.')
      v = v << 0
      v = (cpcr4_q[0].value.integer & ~0x1F) | v
      await RisingEdge(sim.sigClk)  # need cuz of act?
      cpcr4_d[0].value = Force(v)
      cpcr4_act.value = Force(1)
      await RisingEdge(sim.sigClk)
      await RisingEdge(sim.sigClk)  # need cuz of act?
      cpcr4_d[0].value = Release()
      cpcr4_act.value = Release()
      sim.msg(f'CPCR4 = {hex(cpcr4_q[0], 8)}')

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
   # or raise SimTimeoutError

# ------------------------------------------------------------------------------------------------
# Interfaces

# SCOM
async def scom(dut, sim):
   """scom interface"""

   dut.an_ac_scom_dch.value = 0
   dut.an_ac_scom_cch.value = 0


# ------------------------------------------------------------------------------------------------
# Do something

# ************************************************************************************************
@cocotb.test()
async def tb(dut):
   """A Vulgar Display of OpenPower"""

   sim = Sim(dut)
   sim.mem = Memory(sim)
   sim.maxCycles = 20000
   sim.sigClk = dut.clk
   sim.sigRst = dut.rst
   sim.resetAddr = 0xFFFFFFFC
   # original fpga design needed 4 cred, no fwd (set in logic currently)
   #sim.config.core.creditsSt = 32
   #sim.config.core.lsDataForward = 0   # disable=1
   #sim.config.core.cpcr4_sq_cnt = 0     # default=6

   sim.a2o = A2OCore(sim, dut.c0.c0)
   sim.a2o.traceFacUpdates =  True
   sim.a2o.stopOnHang = 200
   sim.a2o.stopOnLoop = 50
   sim.a2o.iarPass = 0x7F0
   sim.a2o.iarFail = 0x7F4

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

   '''
   # rom+bios+dhrystone
   sim.memFiles = [
      {
      'addr': 0x00000000,
      'file' : '../mem/dhrystone/rom.init'
      }
   ]
   '''

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

   sim.a2o = A2OCore(sim)
   sim.a2o.traceFacUpdates =  True
   sim.a2o.stopOnLoop = 50
   sim.a2o.iarPass = 0x7F0
   sim.a2o.iarFail = 0x7F4

   await cocotb.start(A2O.driver(dut, sim))
   await cocotb.start(A2O.checker(dut, sim))
   await cocotb.start(A2O.monitor(dut, sim))

   await cocotb.start(A2L2.driver(dut, sim))
   await cocotb.start(A2L2.checker(dut, sim))
   await cocotb.start(A2L2.monitor(dut, sim))

   await Timer((sim.resetCycle + 5)*8, units='ns')
   if sim.sigRst.value != 0:
      sim.ok = False
      sim.fail = 'Reset active too long!'

   # config stuff
   #await config(dut, sim)

   # monitor stuff
   #await cocotb.start(coreMonitor(dut, sim))

   # release thread(s)
   dut.an_ac_pm_thread_stop.value = 0
   await RisingEdge(sim.sigClk)
   dut._log.info(f'[{sim.cycle:08d}] Threads enabled.')

   # what should this wait?  genClocks?
   await Timer((sim.maxCycles+100)*8, units='ns')

   if sim.ok:
      dut._log.info(f'[{sim.cycle:08d}] You has opulence.')
   else:
      dut._log.info(f'[{sim.cycle:08d}] You are worthless and weak!')
      dut._log.info(f'[{sim.cycle:08d}] {sim.fail}')
      assert False

# ************************************************************************************************
@cocotb.test()
async def tb_smt(dut):
   """A Vulgar Display of OpenPower"""

   sim = Sim(dut)
   sim.mem = Memory(sim)
   sim.maxCycles = 20000
   sim.sigClk = dut.clk
   sim.sigRst = dut.rst
   #t1 takes prot exc??? ierat 14 should be ok.  set to 0 in tri_a2o.vh for now
   #sim.resetAddr = 0xFFFFFFFC
   #t1 starts but need more stuff; 2 printf buffers, etc.

   # original fpga design needed 4 cred, no fwd (set in logic currently)
   #sim.config.core.creditsSt = 32
   #sim.config.core.lsDataForward = 0   # disable=1
   #sim.config.core.cpcr4_sq_cnt = 0     # default=6

   sim.a2o = A2OCore(sim, dut.c0.c0)
   sim.a2o.config.threads = 2
   sim.a2o.traceFacUpdates =  True
   sim.a2o.stopOnHang = 200
   sim.a2o.stopOnLoop = 50
   sim.a2o.iarPass = 0x7F0
   sim.a2o.iarFail = 0x7F4

   # rom+bios+arcitst
   sim.memFiles = [
      {
      'addr': 0x00000000,
      'file' : '../mem/test3/rom_smt.init'
      }
   ]

   '''
   # rom+bios+dhrystone
   sim.memFiles = [
      {
      'addr': 0x00000000,
      'file' : '../mem/dhrystone/rom.init'
      }
   ]
   '''

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

   sim.a2o = A2OCore(sim)
   sim.a2o.traceFacUpdates =  True
   sim.a2o.stopOnLoop = 50
   sim.a2o.iarPass = 0x7F0
   sim.a2o.iarFail = 0x7F4

   await cocotb.start(A2O.driver(dut, sim))
   await cocotb.start(A2O.checker(dut, sim))
   await cocotb.start(A2O.monitor(dut, sim))

   await cocotb.start(A2L2.driver(dut, sim))
   await cocotb.start(A2L2.checker(dut, sim))
   await cocotb.start(A2L2.monitor(dut, sim))

   await Timer((sim.resetCycle + 5)*8, units='ns')
   if sim.sigRst.value != 0:
      sim.ok = False
      sim.fail = 'Reset active too long!'

   # config stuff
   #await config(dut, sim)

   # monitor stuff
   #await cocotb.start(coreMonitor(dut, sim))

   # release thread(s)
   dut.an_ac_pm_thread_stop.value = 0
   await RisingEdge(sim.sigClk)
   dut._log.info(f'[{sim.cycle:08d}] Threads enabled.')

   # what should this wait?  genClocks?
   await Timer((sim.maxCycles+100)*8, units='ns')

   if sim.ok:
      dut._log.info(f'[{sim.cycle:08d}] You has opulence.')
   else:
      dut._log.info(f'[{sim.cycle:08d}] You are worthless and weak!')
      dut._log.info(f'[{sim.cycle:08d}] {sim.fail}')
      assert False

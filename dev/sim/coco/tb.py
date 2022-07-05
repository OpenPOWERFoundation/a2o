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
from A2L2 import *

# ------------------------------------------------------------------------------------------------
# Tasks

# get rid of z on anything that will be sampled here
# is there a func to get all inputs?
async def init(dut, sim):
   """Initialize inputs. """

   dut.nclk.value = 0
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
   """Configure core, etc. """

   #wtf make A2 module to do core-specific stuff
   # A2L2 load/store credits
   creditsLd = dut.c0.lq0.lsq.arb.load_cred_cnt_d           # 8 max
   creditsLdMax = dut.c0.lq0.lsq.arb.ld_cred_max            # hdw check
   creditsSt = dut.c0.lq0.lsq.arb.store_cred_cnt_d          # 32 max
   creditsStMax = dut.c0.lq0.lsq.arb.st_cred_max            # hdw check
   creditsLdStSingle = dut.c0.lq0.lsq.arb.spr_xucr0_cred_d.value   # 1 total credit
   #wtf this affects A2L2 - default=1
   #creditsLdStSingle = dut.c0.lq0.lsq.arb.spr_lsucr0_b2b_q.value   # 0=crit first, every other 1=crit first, b2b **the a2l2 spec does not say crit must be first**

   await RisingEdge(dut.clk_1x)

   if sim.config.core.creditsLd is not None:
      creditsLd.value = Force(sim.config.core.creditsLd)
      creditsLdMax.value = Force(sim.config.core.creditsLd)
      sim.msg(f'A2L2: load credits changed from {creditsLd.value.integer} to {sim.config.core.creditsLd}.')
      await RisingEdge(dut.clk_1x)
      creditsLd.value = Release()

   if sim.config.core.creditsSt is not None:
      creditsSt.value = Force(sim.config.core.creditsSt)
      creditsStMax.value = Force(sim.config.core.creditsSt)
      sim.msg(f'A2L2: store credits changed from {creditsSt.value.integer} to {sim.config.core.creditsSt}.')
      await RisingEdge(dut.clk_1x)
      creditsSt.value = Release()

   if sim.config.core.creditsLdStSingle:
      creditsLdStSingle = Force(1)
      sim.msg(f'A2L2: only one load OR store allowed when credits=1/1.')
      await RisingEdge(dut.clk_1x)
      creditsLdStSingle.value = Release()

   await RisingEdge(dut.clk_1x)

async def coreMonitor(dut, sim):
   """Watch for core events. """

   me = 'a2oMonitor'

   # errors
   creditsLdErr = dut.c0.lq0.lsq.arb.ld_cred_err_q
   creditsStErr = dut.c0.lq0.lsq.arb.st_cred_err_q

   # watches
   iu0Comp = dut.c0.iu_lq_i0_completed
   iu0CompIFAR = dut.c0.iuq0.iuq_cpl_top0.iuq_cpl0.cp2_i0_ifar
   iu1Comp = dut.c0.iu_lq_i1_completed
   iu1CompIFAR = dut.c0.iuq0.iuq_cpl_top0.iuq_cpl0.cp2_i1_ifar
   iuCompFlushIFAR = dut.c0.cp_t0_flush_ifar
   cp3NIA = dut.c0.iuq0.iuq_cpl_top0.iuq_cpl0.iuq_cpl_ctrl.cp3_nia_q           # nia after last cycle's completions

   # queue depths, etc.

   errors = [
      {'name': 'Load Credits', 'sig': creditsLdErr},
      {'name': 'Store Credits', 'sig': creditsStErr},
   ]

   done = False

   while not done:

      await RisingEdge(dut.clk_1x)

      for i in range(len(errors)):
          assert errors[i]['sig'].value == 0, f'{me} Error: {errors[i]["name"]}'

      comp = ''
      if iu0Comp.value == 1:
         comp = f'0:{int(iu0CompIFAR.value.binstr + "00", 2):06X} '

      if iu1Comp.value == 1:
         comp = f'{comp}1:{int(iu1CompIFAR.value.binstr + "00", 2):06X} '

      if comp != '':
         comp = f'{comp}{int(iuCompFlushIFAR.value.binstr + "00", 2):016X}'
         sim.msg(f'C0: CP {comp}')


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

# ------------------------------------------------------------------------------------------------
# Interfaces

# SCOM
async def scom(dut, sim):
   """scom interface"""

   dut.an_ac_scom_dch.value = 0
   dut.an_ac_scom_cch.value = 0


# ------------------------------------------------------------------------------------------------
# Do something

@cocotb.test()
async def tb(dut):
   """A Vulgar Display of OpenPower"""

   sim = Sim(dut)
   sim.mem = Memory(sim)
   #sim.memFiles = ['../mem/boot_ieq1.bin.hex'] #wtf cmdline parm
   sim.memFiles = ['../mem/boot.bin.hex'] #wtf cmdline parm

   for i in range(len(sim.memFiles)):  #wtf el should be object with name, format, etc.
      sim.mem.loadFile(sim.memFiles[i])
   if sim.resetAddr is not None and sim.mem.read(sim.resetAddr) == sim.mem.default:
      sim.mem.write(sim.resetAddr, sim.resetOp)
      sim.msg(f'Set reset fetch @{sim.resetAddr:08X} to {sim.resetOp:08X}.')

#  dut.cocotb_icarus
#  dut._log.info(sim.top.__dict__)
#  {'_handle': <cocotb.simulator.gpi_sim_hdl at 0x55f8fa8a3aa0>,
#   '_len': None, '_sub_handles': {}, '_invalid_sub_handles': set(), '_name': 'cocotb_icarus',
#   '_type': 'GPI_MODULE', '_fullname': 'cocotb_icarus(GPI_MODULE)', '_path': 'cocotb_icarus.cocotb_icarus',
#   '_log': <SimBaseLog cocotb.cocotb_icarus (INFO)>, '_def_name': 'cocotb_icarus', '_def_file': './cocotb_icarus.v',
#   '_discovered': False
#  }
#  dut
#  {'_handle': <cocotb.simulator.gpi_sim_hdl at 0x557757943540>,
#   '_len': None, '_sub_handles': {'an_ac_pm_thread_stop': ModifiableObject(cocotb_icarus.an_ac_pm_thread_stop),
#   'cocotb_icarus': HierarchyObject(cocotb_icarus.cocotb_icarus with definition cocotb_icarus (at ./cocotb_icarus.v))},
#   '_invalid_sub_handles': set(), '_name': 'cocotb_icarus', '_type': 'GPI_MODULE', '_fullname': 'cocotb_icarus(GPI_MODULE)',
#   '_path': 'cocotb_icarus', '_log': <SimBaseLog cocotb.cocotb_icarus (INFO)>, '_def_name': '', '_def_file': '',
#   '_discovered': False

   # init stuff
   await init(dut, sim)

   # start clocks,reset
   await cocotb.start(genClocks(dut, sim))
   await cocotb.start(genReset(dut, sim))

   # start interfaces
   await cocotb.start(scom(dut, sim))

   #wtf don't have to instantiate A2L2 first?
   #await cocotb.start(A2L2Driver(dut, sim))
   #await cocotb.start(A2L2Checker(dut, sim))
   #await cocotb.start(A2L2Monitor(dut, sim))
   await cocotb.start(A2L2.driver(dut, sim))
   await cocotb.start(A2L2.checker(dut, sim))
   await cocotb.start(A2L2.monitor(dut, sim))

   await Timer((sim.resetCycle + 5)*8, units='ns')
   if dut.nclk[1].value != 0:
      sim.ok = False
      sim.fail = 'Reset active too long!'

   # config stuff
   await config(dut, sim)

   # monitor stuff
   await cocotb.start(coreMonitor(dut, sim))

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
      assert False, f'[{sim.cycle:08d}] {sim.fail}'


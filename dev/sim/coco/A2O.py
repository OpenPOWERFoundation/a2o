# A2O Core

import cocotb
from cocotb.triggers import Timer, RisingEdge
from cocotb.binary import BinaryValue
from cocotb.handle import Force
from cocotb.handle import Release

from dotmap import DotMap
import itertools

from OPEnv import *

# ------------------------------------------------------------------------------------------------
# Tasks

async def A2ODriver(dut, sim):
   """A2O Core Driver"""

   transTypes = {
      '00': 'IFETCH',
      '08': 'LOAD',
      '20': 'STORE'
   }

   ok = True
   readPending = []
   countReads = 0
   mem = {}
   sim.msg('A2O Driver: nothing to do.')

   #while ok and not sim.done:
   #   await RisingEdge(dut.clk_1x)


# A2O Checker
# check protocol, etc.
async def A2OChecker(dut, sim):
   """A2O Core Checker """

   me = 'A2O Checker'
   ok = True
   sim.msg(f'{me}: started.')

   # errors
   creditsLdErr = dut.c0.lq0.lsq.arb.ld_cred_err_q
   creditsStErr = dut.c0.lq0.lsq.arb.st_cred_err_q
   errors = [
      {'name': 'Load Credits', 'sig': creditsLdErr},
      {'name': 'Store Credits', 'sig': creditsStErr},
   ]

   while ok:

      await RisingEdge(dut.clk_1x)

      if not sim.resetDone:
         continue

      for i in range(len(errors)):
          assert errors[i]['sig'].value == 0, f'{me} Error: {errors[i]["name"]}'

# A2O Monitor
# count transactions, etc.
# fail on bad addresses
async def A2OMonitor(dut, sim):
   """A2O Core Monitor"""

   me = 'A2O Monitor'
   ok = True
   sim.msg(f'{me}: started.')

   # completions
   iu0Comp = dut.c0.iu_lq_i0_completed
   iu0CompIFAR = dut.c0.iuq0.iuq_cpl_top0.iuq_cpl0.cp2_i0_ifar
   iu1Comp = dut.c0.iu_lq_i1_completed
   iu1CompIFAR = dut.c0.iuq0.iuq_cpl_top0.iuq_cpl0.cp2_i1_ifar
   iuCompFlushIFAR = dut.c0.cp_t0_flush_ifar
   cp3NIA = dut.c0.iuq0.iuq_cpl_top0.iuq_cpl0.iuq_cpl_ctrl.cp3_nia_q           # nia after last cycle's completions

   # GPR ppol and arch map
   gprCompMap = []
   lastGprCompMap = []
   #wtf check what 33:36 are!
   for i in range(36):
      gprCompMap.append(dut.c0.iuq0.iuq_slice_top0.slice0.rn_top0.fx_rn0.gpr_rn_map.xhdl3.comp_map0[i].comp_map_latch.dout)
      lastGprCompMap.append(i)

   gpr = []
   for i in range(144):
      gpr.append(dut.c0.xu0.gpr.gpr0.loc[i].dat)

   # CR fields pool and arch map
   crCompMap = []
   lastCrCompMap = []
   for i in range(8):
      crCompMap.append(dut.c0.iuq0.iuq_slice_top0.slice0.rn_top0.fx_rn0.cr_rn_map.xhdl3.comp_map0[i].comp_map_latch.dout)
      lastCrCompMap.append(i)

   cr = []
   for i in range(24):
      cr.append(dut.c0.xu0.cr.entry[i].reg_latch.dout)

   # XER pool and arch map
   xerCompMap = []
   lastXerCompMap = []
   for i in range(1):
      xerCompMap.append(dut.c0.iuq0.iuq_slice_top0.slice0.rn_top0.fx_rn0.xer_rn_map.xhdl3.comp_map0[i].comp_map_latch.dout)
      lastXerCompMap.append(i)

   xer = []
   for i in range(12):
      xer.append(dut.c0.xu0.xer.entry[i].reg_latch.dout)

   # CTR pool and arch map
   ctrCompMap = []
   lastCtrCompMap = []
   for i in range(1):
      ctrCompMap.append(dut.c0.iuq0.iuq_slice_top0.slice0.rn_top0.fx_rn0.ctr_rn_map.xhdl3.comp_map0[i].comp_map_latch.dout)
      lastCtrCompMap.append(i)

   ctr = []
   for i in range(8):
      ctr.append(dut.c0.xu0.ctr.entry[i].reg_latch.dout)

   # LR pool and arch map
   lrCompMap = []
   lastLrCompMap = []
   for i in range(1):
      lrCompMap.append(dut.c0.iuq0.iuq_slice_top0.slice0.rn_top0.fx_rn0.lr_rn_map.xhdl3.comp_map0[i].comp_map_latch.dout)
      lastLrCompMap.append(i)

   lr = []
   for i in range(8):
      lr.append(dut.c0.xu0.lr.entry[i].reg_latch.dout)

   while ok:

      await RisingEdge(dut.clk_1x)

      if not sim.resetDone:
         continue

      comp = ''
      #wtf seeing something weird here
      # there are cases where x's are in some bits of comp ifar's; maybe ok (predict array?) but why is completed indicated?
      if iu0Comp.value == 1:
         comp = f'0:{sim.safeint(iu0CompIFAR.value.binstr + "00", 2):06X} '

      if iu1Comp.value == 1:
         comp = f'{comp}1:{sim.safeint(iu1CompIFAR.value.binstr + "00", 2):06X} '

      if comp != '':
         comp = f'{comp}{sim.safeint(iuCompFlushIFAR.value.binstr + "00", 2):016X}'
         sim.msg(f'C0: CP {comp}')

      if sim.a2o.traceFacUpdates:
         # renamables
         for i in range(36):
            good, arch = sim.safeint(gprCompMap[i].value.binstr, 2, rc=True)
            if good and arch != lastGprCompMap[i]:
               sim.msg(f'GPR Update: R{i:02d}={hex(gpr[arch], 16)}')
               lastGprCompMap[i] = arch
         for i in range(8):
            good, arch = sim.safeint(crCompMap[i].value.binstr, 2, rc=True)
            if good and arch != lastCrCompMap[i]:
               sim.msg(f'CR Update: F{i:01d}={hex(cr[arch], 1)}')
               lastCrCompMap[i] = arch
         for i in range(1):
            good, arch = sim.safeint(xerCompMap[i].value.binstr, 2, rc=True)
            if good and arch != lastXerCompMap[i]:
               v = xer[arch].value.binstr
               sim.msg(f'XER Update: SO/OV/CA={v[0:3]} LEN={int(v[3:],2):02X}')
               lastXerCompMap[i] = arch
         for i in range(1):
            good, arch = sim.safeint(ctrCompMap[i].value.binstr, 2, rc=True)
            if good and arch != lastCtrCompMap[i]:
               sim.msg(f'CTR Update:{hex(ctr[arch], 16)}')
               lastCtrCompMap[i] = arch
         for i in range(1):
            good, arch = sim.safeint(lrCompMap[i].value.binstr, 2, rc=True)
            if good and arch != lastLrCompMap[i]:
               sim.msg(f'LR Update:{hex(lr[arch], 16)}')
               lastLrCompMap[i] = arch

# ------------------------------------------------------------------------------------------------
# Classes

class A2O:
   driver = A2ODriver
   checker = A2OChecker
   monitor = A2OMonitor

   def __init__(self, sim):
      pass

class A2OCore(DotMap):
   def __init__(self, sim):
      super().__init__()
      self.sim = sim
      self.traceFacUpdates = False
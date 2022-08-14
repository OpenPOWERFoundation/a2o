# A2O Core

import cocotb
from cocotb.triggers import Timer, RisingEdge
from cocotb.binary import BinaryValue
from cocotb.handle import Force
from cocotb.handle import Release
from cocotb.result import TestSuccess

from dotmap import DotMap
import itertools

from OPEnv import *

# ------------------------------------------------------------------------------------------------
# Tasks

async def A2OConfig(dut, sim):
   """Configure A2O. """

   # A2L2 load/store credits
   creditsLd = sim.a2o.root.lq0.lsq.arb.load_cred_cnt_d           # 8 max
   creditsLdMax = sim.a2o.root.lq0.lsq.arb.ld_cred_max            # hdw check
   creditsSt = sim.a2o.root.lq0.lsq.arb.store_cred_cnt_d          # 32 max
   creditsStMax = sim.a2o.root.lq0.lsq.arb.st_cred_max            # hdw check
   creditsLdStSingle = sim.a2o.root.lq0.lsq.arb.spr_xucr0_cred_d  # 1 total credit
   #wtf this affects A2L2 - default=1
   #  sim.a2o.root.lq0.lsq.arb.spr_lsucr0_b2b_q   # 0=crit first, every other 1=crit first, b2b **the a2l2 spec does not say crit must be first**
   lsucr0_d = sim.a2o.root.lq0.ctl.spr.lq_spr_cspr.lsucr0_d
   lsucr0_q = sim.a2o.root.lq0.ctl.spr.lq_spr_cspr.lsucr0_q
   cpcr2_d = sim.a2o.root.iuq0.iuq_ifetch0.iuq_spr0.cpcr2_d
   cpcr2_q = sim.a2o.root.iuq0.iuq_ifetch0.iuq_spr0.cpcr2_l2
   cpcr2_act = sim.a2o.root.iuq0.iuq_ifetch0.iuq_spr0.cpcr2_wren
   cpcr4_d = sim.a2o.root.iuq0.iuq_ifetch0.iuq_spr0.cpcr4_d
   cpcr4_q = sim.a2o.root.iuq0.iuq_ifetch0.iuq_spr0.cpcr4_l2
   cpcr4_act = sim.a2o.root.iuq0.iuq_ifetch0.iuq_spr0.cpcr4_wren

   await RisingEdge(sim.sigClk)

   if sim.a2o.config.creditsLd is not None:
      creditsLd.value = Force(sim.a2o.config.creditsLd)
      creditsLdMax.value = Force(sim.a2o.config.creditsLd)
      sim.msg(f'A2O: load credits changed from {creditsLd.value.integer} to {sim.a2o.config.creditsLd}.')
      await RisingEdge(sim.sigClk)
      creditsLd.value = Release()
   else:
      sim.msg(f'A2O: load credits = {creditsLd.value.integer}.')

   if sim.a2o.config.creditsSt is not None:
      creditsSt.value = Force(sim.a2o.config.creditsSt)
      creditsStMax.value = Force(sim.a2o.config.creditsSt)
      sim.msg(f'A2O: store credits changed from {creditsSt.value.integer} to {sim.a2o.config.creditsSt}.')
      await RisingEdge(sim.sigClk)
      creditsSt.value = Release()
   else:
      sim.msg(f'A2O: store credits = {creditsSt.value.integer}.')

   if sim.a2o.config.creditsLdStSingle is not None:
      v = 1 if sim.a2o.config.creditsLdStSingle else 0
      creditsLdStSingle.value = Force(v)
      sim.msg(f'A2O: only one load OR store allowed when credits=1/1.')
      await RisingEdge(sim.sigClk)
      #creditsLdStSingle.value = Release()  # to release have to set _q with xucr0_d[51] and xucr0_act
   elif sim.a2o.root.lq0.lsq.arb.load_cred_cnt_q.value.integer == 1 and sim.a2o.root.lq0.lsq.arb.store_cred_cnt_q.value.integer == 1 and sim.a2o.root.lq0.lsq.arb.spr_xucr0_cred_q.value.integer == 1:
      sim.msg(f'A2O: single-credit mode is enabled.')

   #wtf make a function - needs mask,thread
   if sim.a2o.config.lsDataForward is not None:
      v = 1 if sim.a2o.config.lsDataForward else 0
      sim.msg(f'A2O: LSUCR0 = {hex(lsucr0_q.value), 8}')
      sim.msg(f'A2O: Setting LSUCR0[DFWD] = {v}.')
      v = v << 2
      v = (lsucr0_q.value.integer & ~0x4) | v
      lsucr0_d.value = Force(v)
      await RisingEdge(sim.sigClk)
      lsucr0_d.value = Release()
      sim.msg(f'A2O: LSUCR0 = {hex(lsucr0_q.value), 8}')

   if sim.a2o.config.cpcr4_sq_cnt is not None:
      v = sim.a2o.config.cpcr4_sq_cnt
      sim.msg(f'A2O: CPCR4 = {hex(cpcr4_q[0], 8)}')
      sim.msg(f'A2O: Setting CPCR4[SQ_CNT] = {v}.')
      v = v << 0
      v = (cpcr4_q[0].value.integer & ~0x1F) | v
      await RisingEdge(sim.sigClk)  # need cuz of act?
      cpcr4_d[0].value = Force(v)
      cpcr4_act.value = Force(1)
      await RisingEdge(sim.sigClk)
      await RisingEdge(sim.sigClk)  # need cuz of act?
      cpcr4_d[0].value = Release()
      cpcr4_act.value = Release()
      sim.msg(f'A2O: CPCR4 = {hex(cpcr4_q[0], 8)}')

   await RisingEdge(sim.sigClk)

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
   #   await RisingEdge(sim.sigClk)


# A2O Checker
# check protocol, etc.
async def A2OChecker(dut, sim):
   """A2O Core Checker """

   me = 'A2O Checker'
   ok = True
   sim.msg(f'{me}: started.')

   # errors
   creditsLdErr = sim.a2o.root.lq0.lsq.arb.ld_cred_err_q
   creditsStErr = sim.a2o.root.lq0.lsq.arb.st_cred_err_q
   errors = [
      {'name': 'Load Credits', 'sig': creditsLdErr},
      {'name': 'Store Credits', 'sig': creditsStErr},
   ]

   while ok:

      await RisingEdge(sim.sigClk)

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

   #wtf NEEDS THREADING! separate hang/loop/pass/fail checks for each

   # completions
   iu0Comp = sim.a2o.root.iu_lq_i0_completed
   iu0CompIFAR = sim.a2o.root.iuq0.iuq_cpl_top0.iuq_cpl0.cp2_i0_ifar
   iu1Comp = sim.a2o.root.iu_lq_i1_completed
   iu1CompIFAR = sim.a2o.root.iuq0.iuq_cpl_top0.iuq_cpl0.cp2_i1_ifar
   iuCompFlushIFAR = sim.a2o.root.cp_t0_flush_ifar
   cp3NIA = sim.a2o.root.iuq0.iuq_cpl_top0.iuq_cpl0.iuq_cpl_ctrl.cp3_nia_q           # nia after last cycle's completions

   # GPR pool and arch map
   gprCompMap = []
   lastGprCompMap = []
   #wtf check what 33:36 are!
   for i in range(36):
      gprCompMap.append(sim.a2o.root.iuq0.iuq_slice_top0.slice0.rn_top0.fx_rn0.gpr_rn_map.xhdl3.comp_map0[i].comp_map_latch.dout)
      lastGprCompMap.append(i)

   gpr = []
   for i in range(144):
      gpr.append(sim.a2o.root.xu0.gpr.gpr0.loc[i].dat)

   # CR fields pool and arch map
   crCompMap = []
   lastCrCompMap = []
   for i in range(8):
      crCompMap.append(sim.a2o.root.iuq0.iuq_slice_top0.slice0.rn_top0.fx_rn0.cr_rn_map.xhdl3.comp_map0[i].comp_map_latch.dout)
      lastCrCompMap.append(i)

   cr = []
   for i in range(24):
      cr.append(sim.a2o.root.xu0.cr.entry[i].reg_latch.dout)

   # XER pool and arch map
   xerCompMap = []
   lastXerCompMap = []
   for i in range(1):
      xerCompMap.append(sim.a2o.root.iuq0.iuq_slice_top0.slice0.rn_top0.fx_rn0.xer_rn_map.xhdl3.comp_map0[i].comp_map_latch.dout)
      lastXerCompMap.append(i)

   xer = []
   for i in range(12):
      xer.append(sim.a2o.root.xu0.xer.entry[i].reg_latch.dout)

   # CTR pool and arch map
   ctrCompMap = []
   lastCtrCompMap = []
   for i in range(1):
      ctrCompMap.append(sim.a2o.root.iuq0.iuq_slice_top0.slice0.rn_top0.fx_rn0.ctr_rn_map.xhdl3.comp_map0[i].comp_map_latch.dout)
      lastCtrCompMap.append(i)

   ctr = []
   for i in range(8):
      ctr.append(sim.a2o.root.xu0.ctr.entry[i].reg_latch.dout)

   # LR pool and arch map
   lrCompMap = []
   lastLrCompMap = []
   for i in range(1):
      lrCompMap.append(sim.a2o.root.iuq0.iuq_slice_top0.slice0.rn_top0.fx_rn0.lr_rn_map.xhdl3.comp_map0[i].comp_map_latch.dout)
      lastLrCompMap.append(i)

   lr = []
   for i in range(8):
      lr.append(sim.a2o.root.xu0.lr.entry[i].reg_latch.dout)

   lastComp = ''
   lastCompCycle = 0
   lastCompCount = 0
   lastStack = ''
   lastPrintf = ''

   while ok:

      await RisingEdge(sim.sigClk)

      if not sim.resetDone:
         continue

      #wtf NEED SMT

      # allow registered callbacks to be called here
      stack = sim.mem.dump(0x1FD00, 0x1FFFF, cols=8, trimLeadingZeros=True, trimTrailingZeros=True)
      if stack != lastStack:
         sim.msg('Stack:\n' + stack)
         lastStack = stack

      printf = sim.mem.dump(0x1C000, 0x1C1FF, cols=8, trimLeadingZeros=True, trimTrailingZeros=True)
      if printf != lastPrintf:
         sim.msg('Print buffer:\n' + printf)
         lastPrintf = printf

      comp = ''
      #wtf seeing something weird here
      # there are cases where x's are in some bits of comp ifar's; maybe ok (predict array?) but why is completed indicated?

      if iu0Comp.value == 1:
         comp = f'0:{sim.safeint(iu0CompIFAR.value.binstr + "00", 2):06X} '

      if iu1Comp.value == 1:
         comp = f'{comp}1:{sim.safeint(iu1CompIFAR.value.binstr + "00", 2):06X} '

      if comp == '':
         if sim.a2o.stopOnHang != 0 and sim.cycle - lastCompCycle > sim.a2o.stopOnHang:
            sim.ok = False
            sim.fail = f'No completion detected in {sim.a2o.stopOnHang} cycles'
            assert False, sim.fail
            break
      else:
         comp = f'{comp}{sim.safeint(iuCompFlushIFAR.value.binstr + "00", 2):016X}'
         sim.msg(f'C0: CP {comp}')
         lastCompCycle = sim.cycle

         if sim.a2o.iarPass is not None:
            if sim.safeint(iu0CompIFAR.value.binstr + "00", 2) == sim.a2o.iarPass:
               sim.msg(f'Passing IAR detected: {sim.a2o.iarPass:08X}')
               raise TestSuccess('Test passed.')

         if sim.a2o.iarPass is not None:
            if sim.safeint(iu0CompIFAR.value.binstr + "00", 2) == sim.a2o.iarPass:
               sim.ok = False
               sim.fail = 'Failing IAR detected'
               assert False, sim.fail
               break

         if sim.a2o.stopOnLoop is not None and sim.a2o.stopOnLoop > 0:
            if comp == lastComp:
               lastCompCount += 1
               if lastCompCount == sim.a2o.stopOnLoop:
                  sim.ok = False
                  sim.fail = 'Code hang detected'
                  assert False, sim.fail
                  break
            else:
               lastCompCount = 0
               lastComp = comp

      if sim.a2o.traceFacUpdates:
         # renamables
         for i in range(36):
            good, arch = sim.safeint(gprCompMap[i].value.binstr, 2, rc=True)
            if good and arch != lastGprCompMap[i]:
               sim.msg(f'C0: GPR Update: R{i:02d}={hex(gpr[arch], 16)}')
               lastGprCompMap[i] = arch
         for i in range(8):
            good, arch = sim.safeint(crCompMap[i].value.binstr, 2, rc=True)
            if good and arch != lastCrCompMap[i]:
               sim.msg(f'C0: CR Update: F{i:01d}={hex(cr[arch], 1)}')
               lastCrCompMap[i] = arch
         for i in range(1):
            good, arch = sim.safeint(xerCompMap[i].value.binstr, 2, rc=True)
            if good and arch != lastXerCompMap[i]:
               v = xer[arch].value.binstr
               sim.msg(f'C0: XER Update: SO/OV/CA={v[0:3]} LEN={int(v[3:],2):02X}')
               lastXerCompMap[i] = arch
         for i in range(1):
            good, arch = sim.safeint(ctrCompMap[i].value.binstr, 2, rc=True)
            if good and arch != lastCtrCompMap[i]:
               sim.msg(f'C0: CTR Update:{hex(ctr[arch], 16)}')
               lastCtrCompMap[i] = arch
         for i in range(1):
            good, arch = sim.safeint(lrCompMap[i].value.binstr, 2, rc=True)
            if good and arch != lastLrCompMap[i]:
               sim.msg(f'C0: LR Update:{hex(lr[arch], 16)}')
               lastLrCompMap[i] = arch

   sim.msg(f'{me}: ended.')

# ------------------------------------------------------------------------------------------------
# Classes

class A2O:
   config = A2OConfig
   driver = A2ODriver
   checker = A2OChecker
   monitor = A2OMonitor

   def __init__(self, sim):
      pass

class A2OCore(DotMap):
   def __init__(self, sim, root=None):
      super().__init__()
      self.sim = sim
      if root is None:
         self.root = sim.dut.c0
      else:
         self.root = root
      self.traceFacUpdates = False
      self.stopOnHang = 0     # cycles of no completions; could be tuple(start cyc, hang cycs)
      self.stopOnLoop = 0     # number of consecutive identical comopletions
      self.iarPass = None
      self.iarFail = None
      self.config =  DotMap({
         'threads' : 1,
         'creditsLd': None,
         'creditsSt': None,
         'creditsLdStSingle': None,
         'lsDataForward' : None,
         'cpcr4_sq_cnt' : None
      })

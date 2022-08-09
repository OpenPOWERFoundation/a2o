// simple verilator top
// uses a2owb with sim mem interface

#define TRACING

// old public access method
//#define OLD_PUBLIC

#include <cstddef>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <unordered_map>

#include "verilated.h"
#include "Va2owb.h"

#ifndef OLD_PUBLIC
// internal nets
#include "Va2owb___024root.h"
#endif

#include "Va2owb_a2owb.h"
#include "Va2owb_a2l2wb.h"
#include "Va2owb_c.h"
#include "Va2owb_iuq.h"
#include "Va2owb_iuq_cpl_top.h"
#include "Va2owb_iuq_cpl.h"
#include "Va2owb_iuq_cpl_ctrl.h"

#ifdef TRACING
#include "verilated_vcd_c.h"
VerilatedVcdC *t;
#else
unsigned int t = 0;
#endif

/*
#include "uart/uartsim.h"
*/

Va2owb* m;
#ifdef OLD_PUBLIC
Va2owb* root;
#else
Va2owb___024root* root;
#endif

vluint64_t main_time = 0;     // in units of timeprecision used in verilog or --timescale-override

double sc_time_stamp() {      // $time in verilog
   return main_time;
}

const int resetCycle = 10;
const int threadRunCycle = resetCycle + 5;
const int runCycles = 501;
const int hbCycles = 500;
const int threads = 1;
const std::string testFile = "../mem/test3/rom.init";
const unsigned int bootAdr = 0x00000000;


// Cythonize this and use it for cocotb too...

class Memory {
   std::unordered_map<unsigned int, unsigned int> mem;
   public:
      bool le;
      bool logStores;
      int defaultVal;
      Memory();
      void loadFile(std::string filename, unsigned int adr=0, bool le=false, std::string format="ascii");
      int read(unsigned int adr);
      void write(unsigned int adr, unsigned int dat);
      void write(unsigned int adr, unsigned int be, unsigned int dat);
};

Memory::Memory() {

   this->defaultVal = 0;
   this->le = false;
   this->logStores = true;

}

void Memory::loadFile(std::string filename, unsigned int adr, bool le, std::string format) {

   unsigned int dat;
   std::ifstream f;
   f.open(filename, std::fstream::in);
   // "ascii"
   //while (f.peek()!=EOF) {
      //f >> std::hex >> dat;
     // f >> dat;
   while (f >> std::hex >> dat) {
      this->write(adr, dat);
      adr += 4;
   }

}

// adr is word-aligned byte address
int Memory::read(unsigned int adr) {
   if (this->mem.find(adr) != this->mem.end()) {
      return this->mem[adr];
   } else {
      return this->defaultVal;
   }
}

// adr is word-aligned byte address
void Memory::write(unsigned int adr, unsigned int dat) {
   unsigned int startDat = this->read(adr);
   this->mem[adr] = dat;
   if (this->logStores) {
      std::cout << std::setw(8) << std::hex << " * Mem Update @" << adr << " " << startDat << "->" << dat << std::endl;
   }
}

void Memory::write(unsigned int adr, unsigned int be, unsigned int dat) {
   if (be == 0) return;

   int mask, startDat;
   if (be >= 8) {
      be = be - 8;
      mask = 0xFF000000;
   } else {
      mask = 0;
   }
   if (be >= 4) {
      be = be - 4;
      mask |= 0x00FF0000;
   }
   if (be >= 2) {
      be = be - 2;
      mask |= 0x0000FF00;
   }
   if (be = 1) {
      mask |= 0x000000FF;
   }

   startDat = this->read(adr);
   this->mem[adr] = (startDat & ~mask) | (dat & mask);
   if (this->logStores) {
      std::cout << std::setw(8) << std::hex << " * Mem Update @" << adr << " " << startDat << "->" << dat << std::endl;
   }

}

Memory mem;

int main(int argc, char **argv) {
   using namespace std;

   cout << setfill('0');

   Verilated::commandArgs(argc, argv);
   m = new Va2owb;
#ifdef OLD_PUBLIC
   root = m;
#else
   root = m->rootp;
#endif

#ifdef TRACING
      Verilated::traceEverOn(true);
      t = new VerilatedVcdC;
      m->trace(t, 99);
      t->open("a2olitex.vcd");
      cout << "Tracing enabled." << endl;
#endif

   bool ok = true;
   bool resetDone = false;
   bool booted = false;
   unsigned int threadStop = 0x3;

   unsigned int tick = 0;
   unsigned int cycle = 1;
   unsigned int readPending = 0;
   unsigned int readAddr = 0;
   unsigned int readTag = 0;
   unsigned int readTID = 0;
   unsigned int countReads = 0;
   bool wbRdPending = false, wbWrPending = false;

   unsigned int iu0Comp, iu1Comp;
   unsigned long iu0CompIFAR, iu1CompIFAR, cp3NIA;
/*
   creditsLdErr = sim.a2o.root.lq0.lsq.arb.ld_cred_err_q
   creditsStErr = sim.a2o.root.lq0.lsq.arb.st_cred_err_q
*/


   /*
   iu0CompIFAR = sim.a2o.root.iuq0.iuq_cpl_top0.iuq_cpl0.cp2_i0_ifar
   iu1Comp =                                             cp2_i0_completed
   iu1CompIFAR = sim.a2o.root.iuq0.iuq_cpl_top0.iuq_cpl0.cp2_i1_ifar
   iuCompFlushIFAR = sim.a2o.root.cp_t0_flush_ifar
   cp3NIA = sim.a2o.root.iuq0.iuq_cpl_top0.iuq_cpl0.iuq_cpl_ctrl.cp3_nia_q           # nia after last cycle's completions
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

   */

/*
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

*/

   mem.write(0xFFFFFFFC, 0x48000002);
   mem.loadFile(testFile);

   m->rst = 1;

   cout << dec << setw(8) << cycle << " Resetting..." << endl;

   //m->an_ac_pm_thread_stop = threadStop;
   //cout << dec << setw(8) << cycle << " Thread stop=" << threadStop << endl;

   const int clocks[4] = {0x3, 0x2, 0x1, 0x0};     // 1x, 2x
   const int ticks1x = 4;

   while (!Verilated::gotFinish() && ok && cycle <= runCycles) {

      if (!resetDone && (cycle > resetCycle)) {
         m->rst = 0;
         cout << dec << setw(8) << cycle << " Releasing reset." << endl;
         resetDone = true;
      }

      if (threadStop && (cycle > threadRunCycle)) {
         //threadStop = 0x0;
         //m->an_ac_pm_thread_stop = threadStop;
         //cout << dec << setw(8) << cycle << " Thread stop=" << threadStop << endl;
      }

      m->clk_1x = clocks[tick % ticks1x] >> 1;
      m->clk_2x = clocks[tick % ticks1x] & 0x1;
      m->eval();

      // 1x clock
      if ((tick % ticks1x) == 0) {

         // core
         iu0Comp = root->a2owb->c0->iuq0->iuq_cpl_top0->iuq_cpl0->cp2_i0_completed;
         iu1Comp = root->a2owb->c0->iuq0->iuq_cpl_top0->iuq_cpl0->cp2_i1_completed;
         iu0CompIFAR = root->a2owb->c0->iuq0->iuq_cpl_top0->iuq_cpl0->cp2_i0_ifar;
         iu1CompIFAR = root->a2owb->c0->iuq0->iuq_cpl_top0->iuq_cpl0->cp2_i1_ifar;

         if (iu0Comp || iu1Comp) {
            cout << dec << setw(8) << setfill('0') << uppercase << cycle << " Completed:";
            if (iu0Comp)
               cout << " I0:" << iu0Comp << " "  << setw(16) << setfill('0') << hex << (iu0CompIFAR << 2);
            if (iu1Comp)
               cout << " I1:" << iu1Comp << " "  << setw(16) << setfill('0') << hex << (iu1CompIFAR << 2);
            cout << endl;
         }

         // wb
         m->wb_ack = 0;
         if (wbRdPending) {
            m->wb_datr = mem.read(m->wb_adr & 0xFFFFFFFC);
            m->wb_ack = 1;
            cout << dec << setw(8) << setfill('0') << uppercase << cycle << " WB RD ACK RA=" << setw(8)  << hex << setfill('0') << (m->wb_adr & 0xFFFFFFFC) <<
                  " DATA=" <<  m->wb_datr << endl;
            wbRdPending = false;
         } else if (wbWrPending) {
            mem.write(m->wb_adr, m->wb_datw, m->wb_sel);
            m->wb_ack = 1;
            wbWrPending = false;
         } else if (m->wb_cyc && m->wb_stb) {
            if (!m->wb_we) {
               cout << dec << setw(8) << setfill('0') << uppercase << cycle << " WB RD RA=" << setw(8)  << hex << setfill('0') << m->wb_adr << endl;
               wbRdPending = true;
               if (m->wb_adr == bootAdr) {
                  if (booted) {
                     cout << "*** Fetch to boot address (" << dec << setw(8) << bootAdr << ") after initial boot! ***" << endl;
                     ok = false;
                  } else {
                     booted = true;
                  }
               }
            } else {
               cout << dec << setw(8) << setfill('0') << uppercase << cycle << " WB WR RA=" << setw(8)  << hex << setfill('0') << m->wb_adr <<
                  " SEL=" << m->wb_sel << " DATA=" << m->wb_datw << endl;
               wbWrPending = true;
            }
         }

      }

      m->eval(); // NEED THIS!!!!

      // finish clock stuff
      if ((tick % ticks1x) == 0) {
         cycle++;
         if ((cycle % hbCycles) == 0) {
            cout << dec << setw(8) << setfill('0') << cycle << " ...tick..." << endl;
         }
      }

      tick++;

      #ifdef TRACING
      t->dump(tick);
      t->flush();
      #endif

      // check for fails

   }

#ifdef TRACING
   t->close();
#endif
   m->final();

   cout << endl << "Cycles run=" << cycle << endl << endl;
   if (!ok) {
      cout << "You are worthless and weak." << endl;
      exit(EXIT_FAILURE);
   } else {
      cout << "You has opulence." << endl;
      exit(EXIT_SUCCESS);
   }

}
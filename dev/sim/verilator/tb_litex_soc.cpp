// simple verilator top
// litex soc w/a2o

#ifndef NO_TRACE
#define TRACING
#endif

// old public access method
//#define OLD_PUBLIC

#include <cstddef>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <unordered_map>

#include "verilated.h"
#include "Vsoc.h"

#ifndef OLD_PUBLIC
// internal nets
#include "Vsoc___024root.h"
#endif

#include "Vsoc_soc.h"
#include "Vsoc_a2owb.h"
#include "Vsoc_a2l2wb.h"
#include "Vsoc_c.h"
#include "Vsoc_iuq.h"
#include "Vsoc_iuq_cpl_top.h"
#include "Vsoc_iuq_cpl.h"
#include "Vsoc_iuq_slice_top.h"
#include "Vsoc_iuq_slice.h"
#include "Vsoc_iuq_rn_top.h"
#include "Vsoc_iuq_rn.h"
#include "Vsoc_iuq_rn_map__A24.h"
#include "Vsoc_xu.h"
#include "Vsoc_xu_gpr.h"
#include "Vsoc_tri_144x78_2r4w.h"

#ifdef TRACING
#include "verilated_vcd_c.h"
VerilatedVcdC *t;
#else
unsigned int t = 0;
#endif

// using https://github.com/ZipCPU/wbuart32 sim driver
// how does cpp get compiled in without this?  can verilator be told to add more cpp?  see a2p!
// UART=port
//   0xA20 = 2592
#ifdef UART
#include "wbuart32/bench/cpp/uartsim.h"
#include "wbuart32/bench/cpp/uartsim.cpp"
#endif

Vsoc* m;
#ifdef OLD_PUBLIC
Vsoc* root;
#else
Vsoc___024root* root;
#endif

vluint64_t main_time = 0;     // in units of timeprecision used in verilog or --timescale-override

double sc_time_stamp() {      // $time in verilog
   return main_time;
}

const char* tbName = "tb_litex_soc";
const int resetCycle = 10;
const int threadRunCycle = resetCycle + 5;
const int runCycles = 100000000;
const int hbCycles = 500;
const int quiesceCycles = 50;
const int threads = 1;
const std::string testFile = "";
const unsigned int bootAdr = 0x00000000;
const bool failMaxCycles = true;
const unsigned int stopOnHang = 500;
const unsigned int stopOnLoop = 20;
const unsigned long iarPass = 0x7F0;
const unsigned long iarFail = 0x7F4;
const bool debugWB = true;
const bool debugWBReq = false;

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
   this->write(adr, 0xF, dat);
}

void Memory::write(unsigned int adr, unsigned int be, unsigned int dat) {
   if (be == 0) return;

   int mask = 0, startDat;
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
      std::cout << " * Mem Update @" << std::setw(8) << std::setfill('0') << std::uppercase << std::hex << adr <<
       " " <<std::setw(8) << std::setfill('0') << std::uppercase << std::hex << startDat <<
       "->" <<std::setw(8) << std::setfill('0') << std::uppercase << std::hex << this->read(adr) << std::endl;
   }
}

Memory mem;

int main(int argc, char **argv) {
   using namespace std;

   cout << setfill('0');

   Verilated::commandArgs(argc, argv);
   m = new Vsoc;
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

   int i;
   bool ok = true;
   bool done = false;
   bool resetDone = false;
   bool booted = false;
   unsigned int quiesceCount = 0;
   unsigned int threadStop = 0x3;

   unsigned int tick = 0;
   unsigned int cycle = 1;
   unsigned int readPending = 0;
   unsigned int readAddr = 0;
   unsigned int readTag = 0;
   unsigned int readTID = 0;
   unsigned int countReads = 0;
   unsigned int lastCompCycle = 0;
   unsigned int lastCompSame = 0;
   bool wbRdPending = false, wbWrPending = false;

   //unsigned int wbSel, wbDatW;
   unsigned int iu0Comp, iu1Comp, iu0CompLast, iu1CompLast;
   unsigned long iu0CompIFAR, iu1CompIFAR, iu0CompIFARLast, iu1CompIFARLast, iuCompFlushIFAR;

   unsigned long gprCompMap[36], lastGprCompMap[36];
   unsigned int vHi, vLo;
   VlWide<3> gpr[144];


   /*
         # renamables
         for i in range(36):
            good, arch = sim.safeint(gprCompMap[i].value.binstr, 2, rc=True)
            if good and arch != lastGprCompMap[i]:
               sim.msg(f'C0: GPR Update: R{i:02d}={hex(gpr[arch], 16)}')
               lastGprCompMap[i] = arch
   */
   for (i = 0; i < 36; i++) {
      lastGprCompMap[i] = i;
   }

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

   // memory setup
   //mem.write(0xFFFFFFFC, 0x48000002);
   //mem.loadFile(testFile);

   // uart setup
   /*
   //	i_setup[30]	True if we are not using hardware flow control.  This bit
//		is ignored within this module, as any receive hardware flow
//		control will need to be implemented elsewhere.
//
//	i_setup[29:28]	Indicates the number of data bits per word.  This will
//		either be 2'b00 for an 8-bit word, 2'b01 for a 7-bit word, 2'b10
//		for a six bit word, or 2'b11 for a five bit word.
//
//	i_setup[27]	Indicates whether or not to use one or two stop bits.
//		Set this to one to expect two stop bits, zero for one.
//
//	i_setup[26]	Indicates whether or not a parity bit exists.  Set this
//		to 1'b1 to include parity.
//
//	i_setup[25]	Indicates whether or not the parity bit is fixed.  Set
//		to 1'b1 to include a fixed bit of parity, 1'b0 to allow the
//		parity to be set based upon data.  (Both assume the parity
//		enable value is set.)
//
//	i_setup[24]	This bit is ignored if parity is not used.  Otherwise,
//		in the case of a fixed parity bit, this bit indicates whether
//		mark (1'b1) or space (1'b0) parity is used.  Likewise if the
//		parity is not fixed, a 1'b1 selects even parity, and 1'b0
//		selects odd.
//
//	i_setup[23:0]	Indicates the speed of the UART in terms of clocks.
//		So, for example, if you have a 200 MHz clock and wish to
//		run your UART at 9600 baud, you would take 200 MHz and divide
//		by 9600 to set this value to 24'd20834.  Likewise if you wished
//		to run this serial port at 115200 baud from a 200 MHz clock,
//		you would set the value to 24'd1736
   */
  /*
  		m_baud_counts = (isetup & 0x0ffffff);
		m_nbits   = 8-((isetup >> 28)&0x03);
		m_nstop   =((isetup >> 27)&1)+1;
		m_nparity = (isetup >> 26)&1;
		m_fixdp   = (isetup >> 25)&1;
		m_evenp   = (isetup >> 24)&1;
  */

 // 100MHz, 115200 = 868
   #ifdef UART
   	UARTSIM *uart;
	   int uartPort = UART;   // 0-stdin/stdout
 	   //unsigned	uartConfig = 1736;
 	   unsigned	uartConfig = 868;
	   //unsigned	uartConfig = 434;
	   //unsigned	uartConfig = 217;
	   //unsigned	uartConfig = 217;

      cout << "Initializing UART on port " << uartPort << " with config=" << hex << setw(8) << setfill('0') << uartConfig << endl;
	   uart = new UARTSIM(uartPort);
	   uart->setup(uartConfig);
   #endif


   // do something

   root->soc->soc_rst = 1;

   cout << dec << setw(8) << cycle << " Resetting..." << endl;

   //m->an_ac_pm_thread_stop = threadStop;  === a2l2.cfg_q[0] (do write to cfg_dat)
   //cout << dec << setw(8) << cycle << " Thread stop=" << threadStop << endl;

   //const int clocks[4] = {0x3, 0x2, 0x1, 0x0};   // 1x, 2x
   //const int ticks1x = 4;
   // all clk2x and clk4x fpga arrays overridden
   const int clocks[2] = {0x1, 0x0};               // 1x
   const int ticks1x = 2;

   while (!Verilated::gotFinish() && (ok | quiesceCount > 0) && cycle <= runCycles && !done) {

      if (!resetDone && (cycle > resetCycle)) {
         root->soc->soc_rst = 0;
         cout << dec << setw(8) << cycle << " Releasing reset." << endl;
         resetDone = true;
      }

      if (threadStop && (cycle > threadRunCycle)) {
         //threadStop = 0x0;
         //m->an_ac_pm_thread_stop = threadStop;
         //cout << dec << setw(8) << cycle << " Thread stop=" << threadStop << endl;
      }

      m->clk12 = clocks[tick % ticks1x];
      m->eval();

      // 1x clock
      if ((tick % ticks1x) == 0) {

         // core

         // completion

         // gpr change
         for (i = 0; i < 36; i++) {
            gprCompMap[i] = root->soc->a2owb->c0->iuq0->iuq_slice_top0->slice0->rn_top0->fx_rn0->gpr_rn_map->comp_map_l2[i];
            if (gprCompMap[i] != lastGprCompMap[i]) {
               // need to left shift by 18 unused (96-78)!
               vHi = root->soc->a2owb->c0->xu0->gpr->gpr0->mem[gprCompMap[i]][2] << 18;
               vHi |= root->soc->a2owb->c0->xu0->gpr->gpr0->mem[gprCompMap[i]][1] >> 14;
               vLo = root->soc->a2owb->c0->xu0->gpr->gpr0->mem[gprCompMap[i]][1] << 18;
               vLo |= root->soc->a2owb->c0->xu0->gpr->gpr0->mem[gprCompMap[i]][0] >> 14;
               cout << dec << setw(8) << setfill('0') << cycle << " C0: GPR Update: R";
               cout << dec << setw(2) << setfill('0') << i << "=";
               //cout << hex << setw(8) << setfill('0') << uppercase << root->soc->a2owb->c0->xu0->gpr->gpr0->mem[gprCompMap[i]][0] << " ";
               //cout << hex << setw(8) << setfill('0') << uppercase << root->soc->a2owb->c0->xu0->gpr->gpr0->mem[gprCompMap[i]][1] << " ";
               //cout << hex << setw(8) << setfill('0') << uppercase << root->soc->a2owb->c0->xu0->gpr->gpr0->mem[gprCompMap[i]][2] << " ";
               cout << hex << setw(8) << setfill('0') << uppercase << vHi << "";
               cout << hex << setw(8) << setfill('0') << uppercase << vLo << " ";
               cout << "[" << dec << setw(3) << setfill('0') << gprCompMap[i] << "]";
               cout << endl;
               lastGprCompMap[i] =  gprCompMap[i];
            }
         }

         // completions
         iu0Comp = root->soc->a2owb->c0->iuq0->iuq_cpl_top0->iuq_cpl0->cp2_i0_completed;
         iu1Comp = root->soc->a2owb->c0->iuq0->iuq_cpl_top0->iuq_cpl0->cp2_i1_completed;
         iu0CompIFAR = root->soc->a2owb->c0->iuq0->iuq_cpl_top0->iuq_cpl0->cp2_i0_ifar << 2;
         iu1CompIFAR = root->soc->a2owb->c0->iuq0->iuq_cpl_top0->iuq_cpl0->cp2_i1_ifar << 2;
         iuCompFlushIFAR = root->soc->a2owb->c0->cp_t0_flush_ifar << 2;

         if (iu0Comp || iu1Comp) {
            cout << dec << setw(8) << setfill('0') << uppercase << cycle << " C0: CP";
            if (iu0Comp)
               cout << " 0:" << setw(6) << setfill('0') << hex << (iu0CompIFAR);
            if (iu1Comp)
               cout << " 1:" << setw(6) << setfill('0') << hex << (iu1CompIFAR);
            cout << " " << setw(16) << setfill('0') << hex << (iuCompFlushIFAR);
            cout << endl;
            lastCompCycle = cycle;
            if (quiesceCount > 0) {
               // skip remaining checks
            } else if ((iu0Comp && (iu0CompIFAR == iarPass)) || (iu1Comp && (iu1CompIFAR == iarPass))) {
               cout << "*** Passing IAR detected ***" << endl;
               quiesceCount = 5;
            } else if ((iu0Comp && (iu0CompIFAR == iarFail)) || (iu1Comp && (iu1CompIFAR == iarFail))) {
               cout << "*** Failing IAR detected ***" << endl;
               ok = false;
               quiesceCount = 5;
            } else if ((iu0Comp == iu0CompLast) && (!iu0Comp || (iu0CompIFAR == iu0CompIFARLast)) &&
                (iu1Comp == iu1CompLast) && (!iu1Comp || (iu1CompIFAR == iu1CompIFARLast))) {
                  if (!iu0Comp || !iu1Comp) { // don't count if both are valid (assume only 1-op loops are bad)
                     lastCompSame++;
                     if (stopOnLoop && (lastCompSame == stopOnLoop)) {
                        ok = false;
                        cout << "*** Loop detected for " << dec << stopOnLoop << " iterations ***" << endl;
                     }
                  }
            } else {
               iu0CompLast = iu0Comp;
               iu0CompIFARLast = iu0CompIFAR;
               iu1CompLast = iu1Comp;
               iu1CompIFARLast = iu1CompIFAR;
               lastCompSame = 0;
            }
         } else if (!quiesceCount && (stopOnHang != 0) && (cycle - lastCompCycle > stopOnHang)) {
            ok = false;
            cout << "*** No completion detected in " << dec << stopOnHang << " cycles ***" << endl;
         }

         // wb - soc can monitor-only
         if (wbRdPending) {
            if (root->soc->a2owb->wb_ack)
               if (debugWB)
                  cout << dec << setw(8) << setfill('0') << uppercase << cycle << " WB RD ACK RA=" << setw(8) << hex << setfill('0') << (root->soc->a2owb->wb_adr & 0xFFFFFFFC) <<
                          " DATA=" << setw(8)  << hex << setfill('0') <<  root->soc->a2owb->wb_datr << endl;

            wbRdPending = false;

         } else if (wbWrPending) {
            if (root->soc->a2owb->wb_ack)
               if (debugWB)
                  cout << dec << setw(8) << setfill('0') << uppercase << cycle << " WB WR ACK RA=" << setw(8) << hex << setfill('0') << (root->soc->a2owb->wb_adr & 0xFFFFFFFC) <<
                          " SEL=" << setw(1) << setfill('0') << uppercase << hex << (unsigned int)root->soc->a2owb->wb_sel <<
                          " DATA=" << setw(8)  << hex << setfill('0') <<  root->soc->a2owb->wb_datw << endl;
            wbWrPending = false;

         } else if (root->soc->a2owb->wb_cyc && root->soc->a2owb->wb_stb) {
            if (!root->soc->a2owb->wb_we) {
               if (!wbRdPending && debugWBReq)
                  cout << dec << setw(8) << setfill('0') << uppercase << cycle << " WB RD RA=" << setw(8) << hex << setfill('0') << root->soc->a2owb->wb_adr << endl;
               wbRdPending = true;
            } else {
               if (!wbWrPending && debugWBReq)
                  cout << dec << setw(8) << setfill('0') << uppercase << cycle << " WB WR RA=" << setw(8)  << hex << setfill('0') << root->soc->a2owb->wb_adr <<
                          " SEL=" << root->soc->a2owb->wb_sel << " DATA=" << setw(8)  << hex << setfill('0') << root->soc->a2owb->wb_datw << endl;
               wbWrPending = true;
            }
         }

         // leds, btns, mem, etc.

      } else {

         if (resetDone) {
         #ifdef UART
   		   m->serial_rx = (*uart)(m->serial_tx);
         #endif
         }

      }

      m->eval(); // NEED THIS!!!!

      // finish clock stuff
      if ((tick % ticks1x) == 0) {
         cycle++;
         if ((cycle % hbCycles) == 0) {
            cout << dec << setw(8) << setfill('0') << cycle << " ...tick..." << endl;
         }
         if (failMaxCycles &&  (cycle == runCycles)) {
            cout << "*** Max cycles reached ***" << endl;
            ok = false;
         }
      }

      tick++;

      #ifdef TRACING
      t->dump(tick);
      t->flush();
      #endif

      // check for fails

      if (!ok && quiesceCount == 0) {
         quiesceCount = quiesceCycles;
         cout << "Quiescing..." << endl;
      } else if (quiesceCount > 0) {
         quiesceCount--;
         if (ok && quiesceCount == 0) {
            done = true;
         }
      }

   }

#ifdef TRACING
   t->close();
#endif
   m->final();

   cout << endl << endl << tbName << endl;
   cout << endl << "Cycles run=" << dec << cycle << endl << endl;
   if (!ok) {
      cout << "You are worthless and weak." << endl;
      exit(EXIT_FAILURE);
   } else {
      cout << "You has opulence." << endl;
      exit(EXIT_SUCCESS);
   }

}
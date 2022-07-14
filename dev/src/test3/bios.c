#include <stdint.h>

#include "bios.h"

// arci stuff1
void tst_done(unsigned int rc);
unsigned int checkResult(unsigned int r, char* name);
// shouldn't need any of these if i use the .o from bios build???
//#include "generated/soc.h"
extern unsigned int tst_start;
extern unsigned int tst_end;
extern unsigned int tst_inits;
extern unsigned int tst_results;
extern unsigned int tst_expects;


int main(int tid) {
   int *p;
   int *fdata = _fdata;
   unsigned int *inits = &tst_inits;

   if (tid != 0) {
      return -1;
   }

   // r/w memory init

   // copy
   for (p = _fdata_rom; p < _edata_rom; p++){
      *(fdata++) = *p;
   }
   // zero
   for (p = _fbss; p < _ebss; p++) {
      *_fbss = 0;
   }

   // core init
   set_epcr(0x03000000);                        // icm=gicm=1
   set_dec(0);
   set_tbh(0);
   set_tbl(0);
   set_tsr(0xFE000000);                         // mask: clear enw,wis,wrs,dis,fis,udis
   set_xucr0(get_xucr0() & 0x00000200);         // set tcs=0
   set_tsr(0);
   set_tcr(0);                                  // disable all timers

   // thread enable
   // set_tens(0x3);

   // run a .tst
   // danger! once r1 is whacked, any c code like bad int handler, etc. needs
   //  to make sure it has a safe stack for calls
   asm (
      "mr   3,%0\n"
      //"lis  4,init_tst@h\n"
      //"ori  4,4,init_tst@l\n"
      //"mtctr 4\n"
      //"bcctr\n"
      "b    init_tst\n"
      :                       // outputs
      : "r"(inits)            // inputs
      : "r3"                  // clobbers
   );

   while(1) {}

   return 0;
}

#define MAGIC 0x08675309

//void  __attribute__((noreturn)) tst_done(unsigned int rc) {
void tst_done(unsigned int rc) {
   unsigned int i, ok = 1, done = 0;
   /*
   char c;
   char name[10];
   unsigned int r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15;
   unsigned int cr, xer, ctr, lr, tar;
   unsigned int op, *cia;
   */

   if (rc != MAGIC) {
      ok = 0;
   }

   // ops

   // cr, xer, ctr, lr, tar
   ok = ok && checkResult(32, "CR");
   ok = ok && checkResult(33, "XER");
   ok = ok && checkResult(34, "CTR");
   ok = ok && checkResult(35, "LR");
   ok = ok && checkResult(36, "TAR");
}

unsigned int checkResult(unsigned int r, char* name) {
   unsigned int init, act, exp, ok = 1;

   init = *(&tst_inits + r);
   act = *(&tst_results + r);
   exp = *(&tst_expects + r);

   ok = act != exp;

   return ok;
}

// these are branched to!
void int_sc(int code, int srr0) {
   asm (
      "b    tst_end\n"
      :                       // outputs
      :                       // inputs
      :                       // clobbers
   );
}

void int_unhandled(void) {
   while(1) {}
}
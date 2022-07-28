#include <stdint.h>
#include <stdio.h>

#include "bios.h"

#ifdef PRINTF
#include "liblitex.h"

//static char printbuf[1000]; // make this a pointer with address a define
//const char* printbuf = (char *)0x12000;
#ifndef PRINTBUF
#define PRINTBUF 0x0001C000
#endif
//static int printbuf_ptr = 0;
static char *printbuf_ptr = (char *)PRINTBUF;
void putchar_handler(char c) {
   //printbuf[printbuf_ptr++] = c;
   //*(printbuf + printbuf_ptr++) = c;
   *printbuf_ptr++ = c;
}
#endif

// arci stuff
//void tst_done(unsigned int rc);
void tst_done(unsigned int rc);

// in kernel (for constant locs)
extern void tst_pass(void);
extern void tst_fail(int i);
/*
void tst_pass(void);
void tst_fail(int i);

void tst_fail(int i) {
   while(1) {}
}

void tst_pass(void) {
   while(1) {}
}
*/

//inline unsigned int checkResult(unsigned int r) __attribute__((always_inline));
unsigned int checkResult(unsigned int r);

extern unsigned int tst_start;
extern unsigned int tst_end;
extern unsigned int tst_inits;
extern unsigned int tst_results;
extern unsigned int tst_expects;

int main(int tid) {
   int *p;
   int *fdata = &_fdata;
   unsigned int *inits = &tst_inits;

   if (tid != 0) {
      return -1;
   }

   // r/w memory init

   // copy
   for (p = &_fdata_rom; p < &_edata_rom; p++){
      *(fdata++) = *p;
   }
   // zero
   for (p = &_fbss; p < &_ebss; p++) {
      *(p++) = 0;
   }

#ifdef PRINTF
   console_set_write_hook(putchar_handler);
   putchar('w');
   putchar('t');
   putchar('f');
   putchar('\n');
   printf("main(%i)\n", tid);
#endif

   // core init
   set_epcr(0x03000000);                        // icm=gicm=1
   set_dec(0);
   set_tbh(0);
   set_tbl(0);
   set_tsr(0xFE000000);                         // mask: clear enw,wis,wrs,dis,fis,udis
   set_xucr0(get_xucr0() & ~0x00000200);        // set tcs=0
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

// r1 has been restored to where it was for 'b init_tst' above
void tst_done(unsigned int rc) {
   unsigned int i, ok = 1;
   unsigned int act, exp;

   if (rc != MAGIC) {
      tst_fail(0x80000000);
   }

   // check GPR & CR
   for (i = 0; i < 32; i++) {
      act = *(&tst_results + i);
      exp = *(&tst_expects + i);
      ok = ok && (act == exp);
      if (!ok) {
         tst_fail(i);
      }
   }

   // check XER - a2o not compliant right now (only so/ov/ca/len)
   i = 33;
   act = *(&tst_results + i);
   exp = *(&tst_expects + i) & 0xE000007F;
   ok = ok && (act == exp);
   if (!ok) {
      tst_fail(i);
   }

   // check CLT - skip tar, a2o doesn't have usermode sprg to use for save reg, so using tar
   //for (i = 34; i < 37; i++) {
   for (i = 34; i < 36; i++) {
      act = *(&tst_results + i);
      exp = *(&tst_expects + i);
      ok = ok && (act == exp);
      if (!ok) {
         tst_fail(i);
      }
   }

   // could get back to kernel
   tst_pass();
   while (1) {}
}

// these are branched to!  but if fun, they assume r1 is stack!!!!

// tst is ended with sc to return to priv mode; then save results
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


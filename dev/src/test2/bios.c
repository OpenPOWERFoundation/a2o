#include <stdint.h>

#include "bios.h"

int main(int tid) {
   int *p;
   int *fdata = _fdata;

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

   return 0;
}


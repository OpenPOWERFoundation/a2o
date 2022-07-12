#include <stdint.h>

uint32_t main(uint32_t tid) {
   uint32_t i, a = tid;
   for (i = 0; i < 10; i++) {
      a = a + i + 1;
   }
   if (a == 55+tid) {
      return 0;
   } else {
      return 0x8000000 + a;
   }
}
#ifndef BIOS_H

#define BIOS_H

extern int *_fdata_rom;
extern int *_edata_rom;
extern int *_fdata;
extern int *_fbss;
extern int *_ebss;

inline void set_epcr(int v) __attribute__((always_inline));
inline void set_dec(int v) __attribute__((always_inline));
inline void set_tbh(int v) __attribute__((always_inline));
inline void set_tbl(int v) __attribute__((always_inline));
inline void set_tsr(int v) __attribute__((always_inline));
inline void set_tcr(int v) __attribute__((always_inline));
inline void set_tens(int v) __attribute__((always_inline));
inline void set_xucr0(int v) __attribute__((always_inline));
inline int get_xucr0(void) __attribute__((always_inline));

inline void set_epcr(int v) {
   asm volatile(
       "lis  4,%0@h\n"
       "ori  4,4,%0@l\n"
       "mtspr 307,4\n"              // epcr
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

inline void set_dec(int v) {
   asm volatile(
       "lis  4,%0@h\n"
       "ori  4,4,%0@l\n"
       "mtspr 22,4\n"               // dec
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

inline void set_tbh(int v) {
   asm volatile(
       "lis  4,%0@h\n"
       "ori  4,4,%0@l\n"
       "mtspr 285,4\n"              // tbh
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

inline void set_tbl(int v) {
   asm volatile(
       "lis  4,%0@h\n"
       "ori  4,4,%0@l\n"
       "mtspr 284,4\n"              // tbl
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

inline void set_tsr(int v) {
   asm volatile(
       "lis  4,%0@h\n"
       "ori  4,4,%0@l\n"
       "mtspr 336,4\n"              // tsr
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

inline void set_tcr(int v) {
   asm volatile(
       "lis  4,%0@h\n"
       "ori  4,4,%0@l\n"
       "mtspr 340,4\n"              // tcr
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

inline int get_xucr0(void) {
   int v;
   asm volatile(
       "mfspr %0,1014\n"            // xucr0
       : "=r"(v)                    // outputs
       :                            // inputs
       :                            // clobbers
   );
   return v;
}

inline void set_xucr0(int v) {
   asm volatile(
       "lis  4,%0@h\n"
       "ori  4,4,%0@l\n"
       "mtspr 1014,4\n"             // xucr0
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

inline void set_tens(int v) {
   asm volatile(
       "lis  4,%0@h\n"
       "ori  4,4,%0@l\n"
       "mtspr 438,4\n"              // tens
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

#endif
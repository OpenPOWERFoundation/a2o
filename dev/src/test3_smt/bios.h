#ifndef _BIOS_H_
#define _BIOS_H_

// need address for linker constants!
extern int _fdata_rom;
extern int _edata_rom;
extern int _fdata;
extern int _fbss;
extern int _ebss;

// printf to mem
void putchar_handler(char c);


void int_sc(int code, int srr0);
void int_unhandled(void);

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
       "mtspr 307,%0\n"             // epcr
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

inline void set_dec(int v) {
   asm volatile(
       "mtspr 22,%0\n"              // dec
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

inline void set_tbh(int v) {
   asm volatile(
       "mtspr 285,%0\n"             // tbh
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

inline void set_tbl(int v) {
   asm volatile(
       "mtspr 284,%0\n"             // tbl
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

inline void set_tsr(int v) {
   asm volatile(
       "mtspr 336,%0\n"             // tsr
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

inline void set_tcr(int v) {
   asm volatile(
       "mtspr 340,%0\n"             // tcr
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
       "mtspr 1014,%0\n"            // xucr0
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

inline void set_tens(int v) {
   asm volatile(
       "mtspr 438,%0\n"             // tens
       :                            // outputs
       : "r"(v)                     // inputs
       : "r4"                       // clobbers
   );
}

#endif
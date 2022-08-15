#ifndef __IRQ_H
#define __IRQ_H

static inline void irq_setmask(unsigned int mask) {
}

static inline unsigned int irq_getmask(void) {
   return 0;
}

static inline unsigned int irq_pending(void) {
   return 0;
}

static inline void irq_setie(unsigned int mask) {
}

#endif
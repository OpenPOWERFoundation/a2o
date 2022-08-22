#ifndef __IRQ_H
#define __IRQ_H

// what do i implement for this?
// what if i want uart polling? uart still gen's uart_irq
// assign uart_irq = ((uart_pending_status[0] & uart_enable_storage[0]) | (uart_pending_status[1] & uart_enable_storage[1]));
// i have to disable in node i guess
/* uwatt
static inline void irq_setmask(unsigned int mask)
{
	int irq;

	// Enable all interrupts at a fixed priority level for now
	int priority_level = PPC_EXT_INTERRUPT_PRIO;

	// Iterate over IRQs configured in mask, and enable / mask in ICS
	for (irq = 0; irq < PPC_XICS_SRC_NUM; irq++) {
		if ((mask >> irq) & 0x1)
			xics_ics_write_xive(irq, priority_level);
		else
			xics_ics_write_xive(irq, 0xff);
	}
}
*/
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
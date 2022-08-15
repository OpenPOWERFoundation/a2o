.section .text, "ax", @progbits
# called by bios boot commands to do the jump to code (r1,r2,r3 can be specified in terminal 'boot' command)

.include "defines.s"

.global boot_helper
# extern void boot_helper(unsigned long r1, unsigned long r2, unsigned long r3, unsigned long addr);

.align 4
boot_helper:
   lis      r3,_fstack@h
   ori      r3,r3,_fstack@l   # top o mem
   mtctr    r6
   bctr                       # jump to callee

   # play with stack. what could go wrong?
   # r1 = new top
   #   orig lr         20(r1)
   #   ancient r1      16(r1)
   #   local1          12(r1)
   #   local2           8(r1)
   #   (next lr)        4(r1)
   #   orig r1          0(r1)
   # doesnt help...getting a bad op, probably blr to wrong address off stack, within calls to do a putchar
   stwu     r1,-32(r1)
   mflr     r0
   stw      r0,36(r1)
   stw      r3,8(r1)
   stw      r4,12(r1)
   stw      r5,16(r1)
   stw      r6,20(r1)
   li       r3,'w'
   slwi     r3,r3,8
   ori      r3,r3,'t'
   slwi     r3,r3,8
   ori      r3,r3,'f'
   slwi     r3,r3,8
   ori      r3,r3,'!'
   stw      r3,24(r1)
   stw      r3,28(r1)
   lwz      r0,36(r1)
   mtlr     r6
   addi     r1,r1,32
   blr

   #addi     r1,r1,32      # leave frame on stack
   #mtctr    r6
   #bctrl                   # jump to callee

   b        .

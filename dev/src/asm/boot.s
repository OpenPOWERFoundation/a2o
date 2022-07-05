# © IBM Corp. 2020
# Licensed under and subject to the terms of the CC-BY 4.0
# license (https://creativecommons.org/licenses/by/4.0/legalcode).
# Additional rights, including the right to physically implement a softcore
# that is compliant with the required sections of the Power ISA
# Specification, will be available at no cost via the OpenPOWER Foundation.
# This README will be updated with additional information when OpenPOWER's
# license is available.

# boot kernel
#  set up translations
#  set up timer facilities
#  set up threads
#  call user code
#  process user rc

# todo:
# 1. skip_printf_init flag should be threaded

.include "defines.s"

.section .text
start:

int_000:
      b         boot_start

# critical input
.align 5
int_020:
      b         .

# debug
.align 5
int_040:
      b         .

# dsi
.align 5
int_060:
      b         .

# isi
.align 5
int_080:
      b         .

# external
.align 5
int_0A0:
      b         .

# alignment
.align 5
int_0C0:
      b         .

# program
.align 5
int_0E0:
      b         .

# fp unavailable
.align 5
int_100:
      b         .

# sc
.align 5
int_120:
      b         int_120_handler

# apu unavailable
.align 5
int_140:
      b         .

# decrementer
.align 5
int_160:
      b         .

# fit
.align 5
int_180:
      b         .

# watchdog
.align 5
int_1A0:
      b         .

# dtlb
.align 5
int_1C0:
      b         .

# itlb
.align 5
int_1E0:
      b         .

# vector unavailable
.align 5
int_200:
      b         .

#
.align 5
int_220:
      b         .

#
.align 5
int_240:
      b         .

#
.align 5
int_260:
      b         .

# doorbell
.align 5
int_280:
      b         .

# doorbell critical
.align 5
int_2A0:
      b         .

# doorbell guest
.align 5
int_2C0:
      b         .

# doorbell guest critical
.align 5
int_2E0:
      b         .

# hvsc
.align 8
int_300:
      b         int_300_handler

# hvpriv
.align 5
int_320:
      b         .

# lrat
.align 5
int_340:
      b         .

# ------------------------------------------------------------------------------------------------------------------------------
# initial translation
# both erats:
# 00000000 1M: (boot)
# 10000000 1M: (test)

.align 8
boot_start:

      mfspr     r5,tir           # who am i?
      cmpdi     r5,0x00          # skip unless T0
      bne       init_t123

      lis       r3,0x8C00        # 32=ecl 36:37=tlbsel (10=i, 11=d)
# derat 31 @00000000

      li        r0,0x001F        # entry #31
      li        r2,0x0015        # word 2 wlc=40:41 rsvd=42 u=44:47 r=48 c=49 wimge=52:56 vf=57 ux/sx=58:59 uw/sw=60:61 ur/sr=62:63
      li        r4,0             # word 1 rpn(32:51)=32:51 rpn(22:31)=54:63
      li        r8,0x025F        # word 0 epn=32:51 class=52:53 v=54 x=55 size=56:59 thrd=60:63   size: 0001=4K 0011=64K 0101=1M 0111=16M 1010=1G

      mtspr     mmucr0,r3
      eratwe    r2,r0,2
      eratwe    r4,r0,1
      eratwe    r8,r0,0
      isync

      lwz       r10,CONFIG+S_ERATW2(r0)  # load parms for erat settings

# derat 30  @100000000

      li        r0,0x001E        # entry #30
      lis       r4,0x1000        # word 1 rpn(32:51)=32:51 rpn(22:31)=54:63
      li        r8,0x025F        # word 0 epn=32:51 class=52:53 v=54 x=55 size=56:59 thrd=60:63   size: 0001=4K 0011=64K 0101=1M 0111=16M 1010=1G
      oris      r8,r8,0x1000

      eratwe    r10,r0,2
      eratwe    r4,r0,1
      eratwe    r8,r0,0
      isync

      lis       r3,0x8800        # 32=ecl 36:37=tlbsel (10=i, 11=d)
# ierat 15  @00000000

      li        r0,0x000F        # entry #15
      li        r2,0x003F        # word 2 wlc=40:41 rsvd=42 u=44:47 r=48 c=49 wimge=52:56 vf=57 ux/sx=58:59 uw/sw=60:61 ur/sr=62:63
      li        r4,0             # word 1 rpn(32:51)=32:51 rpn(22:31)=54:63
      li        r8,0x025F        # word 0 epn=32:51 class=52:53 v=54 x=55 size=56:59 thrd=60:63   size: 0001=4K 0011=64K 0101=1M 0111=16M 1010=1G

      mtspr     mmucr0,r3
      eratwe    r2,r0,2
      eratwe    r4,r0,1
      eratwe    r8,r0,0
      isync

 # *** leave the init'd entry 14 for MT access to FFFFFFC0
 # ierat 13  @10000000

      li        r0,0x000D        # entry #13
      lis       r4,0x1000        # word 1 rpn(32:51)=32:51 rpn(22:31)=54:63
      li        r8,0x025F        # word 0 epn=32:51 class=52:53 v=54 x=55 size=56:59 thrd=60:63   size: 0001=4K 0011=64K 0101=1M 0111=16M 1010=1G
      oris      r8,r8,0x1000

      eratwe    r10,r0,2
      eratwe    r4,r0,1
      eratwe    r8,r0,0
      isync

# ------------------------------------------------------------------------------------------------------------------------------
# init
#

# T0-only
# set up any core facilities, then enable the others if config'd
init_t0:

# switch to 64b

      lwz       r10,CONFIG+S_MSR(r0)
      mtmsr     r10
      isync

# other init

      lis       r1,0x0300        # icm=gicm=1
      mtspr     epcr,r1

# set up timer facs

      li        r1,0             # clear
      mtspr     dec,r1
      mtspr     tbh,r1
      mtspr     tbl,r1

      lis       r2,0xFE00        # mask: clear enw,wis,wrs,dis,fis,udis
      mtspr     tsr,r2

      mfspr     r2,xucr0
      andi.     r2,r2,0x0200     # set tcs=0
      mtspr     xucr0,r2

      mtspr     tsr,r1           # clear tsr
      mtspr     tcr,r1           # disable all timers

# set thread configuration

      lwz       r1,CONFIG+S_FLAGS(r0)
      andi.     r1,r1,0xF
      mtspr     tens,r1          # 60:63 = tid 3:0 enabled
      #not       r1,r1
      #mtspr     tenc,r1         # in case T0 is marked disabled
      isync

      b         boot_complete

# except T0
# just worry about myself

init_t123:

# switch to 64b

      lwz       r10,CONFIG+S_MSR(r0)
      mtmsr     r10
      isync

      b         boot_complete

# ------------------------------------------------------------------------------------------------------------------------------
boot_complete:

# set up thread and hop to it

      lwz       r1,CONFIG+S_FLAGS(r0)
      andis.    r1,r1,0x8000     # 1=skip initial printf init
      bne       boot_complete_1
      bl        printf_reset     # wipe buffer

boot_complete_1:

      lwz       r1,CONFIG+S_FLAGS(r0)
      lis       r2,0x7FFF        # clear printf flag
      ori       r2,r2,0xFFFF
      and       r1,r1,r2
      stw       r1,CONFIG+S_FLAGS(r0)

      mfspr     r5,tir           # who am i?
      sldi      r5,r5,6          # 64B offset
      addi      r5,r5,CONFIG+T_CONFIG

      lwz       r11,T_MSR(r5)
      ld        r12,T_STACK(r5)
      ld        r13,T_ENTRY(r5)

      lwz       r1,CONFIG+S_FLAGS(r0)
      andi.     r1,r1,FLAG_EOT_SC
      beq       eot_blr

eot_sc:

      lwz       r2,CONFIG+S_EOT_SC(r0)
      lis       r1,0x4400        # 'sc 1'
      ori       r1,r1,0022
      std       r1,0x0(r2)
      mtlr      r1               # prog will blr to sc
      b         process_start

eot_blr:

      bl        4
      mflr      r1
      addi      r1,r1,0x30       # !!!!!!!!!!!!!!! <-- WARNING!
      mtlr      r1               # prog will blr to exec_complete

process_start:

      mtspr     srr1,r11         # msr
      mtspr     srr0,r13         # @entry
      mr        r1,r12           # @stack
      mfspr     r3,tir           # tid - main(tid) if yall want it

      mfspr     r2,tb
      std       r2,T_TIMER_START(r5)
      rfi
      nop                        # !!!!!!!!!!!!!!! pads for lr calc
      nop
      nop

# ------------------------------------------------------------------------------------------------------------------------------
exec_complete:
# allow blr to here, or it will be entered by sc directly

# user blr'd here...
      sc        1                # hvsc back to sup state

exec_complete_sup:
      mfspr     r5,tir           # who am i?
      sldi      r5,r5,6          # 64B offset
      addi      r5,r5,CONFIG+T_CONFIG

      mfspr     r2,tb
      std       r2,T_TIMER_END(r5)

      cmpdi     r3,0             # check rc
      beq       pass
      b         fail

# ------------------------------------------------------------------------------------------------------------------------------
# dead zone
.align 8
fail:
      b         .

# ------------------------------------------------------------------------------------------------------------------------------
# happy ending
.align 8
pass:
      b         .

# ------------------------------------------------------------------------------------------------------------------------------

# dec
.align 11
int_800:
      b         .

# perf
.align 5
int_820:
      b         .

.set CONFIG,0x0A00
# ------------------------------------------------------------------------------------------------------------------------------
# config info
.align 9

      .long  0x8002B000          # sup MSR cm=1 ce=1 ee=1 pr=0 fp=1 me=1 fe=00 de=0 is=0 ds=0
      .long  0x80000001          # flags: skip_printf_init=0 eot_sc=27 thr_en=28:31(T3:T0)
      .long  0x000000BF          # erat w2 (test)   # word 2 wlc=40:41 rsvd=42 u=44:47 r=48 c=49 wimge=52:56 vf=57 ux/sx=58:59 uw/sw=60:61 ur/sr=62:63
      .long  0x10000000          # @user eot sc

# per-thread configs (64B each)
.align 7
      .long  0x8002F000          # usr MSR cm=1 ce=1 ee=1 pr=1 fp=1 me=1 fe=00 de=0 is=0 ds=0
      .long  0x00000000          #
      .long  0x00000000          #
      .long  0x1003FF00          # @stack
      .long  0x00000000          #
      .long  0x100004B0          # @entry
      .long  0
      .long  0x10030000          # @print_start
      .long  0
      .long  0x10031FFF          # @print_end
      .long  0
      .long  0x10030000          # print ptr
      .quad  0                   # start tb
      .quad  0                   # end tb

      .long  0x8002F000          # usr MSR cm=1 ce=1 ee=1 pr=1 fp=1 me=1 fe=00 de=0 is=0 ds=0
      .long  0x00000000          #
      .long  0x00000000          #
      .long  0x1003DF00          # @stack
      .long  0x00000000          #
      .long  0x100004B0          # @entry
      .long  0
      .long  0x10032000          # @print_start
      .long  0
      .long  0x10033FFF          # @print_end
      .long  0
      .long  0x10032000          # print ptr
      .quad  0                   # start tb
      .quad  0                   # end tb

      .long  0x8002F000          # usr MSR cm=1 ce=1 ee=1 pr=1 fp=1 me=1 fe=00 de=0 is=0 ds=0
      .long  0x00000000          # flags
      .long  0x00000000          #
      .long  0x1003BF00          # @stack
      .long  0x00000000          #
      .long  0x100004B0          # @entry
      .long  0
      .long  0x10034000          # @print_start
      .long  0
      .long  0x10035FFF          # @print_end
      .long  0
      .long  0x10034000          # print ptr
      .quad  0                   # start tb
      .quad  0                   # end tb

      .long  0x8002F000          # usr MSR cm=1 ce=1 ee=1 pr=1 fp=1 me=1 fe=00 de=0 is=0 ds=0
      .long  0x00000000          # flags
      .long  0x00000000          #
      .long  0x10039F00          # @stack
      .long  0x00000000          #
      .long  0x100004B0          # @entry
      .long  0
      .long  0x10036000          # @print_start
      .long  0
      .long  0x10037FFF          # @print_end
      .long  0
      .long  0x10036000          # print ptr
      .quad  0                   # start tb
      .quad  0                   # end tb


.set S_MSR,0x00
.set S_FLAGS,0x04
.set S_ERATW2,0x08
.set S_EOT_SC,0x0C

.set T_CONFIG,0x80
.set T_MSR,0x00
.set T_FLAGS,0x04
.set T_STACK,0x08
.set T_ENTRY,0x10
.set T_TIMER_START,0x30
.set T_TIMER_END,0x38
.set T_PRINTSTART, 0x18
.set T_PRINTEND, 0x20
.set T_PRINTF, 0x28
.set FLAG_EOT_SC,0x10


# ------------------------------------------------------------------------------------------------------------------------------
# other stuff
.align 10

# clear buffer and reset pointer to start
.align 6
printf_reset:

      mfspr     r5,tir           # who am i?
      sldi      r5,r5,6          # 64B offset
      addi      r5,r5,CONFIG+T_CONFIG

      addi      r6,r5,T_PRINTSTART
      ld        r7,0(r6)         # buffer start
      addi      r6,r5,T_PRINTEND
      ld        r8,0(r6)         # buffer end
      sub       r8,r8,r7
      addi      r8,r8,1          # num bytes

      mtctr     r8
      li        r6,0
      mr        r8,r7
printf_reset_clr:
      stb       r6,0(r8)
      addi      r8,r8,1
      bdnz      printf_reset_clr

      addi      r8,r5,T_PRINTF
      std       r7,0(r8)         # reset ptr

      blr


# hvsc
.align 8
# go to exec_complete_sup in sup mode
int_300_handler:

      lwz       r0,CONFIG+S_MSR(r0)
      mtmsr     r0
      isync
      b         exec_complete_sup

# sc
.align 8
# r3 is id, remaining are function-specific
# not preserving r0, r3-r9 right now
#
# 0001 whoami
# 0010 tick
# 0100 putchar r4=c
# 0106 printf_mode *NI*
# 0107 printf_rst
#
int_120_handler:

      mflr      r0

      cmpdi     r3,0x0001
      beq       sc_whoami
      cmpdi     r3,0x0010
      beq       sc_tick
      cmpdi     r3,0x100
      beq       sc_putchar
      cmpdi     r3,0x107
      beq       sc_printf_rst

      li        r3,-1
      mtlr      r0
      rfi

# thread id
.align 6
sc_whoami:
      mfspr     r3,tir
      rfi

# tb
.align 6
sc_tick:
      mfspr     r3,tb
      rfi

# wrap buffer; could add flag to stop when full, or reset
.align 6
sc_putchar:

      mfspr     r5,tir           # who am i?
      sldi      r5,r5,6          # 64B offset
      addi      r5,r5,CONFIG+T_CONFIG

      addi      r6,r5,T_PRINTF
      ld        r7,0(r6)         # buffer ptr
      stb       r4,0(r7)         # store char
      addi      r7,r7,1

      addi      r8,r5,T_PRINTEND
      ld        r8,0(r8)         # buffer end
      cmpd      r7,r8
      li        r3,0             # rc=normal
      ble       sc_putchar_ok
      addi      r8,r5,T_PRINTSTART
      ld        r7,0(r8)         # buffer start
      li        r3,-1            # rc=full
sc_putchar_ok:
      std       r7,0(r6)         # save ptr

      rfi

# clear buffer and reset pointer to start
.align 6
sc_printf_rst:

      mfctr     r3

      bl        printf_reset

      mtctr     r3
      mtlr      r0
      li        r3,0

      rfi


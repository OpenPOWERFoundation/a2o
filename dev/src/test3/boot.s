# © IBM Corp. 2022
# Licensed under and subject to the terms of the CC-BY 4.0
# license (https://creativecommons.org/licenses/by/4.0/legalcode).
# Additional rights, including the right to physically implement a softcore
# that is compliant with the required sections of the Power ISA
# Specification, will be available at no cost via the OpenPOWER Foundation.
# This README will be updated with additional information when OpenPOWER's
# license is available.

# boot kernel
#  resets to 32BE
#  set up translations for starting bios (inc. BE/LE)
#  copy modifiable rom data to ram - or do in bios?
#  set up msr for running bios (inc. 32/64)
#  jump to bios


.include "defines.s"

.macro load32  rx,v
      li       \rx,0
      oris     \rx,\rx,\v>>16
      ori      \rx,\rx,\v&0x0000FFFF
.endm

.macro load16swiz rx,v
      li       \rx,0
      ori      \rx,\rx,(\v<<8)&0xFF00
      ori      \rx,\rx,(\v>>8)&0x00FF
.endm

# constants from linker script, or defsym

.ifdef BIOS_32
# sup MSR cm=1 ce=1 ee=1 pr=0 fp=1 me=1 fe=00 de=0 is=0 ds=0
.set BIOS_MSR,0x0002B000
.else
# sup MSR cm=1 ce=1 ee=1 pr=0 fp=1 me=1 fe=00 de=0 is=0 ds=0
.set BIOS_MSR,0x8002B000
.endif

#wtf this should to be done in bios based on the tst
# erat w2 (test)   # word 2 wlc=40:41 rsvd=42 u=44:47 r=48 c=49 wimge=52:56 vf=57 ux/sx=58:59 uw/sw=60:61 ur/sr=62:63
.ifdef BIOS_LE
.set BIOS_ERATW2,0x000000BF
.else
.set BIOS_ERATW2,0x0000003F
.endif

# bios might be able to use one stack during thread startup if careful
.ifndef BIOS_STACK_0
.set BIOS_STACK_0,_stack_0
.endif

.ifndef BIOS_STACK_1
.set BIOS_STACK_1,_stack_1
.endif

#wtf get rid of this and just make the low 1G a single erat entry - it can be fixed up by bios later
.ifndef BIOS_START
.set BIOS_START,0x00010000
.endif

.section .text

.global _start

.org 0x000
_start:
int_000:
      b         boot_start

.ifdef TST_END
# tst ends with ba here, which switches to priv and jumps to tst_end
      sc
.endif

# critical input
.org 0x020
int_020:
.ifdef INT_UNHANDLED
      b         int_unhandled
.else
      b         .
.endif

# debug
.org 0x040
int_040:
      b         .

# dsi
.org 0x060
int_060:
      b         .

# isi
.org 0x080
int_080:
      b         .

# external
.org 0x0A0
int_0A0:
      b         .

# alignment
.org 0x0C0
int_0C0:
      b         .

# program
.org 0x0E0
int_0E0:
      b         .

# fp unavailable
.org 0x100
int_100:
      b         .

# sc
.org 0x120
int_120:
.ifdef TST_END
# tst results haven't been saved yet; if want to call bios, need to save r1, then restore or set stack
      b         tst_end
.else
.ifdef INT_SC
      # lev is in 20:26, but supposed to use scv now
      li        r3,0
      mfsrr0    r4
      b         int_sc
.else
.ifdef INT_UNHANDLED
      b         int_unhandled
.else
      b         .
.endif
.endif
.endif

# apu unavailable
.org 0x140
int_140:
      b         .

# decrementer
.org 0x160
int_160:
      b         .

# fit
.org 0x180
int_180:
      b         .

# watchdog
.org 0x1A0
int_1A0:
      b         .

# dtlb
.org 0x1C0
int_1C0:
      b         .

# itlb
.org 0x1E0
int_1E0:
      b         .

# vector unavailable
.org 0x200
int_200:
      b         .

#
.org 0x220
int_220:
      b         .

#
.org 0x240
int_240:
      b         .

#
.org 0x260
int_260:
      b         .

# doorbell
.org 0x280
int_280:
      b         .

# doorbell critical
.org 0x2A0
int_2A0:
      b         .

# doorbell guest
.org 0x2C0
int_2C0:
      b         .

# doorbell guest critical
.org 0x2E0
int_2E0:
      b         .

# hvsc
.org 0x300
int_300:
      b         .

# hvpriv
.org 0x320
int_320:
      b         .

# lrat
.org 0x340
int_340:
      b         .

# ------------------------------------------------------------------------------------------------------------------------------
# initial translation
# both erats:
# 00000000 64K: (rom, BE)
# 00010000 64K: (ram, BE or LE)
#
.org 0x400
boot_start:

      mfspr     r5,tir           # who am i?
      cmpdi     r5,0x00          # skip unless T0
      bne       init_t123

      lis       r3,0x8C00        # 32=ecl 36:37=tlbsel (10=i, 11=d)

# derat 31 @00000000
      li        r0,0x001F        # entry #31
      li        r2,0x0015        # word 2 wlc=40:41 rsvd=42 u=44:47 r=48 c=49 wimge=52:56 vf=57 ux/sx=58:59 uw/sw=60:61 ur/sr=62:63
      li        r4,0             # word 1 rpn(32:51)=32:51 rpn(22:31)=54:63
      li        r8,0x023F        # word 0 epn=32:51 class=52:53 v=54 x=55 size=56:59 thrd=60:63   size: 0001=4K 0011=64K 0101=1M 0111=16M 1010=1G

      mtspr     mmucr0,r3
      eratwe    r2,r0,2
      eratwe    r4,r0,1
      eratwe    r8,r0,0
      isync

      load32    r10,BIOS_ERATW2  # word 2 wlc=40:41 rsvd=42 u=44:47 r=48 c=49 wimge=52:56 vf=57 ux/sx=58:59 uw/sw=60:61 ur/sr=62:63

# derat 30  @<BIOS_START>
      li        r0,0x001E        # entry #30
      load32    r4,BIOS_START    # word 1 rpn(32:51)=32:51 rpn(22:31)=54:63
      load32    r8,BIOS_START
      ori       r8,r8,0x023F     # word 0 epn=32:51 class=52:53 v=54 x=55 size=56:59 thrd=60:63   size: 0001=4K 0011=64K 0101=1M 0111=16M 1010=1G

      eratwe    r10,r0,2
      eratwe    r4,r0,1
      eratwe    r8,r0,0
      isync

      lis       r3,0x8800        # 32=ecl 36:37=tlbsel (10=i, 11=d)

# ierat 15  @00000000
      li        r0,0x000F        # entry #15
      li        r2,0x003F        # word 2 wlc=40:41 rsvd=42 u=44:47 r=48 c=49 wimge=52:56 vf=57 ux/sx=58:59 uw/sw=60:61 ur/sr=62:63
      li        r4,0             # word 1 rpn(32:51)=32:51 rpn(22:31)=54:63
      li        r8,0x023F        # word 0 epn=32:51 class=52:53 v=54 x=55 size=56:59 thrd=60:63   size: 0001=4K 0011=64K 0101=1M 0111=16M 1010=1G

      mtspr     mmucr0,r3
      eratwe    r2,r0,2
      eratwe    r4,r0,1
      eratwe    r8,r0,0
      isync

 # *** leave the init'd entry 14 for MT access to FFFFFFC0
 # ierat 13  @<BIOS_START>
      li        r0,0x000D        # entry #13
      load32    r4,BIOS_START    # word 1 rpn(32:51)=32:51 rpn(22:31)=54:63
      load32    r8,BIOS_START
      ori       r8,r8,0x023F     # word 0 epn=32:51 class=52:53 v=54 x=55 size=56:59 thrd=60:63   size: 0001=4K 0011=64K 0101=1M 0111=16M 1010=1G

      eratwe    r10,r0,2
      eratwe    r4,r0,1
      eratwe    r8,r0,0
      isync

      b         init_t0

# ------------------------------------------------------------------------------------------------------------------------------
# init
#

# T0

init_t0:

# set up BIOS msr

      load32    r10,BIOS_MSR
      mtmsr     r10
      isync
# can't use load32 unless you can .set BIOS_STACK_0 to the linked value
#      load32    r1,BIOS_STACK_0  # @stack_0
# this ignores def
#      lis        r1,_stack_0@h
#      ori        r1,r1,_stack_0@l
# this requires data load
      lwz       r1,stack_0(r0)

      b         boot_complete

# except T0

init_t123:

# set up BIOS msr

      load32    r10,BIOS_MSR
      mtmsr     r10
      isync
      # check tir if more than 2 threads possible
      lwz       r1,stack_1(r0)

      b         boot_complete

# ------------------------------------------------------------------------------------------------------------------------------
boot_complete:

# set up thread and hop to it

      lis       r3,main@h
      ori       r3,r3,main@l
      mtctr     r3
      mfspr     r3,tir           # who am i?
      bctrl
      b         kernel_return

# ------------------------------------------------------------------------------------------------------------------------------

.ifdef TST_PASSFAIL
.global tst_pass
.global tst_fail

.org 0x7F0
tst_pass:
      b         .

.org 0x7F4
tst_fail:
      b         .
.endif

.org 0x7FC
kernel_return:
      b         .

# dec
.org 0x800
int_800:
      b         .

# perf
.org 0x820
int_820:
      b         .

.org 0x8F0
.section .rodata
stack_0:        .long BIOS_STACK_0
stack_1:        .long BIOS_STACK_1

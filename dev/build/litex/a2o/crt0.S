# © IBM Corp. 2022
# Licensed under and subject to the terms of the CC-BY 4.0
# license (https://creativecommons.org/licenses/by/4.0/legalcode).
# Additional rights, including the right to physically implement a softcore
# that is compliant with the required sections of the Power ISA
# Specification, will be available at no cost via the OpenPOWER Foundation.
# This README will be updated with additional information when OpenPOWER's
# license is available.

# litex boot kernel (original ppc-embedded architecture)
#  resets to 32BE
#  set up translations for starting bios (inc. BE/LE)
#  copy modifiable rom data to ram
#  set up msr for running bios (inc. 32/64)
#  jump to bios

.include "defines.s"

# pass in with -defsym
;# if neither defined, it's 64BE!
# BE/LE
#.set BIOS_LE,1
# 32/64
#.set BIOS_32,1

# this is for i/d xlate setup of 2nd entry; it should be related to _fdata i think
.set BIOS_START,0x10000
# this is for d xlate setup of 3rd entry; it needs to be defined by memory map; it could be done by bios code,
#  but has to be done before uart_init is called
.set CSR_START,0xFFF00000

# needed for litex
.set ROM_INIT,1

# not needed for litex
.set BIOS_STACK_0,_fstack-8
.set BIOS_STACK_1,_fstack-8

.macro load32  rx,v
      lis      \rx,\v>>16
      ori      \rx,\rx,\v&0x0000FFFF
.endm

.macro load16swiz rx,v
      lis      \rx,(\v<<8)&0xFF00
      ori      \rx,\rx,(\v>>8)&0x00FF
.endm

# constants from linker script, or defsym

.ifndef THREAD_ENABLES
.set THREAD_ENABLES,0x1
.endif

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

.section .text

.global _start

.org 0x000
_start:

.ifdef BIOS_LE
# a2o boots in 32Be w/erats set up for BE; rewrite I[15],D[31]
# 0000000000000240 <_start>:
# 240:	00 8c 60 3c 	lis     r3,-29696
# 244:	1f 00 00 38 	li      r0,31
# 248:	95 00 40 38 	li      r2,149
# 24c:	00 00 80 38 	li      r4,0
# 250:	3f 02 00 39 	li      r8,575
# 254:	a6 fb 7c 7c 	mtspr   1020,r3
# 258:	a6 11 40 7c 	eratwe  r2,r0,2
# 25c:	a6 09 80 7c 	eratwe  r4,r0,1
# 260:	a6 01 00 7d 	mtfprwa f8,r0
# 264:	2c 01 00 4c 	isync
# 268:	00 88 60 3c 	lis     r3,-30720
# 26c:	0f 00 00 38 	li      r0,15
# 270:	bf 00 40 38 	li      r2,191
# 274:	00 00 80 38 	li      r4,0
# 278:	3f 02 00 39 	li      r8,575
# 27c:	a6 fb 7c 7c 	mtspr   1020,r3
# 280:	a6 11 40 7c 	eratwe  r2,r0,2
# 284:	a6 09 80 7c 	eratwe  r4,r0,1
# 288:	a6 01 00 7d 	mtfprwa f8,r0
# 28c:	2c 01 00 4c 	isync
# 290:	00 00 40 39 	li      r10,0
# 294:	02 80 4a 65 	oris    r10,r10,32770
# 298:	00 b0 4a 61 	ori     r10,r10,45056
# 29c:	24 01 40 7d 	mtmsr   r10
# 2a0:	2c 01 00 4c 	isync

.long 0x008c603c
.long 0x1f000038
.long 0x95004038
.long 0x00008038
.long 0x3f020039
.long 0xa6fb7c7c
.long 0xa611407c
.long 0xa609807c
.long 0xa601007d
.long 0x2c01004c
.long 0x0088603c
.long 0x0f000038
.long 0xbf004038
.long 0x00008038
.long 0x3f020039
.long 0xa6fb7c7c
.long 0xa611407c
.long 0xa609807c
.long 0xa601007d
.long 0x2c01004c
# stay in 32b mode until done with common code
#.long 0x00004039
#.long 0x02804a65
#.long 0x00b04a61
#.long 0x2401407d
#.long 0x2c01004c
#.long 0x02040048
#      isync
#      li      r10,0
#      oris    r10,r10,32770
#      ori     r10,r10,45056
#      mtmsr   r10
#      isync

.else

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

.endif

b         boot_start

# ints need to handle save/restore and call to isr (like uart_isr())
# enable in a2node when it's safe (stack set up, etc.)

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
#
.org 0x400
boot_start:

      mfspr     r5,tir           # who am i?
      cmpdi     r5,0x00          # skip unless T0
      bne       init_t123

      lis       r3,0x8C00        # 32=ecl 36:37=tlbsel (10=i, 11=d)
      mtspr     mmucr0,r3

.ifndef BIOS_LE
# derat 31 @00000000
      li        r0,0x001F        # entry #31
      li        r2,0x0015        # word 2 wlc=40:41 rsvd=42 u=44:47 r=48 c=49 wimge=52:56 vf=57 ux/sx=58:59 uw/sw=60:61 ur/sr=62:63
      li        r4,0             # word 1 rpn(32:51)=32:51 rpn(22:31)=54:63
      li        r8,0x023F        # word 0 epn=32:51 class=52:53 v=54 x=55 size=56:59 thrd=60:63   size: 0001=4K 0011=64K 0101=1M 0111=16M 1010=1G

      eratwe    r2,r0,2
      eratwe    r4,r0,1
      eratwe    r8,r0,0
      isync
.endif

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

# derat 29  @<CSR_START>  I=1!!!
      li        r0,0x001D        # entry #29
      #ori       r10,r10,0x0F00   # word 2 with WIMG=F - doesn't work for 64LE
      li        r10,0x0F3F       # WIMG=F BE
      load32    r4,CSR_START     # word 1 rpn(32:51)=32:51 rpn(22:31)=54:63
      load32    r8,CSR_START
      ori       r8,r8,0x023F     # word 0 epn=32:51 class=52:53 v=54 x=55 size=56:59 thrd=60:63   size: 0001=4K 0011=64K 0101=1M 0111=16M 1010=1G

      eratwe    r10,r0,2
      eratwe    r4,r0,1
      eratwe    r8,r0,0
      isync

      lis       r3,0x8800        # 32=ecl 36:37=tlbsel (10=i, 11=d)
      mtspr     mmucr0,r3

.ifndef BIOS_LE
# ierat 15  @00000000
      li        r0,0x000F        # entry #15
      li        r2,0x003F        # word 2 wlc=40:41 rsvd=42 u=44:47 r=48 c=49 wimge=52:56 vf=57 ux/sx=58:59 uw/sw=60:61 ur/sr=62:63
      li        r4,0             # word 1 rpn(32:51)=32:51 rpn(22:31)=54:63
      li        r8,0x023F        # word 0 epn=32:51 class=52:53 v=54 x=55 size=56:59 thrd=60:63   size: 0001=4K 0011=64K 0101=1M 0111=16M 1010=1G

      eratwe    r2,r0,2
      eratwe    r4,r0,1
      eratwe    r8,r0,0
      isync
.endif

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

.ifdef ROM_INIT
########################################################################################################################################
# VMA/LMA: copy .data, clear .bss
rominit:
.ifdef BIOS_32

      lis        r1,_fdata_rom@h
      ori        r1,r1,_fdata_rom@l
      lis        r2,_fdata@h
      ori        r2,r2,_fdata@l
      lis        r3,_edata_rom@h
      ori        r3,r3,_edata_rom@l
      lis        r4,_fbss@h
      ori        r4,r4,_fbss@l
      lis        r5,_ebss@h
      ori        r5,r5,_ebss@l

.else

	   bl        +4
1:    mflr      r12
	   addis	    r12,r12,(.TOC.-1b)@h
	   addi	    r12,r12,(.TOC.-1b)@l      # now gots toc
   	ld	       r1,_fdata_rom@got(r12)
   	ld	       r2,_fdata@got(r12)
   	ld	       r3,_edata_rom@got(r12)
   	ld	       r4,_fbss@got(r12)
   	ld	       r5,_ebss@got(r12)
   	ld	       r6,_fstack@got(r12)
      addi      r6,r6,-32

.endif


      subf       r9,r1,r3
      srwi.      r9,r9,2
      beq        romcopy_done
      mtctr      r9
      addi       r1,r1,-4
      addi       r2,r2,-4

romcopy:
      lwzu       r9,4(r1)
      stwu       r9,4(r2)
      bdnz       romcopy

romcopy_done:
      subf       r9,r4,r5
      srwi.      r9,r9,2
      beq        romclear_done

      mtctr      r9
      addi       r4,r4,-4
      li         r9,0

romclear:
      stwu       r9,4(r4)
      bdnz       romclear

romclear_done:
.endif

# set up threads
# set thread configuration

      li        r1,THREAD_ENABLES
      mtspr     tens,r1          # 60:63 = tid 3:0 enabled
      not       r1,r1
      mtspr     tenc,r1          # in case T0 is marked disabled
      isync

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

.ifdef BIOS_32
      lwz       r1,stack_0(r0)
.else
      mr        r1,r6
.endif

      b         boot_complete

# except T0

init_t123:
# NEEDS 64LE VERSION!!! once i figure out the right way

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
.ifdef BIOS_32

      lis       r3,main@h
      ori       r3,r3,main@l
      mtctr     r3
      mfspr     r3,tir                    # who am i?

.else
	   bl        +4
0:    mflr      r2
	   addis	    r2,r2,(.TOC.-0b)@h
	   addi	    r2,r2,(.TOC.-0b)@l        # set toc
   	ld	       r3,main@got(r2)
      addi      r3,r3,8                   # <main+8>
      mtctr     r3
      li        r3,0                      # argc

.endif

      bctrl
      b         kernel_return

wtf: # huh? what did linux guys do to the good ol 32b stuff?
      bl        main
      ba        main
      ba        main@got
      lwz       r1,main(r0)
   	lwz   	 r1,main@got(r0)
uwatt:
	   bl        +4
0:    mflr      r2
      #	/* Get our TOC */
	   addis	    r1,r2,(.TOC.-0b)@h
	   addi	    r2,r2,(.TOC.-0b)@l
   	ld	       r3,_fdata@got(r2)
wtf2:
      ld        r3,main@got(r2)


# ------------------------------------------------------------------------------------------------------------------------------

.ifdef BIOS_32
.align 4
.include "crtsavres.s"
.endif

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

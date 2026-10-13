# ERAT bootstrap derived from ../test1/boot.s:
# © IBM Corp. 2022
# Licensed under and subject to the terms of the CC-BY 4.0
# license (https://creativecommons.org/licenses/by/4.0/legalcode).
# Additional rights, including the right to physically implement a softcore
# that is compliant with the required sections of the Power ISA
# Specification, will be available at no cost via the OpenPOWER Foundation.
# This README will be updated with additional information when OpenPOWER's
# license is available.
#
# CTR regression test body: CC0-1.0.
# CASE=0: decrement 0x0000000100000001; test both bdnz and bdz.
# CASE=1: lwz/addi creates 0x0000000100000005; expect five iterations.
# CASE=2: CTR=1 control. MODE64=1: full-width CTR control for CASE=0.
# Power ISA 2.07B Book I 2.5: test decremented CTR[M:63], M=32 in 32-bit mode.
# Completion markers match dev/sim/verilator/tb_litex.cpp.

.ifndef MODE64
.set MODE64,0
.endif
.ifndef CASE
.set CASE,0
.endif
.section .text
.global _start
_start:
      b         boot
.org 0x100
boot:
      lis       r3,0x8C00
      li        r0,0x001F
      li        r2,0x0015
      li        r4,0
      li        r8,0x025F
      mtspr     1020,r3
      eratwe    r2,r0,2
      eratwe    r4,r0,1
      eratwe    r8,r0,0
      isync
      lis       r3,0x8800
      li        r0,0x000F
      li        r2,0x003F
      mtspr     1020,r3
      eratwe    r2,r0,2
      eratwe    r4,r0,1
      eratwe    r8,r0,0
      isync
.if MODE64
      lis       r10,0x8000
.else
      li        r10,0
.endif
      ori       r10,r10,0x1000
      mtmsr     r10
      isync
.if CASE==0
      li        r6,1
      sldi      r6,r6,32
      ori       r6,r6,1
      mtctr     r6
      bdnz      taken
      b         nottaken
taken:
.if MODE64
      mtctr     r6
      bdz       fail
      b         pass
.else
      b         fail
.endif
nottaken:
.if MODE64
      b         fail
.else
      mtctr     r6
      bdz       pass
      b         fail
.endif
.endif
.if CASE==1
      lwz       r10,word(0)
      addi      r10,r10,6
      mtctr     r10
      li        r7,0
loop: addi      r7,r7,1
      cmpwi     r7,100
      bgt       fail
      bdnz      loop
      cmpwi     r7,5
      beq       pass
      b         fail
.endif
.if CASE==2
      li        r6,1
      mtctr     r6
      bdnz      fail
      b         pass
.endif
.org 0x700
word: .long 0xFFFFFFFF
.org 0x7F0
pass: b         pass
.org 0x7F4
fail: b         fail
.org 0x800

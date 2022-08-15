
rom:     file format elf32-powerpc


Disassembly of section .kernel:

00000000 <_start>:
   0:	48 00 04 00 	b       400 <boot_start>
   4:	44 00 00 02 	sc
	...

00000020 <int_020>:
  20:	48 00 10 10 	b       1030 <int_unhandled>
	...

00000040 <int_040>:
  40:	48 00 00 00 	b       40 <int_040>
	...

00000060 <int_060>:
  60:	48 00 00 00 	b       60 <int_060>
	...

00000080 <int_080>:
  80:	48 00 00 00 	b       80 <int_080>
	...

000000a0 <int_0A0>:
  a0:	48 00 00 00 	b       a0 <int_0A0>
	...

000000c0 <int_0C0>:
  c0:	48 00 00 00 	b       c0 <int_0C0>
	...

000000e0 <int_0E0>:
  e0:	48 00 00 00 	b       e0 <int_0E0>
	...

00000100 <int_100>:
 100:	48 00 00 00 	b       100 <int_100>
	...

00000120 <int_120>:
 120:	48 01 21 34 	b       12254 <tst_end>
	...

00000140 <int_140>:
 140:	48 00 00 00 	b       140 <int_140>
	...

00000160 <int_160>:
 160:	48 00 00 00 	b       160 <int_160>
	...

00000180 <int_180>:
 180:	48 00 00 00 	b       180 <int_180>
	...

000001a0 <int_1A0>:
 1a0:	48 00 00 00 	b       1a0 <int_1A0>
	...

000001c0 <int_1C0>:
 1c0:	48 00 00 00 	b       1c0 <int_1C0>
	...

000001e0 <int_1E0>:
 1e0:	48 00 00 00 	b       1e0 <int_1E0>
	...

00000200 <int_200>:
 200:	48 00 00 00 	b       200 <int_200>
	...

00000220 <int_220>:
 220:	48 00 00 00 	b       220 <int_220>
	...

00000240 <int_240>:
 240:	48 00 00 00 	b       240 <int_240>
	...

00000260 <int_260>:
 260:	48 00 00 00 	b       260 <int_260>
	...

00000280 <int_280>:
 280:	48 00 00 00 	b       280 <int_280>
	...

000002a0 <int_2A0>:
 2a0:	48 00 00 00 	b       2a0 <int_2A0>
	...

000002c0 <int_2C0>:
 2c0:	48 00 00 00 	b       2c0 <int_2C0>
	...

000002e0 <int_2E0>:
 2e0:	48 00 00 00 	b       2e0 <int_2E0>
	...

00000300 <int_300>:
 300:	48 00 00 00 	b       300 <int_300>
	...

00000320 <int_320>:
 320:	48 00 00 00 	b       320 <int_320>
	...

00000340 <int_340>:
 340:	48 00 00 00 	b       340 <int_340>
	...

00000400 <boot_start>:
 400:	7c be 6a a6 	mfspr   r5,446
 404:	2c 25 00 00 	cmpdi   r5,0
 408:	40 82 00 e0 	bne     4e8 <init_t123>
 40c:	3c 60 8c 00 	lis     r3,-29696
 410:	38 00 00 1f 	li      r0,31
 414:	38 40 00 15 	li      r2,21
 418:	38 80 00 00 	li      r4,0
 41c:	39 00 02 3f 	li      r8,575
 420:	7c 7c fb a6 	mtspr   1020,r3
 424:	7c 40 11 a6 	eratwe  r2,r0,2
 428:	7c 80 09 a6 	eratwe  r4,r0,1
 42c:	7d 00 01 a6 	mtfprwa f8,r0
 430:	4c 00 01 2c 	isync
 434:	39 40 00 00 	li      r10,0
 438:	65 4a 00 00 	oris    r10,r10,0
 43c:	61 4a 00 3f 	ori     r10,r10,63
 440:	38 00 00 1e 	li      r0,30
 444:	38 80 00 00 	li      r4,0
 448:	64 84 00 01 	oris    r4,r4,1
 44c:	60 84 00 00 	ori     r4,r4,0
 450:	39 00 00 00 	li      r8,0
 454:	65 08 00 01 	oris    r8,r8,1
 458:	61 08 00 00 	ori     r8,r8,0
 45c:	61 08 02 3f 	ori     r8,r8,575
 460:	7d 40 11 a6 	eratwe  r10,r0,2
 464:	7c 80 09 a6 	eratwe  r4,r0,1
 468:	7d 00 01 a6 	mtfprwa f8,r0
 46c:	4c 00 01 2c 	isync
 470:	3c 60 88 00 	lis     r3,-30720
 474:	38 00 00 0f 	li      r0,15
 478:	38 40 00 3f 	li      r2,63
 47c:	38 80 00 00 	li      r4,0
 480:	39 00 02 3f 	li      r8,575
 484:	7c 7c fb a6 	mtspr   1020,r3
 488:	7c 40 11 a6 	eratwe  r2,r0,2
 48c:	7c 80 09 a6 	eratwe  r4,r0,1
 490:	7d 00 01 a6 	mtfprwa f8,r0
 494:	4c 00 01 2c 	isync
 498:	38 00 00 0d 	li      r0,13
 49c:	38 80 00 00 	li      r4,0
 4a0:	64 84 00 01 	oris    r4,r4,1
 4a4:	60 84 00 00 	ori     r4,r4,0
 4a8:	39 00 00 00 	li      r8,0
 4ac:	65 08 00 01 	oris    r8,r8,1
 4b0:	61 08 00 00 	ori     r8,r8,0
 4b4:	61 08 02 3f 	ori     r8,r8,575
 4b8:	7d 40 11 a6 	eratwe  r10,r0,2
 4bc:	7c 80 09 a6 	eratwe  r4,r0,1
 4c0:	7d 00 01 a6 	mtfprwa f8,r0
 4c4:	4c 00 01 2c 	isync
 4c8:	48 00 00 04 	b       4cc <init_t0>

000004cc <init_t0>:
 4cc:	39 40 00 00 	li      r10,0
 4d0:	65 4a 80 02 	oris    r10,r10,32770
 4d4:	61 4a b0 00 	ori     r10,r10,45056
 4d8:	7d 40 01 24 	mtmsr   r10
 4dc:	4c 00 01 2c 	isync
 4e0:	80 20 08 fa 	lwz     r1,2298(0)
 4e4:	48 00 00 20 	b       504 <boot_complete>

000004e8 <init_t123>:
 4e8:	39 40 00 00 	li      r10,0
 4ec:	65 4a 80 02 	oris    r10,r10,32770
 4f0:	61 4a b0 00 	ori     r10,r10,45056
 4f4:	7d 40 01 24 	mtmsr   r10
 4f8:	4c 00 01 2c 	isync
 4fc:	80 20 08 fe 	lwz     r1,2302(0)
 500:	48 00 00 04 	b       504 <boot_complete>

00000504 <boot_complete>:
 504:	3c 60 00 00 	lis     r3,0
 508:	60 63 0c 34 	ori     r3,r3,3124
 50c:	7c 69 03 a6 	mtctr   r3
 510:	7c 7e 6a a6 	mfspr   r3,446
 514:	4e 80 04 21 	bctrl
 518:	48 00 02 e4 	b       7fc <kernel_return>
	...

000007f0 <tst_pass>:
 7f0:	48 00 00 00 	b       7f0 <tst_pass>

000007f4 <tst_fail>:
 7f4:	48 00 00 00 	b       7f4 <tst_fail>
 7f8:	00 00 00 00 	.long 0x0

000007fc <kernel_return>:
 7fc:	48 00 00 00 	b       7fc <kernel_return>

00000800 <int_800>:
 800:	48 00 00 00 	b       800 <int_800>
	...

00000820 <int_820>:
 820:	48 00 00 00 	b       820 <int_820>
	...

Disassembly of section .bios:

00000c00 <putchar_handler>:
     c00:	94 21 ff f0 	stwu    r1,-16(r1)
     c04:	7c 69 1b 78 	mr      r9,r3
     c08:	99 21 00 08 	stb     r9,8(r1)
     c0c:	3d 20 00 01 	lis     r9,1
     c10:	81 29 20 00 	lwz     r9,8192(r9)
     c14:	39 09 00 01 	addi    r8,r9,1
     c18:	3d 40 00 01 	lis     r10,1
     c1c:	91 0a 20 00 	stw     r8,8192(r10)
     c20:	89 41 00 08 	lbz     r10,8(r1)
     c24:	99 49 00 00 	stb     r10,0(r9)
     c28:	60 00 00 00 	nop
     c2c:	38 21 00 10 	addi    r1,r1,16
     c30:	4e 80 00 20 	blr

00000c34 <main>:
     c34:	94 21 ff c0 	stwu    r1,-64(r1)
     c38:	7c 08 02 a6 	mflr    r0
     c3c:	90 01 00 44 	stw     r0,68(r1)
     c40:	90 61 00 38 	stw     r3,56(r1)
     c44:	3d 20 00 01 	lis     r9,1
     c48:	39 29 20 00 	addi    r9,r9,8192
     c4c:	91 21 00 0c 	stw     r9,12(r1)
     c50:	3d 20 00 01 	lis     r9,1
     c54:	39 29 20 40 	addi    r9,r9,8256
     c58:	91 21 00 10 	stw     r9,16(r1)
     c5c:	81 21 00 38 	lwz     r9,56(r1)
     c60:	2c 09 00 00 	cmpwi   r9,0
     c64:	41 82 00 0c 	beq     c70 <main+0x3c>
     c68:	39 20 ff ff 	li      r9,-1
     c6c:	48 00 01 90 	b       dfc <main+0x1c8>
     c70:	3d 20 00 00 	lis     r9,0
     c74:	39 29 36 d0 	addi    r9,r9,14032
     c78:	91 21 00 08 	stw     r9,8(r1)
     c7c:	48 00 00 28 	b       ca4 <main+0x70>
     c80:	81 21 00 0c 	lwz     r9,12(r1)
     c84:	39 49 00 04 	addi    r10,r9,4
     c88:	91 41 00 0c 	stw     r10,12(r1)
     c8c:	81 41 00 08 	lwz     r10,8(r1)
     c90:	81 4a 00 00 	lwz     r10,0(r10)
     c94:	91 49 00 00 	stw     r10,0(r9)
     c98:	81 21 00 08 	lwz     r9,8(r1)
     c9c:	39 29 00 04 	addi    r9,r9,4
     ca0:	91 21 00 08 	stw     r9,8(r1)
     ca4:	81 41 00 08 	lwz     r10,8(r1)
     ca8:	3d 20 00 00 	lis     r9,0
     cac:	39 29 3b 4c 	addi    r9,r9,15180
     cb0:	7c 0a 48 40 	cmplw   r10,r9
     cb4:	41 80 ff cc 	blt     c80 <main+0x4c>
     cb8:	3d 20 00 01 	lis     r9,1
     cbc:	39 29 24 7c 	addi    r9,r9,9340
     cc0:	91 21 00 08 	stw     r9,8(r1)
     cc4:	48 00 00 24 	b       ce8 <main+0xb4>
     cc8:	81 21 00 08 	lwz     r9,8(r1)
     ccc:	39 49 00 04 	addi    r10,r9,4
     cd0:	91 41 00 08 	stw     r10,8(r1)
     cd4:	39 40 00 00 	li      r10,0
     cd8:	91 49 00 00 	stw     r10,0(r9)
     cdc:	81 21 00 08 	lwz     r9,8(r1)
     ce0:	39 29 00 04 	addi    r9,r9,4
     ce4:	91 21 00 08 	stw     r9,8(r1)
     ce8:	81 41 00 08 	lwz     r10,8(r1)
     cec:	3d 20 00 01 	lis     r9,1
     cf0:	39 29 24 98 	addi    r9,r9,9368
     cf4:	7c 0a 48 40 	cmplw   r10,r9
     cf8:	41 80 ff d0 	blt     cc8 <main+0x94>
     cfc:	3d 20 00 00 	lis     r9,0
     d00:	38 69 0c 00 	addi    r3,r9,3072
     d04:	4c c6 31 82 	crclr   4*cr1+eq
     d08:	48 00 26 d1 	bl      33d8 <console_set_write_hook>
     d0c:	38 60 00 77 	li      r3,119
     d10:	48 00 27 19 	bl      3428 <putchar>
     d14:	38 60 00 74 	li      r3,116
     d18:	48 00 27 11 	bl      3428 <putchar>
     d1c:	38 60 00 66 	li      r3,102
     d20:	48 00 27 09 	bl      3428 <putchar>
     d24:	38 60 00 0a 	li      r3,10
     d28:	48 00 27 01 	bl      3428 <putchar>
     d2c:	80 81 00 38 	lwz     r4,56(r1)
     d30:	3d 20 00 00 	lis     r9,0
     d34:	38 69 08 f0 	addi    r3,r9,2288
     d38:	4c c6 31 82 	crclr   4*cr1+eq
     d3c:	48 00 28 f5 	bl      3630 <printf>
     d40:	3d 20 03 00 	lis     r9,768
     d44:	91 21 00 34 	stw     r9,52(r1)
     d48:	81 21 00 34 	lwz     r9,52(r1)
     d4c:	7d 33 4b a6 	mtspr   307,r9
     d50:	60 00 00 00 	nop
     d54:	39 20 00 00 	li      r9,0
     d58:	91 21 00 30 	stw     r9,48(r1)
     d5c:	81 21 00 30 	lwz     r9,48(r1)
     d60:	7d 36 03 a6 	mtdec   r9
     d64:	60 00 00 00 	nop
     d68:	39 20 00 00 	li      r9,0
     d6c:	91 21 00 2c 	stw     r9,44(r1)
     d70:	81 21 00 2c 	lwz     r9,44(r1)
     d74:	7d 3d 43 a6 	mttbu   r9
     d78:	60 00 00 00 	nop
     d7c:	39 20 00 00 	li      r9,0
     d80:	91 21 00 28 	stw     r9,40(r1)
     d84:	81 21 00 28 	lwz     r9,40(r1)
     d88:	7d 3c 43 a6 	mttbl   r9
     d8c:	60 00 00 00 	nop
     d90:	3d 20 fe 00 	lis     r9,-512
     d94:	91 21 00 24 	stw     r9,36(r1)
     d98:	81 21 00 24 	lwz     r9,36(r1)
     d9c:	7d 30 53 a6 	mtspr   336,r9
     da0:	60 00 00 00 	nop
     da4:	7d 36 fa a6 	mfspr   r9,1014
     da8:	91 21 00 20 	stw     r9,32(r1)
     dac:	81 21 00 20 	lwz     r9,32(r1)
     db0:	55 29 05 ea 	rlwinm  r9,r9,0,23,21
     db4:	91 21 00 1c 	stw     r9,28(r1)
     db8:	81 21 00 1c 	lwz     r9,28(r1)
     dbc:	7d 36 fb a6 	mtspr   1014,r9
     dc0:	60 00 00 00 	nop
     dc4:	39 20 00 00 	li      r9,0
     dc8:	91 21 00 18 	stw     r9,24(r1)
     dcc:	81 21 00 18 	lwz     r9,24(r1)
     dd0:	7d 30 53 a6 	mtspr   336,r9
     dd4:	60 00 00 00 	nop
     dd8:	39 20 00 00 	li      r9,0
     ddc:	91 21 00 14 	stw     r9,20(r1)
     de0:	81 21 00 14 	lwz     r9,20(r1)
     de4:	7d 34 53 a6 	mtspr   340,r9
     de8:	60 00 00 00 	nop
     dec:	81 21 00 10 	lwz     r9,16(r1)
     df0:	7d 23 4b 78 	mr      r3,r9
     df4:	48 01 13 6c 	b       12160 <init_tst>
     df8:	48 00 00 00 	b       df8 <main+0x1c4>
     dfc:	7d 23 4b 78 	mr      r3,r9
     e00:	80 01 00 44 	lwz     r0,68(r1)
     e04:	7c 08 03 a6 	mtlr    r0
     e08:	38 21 00 40 	addi    r1,r1,64
     e0c:	4e 80 00 20 	blr

00000e10 <tst_done>:
     e10:	94 21 ff e0 	stwu    r1,-32(r1)
     e14:	7c 08 02 a6 	mflr    r0
     e18:	90 01 00 24 	stw     r0,36(r1)
     e1c:	90 61 00 18 	stw     r3,24(r1)
     e20:	39 20 00 01 	li      r9,1
     e24:	91 21 00 0c 	stw     r9,12(r1)
     e28:	81 41 00 18 	lwz     r10,24(r1)
     e2c:	3d 20 08 67 	lis     r9,2151
     e30:	61 29 53 09 	ori     r9,r9,21257
     e34:	7c 0a 48 00 	cmpw    r10,r9
     e38:	41 82 00 0c 	beq     e44 <tst_done+0x34>
     e3c:	3c 60 80 00 	lis     r3,-32768
     e40:	4b ff f9 b5 	bl      7f4 <tst_fail>
     e44:	39 20 00 00 	li      r9,0
     e48:	91 21 00 08 	stw     r9,8(r1)
     e4c:	48 00 00 8c 	b       ed8 <tst_done+0xc8>
     e50:	81 21 00 08 	lwz     r9,8(r1)
     e54:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     e58:	3d 20 00 01 	lis     r9,1
     e5c:	39 29 23 40 	addi    r9,r9,9024
     e60:	7d 2a 4a 14 	add     r9,r10,r9
     e64:	81 29 00 00 	lwz     r9,0(r9)
     e68:	91 21 00 10 	stw     r9,16(r1)
     e6c:	81 21 00 08 	lwz     r9,8(r1)
     e70:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     e74:	3d 20 00 01 	lis     r9,1
     e78:	39 29 23 e0 	addi    r9,r9,9184
     e7c:	7d 2a 4a 14 	add     r9,r10,r9
     e80:	81 29 00 00 	lwz     r9,0(r9)
     e84:	91 21 00 14 	stw     r9,20(r1)
     e88:	81 21 00 0c 	lwz     r9,12(r1)
     e8c:	2c 09 00 00 	cmpwi   r9,0
     e90:	41 82 00 1c 	beq     eac <tst_done+0x9c>
     e94:	81 41 00 10 	lwz     r10,16(r1)
     e98:	81 21 00 14 	lwz     r9,20(r1)
     e9c:	7c 0a 48 00 	cmpw    r10,r9
     ea0:	40 82 00 0c 	bne     eac <tst_done+0x9c>
     ea4:	39 20 00 01 	li      r9,1
     ea8:	48 00 00 08 	b       eb0 <tst_done+0xa0>
     eac:	39 20 00 00 	li      r9,0
     eb0:	91 21 00 0c 	stw     r9,12(r1)
     eb4:	81 21 00 0c 	lwz     r9,12(r1)
     eb8:	2c 09 00 00 	cmpwi   r9,0
     ebc:	40 82 00 10 	bne     ecc <tst_done+0xbc>
     ec0:	81 21 00 08 	lwz     r9,8(r1)
     ec4:	7d 23 4b 78 	mr      r3,r9
     ec8:	4b ff f9 2d 	bl      7f4 <tst_fail>
     ecc:	81 21 00 08 	lwz     r9,8(r1)
     ed0:	39 29 00 01 	addi    r9,r9,1
     ed4:	91 21 00 08 	stw     r9,8(r1)
     ed8:	81 21 00 08 	lwz     r9,8(r1)
     edc:	28 09 00 1f 	cmplwi  r9,31
     ee0:	40 81 ff 70 	ble     e50 <tst_done+0x40>
     ee4:	39 20 00 21 	li      r9,33
     ee8:	91 21 00 08 	stw     r9,8(r1)
     eec:	81 21 00 08 	lwz     r9,8(r1)
     ef0:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     ef4:	3d 20 00 01 	lis     r9,1
     ef8:	39 29 23 40 	addi    r9,r9,9024
     efc:	7d 2a 4a 14 	add     r9,r10,r9
     f00:	81 29 00 00 	lwz     r9,0(r9)
     f04:	91 21 00 10 	stw     r9,16(r1)
     f08:	81 21 00 08 	lwz     r9,8(r1)
     f0c:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     f10:	3d 20 00 01 	lis     r9,1
     f14:	39 29 23 e0 	addi    r9,r9,9184
     f18:	7d 2a 4a 14 	add     r9,r10,r9
     f1c:	81 29 00 00 	lwz     r9,0(r9)
     f20:	55 29 06 44 	rlwinm  r9,r9,0,25,2
     f24:	91 21 00 14 	stw     r9,20(r1)
     f28:	81 21 00 0c 	lwz     r9,12(r1)
     f2c:	2c 09 00 00 	cmpwi   r9,0
     f30:	41 82 00 1c 	beq     f4c <tst_done+0x13c>
     f34:	81 41 00 10 	lwz     r10,16(r1)
     f38:	81 21 00 14 	lwz     r9,20(r1)
     f3c:	7c 0a 48 00 	cmpw    r10,r9
     f40:	40 82 00 0c 	bne     f4c <tst_done+0x13c>
     f44:	39 20 00 01 	li      r9,1
     f48:	48 00 00 08 	b       f50 <tst_done+0x140>
     f4c:	39 20 00 00 	li      r9,0
     f50:	91 21 00 0c 	stw     r9,12(r1)
     f54:	81 21 00 0c 	lwz     r9,12(r1)
     f58:	2c 09 00 00 	cmpwi   r9,0
     f5c:	40 82 00 10 	bne     f6c <tst_done+0x15c>
     f60:	81 21 00 08 	lwz     r9,8(r1)
     f64:	7d 23 4b 78 	mr      r3,r9
     f68:	4b ff f8 8d 	bl      7f4 <tst_fail>
     f6c:	39 20 00 22 	li      r9,34
     f70:	91 21 00 08 	stw     r9,8(r1)
     f74:	48 00 00 8c 	b       1000 <tst_done+0x1f0>
     f78:	81 21 00 08 	lwz     r9,8(r1)
     f7c:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     f80:	3d 20 00 01 	lis     r9,1
     f84:	39 29 23 40 	addi    r9,r9,9024
     f88:	7d 2a 4a 14 	add     r9,r10,r9
     f8c:	81 29 00 00 	lwz     r9,0(r9)
     f90:	91 21 00 10 	stw     r9,16(r1)
     f94:	81 21 00 08 	lwz     r9,8(r1)
     f98:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     f9c:	3d 20 00 01 	lis     r9,1
     fa0:	39 29 23 e0 	addi    r9,r9,9184
     fa4:	7d 2a 4a 14 	add     r9,r10,r9
     fa8:	81 29 00 00 	lwz     r9,0(r9)
     fac:	91 21 00 14 	stw     r9,20(r1)
     fb0:	81 21 00 0c 	lwz     r9,12(r1)
     fb4:	2c 09 00 00 	cmpwi   r9,0
     fb8:	41 82 00 1c 	beq     fd4 <tst_done+0x1c4>
     fbc:	81 41 00 10 	lwz     r10,16(r1)
     fc0:	81 21 00 14 	lwz     r9,20(r1)
     fc4:	7c 0a 48 00 	cmpw    r10,r9
     fc8:	40 82 00 0c 	bne     fd4 <tst_done+0x1c4>
     fcc:	39 20 00 01 	li      r9,1
     fd0:	48 00 00 08 	b       fd8 <tst_done+0x1c8>
     fd4:	39 20 00 00 	li      r9,0
     fd8:	91 21 00 0c 	stw     r9,12(r1)
     fdc:	81 21 00 0c 	lwz     r9,12(r1)
     fe0:	2c 09 00 00 	cmpwi   r9,0
     fe4:	40 82 00 10 	bne     ff4 <tst_done+0x1e4>
     fe8:	81 21 00 08 	lwz     r9,8(r1)
     fec:	7d 23 4b 78 	mr      r3,r9
     ff0:	4b ff f8 05 	bl      7f4 <tst_fail>
     ff4:	81 21 00 08 	lwz     r9,8(r1)
     ff8:	39 29 00 01 	addi    r9,r9,1
     ffc:	91 21 00 08 	stw     r9,8(r1)
    1000:	81 21 00 08 	lwz     r9,8(r1)
    1004:	28 09 00 23 	cmplwi  r9,35
    1008:	40 81 ff 70 	ble     f78 <tst_done+0x168>
    100c:	4b ff f7 e5 	bl      7f0 <tst_pass>
    1010:	48 00 00 00 	b       1010 <tst_done+0x200>

00001014 <int_sc>:
    1014:	94 21 ff f0 	stwu    r1,-16(r1)
    1018:	90 61 00 08 	stw     r3,8(r1)
    101c:	90 81 00 0c 	stw     r4,12(r1)
    1020:	48 01 12 34 	b       12254 <tst_end>
    1024:	60 00 00 00 	nop
    1028:	38 21 00 10 	addi    r1,r1,16
    102c:	4e 80 00 20 	blr

00001030 <int_unhandled>:
    1030:	48 00 00 00 	b       1030 <int_unhandled>

Disassembly of section .text:

00001034 <__toupper>:
    1034:	94 21 ff f0 	stwu    r1,-16(r1)
    1038:	7c 69 1b 78 	mr      r9,r3
    103c:	99 21 00 08 	stb     r9,8(r1)
    1040:	89 21 00 08 	lbz     r9,8(r1)
    1044:	3d 40 00 00 	lis     r10,0
    1048:	39 4a 09 04 	addi    r10,r10,2308
    104c:	7d 2a 48 ae 	lbzx    r9,r10,r9
    1050:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    1054:	2c 09 00 00 	cmpwi   r9,0
    1058:	41 82 00 10 	beq     1068 <__toupper+0x34>
    105c:	89 21 00 08 	lbz     r9,8(r1)
    1060:	39 29 ff e0 	addi    r9,r9,-32
    1064:	99 21 00 08 	stb     r9,8(r1)
    1068:	89 21 00 08 	lbz     r9,8(r1)
    106c:	7d 23 4b 78 	mr      r3,r9
    1070:	38 21 00 10 	addi    r1,r1,16
    1074:	4e 80 00 20 	blr

00001078 <__bswap_16>:
    1078:	94 21 ff f0 	stwu    r1,-16(r1)
    107c:	7c 69 1b 78 	mr      r9,r3
    1080:	b1 21 00 08 	sth     r9,8(r1)
    1084:	a1 21 00 08 	lhz     r9,8(r1)
    1088:	55 29 40 2e 	rlwinm  r9,r9,8,0,23
    108c:	7d 2a 07 34 	extsh   r10,r9
    1090:	a1 21 00 08 	lhz     r9,8(r1)
    1094:	55 29 c2 3e 	rlwinm  r9,r9,24,8,31
    1098:	55 29 04 3e 	clrlwi  r9,r9,16
    109c:	7d 29 07 34 	extsh   r9,r9
    10a0:	7d 49 4b 78 	or      r9,r10,r9
    10a4:	7d 29 07 34 	extsh   r9,r9
    10a8:	55 29 04 3e 	clrlwi  r9,r9,16
    10ac:	7d 23 4b 78 	mr      r3,r9
    10b0:	38 21 00 10 	addi    r1,r1,16
    10b4:	4e 80 00 20 	blr

000010b8 <__bswap_32>:
    10b8:	94 21 ff f0 	stwu    r1,-16(r1)
    10bc:	90 61 00 08 	stw     r3,8(r1)
    10c0:	81 21 00 08 	lwz     r9,8(r1)
    10c4:	55 2a 46 3e 	rlwinm  r10,r9,8,24,31
    10c8:	81 21 00 08 	lwz     r9,8(r1)
    10cc:	55 29 c2 3e 	rlwinm  r9,r9,24,8,31
    10d0:	55 29 04 2e 	rlwinm  r9,r9,0,16,23
    10d4:	7d 4a 4b 78 	or      r10,r10,r9
    10d8:	81 21 00 08 	lwz     r9,8(r1)
    10dc:	55 29 40 2e 	rlwinm  r9,r9,8,0,23
    10e0:	55 29 02 1e 	rlwinm  r9,r9,0,8,15
    10e4:	7d 4a 4b 78 	or      r10,r10,r9
    10e8:	81 21 00 08 	lwz     r9,8(r1)
    10ec:	55 29 c0 0e 	rlwinm  r9,r9,24,0,7
    10f0:	7d 49 4b 78 	or      r9,r10,r9
    10f4:	7d 23 4b 78 	mr      r3,r9
    10f8:	38 21 00 10 	addi    r1,r1,16
    10fc:	4e 80 00 20 	blr

00001100 <strchr>:
    1100:	94 21 ff f0 	stwu    r1,-16(r1)
    1104:	90 61 00 08 	stw     r3,8(r1)
    1108:	90 81 00 0c 	stw     r4,12(r1)
    110c:	48 00 00 28 	b       1134 <strchr+0x34>
    1110:	81 21 00 08 	lwz     r9,8(r1)
    1114:	89 29 00 00 	lbz     r9,0(r9)
    1118:	2c 09 00 00 	cmpwi   r9,0
    111c:	40 82 00 0c 	bne     1128 <strchr+0x28>
    1120:	39 20 00 00 	li      r9,0
    1124:	48 00 00 2c 	b       1150 <strchr+0x50>
    1128:	81 21 00 08 	lwz     r9,8(r1)
    112c:	39 29 00 01 	addi    r9,r9,1
    1130:	91 21 00 08 	stw     r9,8(r1)
    1134:	81 21 00 08 	lwz     r9,8(r1)
    1138:	89 49 00 00 	lbz     r10,0(r9)
    113c:	81 21 00 0c 	lwz     r9,12(r1)
    1140:	55 29 06 3e 	clrlwi  r9,r9,24
    1144:	7c 0a 48 40 	cmplw   r10,r9
    1148:	40 82 ff c8 	bne     1110 <strchr+0x10>
    114c:	81 21 00 08 	lwz     r9,8(r1)
    1150:	7d 23 4b 78 	mr      r3,r9
    1154:	38 21 00 10 	addi    r1,r1,16
    1158:	4e 80 00 20 	blr

0000115c <strpbrk>:
    115c:	94 21 ff e0 	stwu    r1,-32(r1)
    1160:	90 61 00 18 	stw     r3,24(r1)
    1164:	90 81 00 1c 	stw     r4,28(r1)
    1168:	81 21 00 18 	lwz     r9,24(r1)
    116c:	91 21 00 08 	stw     r9,8(r1)
    1170:	48 00 00 58 	b       11c8 <strpbrk+0x6c>
    1174:	81 21 00 1c 	lwz     r9,28(r1)
    1178:	91 21 00 0c 	stw     r9,12(r1)
    117c:	48 00 00 30 	b       11ac <strpbrk+0x50>
    1180:	81 21 00 08 	lwz     r9,8(r1)
    1184:	89 49 00 00 	lbz     r10,0(r9)
    1188:	81 21 00 0c 	lwz     r9,12(r1)
    118c:	89 29 00 00 	lbz     r9,0(r9)
    1190:	7c 0a 48 40 	cmplw   r10,r9
    1194:	40 82 00 0c 	bne     11a0 <strpbrk+0x44>
    1198:	81 21 00 08 	lwz     r9,8(r1)
    119c:	48 00 00 40 	b       11dc <strpbrk+0x80>
    11a0:	81 21 00 0c 	lwz     r9,12(r1)
    11a4:	39 29 00 01 	addi    r9,r9,1
    11a8:	91 21 00 0c 	stw     r9,12(r1)
    11ac:	81 21 00 0c 	lwz     r9,12(r1)
    11b0:	89 29 00 00 	lbz     r9,0(r9)
    11b4:	2c 09 00 00 	cmpwi   r9,0
    11b8:	40 82 ff c8 	bne     1180 <strpbrk+0x24>
    11bc:	81 21 00 08 	lwz     r9,8(r1)
    11c0:	39 29 00 01 	addi    r9,r9,1
    11c4:	91 21 00 08 	stw     r9,8(r1)
    11c8:	81 21 00 08 	lwz     r9,8(r1)
    11cc:	89 29 00 00 	lbz     r9,0(r9)
    11d0:	2c 09 00 00 	cmpwi   r9,0
    11d4:	40 82 ff a0 	bne     1174 <strpbrk+0x18>
    11d8:	39 20 00 00 	li      r9,0
    11dc:	7d 23 4b 78 	mr      r3,r9
    11e0:	38 21 00 20 	addi    r1,r1,32
    11e4:	4e 80 00 20 	blr

000011e8 <strrchr>:
    11e8:	94 21 ff e0 	stwu    r1,-32(r1)
    11ec:	7c 08 02 a6 	mflr    r0
    11f0:	90 01 00 24 	stw     r0,36(r1)
    11f4:	90 61 00 18 	stw     r3,24(r1)
    11f8:	90 81 00 1c 	stw     r4,28(r1)
    11fc:	80 61 00 18 	lwz     r3,24(r1)
    1200:	48 00 03 dd 	bl      15dc <strlen>
    1204:	7c 6a 1b 78 	mr      r10,r3
    1208:	81 21 00 18 	lwz     r9,24(r1)
    120c:	7d 29 52 14 	add     r9,r9,r10
    1210:	91 21 00 08 	stw     r9,8(r1)
    1214:	81 21 00 08 	lwz     r9,8(r1)
    1218:	89 49 00 00 	lbz     r10,0(r9)
    121c:	81 21 00 1c 	lwz     r9,28(r1)
    1220:	55 29 06 3e 	clrlwi  r9,r9,24
    1224:	7c 0a 48 40 	cmplw   r10,r9
    1228:	40 82 00 0c 	bne     1234 <strrchr+0x4c>
    122c:	81 21 00 08 	lwz     r9,8(r1)
    1230:	48 00 00 24 	b       1254 <strrchr+0x6c>
    1234:	81 21 00 08 	lwz     r9,8(r1)
    1238:	39 29 ff ff 	addi    r9,r9,-1
    123c:	91 21 00 08 	stw     r9,8(r1)
    1240:	81 41 00 08 	lwz     r10,8(r1)
    1244:	81 21 00 18 	lwz     r9,24(r1)
    1248:	7c 0a 48 40 	cmplw   r10,r9
    124c:	40 80 ff c8 	bge     1214 <strrchr+0x2c>
    1250:	39 20 00 00 	li      r9,0
    1254:	7d 23 4b 78 	mr      r3,r9
    1258:	80 01 00 24 	lwz     r0,36(r1)
    125c:	7c 08 03 a6 	mtlr    r0
    1260:	38 21 00 20 	addi    r1,r1,32
    1264:	4e 80 00 20 	blr

00001268 <strnchr>:
    1268:	94 21 ff e0 	stwu    r1,-32(r1)
    126c:	90 61 00 08 	stw     r3,8(r1)
    1270:	90 81 00 0c 	stw     r4,12(r1)
    1274:	90 a1 00 10 	stw     r5,16(r1)
    1278:	48 00 00 30 	b       12a8 <strnchr+0x40>
    127c:	81 21 00 08 	lwz     r9,8(r1)
    1280:	89 49 00 00 	lbz     r10,0(r9)
    1284:	81 21 00 10 	lwz     r9,16(r1)
    1288:	55 29 06 3e 	clrlwi  r9,r9,24
    128c:	7c 0a 48 40 	cmplw   r10,r9
    1290:	40 82 00 0c 	bne     129c <strnchr+0x34>
    1294:	81 21 00 08 	lwz     r9,8(r1)
    1298:	48 00 00 38 	b       12d0 <strnchr+0x68>
    129c:	81 21 00 08 	lwz     r9,8(r1)
    12a0:	39 29 00 01 	addi    r9,r9,1
    12a4:	91 21 00 08 	stw     r9,8(r1)
    12a8:	81 21 00 0c 	lwz     r9,12(r1)
    12ac:	39 49 ff ff 	addi    r10,r9,-1
    12b0:	91 41 00 0c 	stw     r10,12(r1)
    12b4:	2c 09 00 00 	cmpwi   r9,0
    12b8:	41 82 00 14 	beq     12cc <strnchr+0x64>
    12bc:	81 21 00 08 	lwz     r9,8(r1)
    12c0:	89 29 00 00 	lbz     r9,0(r9)
    12c4:	2c 09 00 00 	cmpwi   r9,0
    12c8:	40 82 ff b4 	bne     127c <strnchr+0x14>
    12cc:	39 20 00 00 	li      r9,0
    12d0:	7d 23 4b 78 	mr      r3,r9
    12d4:	38 21 00 20 	addi    r1,r1,32
    12d8:	4e 80 00 20 	blr

000012dc <strcpy>:
    12dc:	94 21 ff e0 	stwu    r1,-32(r1)
    12e0:	90 61 00 18 	stw     r3,24(r1)
    12e4:	90 81 00 1c 	stw     r4,28(r1)
    12e8:	81 21 00 18 	lwz     r9,24(r1)
    12ec:	91 21 00 08 	stw     r9,8(r1)
    12f0:	60 00 00 00 	nop
    12f4:	81 41 00 1c 	lwz     r10,28(r1)
    12f8:	39 2a 00 01 	addi    r9,r10,1
    12fc:	91 21 00 1c 	stw     r9,28(r1)
    1300:	81 21 00 18 	lwz     r9,24(r1)
    1304:	39 09 00 01 	addi    r8,r9,1
    1308:	91 01 00 18 	stw     r8,24(r1)
    130c:	89 4a 00 00 	lbz     r10,0(r10)
    1310:	99 49 00 00 	stb     r10,0(r9)
    1314:	89 29 00 00 	lbz     r9,0(r9)
    1318:	2c 09 00 00 	cmpwi   r9,0
    131c:	40 82 ff d8 	bne     12f4 <strcpy+0x18>
    1320:	81 21 00 08 	lwz     r9,8(r1)
    1324:	7d 23 4b 78 	mr      r3,r9
    1328:	38 21 00 20 	addi    r1,r1,32
    132c:	4e 80 00 20 	blr

00001330 <strncpy>:
    1330:	94 21 ff d0 	stwu    r1,-48(r1)
    1334:	90 61 00 18 	stw     r3,24(r1)
    1338:	90 81 00 1c 	stw     r4,28(r1)
    133c:	90 a1 00 20 	stw     r5,32(r1)
    1340:	81 21 00 18 	lwz     r9,24(r1)
    1344:	91 21 00 08 	stw     r9,8(r1)
    1348:	48 00 00 48 	b       1390 <strncpy+0x60>
    134c:	81 21 00 1c 	lwz     r9,28(r1)
    1350:	89 49 00 00 	lbz     r10,0(r9)
    1354:	81 21 00 08 	lwz     r9,8(r1)
    1358:	99 49 00 00 	stb     r10,0(r9)
    135c:	81 21 00 08 	lwz     r9,8(r1)
    1360:	89 29 00 00 	lbz     r9,0(r9)
    1364:	2c 09 00 00 	cmpwi   r9,0
    1368:	41 82 00 10 	beq     1378 <strncpy+0x48>
    136c:	81 21 00 1c 	lwz     r9,28(r1)
    1370:	39 29 00 01 	addi    r9,r9,1
    1374:	91 21 00 1c 	stw     r9,28(r1)
    1378:	81 21 00 08 	lwz     r9,8(r1)
    137c:	39 29 00 01 	addi    r9,r9,1
    1380:	91 21 00 08 	stw     r9,8(r1)
    1384:	81 21 00 20 	lwz     r9,32(r1)
    1388:	39 29 ff ff 	addi    r9,r9,-1
    138c:	91 21 00 20 	stw     r9,32(r1)
    1390:	81 21 00 20 	lwz     r9,32(r1)
    1394:	2c 09 00 00 	cmpwi   r9,0
    1398:	40 82 ff b4 	bne     134c <strncpy+0x1c>
    139c:	81 21 00 18 	lwz     r9,24(r1)
    13a0:	7d 23 4b 78 	mr      r3,r9
    13a4:	38 21 00 30 	addi    r1,r1,48
    13a8:	4e 80 00 20 	blr

000013ac <strcmp>:
    13ac:	94 21 ff e0 	stwu    r1,-32(r1)
    13b0:	90 61 00 18 	stw     r3,24(r1)
    13b4:	90 81 00 1c 	stw     r4,28(r1)
    13b8:	81 21 00 18 	lwz     r9,24(r1)
    13bc:	89 49 00 00 	lbz     r10,0(r9)
    13c0:	81 21 00 1c 	lwz     r9,28(r1)
    13c4:	39 09 00 01 	addi    r8,r9,1
    13c8:	91 01 00 1c 	stw     r8,28(r1)
    13cc:	89 29 00 00 	lbz     r9,0(r9)
    13d0:	7d 29 50 50 	subf    r9,r9,r10
    13d4:	55 29 06 3e 	clrlwi  r9,r9,24
    13d8:	99 21 00 08 	stb     r9,8(r1)
    13dc:	89 21 00 08 	lbz     r9,8(r1)
    13e0:	7d 29 07 74 	extsb   r9,r9
    13e4:	2c 09 00 00 	cmpwi   r9,0
    13e8:	40 82 00 20 	bne     1408 <strcmp+0x5c>
    13ec:	81 21 00 18 	lwz     r9,24(r1)
    13f0:	39 49 00 01 	addi    r10,r9,1
    13f4:	91 41 00 18 	stw     r10,24(r1)
    13f8:	89 29 00 00 	lbz     r9,0(r9)
    13fc:	2c 09 00 00 	cmpwi   r9,0
    1400:	41 82 00 08 	beq     1408 <strcmp+0x5c>
    1404:	4b ff ff b4 	b       13b8 <strcmp+0xc>
    1408:	89 21 00 08 	lbz     r9,8(r1)
    140c:	7d 29 07 74 	extsb   r9,r9
    1410:	7d 23 4b 78 	mr      r3,r9
    1414:	38 21 00 20 	addi    r1,r1,32
    1418:	4e 80 00 20 	blr

0000141c <strncmp>:
    141c:	94 21 ff d0 	stwu    r1,-48(r1)
    1420:	90 61 00 18 	stw     r3,24(r1)
    1424:	90 81 00 1c 	stw     r4,28(r1)
    1428:	90 a1 00 20 	stw     r5,32(r1)
    142c:	39 20 00 00 	li      r9,0
    1430:	91 21 00 0c 	stw     r9,12(r1)
    1434:	39 20 00 00 	li      r9,0
    1438:	99 21 00 08 	stb     r9,8(r1)
    143c:	48 00 00 5c 	b       1498 <strncmp+0x7c>
    1440:	81 21 00 18 	lwz     r9,24(r1)
    1444:	89 49 00 00 	lbz     r10,0(r9)
    1448:	81 21 00 1c 	lwz     r9,28(r1)
    144c:	39 09 00 01 	addi    r8,r9,1
    1450:	91 01 00 1c 	stw     r8,28(r1)
    1454:	89 29 00 00 	lbz     r9,0(r9)
    1458:	7d 29 50 50 	subf    r9,r9,r10
    145c:	55 29 06 3e 	clrlwi  r9,r9,24
    1460:	99 21 00 08 	stb     r9,8(r1)
    1464:	89 21 00 08 	lbz     r9,8(r1)
    1468:	7d 29 07 74 	extsb   r9,r9
    146c:	2c 09 00 00 	cmpwi   r9,0
    1470:	40 82 00 38 	bne     14a8 <strncmp+0x8c>
    1474:	81 21 00 18 	lwz     r9,24(r1)
    1478:	39 49 00 01 	addi    r10,r9,1
    147c:	91 41 00 18 	stw     r10,24(r1)
    1480:	89 29 00 00 	lbz     r9,0(r9)
    1484:	2c 09 00 00 	cmpwi   r9,0
    1488:	41 82 00 20 	beq     14a8 <strncmp+0x8c>
    148c:	81 21 00 0c 	lwz     r9,12(r1)
    1490:	39 29 00 01 	addi    r9,r9,1
    1494:	91 21 00 0c 	stw     r9,12(r1)
    1498:	81 41 00 0c 	lwz     r10,12(r1)
    149c:	81 21 00 20 	lwz     r9,32(r1)
    14a0:	7c 0a 48 40 	cmplw   r10,r9
    14a4:	41 80 ff 9c 	blt     1440 <strncmp+0x24>
    14a8:	89 21 00 08 	lbz     r9,8(r1)
    14ac:	7d 29 07 74 	extsb   r9,r9
    14b0:	7d 23 4b 78 	mr      r3,r9
    14b4:	38 21 00 30 	addi    r1,r1,48
    14b8:	4e 80 00 20 	blr

000014bc <strcat>:
    14bc:	94 21 ff e0 	stwu    r1,-32(r1)
    14c0:	90 61 00 18 	stw     r3,24(r1)
    14c4:	90 81 00 1c 	stw     r4,28(r1)
    14c8:	81 21 00 18 	lwz     r9,24(r1)
    14cc:	91 21 00 08 	stw     r9,8(r1)
    14d0:	48 00 00 10 	b       14e0 <strcat+0x24>
    14d4:	81 21 00 18 	lwz     r9,24(r1)
    14d8:	39 29 00 01 	addi    r9,r9,1
    14dc:	91 21 00 18 	stw     r9,24(r1)
    14e0:	81 21 00 18 	lwz     r9,24(r1)
    14e4:	89 29 00 00 	lbz     r9,0(r9)
    14e8:	2c 09 00 00 	cmpwi   r9,0
    14ec:	40 82 ff e8 	bne     14d4 <strcat+0x18>
    14f0:	60 00 00 00 	nop
    14f4:	81 41 00 1c 	lwz     r10,28(r1)
    14f8:	39 2a 00 01 	addi    r9,r10,1
    14fc:	91 21 00 1c 	stw     r9,28(r1)
    1500:	81 21 00 18 	lwz     r9,24(r1)
    1504:	39 09 00 01 	addi    r8,r9,1
    1508:	91 01 00 18 	stw     r8,24(r1)
    150c:	89 4a 00 00 	lbz     r10,0(r10)
    1510:	99 49 00 00 	stb     r10,0(r9)
    1514:	89 29 00 00 	lbz     r9,0(r9)
    1518:	2c 09 00 00 	cmpwi   r9,0
    151c:	40 82 ff d8 	bne     14f4 <strcat+0x38>
    1520:	81 21 00 08 	lwz     r9,8(r1)
    1524:	7d 23 4b 78 	mr      r3,r9
    1528:	38 21 00 20 	addi    r1,r1,32
    152c:	4e 80 00 20 	blr

00001530 <strncat>:
    1530:	94 21 ff d0 	stwu    r1,-48(r1)
    1534:	90 61 00 18 	stw     r3,24(r1)
    1538:	90 81 00 1c 	stw     r4,28(r1)
    153c:	90 a1 00 20 	stw     r5,32(r1)
    1540:	81 21 00 18 	lwz     r9,24(r1)
    1544:	91 21 00 08 	stw     r9,8(r1)
    1548:	81 21 00 20 	lwz     r9,32(r1)
    154c:	2c 09 00 00 	cmpwi   r9,0
    1550:	41 82 00 7c 	beq     15cc <strncat+0x9c>
    1554:	48 00 00 10 	b       1564 <strncat+0x34>
    1558:	81 21 00 18 	lwz     r9,24(r1)
    155c:	39 29 00 01 	addi    r9,r9,1
    1560:	91 21 00 18 	stw     r9,24(r1)
    1564:	81 21 00 18 	lwz     r9,24(r1)
    1568:	89 29 00 00 	lbz     r9,0(r9)
    156c:	2c 09 00 00 	cmpwi   r9,0
    1570:	40 82 ff e8 	bne     1558 <strncat+0x28>
    1574:	48 00 00 2c 	b       15a0 <strncat+0x70>
    1578:	81 21 00 20 	lwz     r9,32(r1)
    157c:	39 29 ff ff 	addi    r9,r9,-1
    1580:	91 21 00 20 	stw     r9,32(r1)
    1584:	81 21 00 20 	lwz     r9,32(r1)
    1588:	2c 09 00 00 	cmpwi   r9,0
    158c:	40 82 00 14 	bne     15a0 <strncat+0x70>
    1590:	81 21 00 18 	lwz     r9,24(r1)
    1594:	39 40 00 00 	li      r10,0
    1598:	99 49 00 00 	stb     r10,0(r9)
    159c:	48 00 00 30 	b       15cc <strncat+0x9c>
    15a0:	81 41 00 1c 	lwz     r10,28(r1)
    15a4:	39 2a 00 01 	addi    r9,r10,1
    15a8:	91 21 00 1c 	stw     r9,28(r1)
    15ac:	81 21 00 18 	lwz     r9,24(r1)
    15b0:	39 09 00 01 	addi    r8,r9,1
    15b4:	91 01 00 18 	stw     r8,24(r1)
    15b8:	89 4a 00 00 	lbz     r10,0(r10)
    15bc:	99 49 00 00 	stb     r10,0(r9)
    15c0:	89 29 00 00 	lbz     r9,0(r9)
    15c4:	2c 09 00 00 	cmpwi   r9,0
    15c8:	40 82 ff b0 	bne     1578 <strncat+0x48>
    15cc:	81 21 00 08 	lwz     r9,8(r1)
    15d0:	7d 23 4b 78 	mr      r3,r9
    15d4:	38 21 00 30 	addi    r1,r1,48
    15d8:	4e 80 00 20 	blr

000015dc <strlen>:
    15dc:	94 21 ff e0 	stwu    r1,-32(r1)
    15e0:	90 61 00 18 	stw     r3,24(r1)
    15e4:	81 21 00 18 	lwz     r9,24(r1)
    15e8:	91 21 00 08 	stw     r9,8(r1)
    15ec:	48 00 00 10 	b       15fc <strlen+0x20>
    15f0:	81 21 00 08 	lwz     r9,8(r1)
    15f4:	39 29 00 01 	addi    r9,r9,1
    15f8:	91 21 00 08 	stw     r9,8(r1)
    15fc:	81 21 00 08 	lwz     r9,8(r1)
    1600:	89 29 00 00 	lbz     r9,0(r9)
    1604:	2c 09 00 00 	cmpwi   r9,0
    1608:	40 82 ff e8 	bne     15f0 <strlen+0x14>
    160c:	81 41 00 08 	lwz     r10,8(r1)
    1610:	81 21 00 18 	lwz     r9,24(r1)
    1614:	7d 29 50 50 	subf    r9,r9,r10
    1618:	7d 23 4b 78 	mr      r3,r9
    161c:	38 21 00 20 	addi    r1,r1,32
    1620:	4e 80 00 20 	blr

00001624 <strnlen>:
    1624:	94 21 ff e0 	stwu    r1,-32(r1)
    1628:	90 61 00 18 	stw     r3,24(r1)
    162c:	90 81 00 1c 	stw     r4,28(r1)
    1630:	81 21 00 18 	lwz     r9,24(r1)
    1634:	91 21 00 08 	stw     r9,8(r1)
    1638:	48 00 00 10 	b       1648 <strnlen+0x24>
    163c:	81 21 00 08 	lwz     r9,8(r1)
    1640:	39 29 00 01 	addi    r9,r9,1
    1644:	91 21 00 08 	stw     r9,8(r1)
    1648:	81 21 00 1c 	lwz     r9,28(r1)
    164c:	39 49 ff ff 	addi    r10,r9,-1
    1650:	91 41 00 1c 	stw     r10,28(r1)
    1654:	2c 09 00 00 	cmpwi   r9,0
    1658:	41 82 00 14 	beq     166c <strnlen+0x48>
    165c:	81 21 00 08 	lwz     r9,8(r1)
    1660:	89 29 00 00 	lbz     r9,0(r9)
    1664:	2c 09 00 00 	cmpwi   r9,0
    1668:	40 82 ff d4 	bne     163c <strnlen+0x18>
    166c:	81 41 00 08 	lwz     r10,8(r1)
    1670:	81 21 00 18 	lwz     r9,24(r1)
    1674:	7d 29 50 50 	subf    r9,r9,r10
    1678:	7d 23 4b 78 	mr      r3,r9
    167c:	38 21 00 20 	addi    r1,r1,32
    1680:	4e 80 00 20 	blr

00001684 <strspn>:
    1684:	94 21 ff e0 	stwu    r1,-32(r1)
    1688:	90 61 00 18 	stw     r3,24(r1)
    168c:	90 81 00 1c 	stw     r4,28(r1)
    1690:	39 20 00 00 	li      r9,0
    1694:	91 21 00 10 	stw     r9,16(r1)
    1698:	81 21 00 18 	lwz     r9,24(r1)
    169c:	91 21 00 08 	stw     r9,8(r1)
    16a0:	48 00 00 7c 	b       171c <strspn+0x98>
    16a4:	81 21 00 1c 	lwz     r9,28(r1)
    16a8:	91 21 00 0c 	stw     r9,12(r1)
    16ac:	48 00 00 28 	b       16d4 <strspn+0x50>
    16b0:	81 21 00 08 	lwz     r9,8(r1)
    16b4:	89 49 00 00 	lbz     r10,0(r9)
    16b8:	81 21 00 0c 	lwz     r9,12(r1)
    16bc:	89 29 00 00 	lbz     r9,0(r9)
    16c0:	7c 0a 48 40 	cmplw   r10,r9
    16c4:	41 82 00 24 	beq     16e8 <strspn+0x64>
    16c8:	81 21 00 0c 	lwz     r9,12(r1)
    16cc:	39 29 00 01 	addi    r9,r9,1
    16d0:	91 21 00 0c 	stw     r9,12(r1)
    16d4:	81 21 00 0c 	lwz     r9,12(r1)
    16d8:	89 29 00 00 	lbz     r9,0(r9)
    16dc:	2c 09 00 00 	cmpwi   r9,0
    16e0:	40 82 ff d0 	bne     16b0 <strspn+0x2c>
    16e4:	48 00 00 08 	b       16ec <strspn+0x68>
    16e8:	60 00 00 00 	nop
    16ec:	81 21 00 0c 	lwz     r9,12(r1)
    16f0:	89 29 00 00 	lbz     r9,0(r9)
    16f4:	2c 09 00 00 	cmpwi   r9,0
    16f8:	40 82 00 0c 	bne     1704 <strspn+0x80>
    16fc:	81 21 00 10 	lwz     r9,16(r1)
    1700:	48 00 00 30 	b       1730 <strspn+0xac>
    1704:	81 21 00 10 	lwz     r9,16(r1)
    1708:	39 29 00 01 	addi    r9,r9,1
    170c:	91 21 00 10 	stw     r9,16(r1)
    1710:	81 21 00 08 	lwz     r9,8(r1)
    1714:	39 29 00 01 	addi    r9,r9,1
    1718:	91 21 00 08 	stw     r9,8(r1)
    171c:	81 21 00 08 	lwz     r9,8(r1)
    1720:	89 29 00 00 	lbz     r9,0(r9)
    1724:	2c 09 00 00 	cmpwi   r9,0
    1728:	40 82 ff 7c 	bne     16a4 <strspn+0x20>
    172c:	81 21 00 10 	lwz     r9,16(r1)
    1730:	7d 23 4b 78 	mr      r3,r9
    1734:	38 21 00 20 	addi    r1,r1,32
    1738:	4e 80 00 20 	blr

0000173c <memcmp>:
    173c:	94 21 ff d0 	stwu    r1,-48(r1)
    1740:	90 61 00 18 	stw     r3,24(r1)
    1744:	90 81 00 1c 	stw     r4,28(r1)
    1748:	90 a1 00 20 	stw     r5,32(r1)
    174c:	39 20 00 00 	li      r9,0
    1750:	91 21 00 10 	stw     r9,16(r1)
    1754:	81 21 00 18 	lwz     r9,24(r1)
    1758:	91 21 00 08 	stw     r9,8(r1)
    175c:	81 21 00 1c 	lwz     r9,28(r1)
    1760:	91 21 00 0c 	stw     r9,12(r1)
    1764:	48 00 00 50 	b       17b4 <memcmp+0x78>
    1768:	81 21 00 08 	lwz     r9,8(r1)
    176c:	89 29 00 00 	lbz     r9,0(r9)
    1770:	7d 2a 4b 78 	mr      r10,r9
    1774:	81 21 00 0c 	lwz     r9,12(r1)
    1778:	89 29 00 00 	lbz     r9,0(r9)
    177c:	7d 29 50 50 	subf    r9,r9,r10
    1780:	91 21 00 10 	stw     r9,16(r1)
    1784:	81 21 00 10 	lwz     r9,16(r1)
    1788:	2c 09 00 00 	cmpwi   r9,0
    178c:	40 82 00 38 	bne     17c4 <memcmp+0x88>
    1790:	81 21 00 08 	lwz     r9,8(r1)
    1794:	39 29 00 01 	addi    r9,r9,1
    1798:	91 21 00 08 	stw     r9,8(r1)
    179c:	81 21 00 0c 	lwz     r9,12(r1)
    17a0:	39 29 00 01 	addi    r9,r9,1
    17a4:	91 21 00 0c 	stw     r9,12(r1)
    17a8:	81 21 00 20 	lwz     r9,32(r1)
    17ac:	39 29 ff ff 	addi    r9,r9,-1
    17b0:	91 21 00 20 	stw     r9,32(r1)
    17b4:	81 21 00 20 	lwz     r9,32(r1)
    17b8:	2c 09 00 00 	cmpwi   r9,0
    17bc:	40 82 ff ac 	bne     1768 <memcmp+0x2c>
    17c0:	48 00 00 08 	b       17c8 <memcmp+0x8c>
    17c4:	60 00 00 00 	nop
    17c8:	81 21 00 10 	lwz     r9,16(r1)
    17cc:	7d 23 4b 78 	mr      r3,r9
    17d0:	38 21 00 30 	addi    r1,r1,48
    17d4:	4e 80 00 20 	blr

000017d8 <memset>:
    17d8:	94 21 ff d0 	stwu    r1,-48(r1)
    17dc:	90 61 00 18 	stw     r3,24(r1)
    17e0:	90 81 00 1c 	stw     r4,28(r1)
    17e4:	90 a1 00 20 	stw     r5,32(r1)
    17e8:	81 21 00 18 	lwz     r9,24(r1)
    17ec:	91 21 00 08 	stw     r9,8(r1)
    17f0:	48 00 00 1c 	b       180c <memset+0x34>
    17f4:	81 21 00 08 	lwz     r9,8(r1)
    17f8:	39 49 00 01 	addi    r10,r9,1
    17fc:	91 41 00 08 	stw     r10,8(r1)
    1800:	81 41 00 1c 	lwz     r10,28(r1)
    1804:	55 4a 06 3e 	clrlwi  r10,r10,24
    1808:	99 49 00 00 	stb     r10,0(r9)
    180c:	81 21 00 20 	lwz     r9,32(r1)
    1810:	39 49 ff ff 	addi    r10,r9,-1
    1814:	91 41 00 20 	stw     r10,32(r1)
    1818:	2c 09 00 00 	cmpwi   r9,0
    181c:	40 82 ff d8 	bne     17f4 <memset+0x1c>
    1820:	81 21 00 18 	lwz     r9,24(r1)
    1824:	7d 23 4b 78 	mr      r3,r9
    1828:	38 21 00 30 	addi    r1,r1,48
    182c:	4e 80 00 20 	blr

00001830 <memcpy>:
    1830:	94 21 ff d0 	stwu    r1,-48(r1)
    1834:	90 61 00 18 	stw     r3,24(r1)
    1838:	90 81 00 1c 	stw     r4,28(r1)
    183c:	90 a1 00 20 	stw     r5,32(r1)
    1840:	81 21 00 18 	lwz     r9,24(r1)
    1844:	91 21 00 08 	stw     r9,8(r1)
    1848:	81 21 00 1c 	lwz     r9,28(r1)
    184c:	91 21 00 0c 	stw     r9,12(r1)
    1850:	48 00 00 24 	b       1874 <memcpy+0x44>
    1854:	81 41 00 0c 	lwz     r10,12(r1)
    1858:	39 2a 00 01 	addi    r9,r10,1
    185c:	91 21 00 0c 	stw     r9,12(r1)
    1860:	81 21 00 08 	lwz     r9,8(r1)
    1864:	39 09 00 01 	addi    r8,r9,1
    1868:	91 01 00 08 	stw     r8,8(r1)
    186c:	89 4a 00 00 	lbz     r10,0(r10)
    1870:	99 49 00 00 	stb     r10,0(r9)
    1874:	81 21 00 20 	lwz     r9,32(r1)
    1878:	39 49 ff ff 	addi    r10,r9,-1
    187c:	91 41 00 20 	stw     r10,32(r1)
    1880:	2c 09 00 00 	cmpwi   r9,0
    1884:	40 82 ff d0 	bne     1854 <memcpy+0x24>
    1888:	81 21 00 18 	lwz     r9,24(r1)
    188c:	7d 23 4b 78 	mr      r3,r9
    1890:	38 21 00 30 	addi    r1,r1,48
    1894:	4e 80 00 20 	blr

00001898 <memmove>:
    1898:	94 21 ff d0 	stwu    r1,-48(r1)
    189c:	90 61 00 18 	stw     r3,24(r1)
    18a0:	90 81 00 1c 	stw     r4,28(r1)
    18a4:	90 a1 00 20 	stw     r5,32(r1)
    18a8:	81 41 00 18 	lwz     r10,24(r1)
    18ac:	81 21 00 1c 	lwz     r9,28(r1)
    18b0:	7c 0a 48 40 	cmplw   r10,r9
    18b4:	41 81 00 50 	bgt     1904 <memmove+0x6c>
    18b8:	81 21 00 18 	lwz     r9,24(r1)
    18bc:	91 21 00 08 	stw     r9,8(r1)
    18c0:	81 21 00 1c 	lwz     r9,28(r1)
    18c4:	91 21 00 0c 	stw     r9,12(r1)
    18c8:	48 00 00 24 	b       18ec <memmove+0x54>
    18cc:	81 41 00 0c 	lwz     r10,12(r1)
    18d0:	39 2a 00 01 	addi    r9,r10,1
    18d4:	91 21 00 0c 	stw     r9,12(r1)
    18d8:	81 21 00 08 	lwz     r9,8(r1)
    18dc:	39 09 00 01 	addi    r8,r9,1
    18e0:	91 01 00 08 	stw     r8,8(r1)
    18e4:	89 4a 00 00 	lbz     r10,0(r10)
    18e8:	99 49 00 00 	stb     r10,0(r9)
    18ec:	81 21 00 20 	lwz     r9,32(r1)
    18f0:	39 49 ff ff 	addi    r10,r9,-1
    18f4:	91 41 00 20 	stw     r10,32(r1)
    18f8:	2c 09 00 00 	cmpwi   r9,0
    18fc:	40 82 ff d0 	bne     18cc <memmove+0x34>
    1900:	48 00 00 64 	b       1964 <memmove+0xcc>
    1904:	81 41 00 18 	lwz     r10,24(r1)
    1908:	81 21 00 20 	lwz     r9,32(r1)
    190c:	7d 2a 4a 14 	add     r9,r10,r9
    1910:	91 21 00 08 	stw     r9,8(r1)
    1914:	81 41 00 1c 	lwz     r10,28(r1)
    1918:	81 21 00 20 	lwz     r9,32(r1)
    191c:	7d 2a 4a 14 	add     r9,r10,r9
    1920:	91 21 00 0c 	stw     r9,12(r1)
    1924:	48 00 00 2c 	b       1950 <memmove+0xb8>
    1928:	81 21 00 0c 	lwz     r9,12(r1)
    192c:	39 29 ff ff 	addi    r9,r9,-1
    1930:	91 21 00 0c 	stw     r9,12(r1)
    1934:	81 21 00 08 	lwz     r9,8(r1)
    1938:	39 29 ff ff 	addi    r9,r9,-1
    193c:	91 21 00 08 	stw     r9,8(r1)
    1940:	81 21 00 0c 	lwz     r9,12(r1)
    1944:	89 49 00 00 	lbz     r10,0(r9)
    1948:	81 21 00 08 	lwz     r9,8(r1)
    194c:	99 49 00 00 	stb     r10,0(r9)
    1950:	81 21 00 20 	lwz     r9,32(r1)
    1954:	39 49 ff ff 	addi    r10,r9,-1
    1958:	91 41 00 20 	stw     r10,32(r1)
    195c:	2c 09 00 00 	cmpwi   r9,0
    1960:	40 82 ff c8 	bne     1928 <memmove+0x90>
    1964:	81 21 00 18 	lwz     r9,24(r1)
    1968:	7d 23 4b 78 	mr      r3,r9
    196c:	38 21 00 30 	addi    r1,r1,48
    1970:	4e 80 00 20 	blr

00001974 <strstr>:
    1974:	94 21 ff e0 	stwu    r1,-32(r1)
    1978:	7c 08 02 a6 	mflr    r0
    197c:	90 01 00 24 	stw     r0,36(r1)
    1980:	90 61 00 18 	stw     r3,24(r1)
    1984:	90 81 00 1c 	stw     r4,28(r1)
    1988:	80 61 00 1c 	lwz     r3,28(r1)
    198c:	4b ff fc 51 	bl      15dc <strlen>
    1990:	7c 69 1b 78 	mr      r9,r3
    1994:	91 21 00 0c 	stw     r9,12(r1)
    1998:	81 21 00 0c 	lwz     r9,12(r1)
    199c:	2c 09 00 00 	cmpwi   r9,0
    19a0:	40 82 00 0c 	bne     19ac <strstr+0x38>
    19a4:	81 21 00 18 	lwz     r9,24(r1)
    19a8:	48 00 00 68 	b       1a10 <strstr+0x9c>
    19ac:	80 61 00 18 	lwz     r3,24(r1)
    19b0:	4b ff fc 2d 	bl      15dc <strlen>
    19b4:	7c 69 1b 78 	mr      r9,r3
    19b8:	91 21 00 08 	stw     r9,8(r1)
    19bc:	48 00 00 40 	b       19fc <strstr+0x88>
    19c0:	81 21 00 08 	lwz     r9,8(r1)
    19c4:	39 29 ff ff 	addi    r9,r9,-1
    19c8:	91 21 00 08 	stw     r9,8(r1)
    19cc:	80 a1 00 0c 	lwz     r5,12(r1)
    19d0:	80 81 00 1c 	lwz     r4,28(r1)
    19d4:	80 61 00 18 	lwz     r3,24(r1)
    19d8:	4b ff fd 65 	bl      173c <memcmp>
    19dc:	7c 69 1b 78 	mr      r9,r3
    19e0:	2c 09 00 00 	cmpwi   r9,0
    19e4:	40 82 00 0c 	bne     19f0 <strstr+0x7c>
    19e8:	81 21 00 18 	lwz     r9,24(r1)
    19ec:	48 00 00 24 	b       1a10 <strstr+0x9c>
    19f0:	81 21 00 18 	lwz     r9,24(r1)
    19f4:	39 29 00 01 	addi    r9,r9,1
    19f8:	91 21 00 18 	stw     r9,24(r1)
    19fc:	81 41 00 08 	lwz     r10,8(r1)
    1a00:	81 21 00 0c 	lwz     r9,12(r1)
    1a04:	7c 0a 48 40 	cmplw   r10,r9
    1a08:	40 80 ff b8 	bge     19c0 <strstr+0x4c>
    1a0c:	39 20 00 00 	li      r9,0
    1a10:	7d 23 4b 78 	mr      r3,r9
    1a14:	80 01 00 24 	lwz     r0,36(r1)
    1a18:	7c 08 03 a6 	mtlr    r0
    1a1c:	38 21 00 20 	addi    r1,r1,32
    1a20:	4e 80 00 20 	blr

00001a24 <memchr>:
    1a24:	94 21 ff d0 	stwu    r1,-48(r1)
    1a28:	90 61 00 18 	stw     r3,24(r1)
    1a2c:	90 81 00 1c 	stw     r4,28(r1)
    1a30:	90 a1 00 20 	stw     r5,32(r1)
    1a34:	81 21 00 18 	lwz     r9,24(r1)
    1a38:	91 21 00 08 	stw     r9,8(r1)
    1a3c:	48 00 00 30 	b       1a6c <memchr+0x48>
    1a40:	81 21 00 1c 	lwz     r9,28(r1)
    1a44:	55 2a 06 3e 	clrlwi  r10,r9,24
    1a48:	81 21 00 08 	lwz     r9,8(r1)
    1a4c:	39 09 00 01 	addi    r8,r9,1
    1a50:	91 01 00 08 	stw     r8,8(r1)
    1a54:	89 29 00 00 	lbz     r9,0(r9)
    1a58:	7c 0a 48 40 	cmplw   r10,r9
    1a5c:	40 82 00 10 	bne     1a6c <memchr+0x48>
    1a60:	81 21 00 08 	lwz     r9,8(r1)
    1a64:	39 29 ff ff 	addi    r9,r9,-1
    1a68:	48 00 00 1c 	b       1a84 <memchr+0x60>
    1a6c:	81 21 00 20 	lwz     r9,32(r1)
    1a70:	39 49 ff ff 	addi    r10,r9,-1
    1a74:	91 41 00 20 	stw     r10,32(r1)
    1a78:	2c 09 00 00 	cmpwi   r9,0
    1a7c:	40 82 ff c4 	bne     1a40 <memchr+0x1c>
    1a80:	39 20 00 00 	li      r9,0
    1a84:	7d 23 4b 78 	mr      r3,r9
    1a88:	38 21 00 30 	addi    r1,r1,48
    1a8c:	4e 80 00 20 	blr

00001a90 <strtoul>:
    1a90:	94 21 ff d0 	stwu    r1,-48(r1)
    1a94:	7c 08 02 a6 	mflr    r0
    1a98:	90 01 00 34 	stw     r0,52(r1)
    1a9c:	90 61 00 18 	stw     r3,24(r1)
    1aa0:	90 81 00 1c 	stw     r4,28(r1)
    1aa4:	90 a1 00 20 	stw     r5,32(r1)
    1aa8:	39 20 00 00 	li      r9,0
    1aac:	91 21 00 08 	stw     r9,8(r1)
    1ab0:	81 21 00 20 	lwz     r9,32(r1)
    1ab4:	2c 09 00 00 	cmpwi   r9,0
    1ab8:	40 82 00 8c 	bne     1b44 <strtoul+0xb4>
    1abc:	39 20 00 0a 	li      r9,10
    1ac0:	91 21 00 20 	stw     r9,32(r1)
    1ac4:	81 21 00 18 	lwz     r9,24(r1)
    1ac8:	89 29 00 00 	lbz     r9,0(r9)
    1acc:	28 09 00 30 	cmplwi  r9,48
    1ad0:	40 82 00 e4 	bne     1bb4 <strtoul+0x124>
    1ad4:	39 20 00 08 	li      r9,8
    1ad8:	91 21 00 20 	stw     r9,32(r1)
    1adc:	81 21 00 18 	lwz     r9,24(r1)
    1ae0:	39 29 00 01 	addi    r9,r9,1
    1ae4:	91 21 00 18 	stw     r9,24(r1)
    1ae8:	81 21 00 18 	lwz     r9,24(r1)
    1aec:	89 29 00 00 	lbz     r9,0(r9)
    1af0:	7d 23 4b 78 	mr      r3,r9
    1af4:	4b ff f5 41 	bl      1034 <__toupper>
    1af8:	7c 69 1b 78 	mr      r9,r3
    1afc:	28 09 00 58 	cmplwi  r9,88
    1b00:	40 82 00 b4 	bne     1bb4 <strtoul+0x124>
    1b04:	81 21 00 18 	lwz     r9,24(r1)
    1b08:	39 29 00 01 	addi    r9,r9,1
    1b0c:	89 29 00 00 	lbz     r9,0(r9)
    1b10:	7d 2a 4b 78 	mr      r10,r9
    1b14:	3d 20 00 00 	lis     r9,0
    1b18:	39 29 09 04 	addi    r9,r9,2308
    1b1c:	7d 29 50 ae 	lbzx    r9,r9,r10
    1b20:	71 29 00 44 	andi.   r9,r9,68
    1b24:	2c 09 00 00 	cmpwi   r9,0
    1b28:	41 82 00 8c 	beq     1bb4 <strtoul+0x124>
    1b2c:	81 21 00 18 	lwz     r9,24(r1)
    1b30:	39 29 00 01 	addi    r9,r9,1
    1b34:	91 21 00 18 	stw     r9,24(r1)
    1b38:	39 20 00 10 	li      r9,16
    1b3c:	91 21 00 20 	stw     r9,32(r1)
    1b40:	48 00 00 74 	b       1bb4 <strtoul+0x124>
    1b44:	81 21 00 20 	lwz     r9,32(r1)
    1b48:	2c 09 00 10 	cmpwi   r9,16
    1b4c:	40 82 00 68 	bne     1bb4 <strtoul+0x124>
    1b50:	81 21 00 18 	lwz     r9,24(r1)
    1b54:	89 29 00 00 	lbz     r9,0(r9)
    1b58:	28 09 00 30 	cmplwi  r9,48
    1b5c:	40 82 00 58 	bne     1bb4 <strtoul+0x124>
    1b60:	81 21 00 18 	lwz     r9,24(r1)
    1b64:	39 29 00 01 	addi    r9,r9,1
    1b68:	89 29 00 00 	lbz     r9,0(r9)
    1b6c:	7d 23 4b 78 	mr      r3,r9
    1b70:	4b ff f4 c5 	bl      1034 <__toupper>
    1b74:	7c 69 1b 78 	mr      r9,r3
    1b78:	28 09 00 58 	cmplwi  r9,88
    1b7c:	40 82 00 38 	bne     1bb4 <strtoul+0x124>
    1b80:	81 21 00 18 	lwz     r9,24(r1)
    1b84:	39 29 00 02 	addi    r9,r9,2
    1b88:	91 21 00 18 	stw     r9,24(r1)
    1b8c:	48 00 00 28 	b       1bb4 <strtoul+0x124>
    1b90:	81 41 00 08 	lwz     r10,8(r1)
    1b94:	81 21 00 20 	lwz     r9,32(r1)
    1b98:	7d 2a 49 d6 	mullw   r9,r10,r9
    1b9c:	81 41 00 0c 	lwz     r10,12(r1)
    1ba0:	7d 2a 4a 14 	add     r9,r10,r9
    1ba4:	91 21 00 08 	stw     r9,8(r1)
    1ba8:	81 21 00 18 	lwz     r9,24(r1)
    1bac:	39 29 00 01 	addi    r9,r9,1
    1bb0:	91 21 00 18 	stw     r9,24(r1)
    1bb4:	81 21 00 18 	lwz     r9,24(r1)
    1bb8:	89 29 00 00 	lbz     r9,0(r9)
    1bbc:	7d 2a 4b 78 	mr      r10,r9
    1bc0:	3d 20 00 00 	lis     r9,0
    1bc4:	39 29 09 04 	addi    r9,r9,2308
    1bc8:	7d 29 50 ae 	lbzx    r9,r9,r10
    1bcc:	71 29 00 44 	andi.   r9,r9,68
    1bd0:	2c 09 00 00 	cmpwi   r9,0
    1bd4:	41 82 00 64 	beq     1c38 <strtoul+0x1a8>
    1bd8:	81 21 00 18 	lwz     r9,24(r1)
    1bdc:	89 29 00 00 	lbz     r9,0(r9)
    1be0:	7d 2a 4b 78 	mr      r10,r9
    1be4:	3d 20 00 00 	lis     r9,0
    1be8:	39 29 09 04 	addi    r9,r9,2308
    1bec:	7d 29 50 ae 	lbzx    r9,r9,r10
    1bf0:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    1bf4:	2c 09 00 00 	cmpwi   r9,0
    1bf8:	41 82 00 14 	beq     1c0c <strtoul+0x17c>
    1bfc:	81 21 00 18 	lwz     r9,24(r1)
    1c00:	89 29 00 00 	lbz     r9,0(r9)
    1c04:	39 29 ff d0 	addi    r9,r9,-48
    1c08:	48 00 00 1c 	b       1c24 <strtoul+0x194>
    1c0c:	81 21 00 18 	lwz     r9,24(r1)
    1c10:	89 29 00 00 	lbz     r9,0(r9)
    1c14:	7d 23 4b 78 	mr      r3,r9
    1c18:	4b ff f4 1d 	bl      1034 <__toupper>
    1c1c:	7c 69 1b 78 	mr      r9,r3
    1c20:	39 29 ff c9 	addi    r9,r9,-55
    1c24:	91 21 00 0c 	stw     r9,12(r1)
    1c28:	81 41 00 0c 	lwz     r10,12(r1)
    1c2c:	81 21 00 20 	lwz     r9,32(r1)
    1c30:	7c 0a 48 40 	cmplw   r10,r9
    1c34:	41 80 ff 5c 	blt     1b90 <strtoul+0x100>
    1c38:	81 21 00 1c 	lwz     r9,28(r1)
    1c3c:	2c 09 00 00 	cmpwi   r9,0
    1c40:	41 82 00 10 	beq     1c50 <strtoul+0x1c0>
    1c44:	81 21 00 1c 	lwz     r9,28(r1)
    1c48:	81 41 00 18 	lwz     r10,24(r1)
    1c4c:	91 49 00 00 	stw     r10,0(r9)
    1c50:	81 21 00 08 	lwz     r9,8(r1)
    1c54:	7d 23 4b 78 	mr      r3,r9
    1c58:	80 01 00 34 	lwz     r0,52(r1)
    1c5c:	7c 08 03 a6 	mtlr    r0
    1c60:	38 21 00 30 	addi    r1,r1,48
    1c64:	4e 80 00 20 	blr

00001c68 <strtol>:
    1c68:	94 21 ff e0 	stwu    r1,-32(r1)
    1c6c:	7c 08 02 a6 	mflr    r0
    1c70:	90 01 00 24 	stw     r0,36(r1)
    1c74:	90 61 00 08 	stw     r3,8(r1)
    1c78:	90 81 00 0c 	stw     r4,12(r1)
    1c7c:	90 a1 00 10 	stw     r5,16(r1)
    1c80:	81 21 00 08 	lwz     r9,8(r1)
    1c84:	89 29 00 00 	lbz     r9,0(r9)
    1c88:	28 09 00 2d 	cmplwi  r9,45
    1c8c:	40 82 00 2c 	bne     1cb8 <strtol+0x50>
    1c90:	81 21 00 08 	lwz     r9,8(r1)
    1c94:	39 29 00 01 	addi    r9,r9,1
    1c98:	81 41 00 10 	lwz     r10,16(r1)
    1c9c:	7d 45 53 78 	mr      r5,r10
    1ca0:	80 81 00 0c 	lwz     r4,12(r1)
    1ca4:	7d 23 4b 78 	mr      r3,r9
    1ca8:	4b ff fd e9 	bl      1a90 <strtoul>
    1cac:	7c 69 1b 78 	mr      r9,r3
    1cb0:	7d 29 00 d0 	neg     r9,r9
    1cb4:	48 00 00 1c 	b       1cd0 <strtol+0x68>
    1cb8:	81 21 00 10 	lwz     r9,16(r1)
    1cbc:	7d 25 4b 78 	mr      r5,r9
    1cc0:	80 81 00 0c 	lwz     r4,12(r1)
    1cc4:	80 61 00 08 	lwz     r3,8(r1)
    1cc8:	4b ff fd c9 	bl      1a90 <strtoul>
    1ccc:	7c 69 1b 78 	mr      r9,r3
    1cd0:	7d 23 4b 78 	mr      r3,r9
    1cd4:	80 01 00 24 	lwz     r0,36(r1)
    1cd8:	7c 08 03 a6 	mtlr    r0
    1cdc:	38 21 00 20 	addi    r1,r1,32
    1ce0:	4e 80 00 20 	blr

00001ce4 <skip_atoi>:
    1ce4:	94 21 ff e0 	stwu    r1,-32(r1)
    1ce8:	90 61 00 18 	stw     r3,24(r1)
    1cec:	39 20 00 00 	li      r9,0
    1cf0:	91 21 00 08 	stw     r9,8(r1)
    1cf4:	48 00 00 30 	b       1d24 <skip_atoi+0x40>
    1cf8:	81 21 00 08 	lwz     r9,8(r1)
    1cfc:	1d 49 00 0a 	mulli   r10,r9,10
    1d00:	81 21 00 18 	lwz     r9,24(r1)
    1d04:	81 29 00 00 	lwz     r9,0(r9)
    1d08:	38 e9 00 01 	addi    r7,r9,1
    1d0c:	81 01 00 18 	lwz     r8,24(r1)
    1d10:	90 e8 00 00 	stw     r7,0(r8)
    1d14:	89 29 00 00 	lbz     r9,0(r9)
    1d18:	7d 2a 4a 14 	add     r9,r10,r9
    1d1c:	39 29 ff d0 	addi    r9,r9,-48
    1d20:	91 21 00 08 	stw     r9,8(r1)
    1d24:	81 21 00 18 	lwz     r9,24(r1)
    1d28:	81 29 00 00 	lwz     r9,0(r9)
    1d2c:	89 29 00 00 	lbz     r9,0(r9)
    1d30:	7d 2a 4b 78 	mr      r10,r9
    1d34:	3d 20 00 00 	lis     r9,0
    1d38:	39 29 09 04 	addi    r9,r9,2308
    1d3c:	7d 29 50 ae 	lbzx    r9,r9,r10
    1d40:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    1d44:	2c 09 00 00 	cmpwi   r9,0
    1d48:	40 82 ff b0 	bne     1cf8 <skip_atoi+0x14>
    1d4c:	81 21 00 08 	lwz     r9,8(r1)
    1d50:	7d 23 4b 78 	mr      r3,r9
    1d54:	38 21 00 20 	addi    r1,r1,32
    1d58:	4e 80 00 20 	blr

00001d5c <number>:
    1d5c:	94 21 ff 70 	stwu    r1,-144(r1)
    1d60:	90 61 00 68 	stw     r3,104(r1)
    1d64:	90 81 00 6c 	stw     r4,108(r1)
    1d68:	90 a1 00 70 	stw     r5,112(r1)
    1d6c:	90 c1 00 74 	stw     r6,116(r1)
    1d70:	90 e1 00 78 	stw     r7,120(r1)
    1d74:	91 01 00 7c 	stw     r8,124(r1)
    1d78:	91 21 00 80 	stw     r9,128(r1)
    1d7c:	81 21 00 80 	lwz     r9,128(r1)
    1d80:	55 29 06 72 	rlwinm  r9,r9,0,25,25
    1d84:	2c 09 00 00 	cmpwi   r9,0
    1d88:	41 82 00 10 	beq     1d98 <number+0x3c>
    1d8c:	3d 20 00 00 	lis     r9,0
    1d90:	39 29 0a 10 	addi    r9,r9,2576
    1d94:	48 00 00 0c 	b       1da0 <number+0x44>
    1d98:	3d 20 00 00 	lis     r9,0
    1d9c:	39 29 0a 38 	addi    r9,r9,2616
    1da0:	91 21 00 10 	stw     r9,16(r1)
    1da4:	81 21 00 80 	lwz     r9,128(r1)
    1da8:	55 29 06 f6 	rlwinm  r9,r9,0,27,27
    1dac:	2c 09 00 00 	cmpwi   r9,0
    1db0:	41 82 00 10 	beq     1dc0 <number+0x64>
    1db4:	81 21 00 80 	lwz     r9,128(r1)
    1db8:	55 29 00 3c 	rlwinm  r9,r9,0,0,30
    1dbc:	91 21 00 80 	stw     r9,128(r1)
    1dc0:	81 21 00 74 	lwz     r9,116(r1)
    1dc4:	2c 09 00 01 	cmpwi   r9,1
    1dc8:	40 81 00 10 	ble     1dd8 <number+0x7c>
    1dcc:	81 21 00 74 	lwz     r9,116(r1)
    1dd0:	2c 09 00 24 	cmpwi   r9,36
    1dd4:	40 81 00 0c 	ble     1de0 <number+0x84>
    1dd8:	39 20 00 00 	li      r9,0
    1ddc:	48 00 03 fc 	b       21d8 <number+0x47c>
    1de0:	81 21 00 80 	lwz     r9,128(r1)
    1de4:	55 29 07 fe 	clrlwi  r9,r9,31
    1de8:	2c 09 00 00 	cmpwi   r9,0
    1dec:	41 82 00 0c 	beq     1df8 <number+0x9c>
    1df0:	39 20 00 30 	li      r9,48
    1df4:	48 00 00 08 	b       1dfc <number+0xa0>
    1df8:	39 20 00 20 	li      r9,32
    1dfc:	99 21 00 14 	stb     r9,20(r1)
    1e00:	39 20 00 00 	li      r9,0
    1e04:	99 21 00 08 	stb     r9,8(r1)
    1e08:	81 21 00 80 	lwz     r9,128(r1)
    1e0c:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    1e10:	2c 09 00 00 	cmpwi   r9,0
    1e14:	41 82 00 80 	beq     1e94 <number+0x138>
    1e18:	81 21 00 70 	lwz     r9,112(r1)
    1e1c:	2c 09 00 00 	cmpwi   r9,0
    1e20:	40 80 00 28 	bge     1e48 <number+0xec>
    1e24:	39 20 00 2d 	li      r9,45
    1e28:	99 21 00 08 	stb     r9,8(r1)
    1e2c:	81 21 00 70 	lwz     r9,112(r1)
    1e30:	7d 29 00 d0 	neg     r9,r9
    1e34:	91 21 00 70 	stw     r9,112(r1)
    1e38:	81 21 00 78 	lwz     r9,120(r1)
    1e3c:	39 29 ff ff 	addi    r9,r9,-1
    1e40:	91 21 00 78 	stw     r9,120(r1)
    1e44:	48 00 00 50 	b       1e94 <number+0x138>
    1e48:	81 21 00 80 	lwz     r9,128(r1)
    1e4c:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    1e50:	2c 09 00 00 	cmpwi   r9,0
    1e54:	41 82 00 1c 	beq     1e70 <number+0x114>
    1e58:	39 20 00 2b 	li      r9,43
    1e5c:	99 21 00 08 	stb     r9,8(r1)
    1e60:	81 21 00 78 	lwz     r9,120(r1)
    1e64:	39 29 ff ff 	addi    r9,r9,-1
    1e68:	91 21 00 78 	stw     r9,120(r1)
    1e6c:	48 00 00 28 	b       1e94 <number+0x138>
    1e70:	81 21 00 80 	lwz     r9,128(r1)
    1e74:	55 29 07 38 	rlwinm  r9,r9,0,28,28
    1e78:	2c 09 00 00 	cmpwi   r9,0
    1e7c:	41 82 00 18 	beq     1e94 <number+0x138>
    1e80:	39 20 00 20 	li      r9,32
    1e84:	99 21 00 08 	stb     r9,8(r1)
    1e88:	81 21 00 78 	lwz     r9,120(r1)
    1e8c:	39 29 ff ff 	addi    r9,r9,-1
    1e90:	91 21 00 78 	stw     r9,120(r1)
    1e94:	81 21 00 80 	lwz     r9,128(r1)
    1e98:	55 29 06 b4 	rlwinm  r9,r9,0,26,26
    1e9c:	2c 09 00 00 	cmpwi   r9,0
    1ea0:	41 82 00 38 	beq     1ed8 <number+0x17c>
    1ea4:	81 21 00 74 	lwz     r9,116(r1)
    1ea8:	2c 09 00 10 	cmpwi   r9,16
    1eac:	40 82 00 14 	bne     1ec0 <number+0x164>
    1eb0:	81 21 00 78 	lwz     r9,120(r1)
    1eb4:	39 29 ff fe 	addi    r9,r9,-2
    1eb8:	91 21 00 78 	stw     r9,120(r1)
    1ebc:	48 00 00 1c 	b       1ed8 <number+0x17c>
    1ec0:	81 21 00 74 	lwz     r9,116(r1)
    1ec4:	2c 09 00 08 	cmpwi   r9,8
    1ec8:	40 82 00 10 	bne     1ed8 <number+0x17c>
    1ecc:	81 21 00 78 	lwz     r9,120(r1)
    1ed0:	39 29 ff ff 	addi    r9,r9,-1
    1ed4:	91 21 00 78 	stw     r9,120(r1)
    1ed8:	39 20 00 00 	li      r9,0
    1edc:	91 21 00 0c 	stw     r9,12(r1)
    1ee0:	81 21 00 70 	lwz     r9,112(r1)
    1ee4:	2c 09 00 00 	cmpwi   r9,0
    1ee8:	40 82 00 6c 	bne     1f54 <number+0x1f8>
    1eec:	81 21 00 0c 	lwz     r9,12(r1)
    1ef0:	39 49 00 01 	addi    r10,r9,1
    1ef4:	91 41 00 0c 	stw     r10,12(r1)
    1ef8:	39 41 00 08 	addi    r10,r1,8
    1efc:	7d 2a 4a 14 	add     r9,r10,r9
    1f00:	39 40 00 30 	li      r10,48
    1f04:	99 49 00 10 	stb     r10,16(r9)
    1f08:	48 00 00 58 	b       1f60 <number+0x204>
    1f0c:	81 41 00 74 	lwz     r10,116(r1)
    1f10:	81 21 00 70 	lwz     r9,112(r1)
    1f14:	7d 09 53 96 	divwu   r8,r9,r10
    1f18:	7d 48 51 d6 	mullw   r10,r8,r10
    1f1c:	7d 2a 48 50 	subf    r9,r10,r9
    1f20:	81 41 00 10 	lwz     r10,16(r1)
    1f24:	7d 4a 4a 14 	add     r10,r10,r9
    1f28:	81 21 00 0c 	lwz     r9,12(r1)
    1f2c:	39 09 00 01 	addi    r8,r9,1
    1f30:	91 01 00 0c 	stw     r8,12(r1)
    1f34:	89 4a 00 00 	lbz     r10,0(r10)
    1f38:	39 01 00 08 	addi    r8,r1,8
    1f3c:	7d 28 4a 14 	add     r9,r8,r9
    1f40:	99 49 00 10 	stb     r10,16(r9)
    1f44:	81 21 00 74 	lwz     r9,116(r1)
    1f48:	81 41 00 70 	lwz     r10,112(r1)
    1f4c:	7d 2a 4b 96 	divwu   r9,r10,r9
    1f50:	91 21 00 70 	stw     r9,112(r1)
    1f54:	81 21 00 70 	lwz     r9,112(r1)
    1f58:	2c 09 00 00 	cmpwi   r9,0
    1f5c:	40 82 ff b0 	bne     1f0c <number+0x1b0>
    1f60:	81 41 00 0c 	lwz     r10,12(r1)
    1f64:	81 21 00 7c 	lwz     r9,124(r1)
    1f68:	7c 0a 48 00 	cmpw    r10,r9
    1f6c:	40 81 00 0c 	ble     1f78 <number+0x21c>
    1f70:	81 21 00 0c 	lwz     r9,12(r1)
    1f74:	91 21 00 7c 	stw     r9,124(r1)
    1f78:	81 41 00 78 	lwz     r10,120(r1)
    1f7c:	81 21 00 7c 	lwz     r9,124(r1)
    1f80:	7d 29 50 50 	subf    r9,r9,r10
    1f84:	91 21 00 78 	stw     r9,120(r1)
    1f88:	81 21 00 80 	lwz     r9,128(r1)
    1f8c:	71 29 00 11 	andi.   r9,r9,17
    1f90:	2c 09 00 00 	cmpwi   r9,0
    1f94:	40 82 00 44 	bne     1fd8 <number+0x27c>
    1f98:	48 00 00 2c 	b       1fc4 <number+0x268>
    1f9c:	81 41 00 68 	lwz     r10,104(r1)
    1fa0:	81 21 00 6c 	lwz     r9,108(r1)
    1fa4:	7c 0a 48 40 	cmplw   r10,r9
    1fa8:	40 80 00 10 	bge     1fb8 <number+0x25c>
    1fac:	81 21 00 68 	lwz     r9,104(r1)
    1fb0:	39 40 00 20 	li      r10,32
    1fb4:	99 49 00 00 	stb     r10,0(r9)
    1fb8:	81 21 00 68 	lwz     r9,104(r1)
    1fbc:	39 29 00 01 	addi    r9,r9,1
    1fc0:	91 21 00 68 	stw     r9,104(r1)
    1fc4:	81 21 00 78 	lwz     r9,120(r1)
    1fc8:	39 49 ff ff 	addi    r10,r9,-1
    1fcc:	91 41 00 78 	stw     r10,120(r1)
    1fd0:	2c 09 00 00 	cmpwi   r9,0
    1fd4:	41 81 ff c8 	bgt     1f9c <number+0x240>
    1fd8:	89 21 00 08 	lbz     r9,8(r1)
    1fdc:	2c 09 00 00 	cmpwi   r9,0
    1fe0:	41 82 00 2c 	beq     200c <number+0x2b0>
    1fe4:	81 41 00 68 	lwz     r10,104(r1)
    1fe8:	81 21 00 6c 	lwz     r9,108(r1)
    1fec:	7c 0a 48 40 	cmplw   r10,r9
    1ff0:	40 80 00 10 	bge     2000 <number+0x2a4>
    1ff4:	81 21 00 68 	lwz     r9,104(r1)
    1ff8:	89 41 00 08 	lbz     r10,8(r1)
    1ffc:	99 49 00 00 	stb     r10,0(r9)
    2000:	81 21 00 68 	lwz     r9,104(r1)
    2004:	39 29 00 01 	addi    r9,r9,1
    2008:	91 21 00 68 	stw     r9,104(r1)
    200c:	81 21 00 80 	lwz     r9,128(r1)
    2010:	55 29 06 b4 	rlwinm  r9,r9,0,26,26
    2014:	2c 09 00 00 	cmpwi   r9,0
    2018:	41 82 00 9c 	beq     20b4 <number+0x358>
    201c:	81 21 00 74 	lwz     r9,116(r1)
    2020:	2c 09 00 08 	cmpwi   r9,8
    2024:	40 82 00 30 	bne     2054 <number+0x2f8>
    2028:	81 41 00 68 	lwz     r10,104(r1)
    202c:	81 21 00 6c 	lwz     r9,108(r1)
    2030:	7c 0a 48 40 	cmplw   r10,r9
    2034:	40 80 00 10 	bge     2044 <number+0x2e8>
    2038:	81 21 00 68 	lwz     r9,104(r1)
    203c:	39 40 00 30 	li      r10,48
    2040:	99 49 00 00 	stb     r10,0(r9)
    2044:	81 21 00 68 	lwz     r9,104(r1)
    2048:	39 29 00 01 	addi    r9,r9,1
    204c:	91 21 00 68 	stw     r9,104(r1)
    2050:	48 00 00 64 	b       20b4 <number+0x358>
    2054:	81 21 00 74 	lwz     r9,116(r1)
    2058:	2c 09 00 10 	cmpwi   r9,16
    205c:	40 82 00 58 	bne     20b4 <number+0x358>
    2060:	81 41 00 68 	lwz     r10,104(r1)
    2064:	81 21 00 6c 	lwz     r9,108(r1)
    2068:	7c 0a 48 40 	cmplw   r10,r9
    206c:	40 80 00 10 	bge     207c <number+0x320>
    2070:	81 21 00 68 	lwz     r9,104(r1)
    2074:	39 40 00 30 	li      r10,48
    2078:	99 49 00 00 	stb     r10,0(r9)
    207c:	81 21 00 68 	lwz     r9,104(r1)
    2080:	39 29 00 01 	addi    r9,r9,1
    2084:	91 21 00 68 	stw     r9,104(r1)
    2088:	81 41 00 68 	lwz     r10,104(r1)
    208c:	81 21 00 6c 	lwz     r9,108(r1)
    2090:	7c 0a 48 40 	cmplw   r10,r9
    2094:	40 80 00 14 	bge     20a8 <number+0x34c>
    2098:	81 21 00 10 	lwz     r9,16(r1)
    209c:	89 49 00 21 	lbz     r10,33(r9)
    20a0:	81 21 00 68 	lwz     r9,104(r1)
    20a4:	99 49 00 00 	stb     r10,0(r9)
    20a8:	81 21 00 68 	lwz     r9,104(r1)
    20ac:	39 29 00 01 	addi    r9,r9,1
    20b0:	91 21 00 68 	stw     r9,104(r1)
    20b4:	81 21 00 80 	lwz     r9,128(r1)
    20b8:	55 29 06 f6 	rlwinm  r9,r9,0,27,27
    20bc:	2c 09 00 00 	cmpwi   r9,0
    20c0:	40 82 00 70 	bne     2130 <number+0x3d4>
    20c4:	48 00 00 2c 	b       20f0 <number+0x394>
    20c8:	81 41 00 68 	lwz     r10,104(r1)
    20cc:	81 21 00 6c 	lwz     r9,108(r1)
    20d0:	7c 0a 48 40 	cmplw   r10,r9
    20d4:	40 80 00 10 	bge     20e4 <number+0x388>
    20d8:	81 21 00 68 	lwz     r9,104(r1)
    20dc:	89 41 00 14 	lbz     r10,20(r1)
    20e0:	99 49 00 00 	stb     r10,0(r9)
    20e4:	81 21 00 68 	lwz     r9,104(r1)
    20e8:	39 29 00 01 	addi    r9,r9,1
    20ec:	91 21 00 68 	stw     r9,104(r1)
    20f0:	81 21 00 78 	lwz     r9,120(r1)
    20f4:	39 49 ff ff 	addi    r10,r9,-1
    20f8:	91 41 00 78 	stw     r10,120(r1)
    20fc:	2c 09 00 00 	cmpwi   r9,0
    2100:	41 81 ff c8 	bgt     20c8 <number+0x36c>
    2104:	48 00 00 2c 	b       2130 <number+0x3d4>
    2108:	81 41 00 68 	lwz     r10,104(r1)
    210c:	81 21 00 6c 	lwz     r9,108(r1)
    2110:	7c 0a 48 40 	cmplw   r10,r9
    2114:	40 80 00 10 	bge     2124 <number+0x3c8>
    2118:	81 21 00 68 	lwz     r9,104(r1)
    211c:	39 40 00 30 	li      r10,48
    2120:	99 49 00 00 	stb     r10,0(r9)
    2124:	81 21 00 68 	lwz     r9,104(r1)
    2128:	39 29 00 01 	addi    r9,r9,1
    212c:	91 21 00 68 	stw     r9,104(r1)
    2130:	81 21 00 7c 	lwz     r9,124(r1)
    2134:	39 49 ff ff 	addi    r10,r9,-1
    2138:	91 41 00 7c 	stw     r10,124(r1)
    213c:	81 41 00 0c 	lwz     r10,12(r1)
    2140:	7c 0a 48 00 	cmpw    r10,r9
    2144:	41 80 ff c4 	blt     2108 <number+0x3ac>
    2148:	48 00 00 38 	b       2180 <number+0x424>
    214c:	81 41 00 68 	lwz     r10,104(r1)
    2150:	81 21 00 6c 	lwz     r9,108(r1)
    2154:	7c 0a 48 40 	cmplw   r10,r9
    2158:	40 80 00 1c 	bge     2174 <number+0x418>
    215c:	39 41 00 18 	addi    r10,r1,24
    2160:	81 21 00 0c 	lwz     r9,12(r1)
    2164:	7d 2a 4a 14 	add     r9,r10,r9
    2168:	89 49 00 00 	lbz     r10,0(r9)
    216c:	81 21 00 68 	lwz     r9,104(r1)
    2170:	99 49 00 00 	stb     r10,0(r9)
    2174:	81 21 00 68 	lwz     r9,104(r1)
    2178:	39 29 00 01 	addi    r9,r9,1
    217c:	91 21 00 68 	stw     r9,104(r1)
    2180:	81 21 00 0c 	lwz     r9,12(r1)
    2184:	39 49 ff ff 	addi    r10,r9,-1
    2188:	91 41 00 0c 	stw     r10,12(r1)
    218c:	2c 09 00 00 	cmpwi   r9,0
    2190:	41 81 ff bc 	bgt     214c <number+0x3f0>
    2194:	48 00 00 2c 	b       21c0 <number+0x464>
    2198:	81 41 00 68 	lwz     r10,104(r1)
    219c:	81 21 00 6c 	lwz     r9,108(r1)
    21a0:	7c 0a 48 40 	cmplw   r10,r9
    21a4:	40 80 00 10 	bge     21b4 <number+0x458>
    21a8:	81 21 00 68 	lwz     r9,104(r1)
    21ac:	39 40 00 20 	li      r10,32
    21b0:	99 49 00 00 	stb     r10,0(r9)
    21b4:	81 21 00 68 	lwz     r9,104(r1)
    21b8:	39 29 00 01 	addi    r9,r9,1
    21bc:	91 21 00 68 	stw     r9,104(r1)
    21c0:	81 21 00 78 	lwz     r9,120(r1)
    21c4:	39 49 ff ff 	addi    r10,r9,-1
    21c8:	91 41 00 78 	stw     r10,120(r1)
    21cc:	2c 09 00 00 	cmpwi   r9,0
    21d0:	41 81 ff c8 	bgt     2198 <number+0x43c>
    21d4:	81 21 00 68 	lwz     r9,104(r1)
    21d8:	7d 23 4b 78 	mr      r3,r9
    21dc:	38 21 00 90 	addi    r1,r1,144
    21e0:	4e 80 00 20 	blr

000021e4 <vscnprintf>:
    21e4:	94 21 ff d0 	stwu    r1,-48(r1)
    21e8:	7c 08 02 a6 	mflr    r0
    21ec:	90 01 00 34 	stw     r0,52(r1)
    21f0:	90 61 00 18 	stw     r3,24(r1)
    21f4:	90 81 00 1c 	stw     r4,28(r1)
    21f8:	90 a1 00 20 	stw     r5,32(r1)
    21fc:	90 c1 00 24 	stw     r6,36(r1)
    2200:	80 c1 00 24 	lwz     r6,36(r1)
    2204:	80 a1 00 20 	lwz     r5,32(r1)
    2208:	80 81 00 1c 	lwz     r4,28(r1)
    220c:	80 61 00 18 	lwz     r3,24(r1)
    2210:	48 00 04 4d 	bl      265c <vsnprintf>
    2214:	7c 69 1b 78 	mr      r9,r3
    2218:	91 21 00 08 	stw     r9,8(r1)
    221c:	81 41 00 08 	lwz     r10,8(r1)
    2220:	81 21 00 1c 	lwz     r9,28(r1)
    2224:	7c 0a 48 40 	cmplw   r10,r9
    2228:	41 80 00 10 	blt     2238 <vscnprintf+0x54>
    222c:	81 21 00 1c 	lwz     r9,28(r1)
    2230:	39 29 ff ff 	addi    r9,r9,-1
    2234:	48 00 00 08 	b       223c <vscnprintf+0x58>
    2238:	81 21 00 08 	lwz     r9,8(r1)
    223c:	7d 23 4b 78 	mr      r3,r9
    2240:	80 01 00 34 	lwz     r0,52(r1)
    2244:	7c 08 03 a6 	mtlr    r0
    2248:	38 21 00 30 	addi    r1,r1,48
    224c:	4e 80 00 20 	blr

00002250 <snprintf>:
    2250:	94 21 ff 80 	stwu    r1,-128(r1)
    2254:	7c 08 02 a6 	mflr    r0
    2258:	90 01 00 84 	stw     r0,132(r1)
    225c:	90 61 00 18 	stw     r3,24(r1)
    2260:	90 81 00 1c 	stw     r4,28(r1)
    2264:	90 a1 00 20 	stw     r5,32(r1)
    2268:	90 c1 00 2c 	stw     r6,44(r1)
    226c:	90 e1 00 30 	stw     r7,48(r1)
    2270:	91 01 00 34 	stw     r8,52(r1)
    2274:	91 21 00 38 	stw     r9,56(r1)
    2278:	91 41 00 3c 	stw     r10,60(r1)
    227c:	40 86 00 24 	bne     cr1,22a0 <snprintf+0x50>
    2280:	d8 21 00 40 	stfd    f1,64(r1)
    2284:	d8 41 00 48 	stfd    f2,72(r1)
    2288:	d8 61 00 50 	stfd    f3,80(r1)
    228c:	d8 81 00 58 	stfd    f4,88(r1)
    2290:	d8 a1 00 60 	stfd    f5,96(r1)
    2294:	d8 c1 00 68 	stfd    f6,104(r1)
    2298:	d8 e1 00 70 	stfd    f7,112(r1)
    229c:	d9 01 00 78 	stfd    f8,120(r1)
    22a0:	39 20 00 03 	li      r9,3
    22a4:	99 21 00 0c 	stb     r9,12(r1)
    22a8:	39 20 00 00 	li      r9,0
    22ac:	99 21 00 0d 	stb     r9,13(r1)
    22b0:	39 21 00 88 	addi    r9,r1,136
    22b4:	91 21 00 10 	stw     r9,16(r1)
    22b8:	39 21 00 20 	addi    r9,r1,32
    22bc:	91 21 00 14 	stw     r9,20(r1)
    22c0:	39 21 00 0c 	addi    r9,r1,12
    22c4:	7d 26 4b 78 	mr      r6,r9
    22c8:	80 a1 00 20 	lwz     r5,32(r1)
    22cc:	80 81 00 1c 	lwz     r4,28(r1)
    22d0:	80 61 00 18 	lwz     r3,24(r1)
    22d4:	48 00 03 89 	bl      265c <vsnprintf>
    22d8:	7c 69 1b 78 	mr      r9,r3
    22dc:	91 21 00 08 	stw     r9,8(r1)
    22e0:	81 21 00 08 	lwz     r9,8(r1)
    22e4:	7d 23 4b 78 	mr      r3,r9
    22e8:	80 01 00 84 	lwz     r0,132(r1)
    22ec:	7c 08 03 a6 	mtlr    r0
    22f0:	38 21 00 80 	addi    r1,r1,128
    22f4:	4e 80 00 20 	blr

000022f8 <scnprintf>:
    22f8:	94 21 ff 80 	stwu    r1,-128(r1)
    22fc:	7c 08 02 a6 	mflr    r0
    2300:	90 01 00 84 	stw     r0,132(r1)
    2304:	90 61 00 18 	stw     r3,24(r1)
    2308:	90 81 00 1c 	stw     r4,28(r1)
    230c:	90 a1 00 20 	stw     r5,32(r1)
    2310:	90 c1 00 2c 	stw     r6,44(r1)
    2314:	90 e1 00 30 	stw     r7,48(r1)
    2318:	91 01 00 34 	stw     r8,52(r1)
    231c:	91 21 00 38 	stw     r9,56(r1)
    2320:	91 41 00 3c 	stw     r10,60(r1)
    2324:	40 86 00 24 	bne     cr1,2348 <scnprintf+0x50>
    2328:	d8 21 00 40 	stfd    f1,64(r1)
    232c:	d8 41 00 48 	stfd    f2,72(r1)
    2330:	d8 61 00 50 	stfd    f3,80(r1)
    2334:	d8 81 00 58 	stfd    f4,88(r1)
    2338:	d8 a1 00 60 	stfd    f5,96(r1)
    233c:	d8 c1 00 68 	stfd    f6,104(r1)
    2340:	d8 e1 00 70 	stfd    f7,112(r1)
    2344:	d9 01 00 78 	stfd    f8,120(r1)
    2348:	39 20 00 03 	li      r9,3
    234c:	99 21 00 0c 	stb     r9,12(r1)
    2350:	39 20 00 00 	li      r9,0
    2354:	99 21 00 0d 	stb     r9,13(r1)
    2358:	39 21 00 88 	addi    r9,r1,136
    235c:	91 21 00 10 	stw     r9,16(r1)
    2360:	39 21 00 20 	addi    r9,r1,32
    2364:	91 21 00 14 	stw     r9,20(r1)
    2368:	39 21 00 0c 	addi    r9,r1,12
    236c:	7d 26 4b 78 	mr      r6,r9
    2370:	80 a1 00 20 	lwz     r5,32(r1)
    2374:	80 81 00 1c 	lwz     r4,28(r1)
    2378:	80 61 00 18 	lwz     r3,24(r1)
    237c:	48 00 02 e1 	bl      265c <vsnprintf>
    2380:	7c 69 1b 78 	mr      r9,r3
    2384:	91 21 00 08 	stw     r9,8(r1)
    2388:	81 41 00 08 	lwz     r10,8(r1)
    238c:	81 21 00 1c 	lwz     r9,28(r1)
    2390:	7c 0a 48 40 	cmplw   r10,r9
    2394:	41 80 00 10 	blt     23a4 <scnprintf+0xac>
    2398:	81 21 00 1c 	lwz     r9,28(r1)
    239c:	39 29 ff ff 	addi    r9,r9,-1
    23a0:	48 00 00 08 	b       23a8 <scnprintf+0xb0>
    23a4:	81 21 00 08 	lwz     r9,8(r1)
    23a8:	7d 23 4b 78 	mr      r3,r9
    23ac:	80 01 00 84 	lwz     r0,132(r1)
    23b0:	7c 08 03 a6 	mtlr    r0
    23b4:	38 21 00 80 	addi    r1,r1,128
    23b8:	4e 80 00 20 	blr

000023bc <vsprintf>:
    23bc:	94 21 ff e0 	stwu    r1,-32(r1)
    23c0:	7c 08 02 a6 	mflr    r0
    23c4:	90 01 00 24 	stw     r0,36(r1)
    23c8:	90 61 00 08 	stw     r3,8(r1)
    23cc:	90 81 00 0c 	stw     r4,12(r1)
    23d0:	90 a1 00 10 	stw     r5,16(r1)
    23d4:	80 c1 00 10 	lwz     r6,16(r1)
    23d8:	80 a1 00 0c 	lwz     r5,12(r1)
    23dc:	3d 20 7f ff 	lis     r9,32767
    23e0:	61 24 ff ff 	ori     r4,r9,65535
    23e4:	80 61 00 08 	lwz     r3,8(r1)
    23e8:	48 00 02 75 	bl      265c <vsnprintf>
    23ec:	7c 69 1b 78 	mr      r9,r3
    23f0:	7d 23 4b 78 	mr      r3,r9
    23f4:	80 01 00 24 	lwz     r0,36(r1)
    23f8:	7c 08 03 a6 	mtlr    r0
    23fc:	38 21 00 20 	addi    r1,r1,32
    2400:	4e 80 00 20 	blr

00002404 <sprintf>:
    2404:	94 21 ff 80 	stwu    r1,-128(r1)
    2408:	7c 08 02 a6 	mflr    r0
    240c:	90 01 00 84 	stw     r0,132(r1)
    2410:	90 61 00 18 	stw     r3,24(r1)
    2414:	90 81 00 1c 	stw     r4,28(r1)
    2418:	90 a1 00 20 	stw     r5,32(r1)
    241c:	90 c1 00 24 	stw     r6,36(r1)
    2420:	90 e1 00 28 	stw     r7,40(r1)
    2424:	91 01 00 2c 	stw     r8,44(r1)
    2428:	91 21 00 30 	stw     r9,48(r1)
    242c:	91 41 00 34 	stw     r10,52(r1)
    2430:	40 86 00 24 	bne     cr1,2454 <sprintf+0x50>
    2434:	d8 21 00 38 	stfd    f1,56(r1)
    2438:	d8 41 00 40 	stfd    f2,64(r1)
    243c:	d8 61 00 48 	stfd    f3,72(r1)
    2440:	d8 81 00 50 	stfd    f4,80(r1)
    2444:	d8 a1 00 58 	stfd    f5,88(r1)
    2448:	d8 c1 00 60 	stfd    f6,96(r1)
    244c:	d8 e1 00 68 	stfd    f7,104(r1)
    2450:	d9 01 00 70 	stfd    f8,112(r1)
    2454:	39 20 00 02 	li      r9,2
    2458:	99 21 00 0c 	stb     r9,12(r1)
    245c:	39 20 00 00 	li      r9,0
    2460:	99 21 00 0d 	stb     r9,13(r1)
    2464:	39 21 00 88 	addi    r9,r1,136
    2468:	91 21 00 10 	stw     r9,16(r1)
    246c:	39 21 00 18 	addi    r9,r1,24
    2470:	91 21 00 14 	stw     r9,20(r1)
    2474:	39 21 00 0c 	addi    r9,r1,12
    2478:	7d 26 4b 78 	mr      r6,r9
    247c:	80 a1 00 1c 	lwz     r5,28(r1)
    2480:	3d 20 7f ff 	lis     r9,32767
    2484:	61 24 ff ff 	ori     r4,r9,65535
    2488:	80 61 00 18 	lwz     r3,24(r1)
    248c:	48 00 01 d1 	bl      265c <vsnprintf>
    2490:	7c 69 1b 78 	mr      r9,r3
    2494:	91 21 00 08 	stw     r9,8(r1)
    2498:	81 21 00 08 	lwz     r9,8(r1)
    249c:	7d 23 4b 78 	mr      r3,r9
    24a0:	80 01 00 84 	lwz     r0,132(r1)
    24a4:	7c 08 03 a6 	mtlr    r0
    24a8:	38 21 00 80 	addi    r1,r1,128
    24ac:	4e 80 00 20 	blr

000024b0 <rand>:
    24b0:	3d 20 00 01 	lis     r9,1
    24b4:	81 29 24 88 	lwz     r9,9352(r9)
    24b8:	1d 29 00 81 	mulli   r9,r9,129
    24bc:	3d 29 36 19 	addis   r9,r9,13849
    24c0:	39 49 62 e9 	addi    r10,r9,25321
    24c4:	3d 20 00 01 	lis     r9,1
    24c8:	91 49 24 88 	stw     r10,9352(r9)
    24cc:	3d 20 00 01 	lis     r9,1
    24d0:	81 29 24 88 	lwz     r9,9352(r9)
    24d4:	7d 23 4b 78 	mr      r3,r9
    24d8:	4e 80 00 20 	blr

000024dc <srand>:
    24dc:	94 21 ff f0 	stwu    r1,-16(r1)
    24e0:	90 61 00 08 	stw     r3,8(r1)
    24e4:	3d 20 00 01 	lis     r9,1
    24e8:	81 41 00 08 	lwz     r10,8(r1)
    24ec:	91 49 24 88 	stw     r10,9352(r9)
    24f0:	60 00 00 00 	nop
    24f4:	38 21 00 10 	addi    r1,r1,16
    24f8:	4e 80 00 20 	blr

000024fc <abort>:
    24fc:	94 21 ff f0 	stwu    r1,-16(r1)
    2500:	7c 08 02 a6 	mflr    r0
    2504:	90 01 00 14 	stw     r0,20(r1)
    2508:	3d 20 00 00 	lis     r9,0
    250c:	38 69 0a 04 	addi    r3,r9,2564
    2510:	4c c6 31 82 	crclr   4*cr1+eq
    2514:	48 00 11 1d 	bl      3630 <printf>
    2518:	48 00 00 00 	b       2518 <abort+0x1c>

0000251c <htonl>:
    251c:	94 21 ff e0 	stwu    r1,-32(r1)
    2520:	7c 08 02 a6 	mflr    r0
    2524:	90 01 00 24 	stw     r0,36(r1)
    2528:	90 61 00 18 	stw     r3,24(r1)
    252c:	39 20 00 01 	li      r9,1
    2530:	91 21 00 08 	stw     r9,8(r1)
    2534:	89 21 00 08 	lbz     r9,8(r1)
    2538:	2c 09 00 00 	cmpwi   r9,0
    253c:	41 82 00 14 	beq     2550 <htonl+0x34>
    2540:	80 61 00 18 	lwz     r3,24(r1)
    2544:	4b ff eb 75 	bl      10b8 <__bswap_32>
    2548:	7c 69 1b 78 	mr      r9,r3
    254c:	48 00 00 08 	b       2554 <htonl+0x38>
    2550:	81 21 00 18 	lwz     r9,24(r1)
    2554:	7d 23 4b 78 	mr      r3,r9
    2558:	80 01 00 24 	lwz     r0,36(r1)
    255c:	7c 08 03 a6 	mtlr    r0
    2560:	38 21 00 20 	addi    r1,r1,32
    2564:	4e 80 00 20 	blr

00002568 <htons>:
    2568:	94 21 ff e0 	stwu    r1,-32(r1)
    256c:	7c 08 02 a6 	mflr    r0
    2570:	90 01 00 24 	stw     r0,36(r1)
    2574:	7c 69 1b 78 	mr      r9,r3
    2578:	b1 21 00 18 	sth     r9,24(r1)
    257c:	39 20 00 01 	li      r9,1
    2580:	91 21 00 08 	stw     r9,8(r1)
    2584:	89 21 00 08 	lbz     r9,8(r1)
    2588:	2c 09 00 00 	cmpwi   r9,0
    258c:	41 82 00 18 	beq     25a4 <htons+0x3c>
    2590:	a1 21 00 18 	lhz     r9,24(r1)
    2594:	7d 23 4b 78 	mr      r3,r9
    2598:	4b ff ea e1 	bl      1078 <__bswap_16>
    259c:	7c 69 1b 78 	mr      r9,r3
    25a0:	48 00 00 08 	b       25a8 <htons+0x40>
    25a4:	a1 21 00 18 	lhz     r9,24(r1)
    25a8:	7d 23 4b 78 	mr      r3,r9
    25ac:	80 01 00 24 	lwz     r0,36(r1)
    25b0:	7c 08 03 a6 	mtlr    r0
    25b4:	38 21 00 20 	addi    r1,r1,32
    25b8:	4e 80 00 20 	blr

000025bc <ntohl>:
    25bc:	94 21 ff e0 	stwu    r1,-32(r1)
    25c0:	7c 08 02 a6 	mflr    r0
    25c4:	90 01 00 24 	stw     r0,36(r1)
    25c8:	90 61 00 18 	stw     r3,24(r1)
    25cc:	39 20 00 01 	li      r9,1
    25d0:	91 21 00 08 	stw     r9,8(r1)
    25d4:	89 21 00 08 	lbz     r9,8(r1)
    25d8:	2c 09 00 00 	cmpwi   r9,0
    25dc:	41 82 00 14 	beq     25f0 <ntohl+0x34>
    25e0:	80 61 00 18 	lwz     r3,24(r1)
    25e4:	4b ff ea d5 	bl      10b8 <__bswap_32>
    25e8:	7c 69 1b 78 	mr      r9,r3
    25ec:	48 00 00 08 	b       25f4 <ntohl+0x38>
    25f0:	81 21 00 18 	lwz     r9,24(r1)
    25f4:	7d 23 4b 78 	mr      r3,r9
    25f8:	80 01 00 24 	lwz     r0,36(r1)
    25fc:	7c 08 03 a6 	mtlr    r0
    2600:	38 21 00 20 	addi    r1,r1,32
    2604:	4e 80 00 20 	blr

00002608 <ntohs>:
    2608:	94 21 ff e0 	stwu    r1,-32(r1)
    260c:	7c 08 02 a6 	mflr    r0
    2610:	90 01 00 24 	stw     r0,36(r1)
    2614:	7c 69 1b 78 	mr      r9,r3
    2618:	b1 21 00 18 	sth     r9,24(r1)
    261c:	39 20 00 01 	li      r9,1
    2620:	91 21 00 08 	stw     r9,8(r1)
    2624:	89 21 00 08 	lbz     r9,8(r1)
    2628:	2c 09 00 00 	cmpwi   r9,0
    262c:	41 82 00 18 	beq     2644 <ntohs+0x3c>
    2630:	a1 21 00 18 	lhz     r9,24(r1)
    2634:	7d 23 4b 78 	mr      r3,r9
    2638:	4b ff ea 41 	bl      1078 <__bswap_16>
    263c:	7c 69 1b 78 	mr      r9,r3
    2640:	48 00 00 08 	b       2648 <ntohs+0x40>
    2644:	a1 21 00 18 	lhz     r9,24(r1)
    2648:	7d 23 4b 78 	mr      r3,r9
    264c:	80 01 00 24 	lwz     r0,36(r1)
    2650:	7c 08 03 a6 	mtlr    r0
    2654:	38 21 00 20 	addi    r1,r1,32
    2658:	4e 80 00 20 	blr

0000265c <vsnprintf>:
    265c:	94 21 ff a0 	stwu    r1,-96(r1)
    2660:	7c 08 02 a6 	mflr    r0
    2664:	90 01 00 64 	stw     r0,100(r1)
    2668:	90 61 00 48 	stw     r3,72(r1)
    266c:	90 81 00 4c 	stw     r4,76(r1)
    2670:	90 a1 00 50 	stw     r5,80(r1)
    2674:	90 c1 00 54 	stw     r6,84(r1)
    2678:	81 21 00 4c 	lwz     r9,76(r1)
    267c:	2c 09 00 00 	cmpwi   r9,0
    2680:	40 80 00 0c 	bge     268c <vsnprintf+0x30>
    2684:	39 20 00 00 	li      r9,0
    2688:	48 00 0d 3c 	b       33c4 <vsnprintf+0xd68>
    268c:	81 21 00 48 	lwz     r9,72(r1)
    2690:	91 21 00 18 	stw     r9,24(r1)
    2694:	81 41 00 48 	lwz     r10,72(r1)
    2698:	81 21 00 4c 	lwz     r9,76(r1)
    269c:	7d 2a 4a 14 	add     r9,r10,r9
    26a0:	91 21 00 1c 	stw     r9,28(r1)
    26a4:	81 41 00 1c 	lwz     r10,28(r1)
    26a8:	81 21 00 48 	lwz     r9,72(r1)
    26ac:	7c 0a 48 40 	cmplw   r10,r9
    26b0:	40 80 0c bc 	bge     336c <vsnprintf+0xd10>
    26b4:	39 20 ff ff 	li      r9,-1
    26b8:	91 21 00 1c 	stw     r9,28(r1)
    26bc:	81 41 00 1c 	lwz     r10,28(r1)
    26c0:	81 21 00 48 	lwz     r9,72(r1)
    26c4:	7d 29 50 50 	subf    r9,r9,r10
    26c8:	91 21 00 4c 	stw     r9,76(r1)
    26cc:	48 00 0c a0 	b       336c <vsnprintf+0xd10>
    26d0:	81 21 00 50 	lwz     r9,80(r1)
    26d4:	89 29 00 00 	lbz     r9,0(r9)
    26d8:	28 09 00 25 	cmplwi  r9,37
    26dc:	41 82 00 34 	beq     2710 <vsnprintf+0xb4>
    26e0:	81 41 00 18 	lwz     r10,24(r1)
    26e4:	81 21 00 1c 	lwz     r9,28(r1)
    26e8:	7c 0a 48 40 	cmplw   r10,r9
    26ec:	40 80 00 14 	bge     2700 <vsnprintf+0xa4>
    26f0:	81 21 00 50 	lwz     r9,80(r1)
    26f4:	89 49 00 00 	lbz     r10,0(r9)
    26f8:	81 21 00 18 	lwz     r9,24(r1)
    26fc:	99 49 00 00 	stb     r10,0(r9)
    2700:	81 21 00 18 	lwz     r9,24(r1)
    2704:	39 29 00 01 	addi    r9,r9,1
    2708:	91 21 00 18 	stw     r9,24(r1)
    270c:	48 00 0c 54 	b       3360 <vsnprintf+0xd04>
    2710:	39 20 00 00 	li      r9,0
    2714:	91 21 00 24 	stw     r9,36(r1)
    2718:	81 21 00 50 	lwz     r9,80(r1)
    271c:	39 29 00 01 	addi    r9,r9,1
    2720:	91 21 00 50 	stw     r9,80(r1)
    2724:	81 21 00 50 	lwz     r9,80(r1)
    2728:	89 29 00 00 	lbz     r9,0(r9)
    272c:	39 29 ff e0 	addi    r9,r9,-32
    2730:	28 09 00 10 	cmplwi  r9,16
    2734:	41 81 00 7c 	bgt     27b0 <vsnprintf+0x154>
    2738:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
    273c:	3d 20 00 00 	lis     r9,0
    2740:	39 29 0a 68 	addi    r9,r9,2664
    2744:	7d 2a 4a 14 	add     r9,r10,r9
    2748:	81 49 00 00 	lwz     r10,0(r9)
    274c:	3d 20 00 00 	lis     r9,0
    2750:	39 29 0a 68 	addi    r9,r9,2664
    2754:	7d 2a 4a 14 	add     r9,r10,r9
    2758:	7d 29 03 a6 	mtctr   r9
    275c:	4e 80 04 20 	bctr
    2760:	81 21 00 24 	lwz     r9,36(r1)
    2764:	61 29 00 10 	ori     r9,r9,16
    2768:	91 21 00 24 	stw     r9,36(r1)
    276c:	4b ff ff ac 	b       2718 <vsnprintf+0xbc>
    2770:	81 21 00 24 	lwz     r9,36(r1)
    2774:	61 29 00 04 	ori     r9,r9,4
    2778:	91 21 00 24 	stw     r9,36(r1)
    277c:	4b ff ff 9c 	b       2718 <vsnprintf+0xbc>
    2780:	81 21 00 24 	lwz     r9,36(r1)
    2784:	61 29 00 08 	ori     r9,r9,8
    2788:	91 21 00 24 	stw     r9,36(r1)
    278c:	4b ff ff 8c 	b       2718 <vsnprintf+0xbc>
    2790:	81 21 00 24 	lwz     r9,36(r1)
    2794:	61 29 00 20 	ori     r9,r9,32
    2798:	91 21 00 24 	stw     r9,36(r1)
    279c:	4b ff ff 7c 	b       2718 <vsnprintf+0xbc>
    27a0:	81 21 00 24 	lwz     r9,36(r1)
    27a4:	61 29 00 01 	ori     r9,r9,1
    27a8:	91 21 00 24 	stw     r9,36(r1)
    27ac:	4b ff ff 6c 	b       2718 <vsnprintf+0xbc>
    27b0:	39 20 ff ff 	li      r9,-1
    27b4:	91 21 00 28 	stw     r9,40(r1)
    27b8:	81 21 00 50 	lwz     r9,80(r1)
    27bc:	89 29 00 00 	lbz     r9,0(r9)
    27c0:	7d 2a 4b 78 	mr      r10,r9
    27c4:	3d 20 00 00 	lis     r9,0
    27c8:	39 29 09 04 	addi    r9,r9,2308
    27cc:	7d 29 50 ae 	lbzx    r9,r9,r10
    27d0:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    27d4:	2c 09 00 00 	cmpwi   r9,0
    27d8:	41 82 00 1c 	beq     27f4 <vsnprintf+0x198>
    27dc:	39 21 00 50 	addi    r9,r1,80
    27e0:	7d 23 4b 78 	mr      r3,r9
    27e4:	4b ff f5 01 	bl      1ce4 <skip_atoi>
    27e8:	7c 69 1b 78 	mr      r9,r3
    27ec:	91 21 00 28 	stw     r9,40(r1)
    27f0:	48 00 00 9c 	b       288c <vsnprintf+0x230>
    27f4:	81 21 00 50 	lwz     r9,80(r1)
    27f8:	89 29 00 00 	lbz     r9,0(r9)
    27fc:	28 09 00 2a 	cmplwi  r9,42
    2800:	40 82 00 8c 	bne     288c <vsnprintf+0x230>
    2804:	81 21 00 50 	lwz     r9,80(r1)
    2808:	39 29 00 01 	addi    r9,r9,1
    280c:	91 21 00 50 	stw     r9,80(r1)
    2810:	81 21 00 54 	lwz     r9,84(r1)
    2814:	89 29 00 00 	lbz     r9,0(r9)
    2818:	28 09 00 07 	cmplwi  r9,7
    281c:	41 81 00 30 	bgt     284c <vsnprintf+0x1f0>
    2820:	81 21 00 54 	lwz     r9,84(r1)
    2824:	81 49 00 08 	lwz     r10,8(r9)
    2828:	81 21 00 54 	lwz     r9,84(r1)
    282c:	89 29 00 00 	lbz     r9,0(r9)
    2830:	39 09 00 01 	addi    r8,r9,1
    2834:	55 07 06 3e 	clrlwi  r7,r8,24
    2838:	81 01 00 54 	lwz     r8,84(r1)
    283c:	98 e8 00 00 	stb     r7,0(r8)
    2840:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    2844:	7d 2a 4a 14 	add     r9,r10,r9
    2848:	48 00 00 18 	b       2860 <vsnprintf+0x204>
    284c:	81 21 00 54 	lwz     r9,84(r1)
    2850:	81 29 00 04 	lwz     r9,4(r9)
    2854:	39 09 00 04 	addi    r8,r9,4
    2858:	81 41 00 54 	lwz     r10,84(r1)
    285c:	91 0a 00 04 	stw     r8,4(r10)
    2860:	81 29 00 00 	lwz     r9,0(r9)
    2864:	91 21 00 28 	stw     r9,40(r1)
    2868:	81 21 00 28 	lwz     r9,40(r1)
    286c:	2c 09 00 00 	cmpwi   r9,0
    2870:	40 80 00 1c 	bge     288c <vsnprintf+0x230>
    2874:	81 21 00 28 	lwz     r9,40(r1)
    2878:	7d 29 00 d0 	neg     r9,r9
    287c:	91 21 00 28 	stw     r9,40(r1)
    2880:	81 21 00 24 	lwz     r9,36(r1)
    2884:	61 29 00 10 	ori     r9,r9,16
    2888:	91 21 00 24 	stw     r9,36(r1)
    288c:	39 20 ff ff 	li      r9,-1
    2890:	91 21 00 2c 	stw     r9,44(r1)
    2894:	81 21 00 50 	lwz     r9,80(r1)
    2898:	89 29 00 00 	lbz     r9,0(r9)
    289c:	28 09 00 2e 	cmplwi  r9,46
    28a0:	40 82 00 d4 	bne     2974 <vsnprintf+0x318>
    28a4:	81 21 00 50 	lwz     r9,80(r1)
    28a8:	39 29 00 01 	addi    r9,r9,1
    28ac:	91 21 00 50 	stw     r9,80(r1)
    28b0:	81 21 00 50 	lwz     r9,80(r1)
    28b4:	89 29 00 00 	lbz     r9,0(r9)
    28b8:	7d 2a 4b 78 	mr      r10,r9
    28bc:	3d 20 00 00 	lis     r9,0
    28c0:	39 29 09 04 	addi    r9,r9,2308
    28c4:	7d 29 50 ae 	lbzx    r9,r9,r10
    28c8:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    28cc:	2c 09 00 00 	cmpwi   r9,0
    28d0:	41 82 00 1c 	beq     28ec <vsnprintf+0x290>
    28d4:	39 21 00 50 	addi    r9,r1,80
    28d8:	7d 23 4b 78 	mr      r3,r9
    28dc:	4b ff f4 09 	bl      1ce4 <skip_atoi>
    28e0:	7c 69 1b 78 	mr      r9,r3
    28e4:	91 21 00 2c 	stw     r9,44(r1)
    28e8:	48 00 00 78 	b       2960 <vsnprintf+0x304>
    28ec:	81 21 00 50 	lwz     r9,80(r1)
    28f0:	89 29 00 00 	lbz     r9,0(r9)
    28f4:	28 09 00 2a 	cmplwi  r9,42
    28f8:	40 82 00 68 	bne     2960 <vsnprintf+0x304>
    28fc:	81 21 00 50 	lwz     r9,80(r1)
    2900:	39 29 00 01 	addi    r9,r9,1
    2904:	91 21 00 50 	stw     r9,80(r1)
    2908:	81 21 00 54 	lwz     r9,84(r1)
    290c:	89 29 00 00 	lbz     r9,0(r9)
    2910:	28 09 00 07 	cmplwi  r9,7
    2914:	41 81 00 30 	bgt     2944 <vsnprintf+0x2e8>
    2918:	81 21 00 54 	lwz     r9,84(r1)
    291c:	81 49 00 08 	lwz     r10,8(r9)
    2920:	81 21 00 54 	lwz     r9,84(r1)
    2924:	89 29 00 00 	lbz     r9,0(r9)
    2928:	39 09 00 01 	addi    r8,r9,1
    292c:	55 07 06 3e 	clrlwi  r7,r8,24
    2930:	81 01 00 54 	lwz     r8,84(r1)
    2934:	98 e8 00 00 	stb     r7,0(r8)
    2938:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    293c:	7d 2a 4a 14 	add     r9,r10,r9
    2940:	48 00 00 18 	b       2958 <vsnprintf+0x2fc>
    2944:	81 21 00 54 	lwz     r9,84(r1)
    2948:	81 29 00 04 	lwz     r9,4(r9)
    294c:	39 09 00 04 	addi    r8,r9,4
    2950:	81 41 00 54 	lwz     r10,84(r1)
    2954:	91 0a 00 04 	stw     r8,4(r10)
    2958:	81 29 00 00 	lwz     r9,0(r9)
    295c:	91 21 00 2c 	stw     r9,44(r1)
    2960:	81 21 00 2c 	lwz     r9,44(r1)
    2964:	2c 09 00 00 	cmpwi   r9,0
    2968:	40 80 00 0c 	bge     2974 <vsnprintf+0x318>
    296c:	39 20 00 00 	li      r9,0
    2970:	91 21 00 2c 	stw     r9,44(r1)
    2974:	39 20 ff ff 	li      r9,-1
    2978:	91 21 00 30 	stw     r9,48(r1)
    297c:	81 21 00 50 	lwz     r9,80(r1)
    2980:	89 29 00 00 	lbz     r9,0(r9)
    2984:	28 09 00 68 	cmplwi  r9,104
    2988:	41 82 00 54 	beq     29dc <vsnprintf+0x380>
    298c:	81 21 00 50 	lwz     r9,80(r1)
    2990:	89 29 00 00 	lbz     r9,0(r9)
    2994:	28 09 00 6c 	cmplwi  r9,108
    2998:	41 82 00 44 	beq     29dc <vsnprintf+0x380>
    299c:	81 21 00 50 	lwz     r9,80(r1)
    29a0:	89 29 00 00 	lbz     r9,0(r9)
    29a4:	28 09 00 4c 	cmplwi  r9,76
    29a8:	41 82 00 34 	beq     29dc <vsnprintf+0x380>
    29ac:	81 21 00 50 	lwz     r9,80(r1)
    29b0:	89 29 00 00 	lbz     r9,0(r9)
    29b4:	28 09 00 5a 	cmplwi  r9,90
    29b8:	41 82 00 24 	beq     29dc <vsnprintf+0x380>
    29bc:	81 21 00 50 	lwz     r9,80(r1)
    29c0:	89 29 00 00 	lbz     r9,0(r9)
    29c4:	28 09 00 7a 	cmplwi  r9,122
    29c8:	41 82 00 14 	beq     29dc <vsnprintf+0x380>
    29cc:	81 21 00 50 	lwz     r9,80(r1)
    29d0:	89 29 00 00 	lbz     r9,0(r9)
    29d4:	28 09 00 74 	cmplwi  r9,116
    29d8:	40 82 00 4c 	bne     2a24 <vsnprintf+0x3c8>
    29dc:	81 21 00 50 	lwz     r9,80(r1)
    29e0:	89 29 00 00 	lbz     r9,0(r9)
    29e4:	91 21 00 30 	stw     r9,48(r1)
    29e8:	81 21 00 50 	lwz     r9,80(r1)
    29ec:	39 29 00 01 	addi    r9,r9,1
    29f0:	91 21 00 50 	stw     r9,80(r1)
    29f4:	81 21 00 30 	lwz     r9,48(r1)
    29f8:	2c 09 00 6c 	cmpwi   r9,108
    29fc:	40 82 00 28 	bne     2a24 <vsnprintf+0x3c8>
    2a00:	81 21 00 50 	lwz     r9,80(r1)
    2a04:	89 29 00 00 	lbz     r9,0(r9)
    2a08:	28 09 00 6c 	cmplwi  r9,108
    2a0c:	40 82 00 18 	bne     2a24 <vsnprintf+0x3c8>
    2a10:	39 20 00 4c 	li      r9,76
    2a14:	91 21 00 30 	stw     r9,48(r1)
    2a18:	81 21 00 50 	lwz     r9,80(r1)
    2a1c:	39 29 00 01 	addi    r9,r9,1
    2a20:	91 21 00 50 	stw     r9,80(r1)
    2a24:	39 20 00 0a 	li      r9,10
    2a28:	91 21 00 14 	stw     r9,20(r1)
    2a2c:	81 21 00 50 	lwz     r9,80(r1)
    2a30:	89 29 00 00 	lbz     r9,0(r9)
    2a34:	39 29 ff db 	addi    r9,r9,-37
    2a38:	28 09 00 53 	cmplwi  r9,83
    2a3c:	41 81 05 50 	bgt     2f8c <vsnprintf+0x930>
    2a40:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
    2a44:	3d 20 00 00 	lis     r9,0
    2a48:	39 29 0a ac 	addi    r9,r9,2732
    2a4c:	7d 2a 4a 14 	add     r9,r10,r9
    2a50:	81 49 00 00 	lwz     r10,0(r9)
    2a54:	3d 20 00 00 	lis     r9,0
    2a58:	39 29 0a ac 	addi    r9,r9,2732
    2a5c:	7d 2a 4a 14 	add     r9,r10,r9
    2a60:	7d 29 03 a6 	mtctr   r9
    2a64:	4e 80 04 20 	bctr
    2a68:	81 21 00 24 	lwz     r9,36(r1)
    2a6c:	55 29 06 f6 	rlwinm  r9,r9,0,27,27
    2a70:	2c 09 00 00 	cmpwi   r9,0
    2a74:	40 82 00 48 	bne     2abc <vsnprintf+0x460>
    2a78:	48 00 00 2c 	b       2aa4 <vsnprintf+0x448>
    2a7c:	81 41 00 18 	lwz     r10,24(r1)
    2a80:	81 21 00 1c 	lwz     r9,28(r1)
    2a84:	7c 0a 48 40 	cmplw   r10,r9
    2a88:	40 80 00 10 	bge     2a98 <vsnprintf+0x43c>
    2a8c:	81 21 00 18 	lwz     r9,24(r1)
    2a90:	39 40 00 20 	li      r10,32
    2a94:	99 49 00 00 	stb     r10,0(r9)
    2a98:	81 21 00 18 	lwz     r9,24(r1)
    2a9c:	39 29 00 01 	addi    r9,r9,1
    2aa0:	91 21 00 18 	stw     r9,24(r1)
    2aa4:	81 21 00 28 	lwz     r9,40(r1)
    2aa8:	39 29 ff ff 	addi    r9,r9,-1
    2aac:	91 21 00 28 	stw     r9,40(r1)
    2ab0:	81 21 00 28 	lwz     r9,40(r1)
    2ab4:	2c 09 00 00 	cmpwi   r9,0
    2ab8:	41 81 ff c4 	bgt     2a7c <vsnprintf+0x420>
    2abc:	81 21 00 54 	lwz     r9,84(r1)
    2ac0:	89 29 00 00 	lbz     r9,0(r9)
    2ac4:	28 09 00 07 	cmplwi  r9,7
    2ac8:	41 81 00 30 	bgt     2af8 <vsnprintf+0x49c>
    2acc:	81 21 00 54 	lwz     r9,84(r1)
    2ad0:	81 49 00 08 	lwz     r10,8(r9)
    2ad4:	81 21 00 54 	lwz     r9,84(r1)
    2ad8:	89 29 00 00 	lbz     r9,0(r9)
    2adc:	39 09 00 01 	addi    r8,r9,1
    2ae0:	55 07 06 3e 	clrlwi  r7,r8,24
    2ae4:	81 01 00 54 	lwz     r8,84(r1)
    2ae8:	98 e8 00 00 	stb     r7,0(r8)
    2aec:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    2af0:	7d 2a 4a 14 	add     r9,r10,r9
    2af4:	48 00 00 18 	b       2b0c <vsnprintf+0x4b0>
    2af8:	81 21 00 54 	lwz     r9,84(r1)
    2afc:	81 29 00 04 	lwz     r9,4(r9)
    2b00:	39 09 00 04 	addi    r8,r9,4
    2b04:	81 41 00 54 	lwz     r10,84(r1)
    2b08:	91 0a 00 04 	stw     r8,4(r10)
    2b0c:	81 29 00 00 	lwz     r9,0(r9)
    2b10:	99 21 00 44 	stb     r9,68(r1)
    2b14:	81 41 00 18 	lwz     r10,24(r1)
    2b18:	81 21 00 1c 	lwz     r9,28(r1)
    2b1c:	7c 0a 48 40 	cmplw   r10,r9
    2b20:	40 80 00 10 	bge     2b30 <vsnprintf+0x4d4>
    2b24:	81 21 00 18 	lwz     r9,24(r1)
    2b28:	89 41 00 44 	lbz     r10,68(r1)
    2b2c:	99 49 00 00 	stb     r10,0(r9)
    2b30:	81 21 00 18 	lwz     r9,24(r1)
    2b34:	39 29 00 01 	addi    r9,r9,1
    2b38:	91 21 00 18 	stw     r9,24(r1)
    2b3c:	48 00 00 2c 	b       2b68 <vsnprintf+0x50c>
    2b40:	81 41 00 18 	lwz     r10,24(r1)
    2b44:	81 21 00 1c 	lwz     r9,28(r1)
    2b48:	7c 0a 48 40 	cmplw   r10,r9
    2b4c:	40 80 00 10 	bge     2b5c <vsnprintf+0x500>
    2b50:	81 21 00 18 	lwz     r9,24(r1)
    2b54:	39 40 00 20 	li      r10,32
    2b58:	99 49 00 00 	stb     r10,0(r9)
    2b5c:	81 21 00 18 	lwz     r9,24(r1)
    2b60:	39 29 00 01 	addi    r9,r9,1
    2b64:	91 21 00 18 	stw     r9,24(r1)
    2b68:	81 21 00 28 	lwz     r9,40(r1)
    2b6c:	39 29 ff ff 	addi    r9,r9,-1
    2b70:	91 21 00 28 	stw     r9,40(r1)
    2b74:	81 21 00 28 	lwz     r9,40(r1)
    2b78:	2c 09 00 00 	cmpwi   r9,0
    2b7c:	41 81 ff c4 	bgt     2b40 <vsnprintf+0x4e4>
    2b80:	48 00 07 e0 	b       3360 <vsnprintf+0xd04>
    2b84:	81 21 00 54 	lwz     r9,84(r1)
    2b88:	89 29 00 00 	lbz     r9,0(r9)
    2b8c:	28 09 00 07 	cmplwi  r9,7
    2b90:	41 81 00 30 	bgt     2bc0 <vsnprintf+0x564>
    2b94:	81 21 00 54 	lwz     r9,84(r1)
    2b98:	81 49 00 08 	lwz     r10,8(r9)
    2b9c:	81 21 00 54 	lwz     r9,84(r1)
    2ba0:	89 29 00 00 	lbz     r9,0(r9)
    2ba4:	39 09 00 01 	addi    r8,r9,1
    2ba8:	55 07 06 3e 	clrlwi  r7,r8,24
    2bac:	81 01 00 54 	lwz     r8,84(r1)
    2bb0:	98 e8 00 00 	stb     r7,0(r8)
    2bb4:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    2bb8:	7d 2a 4a 14 	add     r9,r10,r9
    2bbc:	48 00 00 18 	b       2bd4 <vsnprintf+0x578>
    2bc0:	81 21 00 54 	lwz     r9,84(r1)
    2bc4:	81 29 00 04 	lwz     r9,4(r9)
    2bc8:	39 09 00 04 	addi    r8,r9,4
    2bcc:	81 41 00 54 	lwz     r10,84(r1)
    2bd0:	91 0a 00 04 	stw     r8,4(r10)
    2bd4:	81 29 00 00 	lwz     r9,0(r9)
    2bd8:	91 21 00 20 	stw     r9,32(r1)
    2bdc:	81 21 00 20 	lwz     r9,32(r1)
    2be0:	2c 09 00 00 	cmpwi   r9,0
    2be4:	40 82 00 10 	bne     2bf4 <vsnprintf+0x598>
    2be8:	3d 20 00 00 	lis     r9,0
    2bec:	39 29 0a 60 	addi    r9,r9,2656
    2bf0:	91 21 00 20 	stw     r9,32(r1)
    2bf4:	81 21 00 2c 	lwz     r9,44(r1)
    2bf8:	7d 24 4b 78 	mr      r4,r9
    2bfc:	80 61 00 20 	lwz     r3,32(r1)
    2c00:	4b ff ea 25 	bl      1624 <strnlen>
    2c04:	7c 69 1b 78 	mr      r9,r3
    2c08:	91 21 00 34 	stw     r9,52(r1)
    2c0c:	81 21 00 24 	lwz     r9,36(r1)
    2c10:	55 29 06 f6 	rlwinm  r9,r9,0,27,27
    2c14:	2c 09 00 00 	cmpwi   r9,0
    2c18:	40 82 00 48 	bne     2c60 <vsnprintf+0x604>
    2c1c:	48 00 00 2c 	b       2c48 <vsnprintf+0x5ec>
    2c20:	81 41 00 18 	lwz     r10,24(r1)
    2c24:	81 21 00 1c 	lwz     r9,28(r1)
    2c28:	7c 0a 48 40 	cmplw   r10,r9
    2c2c:	40 80 00 10 	bge     2c3c <vsnprintf+0x5e0>
    2c30:	81 21 00 18 	lwz     r9,24(r1)
    2c34:	39 40 00 20 	li      r10,32
    2c38:	99 49 00 00 	stb     r10,0(r9)
    2c3c:	81 21 00 18 	lwz     r9,24(r1)
    2c40:	39 29 00 01 	addi    r9,r9,1
    2c44:	91 21 00 18 	stw     r9,24(r1)
    2c48:	81 21 00 28 	lwz     r9,40(r1)
    2c4c:	39 49 ff ff 	addi    r10,r9,-1
    2c50:	91 41 00 28 	stw     r10,40(r1)
    2c54:	81 41 00 34 	lwz     r10,52(r1)
    2c58:	7c 0a 48 00 	cmpw    r10,r9
    2c5c:	41 80 ff c4 	blt     2c20 <vsnprintf+0x5c4>
    2c60:	39 20 00 00 	li      r9,0
    2c64:	91 21 00 10 	stw     r9,16(r1)
    2c68:	48 00 00 48 	b       2cb0 <vsnprintf+0x654>
    2c6c:	81 41 00 18 	lwz     r10,24(r1)
    2c70:	81 21 00 1c 	lwz     r9,28(r1)
    2c74:	7c 0a 48 40 	cmplw   r10,r9
    2c78:	40 80 00 14 	bge     2c8c <vsnprintf+0x630>
    2c7c:	81 21 00 20 	lwz     r9,32(r1)
    2c80:	89 49 00 00 	lbz     r10,0(r9)
    2c84:	81 21 00 18 	lwz     r9,24(r1)
    2c88:	99 49 00 00 	stb     r10,0(r9)
    2c8c:	81 21 00 18 	lwz     r9,24(r1)
    2c90:	39 29 00 01 	addi    r9,r9,1
    2c94:	91 21 00 18 	stw     r9,24(r1)
    2c98:	81 21 00 20 	lwz     r9,32(r1)
    2c9c:	39 29 00 01 	addi    r9,r9,1
    2ca0:	91 21 00 20 	stw     r9,32(r1)
    2ca4:	81 21 00 10 	lwz     r9,16(r1)
    2ca8:	39 29 00 01 	addi    r9,r9,1
    2cac:	91 21 00 10 	stw     r9,16(r1)
    2cb0:	81 41 00 10 	lwz     r10,16(r1)
    2cb4:	81 21 00 34 	lwz     r9,52(r1)
    2cb8:	7c 0a 48 00 	cmpw    r10,r9
    2cbc:	41 80 ff b0 	blt     2c6c <vsnprintf+0x610>
    2cc0:	48 00 00 2c 	b       2cec <vsnprintf+0x690>
    2cc4:	81 41 00 18 	lwz     r10,24(r1)
    2cc8:	81 21 00 1c 	lwz     r9,28(r1)
    2ccc:	7c 0a 48 40 	cmplw   r10,r9
    2cd0:	40 80 00 10 	bge     2ce0 <vsnprintf+0x684>
    2cd4:	81 21 00 18 	lwz     r9,24(r1)
    2cd8:	39 40 00 20 	li      r10,32
    2cdc:	99 49 00 00 	stb     r10,0(r9)
    2ce0:	81 21 00 18 	lwz     r9,24(r1)
    2ce4:	39 29 00 01 	addi    r9,r9,1
    2ce8:	91 21 00 18 	stw     r9,24(r1)
    2cec:	81 21 00 28 	lwz     r9,40(r1)
    2cf0:	39 49 ff ff 	addi    r10,r9,-1
    2cf4:	91 41 00 28 	stw     r10,40(r1)
    2cf8:	81 41 00 34 	lwz     r10,52(r1)
    2cfc:	7c 0a 48 00 	cmpw    r10,r9
    2d00:	41 80 ff c4 	blt     2cc4 <vsnprintf+0x668>
    2d04:	48 00 06 5c 	b       3360 <vsnprintf+0xd04>
    2d08:	81 41 00 28 	lwz     r10,40(r1)
    2d0c:	39 20 ff ff 	li      r9,-1
    2d10:	7c 0a 48 00 	cmpw    r10,r9
    2d14:	40 82 00 18 	bne     2d2c <vsnprintf+0x6d0>
    2d18:	39 20 00 08 	li      r9,8
    2d1c:	91 21 00 28 	stw     r9,40(r1)
    2d20:	81 21 00 24 	lwz     r9,36(r1)
    2d24:	61 29 00 21 	ori     r9,r9,33
    2d28:	91 21 00 24 	stw     r9,36(r1)
    2d2c:	81 21 00 54 	lwz     r9,84(r1)
    2d30:	89 29 00 00 	lbz     r9,0(r9)
    2d34:	28 09 00 07 	cmplwi  r9,7
    2d38:	41 81 00 30 	bgt     2d68 <vsnprintf+0x70c>
    2d3c:	81 21 00 54 	lwz     r9,84(r1)
    2d40:	81 49 00 08 	lwz     r10,8(r9)
    2d44:	81 21 00 54 	lwz     r9,84(r1)
    2d48:	89 29 00 00 	lbz     r9,0(r9)
    2d4c:	39 09 00 01 	addi    r8,r9,1
    2d50:	55 07 06 3e 	clrlwi  r7,r8,24
    2d54:	81 01 00 54 	lwz     r8,84(r1)
    2d58:	98 e8 00 00 	stb     r7,0(r8)
    2d5c:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    2d60:	7d 2a 4a 14 	add     r9,r10,r9
    2d64:	48 00 00 18 	b       2d7c <vsnprintf+0x720>
    2d68:	81 21 00 54 	lwz     r9,84(r1)
    2d6c:	81 29 00 04 	lwz     r9,4(r9)
    2d70:	39 09 00 04 	addi    r8,r9,4
    2d74:	81 41 00 54 	lwz     r10,84(r1)
    2d78:	91 0a 00 04 	stw     r8,4(r10)
    2d7c:	81 29 00 00 	lwz     r9,0(r9)
    2d80:	7d 2a 4b 78 	mr      r10,r9
    2d84:	81 21 00 24 	lwz     r9,36(r1)
    2d88:	81 01 00 2c 	lwz     r8,44(r1)
    2d8c:	80 e1 00 28 	lwz     r7,40(r1)
    2d90:	38 c0 00 10 	li      r6,16
    2d94:	7d 45 53 78 	mr      r5,r10
    2d98:	80 81 00 1c 	lwz     r4,28(r1)
    2d9c:	80 61 00 18 	lwz     r3,24(r1)
    2da0:	4b ff ef bd 	bl      1d5c <number>
    2da4:	7c 69 1b 78 	mr      r9,r3
    2da8:	91 21 00 18 	stw     r9,24(r1)
    2dac:	48 00 05 b4 	b       3360 <vsnprintf+0xd04>
    2db0:	81 21 00 30 	lwz     r9,48(r1)
    2db4:	2c 09 00 6c 	cmpwi   r9,108
    2db8:	40 82 00 74 	bne     2e2c <vsnprintf+0x7d0>
    2dbc:	81 21 00 54 	lwz     r9,84(r1)
    2dc0:	89 29 00 00 	lbz     r9,0(r9)
    2dc4:	28 09 00 07 	cmplwi  r9,7
    2dc8:	41 81 00 30 	bgt     2df8 <vsnprintf+0x79c>
    2dcc:	81 21 00 54 	lwz     r9,84(r1)
    2dd0:	81 49 00 08 	lwz     r10,8(r9)
    2dd4:	81 21 00 54 	lwz     r9,84(r1)
    2dd8:	89 29 00 00 	lbz     r9,0(r9)
    2ddc:	39 09 00 01 	addi    r8,r9,1
    2de0:	55 07 06 3e 	clrlwi  r7,r8,24
    2de4:	81 01 00 54 	lwz     r8,84(r1)
    2de8:	98 e8 00 00 	stb     r7,0(r8)
    2dec:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    2df0:	7d 2a 4a 14 	add     r9,r10,r9
    2df4:	48 00 00 18 	b       2e0c <vsnprintf+0x7b0>
    2df8:	81 21 00 54 	lwz     r9,84(r1)
    2dfc:	81 29 00 04 	lwz     r9,4(r9)
    2e00:	39 09 00 04 	addi    r8,r9,4
    2e04:	81 41 00 54 	lwz     r10,84(r1)
    2e08:	91 0a 00 04 	stw     r8,4(r10)
    2e0c:	81 29 00 00 	lwz     r9,0(r9)
    2e10:	91 21 00 40 	stw     r9,64(r1)
    2e14:	81 41 00 18 	lwz     r10,24(r1)
    2e18:	81 21 00 48 	lwz     r9,72(r1)
    2e1c:	7d 49 50 50 	subf    r10,r9,r10
    2e20:	81 21 00 40 	lwz     r9,64(r1)
    2e24:	91 49 00 00 	stw     r10,0(r9)
    2e28:	48 00 05 38 	b       3360 <vsnprintf+0xd04>
    2e2c:	81 21 00 30 	lwz     r9,48(r1)
    2e30:	2c 09 00 5a 	cmpwi   r9,90
    2e34:	41 82 00 10 	beq     2e44 <vsnprintf+0x7e8>
    2e38:	81 21 00 30 	lwz     r9,48(r1)
    2e3c:	2c 09 00 7a 	cmpwi   r9,122
    2e40:	40 82 00 7c 	bne     2ebc <vsnprintf+0x860>
    2e44:	81 21 00 54 	lwz     r9,84(r1)
    2e48:	89 29 00 00 	lbz     r9,0(r9)
    2e4c:	28 09 00 07 	cmplwi  r9,7
    2e50:	41 81 00 30 	bgt     2e80 <vsnprintf+0x824>
    2e54:	81 21 00 54 	lwz     r9,84(r1)
    2e58:	81 49 00 08 	lwz     r10,8(r9)
    2e5c:	81 21 00 54 	lwz     r9,84(r1)
    2e60:	89 29 00 00 	lbz     r9,0(r9)
    2e64:	39 09 00 01 	addi    r8,r9,1
    2e68:	55 07 06 3e 	clrlwi  r7,r8,24
    2e6c:	81 01 00 54 	lwz     r8,84(r1)
    2e70:	98 e8 00 00 	stb     r7,0(r8)
    2e74:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    2e78:	7d 2a 4a 14 	add     r9,r10,r9
    2e7c:	48 00 00 18 	b       2e94 <vsnprintf+0x838>
    2e80:	81 21 00 54 	lwz     r9,84(r1)
    2e84:	81 29 00 04 	lwz     r9,4(r9)
    2e88:	39 09 00 04 	addi    r8,r9,4
    2e8c:	81 41 00 54 	lwz     r10,84(r1)
    2e90:	91 0a 00 04 	stw     r8,4(r10)
    2e94:	81 29 00 00 	lwz     r9,0(r9)
    2e98:	91 21 00 3c 	stw     r9,60(r1)
    2e9c:	81 41 00 18 	lwz     r10,24(r1)
    2ea0:	81 21 00 48 	lwz     r9,72(r1)
    2ea4:	7d 29 50 50 	subf    r9,r9,r10
    2ea8:	7d 2a 4b 78 	mr      r10,r9
    2eac:	81 21 00 3c 	lwz     r9,60(r1)
    2eb0:	91 49 00 00 	stw     r10,0(r9)
    2eb4:	60 00 00 00 	nop
    2eb8:	48 00 04 a8 	b       3360 <vsnprintf+0xd04>
    2ebc:	81 21 00 54 	lwz     r9,84(r1)
    2ec0:	89 29 00 00 	lbz     r9,0(r9)
    2ec4:	28 09 00 07 	cmplwi  r9,7
    2ec8:	41 81 00 30 	bgt     2ef8 <vsnprintf+0x89c>
    2ecc:	81 21 00 54 	lwz     r9,84(r1)
    2ed0:	81 49 00 08 	lwz     r10,8(r9)
    2ed4:	81 21 00 54 	lwz     r9,84(r1)
    2ed8:	89 29 00 00 	lbz     r9,0(r9)
    2edc:	39 09 00 01 	addi    r8,r9,1
    2ee0:	55 07 06 3e 	clrlwi  r7,r8,24
    2ee4:	81 01 00 54 	lwz     r8,84(r1)
    2ee8:	98 e8 00 00 	stb     r7,0(r8)
    2eec:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    2ef0:	7d 2a 4a 14 	add     r9,r10,r9
    2ef4:	48 00 00 18 	b       2f0c <vsnprintf+0x8b0>
    2ef8:	81 21 00 54 	lwz     r9,84(r1)
    2efc:	81 29 00 04 	lwz     r9,4(r9)
    2f00:	39 09 00 04 	addi    r8,r9,4
    2f04:	81 41 00 54 	lwz     r10,84(r1)
    2f08:	91 0a 00 04 	stw     r8,4(r10)
    2f0c:	81 29 00 00 	lwz     r9,0(r9)
    2f10:	91 21 00 38 	stw     r9,56(r1)
    2f14:	81 41 00 18 	lwz     r10,24(r1)
    2f18:	81 21 00 48 	lwz     r9,72(r1)
    2f1c:	7d 49 50 50 	subf    r10,r9,r10
    2f20:	81 21 00 38 	lwz     r9,56(r1)
    2f24:	91 49 00 00 	stw     r10,0(r9)
    2f28:	48 00 04 38 	b       3360 <vsnprintf+0xd04>
    2f2c:	81 41 00 18 	lwz     r10,24(r1)
    2f30:	81 21 00 1c 	lwz     r9,28(r1)
    2f34:	7c 0a 48 40 	cmplw   r10,r9
    2f38:	40 80 00 10 	bge     2f48 <vsnprintf+0x8ec>
    2f3c:	81 21 00 18 	lwz     r9,24(r1)
    2f40:	39 40 00 25 	li      r10,37
    2f44:	99 49 00 00 	stb     r10,0(r9)
    2f48:	81 21 00 18 	lwz     r9,24(r1)
    2f4c:	39 29 00 01 	addi    r9,r9,1
    2f50:	91 21 00 18 	stw     r9,24(r1)
    2f54:	48 00 04 0c 	b       3360 <vsnprintf+0xd04>
    2f58:	39 20 00 08 	li      r9,8
    2f5c:	91 21 00 14 	stw     r9,20(r1)
    2f60:	48 00 00 a8 	b       3008 <vsnprintf+0x9ac>
    2f64:	81 21 00 24 	lwz     r9,36(r1)
    2f68:	61 29 00 40 	ori     r9,r9,64
    2f6c:	91 21 00 24 	stw     r9,36(r1)
    2f70:	39 20 00 10 	li      r9,16
    2f74:	91 21 00 14 	stw     r9,20(r1)
    2f78:	48 00 00 90 	b       3008 <vsnprintf+0x9ac>
    2f7c:	81 21 00 24 	lwz     r9,36(r1)
    2f80:	61 29 00 02 	ori     r9,r9,2
    2f84:	91 21 00 24 	stw     r9,36(r1)
    2f88:	48 00 00 7c 	b       3004 <vsnprintf+0x9a8>
    2f8c:	81 41 00 18 	lwz     r10,24(r1)
    2f90:	81 21 00 1c 	lwz     r9,28(r1)
    2f94:	7c 0a 48 40 	cmplw   r10,r9
    2f98:	40 80 00 10 	bge     2fa8 <vsnprintf+0x94c>
    2f9c:	81 21 00 18 	lwz     r9,24(r1)
    2fa0:	39 40 00 25 	li      r10,37
    2fa4:	99 49 00 00 	stb     r10,0(r9)
    2fa8:	81 21 00 18 	lwz     r9,24(r1)
    2fac:	39 29 00 01 	addi    r9,r9,1
    2fb0:	91 21 00 18 	stw     r9,24(r1)
    2fb4:	81 21 00 50 	lwz     r9,80(r1)
    2fb8:	89 29 00 00 	lbz     r9,0(r9)
    2fbc:	2c 09 00 00 	cmpwi   r9,0
    2fc0:	41 82 00 34 	beq     2ff4 <vsnprintf+0x998>
    2fc4:	81 41 00 18 	lwz     r10,24(r1)
    2fc8:	81 21 00 1c 	lwz     r9,28(r1)
    2fcc:	7c 0a 48 40 	cmplw   r10,r9
    2fd0:	40 80 00 14 	bge     2fe4 <vsnprintf+0x988>
    2fd4:	81 21 00 50 	lwz     r9,80(r1)
    2fd8:	89 49 00 00 	lbz     r10,0(r9)
    2fdc:	81 21 00 18 	lwz     r9,24(r1)
    2fe0:	99 49 00 00 	stb     r10,0(r9)
    2fe4:	81 21 00 18 	lwz     r9,24(r1)
    2fe8:	39 29 00 01 	addi    r9,r9,1
    2fec:	91 21 00 18 	stw     r9,24(r1)
    2ff0:	48 00 03 70 	b       3360 <vsnprintf+0xd04>
    2ff4:	81 21 00 50 	lwz     r9,80(r1)
    2ff8:	39 29 ff ff 	addi    r9,r9,-1
    2ffc:	91 21 00 50 	stw     r9,80(r1)
    3000:	48 00 03 60 	b       3360 <vsnprintf+0xd04>
    3004:	60 00 00 00 	nop
    3008:	81 21 00 30 	lwz     r9,48(r1)
    300c:	2c 09 00 4c 	cmpwi   r9,76
    3010:	40 82 00 90 	bne     30a0 <vsnprintf+0xa44>
    3014:	81 21 00 54 	lwz     r9,84(r1)
    3018:	89 29 00 00 	lbz     r9,0(r9)
    301c:	81 41 00 54 	lwz     r10,84(r1)
    3020:	89 4a 00 00 	lbz     r10,0(r10)
    3024:	55 4a 07 fe 	clrlwi  r10,r10,31
    3028:	55 4a 06 3e 	clrlwi  r10,r10,24
    302c:	7d 4a 4a 14 	add     r10,r10,r9
    3030:	55 48 06 3e 	clrlwi  r8,r10,24
    3034:	81 41 00 54 	lwz     r10,84(r1)
    3038:	99 0a 00 00 	stb     r8,0(r10)
    303c:	28 09 00 06 	cmplwi  r9,6
    3040:	41 81 00 30 	bgt     3070 <vsnprintf+0xa14>
    3044:	81 21 00 54 	lwz     r9,84(r1)
    3048:	81 49 00 08 	lwz     r10,8(r9)
    304c:	81 21 00 54 	lwz     r9,84(r1)
    3050:	89 29 00 00 	lbz     r9,0(r9)
    3054:	39 09 00 02 	addi    r8,r9,2
    3058:	55 07 06 3e 	clrlwi  r7,r8,24
    305c:	81 01 00 54 	lwz     r8,84(r1)
    3060:	98 e8 00 00 	stb     r7,0(r8)
    3064:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3068:	7d 2a 4a 14 	add     r9,r10,r9
    306c:	48 00 00 20 	b       308c <vsnprintf+0xa30>
    3070:	81 21 00 54 	lwz     r9,84(r1)
    3074:	81 29 00 04 	lwz     r9,4(r9)
    3078:	39 29 00 07 	addi    r9,r9,7
    307c:	55 29 00 38 	rlwinm  r9,r9,0,0,28
    3080:	39 09 00 08 	addi    r8,r9,8
    3084:	81 41 00 54 	lwz     r10,84(r1)
    3088:	91 0a 00 04 	stw     r8,4(r10)
    308c:	81 49 00 00 	lwz     r10,0(r9)
    3090:	81 69 00 04 	lwz     r11,4(r9)
    3094:	91 41 00 08 	stw     r10,8(r1)
    3098:	91 61 00 0c 	stw     r11,12(r1)
    309c:	48 00 02 98 	b       3334 <vsnprintf+0xcd8>
    30a0:	81 21 00 30 	lwz     r9,48(r1)
    30a4:	2c 09 00 6c 	cmpwi   r9,108
    30a8:	40 82 00 88 	bne     3130 <vsnprintf+0xad4>
    30ac:	81 21 00 54 	lwz     r9,84(r1)
    30b0:	89 29 00 00 	lbz     r9,0(r9)
    30b4:	28 09 00 07 	cmplwi  r9,7
    30b8:	41 81 00 30 	bgt     30e8 <vsnprintf+0xa8c>
    30bc:	81 21 00 54 	lwz     r9,84(r1)
    30c0:	81 49 00 08 	lwz     r10,8(r9)
    30c4:	81 21 00 54 	lwz     r9,84(r1)
    30c8:	89 29 00 00 	lbz     r9,0(r9)
    30cc:	39 09 00 01 	addi    r8,r9,1
    30d0:	55 07 06 3e 	clrlwi  r7,r8,24
    30d4:	81 01 00 54 	lwz     r8,84(r1)
    30d8:	98 e8 00 00 	stb     r7,0(r8)
    30dc:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    30e0:	7d 2a 4a 14 	add     r9,r10,r9
    30e4:	48 00 00 18 	b       30fc <vsnprintf+0xaa0>
    30e8:	81 21 00 54 	lwz     r9,84(r1)
    30ec:	81 29 00 04 	lwz     r9,4(r9)
    30f0:	39 09 00 04 	addi    r8,r9,4
    30f4:	81 41 00 54 	lwz     r10,84(r1)
    30f8:	91 0a 00 04 	stw     r8,4(r10)
    30fc:	81 29 00 00 	lwz     r9,0(r9)
    3100:	91 21 00 0c 	stw     r9,12(r1)
    3104:	39 20 00 00 	li      r9,0
    3108:	91 21 00 08 	stw     r9,8(r1)
    310c:	81 21 00 24 	lwz     r9,36(r1)
    3110:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    3114:	2c 09 00 00 	cmpwi   r9,0
    3118:	41 82 02 1c 	beq     3334 <vsnprintf+0xcd8>
    311c:	81 21 00 0c 	lwz     r9,12(r1)
    3120:	91 21 00 0c 	stw     r9,12(r1)
    3124:	7d 29 fe 70 	srawi   r9,r9,31
    3128:	91 21 00 08 	stw     r9,8(r1)
    312c:	48 00 02 08 	b       3334 <vsnprintf+0xcd8>
    3130:	81 21 00 30 	lwz     r9,48(r1)
    3134:	2c 09 00 5a 	cmpwi   r9,90
    3138:	41 82 00 10 	beq     3148 <vsnprintf+0xaec>
    313c:	81 21 00 30 	lwz     r9,48(r1)
    3140:	2c 09 00 7a 	cmpwi   r9,122
    3144:	40 82 00 68 	bne     31ac <vsnprintf+0xb50>
    3148:	81 21 00 54 	lwz     r9,84(r1)
    314c:	89 29 00 00 	lbz     r9,0(r9)
    3150:	28 09 00 07 	cmplwi  r9,7
    3154:	41 81 00 30 	bgt     3184 <vsnprintf+0xb28>
    3158:	81 21 00 54 	lwz     r9,84(r1)
    315c:	81 49 00 08 	lwz     r10,8(r9)
    3160:	81 21 00 54 	lwz     r9,84(r1)
    3164:	89 29 00 00 	lbz     r9,0(r9)
    3168:	39 09 00 01 	addi    r8,r9,1
    316c:	55 07 06 3e 	clrlwi  r7,r8,24
    3170:	81 01 00 54 	lwz     r8,84(r1)
    3174:	98 e8 00 00 	stb     r7,0(r8)
    3178:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    317c:	7d 2a 4a 14 	add     r9,r10,r9
    3180:	48 00 00 18 	b       3198 <vsnprintf+0xb3c>
    3184:	81 21 00 54 	lwz     r9,84(r1)
    3188:	81 29 00 04 	lwz     r9,4(r9)
    318c:	39 09 00 04 	addi    r8,r9,4
    3190:	81 41 00 54 	lwz     r10,84(r1)
    3194:	91 0a 00 04 	stw     r8,4(r10)
    3198:	81 29 00 00 	lwz     r9,0(r9)
    319c:	91 21 00 0c 	stw     r9,12(r1)
    31a0:	39 20 00 00 	li      r9,0
    31a4:	91 21 00 08 	stw     r9,8(r1)
    31a8:	48 00 01 8c 	b       3334 <vsnprintf+0xcd8>
    31ac:	81 21 00 30 	lwz     r9,48(r1)
    31b0:	2c 09 00 74 	cmpwi   r9,116
    31b4:	40 82 00 68 	bne     321c <vsnprintf+0xbc0>
    31b8:	81 21 00 54 	lwz     r9,84(r1)
    31bc:	89 29 00 00 	lbz     r9,0(r9)
    31c0:	28 09 00 07 	cmplwi  r9,7
    31c4:	41 81 00 30 	bgt     31f4 <vsnprintf+0xb98>
    31c8:	81 21 00 54 	lwz     r9,84(r1)
    31cc:	81 49 00 08 	lwz     r10,8(r9)
    31d0:	81 21 00 54 	lwz     r9,84(r1)
    31d4:	89 29 00 00 	lbz     r9,0(r9)
    31d8:	39 09 00 01 	addi    r8,r9,1
    31dc:	55 07 06 3e 	clrlwi  r7,r8,24
    31e0:	81 01 00 54 	lwz     r8,84(r1)
    31e4:	98 e8 00 00 	stb     r7,0(r8)
    31e8:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    31ec:	7d 2a 4a 14 	add     r9,r10,r9
    31f0:	48 00 00 18 	b       3208 <vsnprintf+0xbac>
    31f4:	81 21 00 54 	lwz     r9,84(r1)
    31f8:	81 29 00 04 	lwz     r9,4(r9)
    31fc:	39 09 00 04 	addi    r8,r9,4
    3200:	81 41 00 54 	lwz     r10,84(r1)
    3204:	91 0a 00 04 	stw     r8,4(r10)
    3208:	81 29 00 00 	lwz     r9,0(r9)
    320c:	91 21 00 0c 	stw     r9,12(r1)
    3210:	7d 29 fe 70 	srawi   r9,r9,31
    3214:	91 21 00 08 	stw     r9,8(r1)
    3218:	48 00 01 1c 	b       3334 <vsnprintf+0xcd8>
    321c:	81 21 00 30 	lwz     r9,48(r1)
    3220:	2c 09 00 68 	cmpwi   r9,104
    3224:	40 82 00 90 	bne     32b4 <vsnprintf+0xc58>
    3228:	81 21 00 54 	lwz     r9,84(r1)
    322c:	89 29 00 00 	lbz     r9,0(r9)
    3230:	28 09 00 07 	cmplwi  r9,7
    3234:	41 81 00 30 	bgt     3264 <vsnprintf+0xc08>
    3238:	81 21 00 54 	lwz     r9,84(r1)
    323c:	81 49 00 08 	lwz     r10,8(r9)
    3240:	81 21 00 54 	lwz     r9,84(r1)
    3244:	89 29 00 00 	lbz     r9,0(r9)
    3248:	39 09 00 01 	addi    r8,r9,1
    324c:	55 07 06 3e 	clrlwi  r7,r8,24
    3250:	81 01 00 54 	lwz     r8,84(r1)
    3254:	98 e8 00 00 	stb     r7,0(r8)
    3258:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    325c:	7d 2a 4a 14 	add     r9,r10,r9
    3260:	48 00 00 18 	b       3278 <vsnprintf+0xc1c>
    3264:	81 21 00 54 	lwz     r9,84(r1)
    3268:	81 29 00 04 	lwz     r9,4(r9)
    326c:	39 09 00 04 	addi    r8,r9,4
    3270:	81 41 00 54 	lwz     r10,84(r1)
    3274:	91 0a 00 04 	stw     r8,4(r10)
    3278:	81 29 00 00 	lwz     r9,0(r9)
    327c:	55 29 04 3e 	clrlwi  r9,r9,16
    3280:	91 21 00 0c 	stw     r9,12(r1)
    3284:	39 20 00 00 	li      r9,0
    3288:	91 21 00 08 	stw     r9,8(r1)
    328c:	81 21 00 24 	lwz     r9,36(r1)
    3290:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    3294:	2c 09 00 00 	cmpwi   r9,0
    3298:	41 82 00 9c 	beq     3334 <vsnprintf+0xcd8>
    329c:	a1 21 00 0e 	lhz     r9,14(r1)
    32a0:	7d 29 07 34 	extsh   r9,r9
    32a4:	91 21 00 0c 	stw     r9,12(r1)
    32a8:	7d 29 fe 70 	srawi   r9,r9,31
    32ac:	91 21 00 08 	stw     r9,8(r1)
    32b0:	48 00 00 84 	b       3334 <vsnprintf+0xcd8>
    32b4:	81 21 00 54 	lwz     r9,84(r1)
    32b8:	89 29 00 00 	lbz     r9,0(r9)
    32bc:	28 09 00 07 	cmplwi  r9,7
    32c0:	41 81 00 30 	bgt     32f0 <vsnprintf+0xc94>
    32c4:	81 21 00 54 	lwz     r9,84(r1)
    32c8:	81 49 00 08 	lwz     r10,8(r9)
    32cc:	81 21 00 54 	lwz     r9,84(r1)
    32d0:	89 29 00 00 	lbz     r9,0(r9)
    32d4:	39 09 00 01 	addi    r8,r9,1
    32d8:	55 07 06 3e 	clrlwi  r7,r8,24
    32dc:	81 01 00 54 	lwz     r8,84(r1)
    32e0:	98 e8 00 00 	stb     r7,0(r8)
    32e4:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    32e8:	7d 2a 4a 14 	add     r9,r10,r9
    32ec:	48 00 00 18 	b       3304 <vsnprintf+0xca8>
    32f0:	81 21 00 54 	lwz     r9,84(r1)
    32f4:	81 29 00 04 	lwz     r9,4(r9)
    32f8:	39 09 00 04 	addi    r8,r9,4
    32fc:	81 41 00 54 	lwz     r10,84(r1)
    3300:	91 0a 00 04 	stw     r8,4(r10)
    3304:	81 29 00 00 	lwz     r9,0(r9)
    3308:	91 21 00 0c 	stw     r9,12(r1)
    330c:	39 20 00 00 	li      r9,0
    3310:	91 21 00 08 	stw     r9,8(r1)
    3314:	81 21 00 24 	lwz     r9,36(r1)
    3318:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    331c:	2c 09 00 00 	cmpwi   r9,0
    3320:	41 82 00 14 	beq     3334 <vsnprintf+0xcd8>
    3324:	81 21 00 0c 	lwz     r9,12(r1)
    3328:	91 21 00 0c 	stw     r9,12(r1)
    332c:	7d 29 fe 70 	srawi   r9,r9,31
    3330:	91 21 00 08 	stw     r9,8(r1)
    3334:	81 41 00 0c 	lwz     r10,12(r1)
    3338:	81 21 00 24 	lwz     r9,36(r1)
    333c:	81 01 00 2c 	lwz     r8,44(r1)
    3340:	80 e1 00 28 	lwz     r7,40(r1)
    3344:	80 c1 00 14 	lwz     r6,20(r1)
    3348:	7d 45 53 78 	mr      r5,r10
    334c:	80 81 00 1c 	lwz     r4,28(r1)
    3350:	80 61 00 18 	lwz     r3,24(r1)
    3354:	4b ff ea 09 	bl      1d5c <number>
    3358:	7c 69 1b 78 	mr      r9,r3
    335c:	91 21 00 18 	stw     r9,24(r1)
    3360:	81 21 00 50 	lwz     r9,80(r1)
    3364:	39 29 00 01 	addi    r9,r9,1
    3368:	91 21 00 50 	stw     r9,80(r1)
    336c:	81 21 00 50 	lwz     r9,80(r1)
    3370:	89 29 00 00 	lbz     r9,0(r9)
    3374:	2c 09 00 00 	cmpwi   r9,0
    3378:	40 82 f3 58 	bne     26d0 <vsnprintf+0x74>
    337c:	81 21 00 4c 	lwz     r9,76(r1)
    3380:	2c 09 00 00 	cmpwi   r9,0
    3384:	41 82 00 34 	beq     33b8 <vsnprintf+0xd5c>
    3388:	81 41 00 18 	lwz     r10,24(r1)
    338c:	81 21 00 1c 	lwz     r9,28(r1)
    3390:	7c 0a 48 40 	cmplw   r10,r9
    3394:	40 80 00 14 	bge     33a8 <vsnprintf+0xd4c>
    3398:	81 21 00 18 	lwz     r9,24(r1)
    339c:	39 40 00 00 	li      r10,0
    33a0:	99 49 00 00 	stb     r10,0(r9)
    33a4:	48 00 00 14 	b       33b8 <vsnprintf+0xd5c>
    33a8:	81 21 00 1c 	lwz     r9,28(r1)
    33ac:	39 29 ff ff 	addi    r9,r9,-1
    33b0:	39 40 00 00 	li      r10,0
    33b4:	99 49 00 00 	stb     r10,0(r9)
    33b8:	81 41 00 18 	lwz     r10,24(r1)
    33bc:	81 21 00 48 	lwz     r9,72(r1)
    33c0:	7d 29 50 50 	subf    r9,r9,r10
    33c4:	7d 23 4b 78 	mr      r3,r9
    33c8:	80 01 00 64 	lwz     r0,100(r1)
    33cc:	7c 08 03 a6 	mtlr    r0
    33d0:	38 21 00 60 	addi    r1,r1,96
    33d4:	4e 80 00 20 	blr

000033d8 <console_set_write_hook>:
    33d8:	94 21 ff f0 	stwu    r1,-16(r1)
    33dc:	90 61 00 08 	stw     r3,8(r1)
    33e0:	3d 20 00 01 	lis     r9,1
    33e4:	81 41 00 08 	lwz     r10,8(r1)
    33e8:	91 49 24 8c 	stw     r10,9356(r9)
    33ec:	60 00 00 00 	nop
    33f0:	38 21 00 10 	addi    r1,r1,16
    33f4:	4e 80 00 20 	blr

000033f8 <console_set_read_hook>:
    33f8:	94 21 ff f0 	stwu    r1,-16(r1)
    33fc:	90 61 00 08 	stw     r3,8(r1)
    3400:	90 81 00 0c 	stw     r4,12(r1)
    3404:	3d 20 00 01 	lis     r9,1
    3408:	81 41 00 08 	lwz     r10,8(r1)
    340c:	91 49 24 90 	stw     r10,9360(r9)
    3410:	3d 20 00 01 	lis     r9,1
    3414:	81 41 00 0c 	lwz     r10,12(r1)
    3418:	91 49 24 94 	stw     r10,9364(r9)
    341c:	60 00 00 00 	nop
    3420:	38 21 00 10 	addi    r1,r1,16
    3424:	4e 80 00 20 	blr

00003428 <putchar>:
    3428:	94 21 ff f0 	stwu    r1,-16(r1)
    342c:	7c 08 02 a6 	mflr    r0
    3430:	90 01 00 14 	stw     r0,20(r1)
    3434:	90 61 00 08 	stw     r3,8(r1)
    3438:	3d 20 00 01 	lis     r9,1
    343c:	81 29 24 8c 	lwz     r9,9356(r9)
    3440:	2c 09 00 00 	cmpwi   r9,0
    3444:	41 82 00 20 	beq     3464 <putchar+0x3c>
    3448:	3d 20 00 01 	lis     r9,1
    344c:	81 29 24 8c 	lwz     r9,9356(r9)
    3450:	81 41 00 08 	lwz     r10,8(r1)
    3454:	55 4a 06 3e 	clrlwi  r10,r10,24
    3458:	7d 43 53 78 	mr      r3,r10
    345c:	7d 29 03 a6 	mtctr   r9
    3460:	4e 80 04 21 	bctrl
    3464:	81 21 00 08 	lwz     r9,8(r1)
    3468:	7d 23 4b 78 	mr      r3,r9
    346c:	80 01 00 14 	lwz     r0,20(r1)
    3470:	7c 08 03 a6 	mtlr    r0
    3474:	38 21 00 10 	addi    r1,r1,16
    3478:	4e 80 00 20 	blr

0000347c <readchar>:
    347c:	94 21 ff f0 	stwu    r1,-16(r1)
    3480:	7c 08 02 a6 	mflr    r0
    3484:	90 01 00 14 	stw     r0,20(r1)
    3488:	3d 20 00 01 	lis     r9,1
    348c:	81 29 24 94 	lwz     r9,9364(r9)
    3490:	2c 09 00 00 	cmpwi   r9,0
    3494:	41 82 ff f4 	beq     3488 <readchar+0xc>
    3498:	3d 20 00 01 	lis     r9,1
    349c:	81 29 24 94 	lwz     r9,9364(r9)
    34a0:	7d 29 03 a6 	mtctr   r9
    34a4:	4e 80 04 21 	bctrl
    34a8:	7c 69 1b 78 	mr      r9,r3
    34ac:	2c 09 00 00 	cmpwi   r9,0
    34b0:	41 82 ff d8 	beq     3488 <readchar+0xc>
    34b4:	3d 20 00 01 	lis     r9,1
    34b8:	81 29 24 90 	lwz     r9,9360(r9)
    34bc:	7d 29 03 a6 	mtctr   r9
    34c0:	4e 80 04 21 	bctrl
    34c4:	7c 69 1b 78 	mr      r9,r3
    34c8:	7d 23 4b 78 	mr      r3,r9
    34cc:	80 01 00 14 	lwz     r0,20(r1)
    34d0:	7c 08 03 a6 	mtlr    r0
    34d4:	38 21 00 10 	addi    r1,r1,16
    34d8:	4e 80 00 20 	blr

000034dc <readchar_nonblock>:
    34dc:	94 21 ff f0 	stwu    r1,-16(r1)
    34e0:	7c 08 02 a6 	mflr    r0
    34e4:	90 01 00 14 	stw     r0,20(r1)
    34e8:	3d 20 00 01 	lis     r9,1
    34ec:	81 29 24 94 	lwz     r9,9364(r9)
    34f0:	2c 09 00 00 	cmpwi   r9,0
    34f4:	41 82 00 28 	beq     351c <readchar_nonblock+0x40>
    34f8:	3d 20 00 01 	lis     r9,1
    34fc:	81 29 24 94 	lwz     r9,9364(r9)
    3500:	7d 29 03 a6 	mtctr   r9
    3504:	4e 80 04 21 	bctrl
    3508:	7c 69 1b 78 	mr      r9,r3
    350c:	2c 09 00 00 	cmpwi   r9,0
    3510:	41 82 00 0c 	beq     351c <readchar_nonblock+0x40>
    3514:	39 20 00 01 	li      r9,1
    3518:	48 00 00 08 	b       3520 <readchar_nonblock+0x44>
    351c:	39 20 00 00 	li      r9,0
    3520:	7d 23 4b 78 	mr      r3,r9
    3524:	80 01 00 14 	lwz     r0,20(r1)
    3528:	7c 08 03 a6 	mtlr    r0
    352c:	38 21 00 10 	addi    r1,r1,16
    3530:	4e 80 00 20 	blr

00003534 <puts>:
    3534:	94 21 ff f0 	stwu    r1,-16(r1)
    3538:	7c 08 02 a6 	mflr    r0
    353c:	90 01 00 14 	stw     r0,20(r1)
    3540:	90 61 00 08 	stw     r3,8(r1)
    3544:	80 61 00 08 	lwz     r3,8(r1)
    3548:	48 00 00 25 	bl      356c <putsnonl>
    354c:	38 60 00 0a 	li      r3,10
    3550:	4b ff fe d9 	bl      3428 <putchar>
    3554:	39 20 00 01 	li      r9,1
    3558:	7d 23 4b 78 	mr      r3,r9
    355c:	80 01 00 14 	lwz     r0,20(r1)
    3560:	7c 08 03 a6 	mtlr    r0
    3564:	38 21 00 10 	addi    r1,r1,16
    3568:	4e 80 00 20 	blr

0000356c <putsnonl>:
    356c:	94 21 ff f0 	stwu    r1,-16(r1)
    3570:	7c 08 02 a6 	mflr    r0
    3574:	90 01 00 14 	stw     r0,20(r1)
    3578:	90 61 00 08 	stw     r3,8(r1)
    357c:	48 00 00 20 	b       359c <putsnonl+0x30>
    3580:	81 21 00 08 	lwz     r9,8(r1)
    3584:	89 29 00 00 	lbz     r9,0(r9)
    3588:	7d 23 4b 78 	mr      r3,r9
    358c:	4b ff fe 9d 	bl      3428 <putchar>
    3590:	81 21 00 08 	lwz     r9,8(r1)
    3594:	39 29 00 01 	addi    r9,r9,1
    3598:	91 21 00 08 	stw     r9,8(r1)
    359c:	81 21 00 08 	lwz     r9,8(r1)
    35a0:	89 29 00 00 	lbz     r9,0(r9)
    35a4:	2c 09 00 00 	cmpwi   r9,0
    35a8:	40 82 ff d8 	bne     3580 <putsnonl+0x14>
    35ac:	60 00 00 00 	nop
    35b0:	60 00 00 00 	nop
    35b4:	80 01 00 14 	lwz     r0,20(r1)
    35b8:	7c 08 03 a6 	mtlr    r0
    35bc:	38 21 00 10 	addi    r1,r1,16
    35c0:	4e 80 00 20 	blr

000035c4 <vprintf>:
    35c4:	94 21 fe e0 	stwu    r1,-288(r1)
    35c8:	7c 08 02 a6 	mflr    r0
    35cc:	90 01 01 24 	stw     r0,292(r1)
    35d0:	90 61 01 18 	stw     r3,280(r1)
    35d4:	90 81 01 1c 	stw     r4,284(r1)
    35d8:	39 21 00 0c 	addi    r9,r1,12
    35dc:	80 c1 01 1c 	lwz     r6,284(r1)
    35e0:	80 a1 01 18 	lwz     r5,280(r1)
    35e4:	38 80 01 00 	li      r4,256
    35e8:	7d 23 4b 78 	mr      r3,r9
    35ec:	4b ff eb f9 	bl      21e4 <vscnprintf>
    35f0:	7c 69 1b 78 	mr      r9,r3
    35f4:	91 21 00 08 	stw     r9,8(r1)
    35f8:	39 41 00 0c 	addi    r10,r1,12
    35fc:	81 21 00 08 	lwz     r9,8(r1)
    3600:	7d 2a 4a 14 	add     r9,r10,r9
    3604:	39 40 00 00 	li      r10,0
    3608:	99 49 00 00 	stb     r10,0(r9)
    360c:	39 21 00 0c 	addi    r9,r1,12
    3610:	7d 23 4b 78 	mr      r3,r9
    3614:	4b ff ff 59 	bl      356c <putsnonl>
    3618:	81 21 00 08 	lwz     r9,8(r1)
    361c:	7d 23 4b 78 	mr      r3,r9
    3620:	80 01 01 24 	lwz     r0,292(r1)
    3624:	7c 08 03 a6 	mtlr    r0
    3628:	38 21 01 20 	addi    r1,r1,288
    362c:	4e 80 00 20 	blr

00003630 <printf>:
    3630:	94 21 ff 80 	stwu    r1,-128(r1)
    3634:	7c 08 02 a6 	mflr    r0
    3638:	90 01 00 84 	stw     r0,132(r1)
    363c:	90 61 00 18 	stw     r3,24(r1)
    3640:	90 81 00 24 	stw     r4,36(r1)
    3644:	90 a1 00 28 	stw     r5,40(r1)
    3648:	90 c1 00 2c 	stw     r6,44(r1)
    364c:	90 e1 00 30 	stw     r7,48(r1)
    3650:	91 01 00 34 	stw     r8,52(r1)
    3654:	91 21 00 38 	stw     r9,56(r1)
    3658:	91 41 00 3c 	stw     r10,60(r1)
    365c:	40 86 00 24 	bne     cr1,3680 <printf+0x50>
    3660:	d8 21 00 40 	stfd    f1,64(r1)
    3664:	d8 41 00 48 	stfd    f2,72(r1)
    3668:	d8 61 00 50 	stfd    f3,80(r1)
    366c:	d8 81 00 58 	stfd    f4,88(r1)
    3670:	d8 a1 00 60 	stfd    f5,96(r1)
    3674:	d8 c1 00 68 	stfd    f6,104(r1)
    3678:	d8 e1 00 70 	stfd    f7,112(r1)
    367c:	d9 01 00 78 	stfd    f8,120(r1)
    3680:	39 20 00 01 	li      r9,1
    3684:	99 21 00 0c 	stb     r9,12(r1)
    3688:	39 20 00 00 	li      r9,0
    368c:	99 21 00 0d 	stb     r9,13(r1)
    3690:	39 21 00 88 	addi    r9,r1,136
    3694:	91 21 00 10 	stw     r9,16(r1)
    3698:	39 21 00 20 	addi    r9,r1,32
    369c:	91 21 00 14 	stw     r9,20(r1)
    36a0:	39 21 00 0c 	addi    r9,r1,12
    36a4:	7d 24 4b 78 	mr      r4,r9
    36a8:	80 61 00 18 	lwz     r3,24(r1)
    36ac:	4b ff ff 19 	bl      35c4 <vprintf>
    36b0:	7c 69 1b 78 	mr      r9,r3
    36b4:	91 21 00 08 	stw     r9,8(r1)
    36b8:	81 21 00 08 	lwz     r9,8(r1)
    36bc:	7d 23 4b 78 	mr      r3,r9
    36c0:	80 01 00 84 	lwz     r0,132(r1)
    36c4:	7c 08 03 a6 	mtlr    r0
    36c8:	38 21 00 80 	addi    r1,r1,128
    36cc:	4e 80 00 20 	blr

Disassembly of section .data:

00012000 <printbuf_ptr>:
   12000:	00 01 c0 00 00 00 00 00                             ........

00012008 <_edata>:
	...

00012020 <tst_info>:
   12020:	69 6e 66 6f 	xori    r14,r11,26223
   12024:	20 74 65 78 	subfic  r3,r20,25976
   12028:	Address 0x0000000000012028 is out of bounds.


0001202a <tst_header>:
   1202a:	68 65 61 64 	xori    r5,r3,24932
   1202e:	65 72 20 74 	oris    r18,r11,8308
   12032:	65 78 74 00 	oris    r24,r11,29696
	...

00012040 <tst_inits>:
   12040:	00 00 00 00 	.long 0x0

00012044 <init_r1>:
   12044:	58 22 c9 05 	rlmi.   r2,r1,r25,4,2

00012048 <init_r2>:
   12048:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001204c <init_r3>:
   1204c:	91 b6 d1 a3 	stw     r13,-11869(r22)

00012050 <init_r4>:
   12050:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012054 <init_r5>:
   12054:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012058 <init_r6>:
   12058:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001205c <init_r7>:
   1205c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012060 <init_r8>:
   12060:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012064 <init_r9>:
   12064:	7e 11 ee 88 	.long 0x7e11ee88

00012068 <init_r10>:
   12068:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001206c <init_r11>:
   1206c:	7f ff ff ff 	.long 0x7fffffff

00012070 <init_r12>:
   12070:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012074 <init_r13>:
   12074:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012078 <init_r14>:
   12078:	8c 20 bd e6 	.long 0x8c20bde6

0001207c <init_r15>:
   1207c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012080 <init_r16>:
   12080:	76 d0 da df 	andis.  r16,r22,56031

00012084 <init_r17>:
   12084:	15 11 1f 42 	.long 0x15111f42

00012088 <init_r18>:
   12088:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001208c <init_r19>:
   1208c:	36 10 8e 50 	addic.  r16,r16,-29104

00012090 <init_r20>:
   12090:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012094 <init_r21>:
   12094:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012098 <init_r22>:
   12098:	32 8a 0c ed 	addic   r20,r10,3309

0001209c <init_r23>:
   1209c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000120a0 <init_r24>:
   120a0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000120a4 <init_r25>:
   120a4:	af 22 4c 19 	lhau    r25,19481(r2)

000120a8 <init_r26>:
   120a8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000120ac <init_r27>:
   120ac:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000120b0 <init_r28>:
   120b0:	d6 24 b2 7a 	stfsu   f17,-19846(r4)

000120b4 <init_r29>:
   120b4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000120b8 <init_r30>:
   120b8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000120bc <init_r31>:
   120bc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000120c0 <init_cr>:
   120c0:	db fd 36 28 	stfd    f31,13864(r29)

000120c4 <init_xer>:
   120c4:	89 f0 00 6e 	lbz     r15,110(r16)

000120c8 <init_ctr>:
   120c8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000120cc <init_lr>:
   120cc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000120d0 <init_tar>:
   120d0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000120d4 <init_msr>:
   120d4:	00 00 11 04 	.long 0x1104

000120d8 <init_iar>:
   120d8:	00 01 00 00 	.long 0x10000

000120dc <save_r1>:
   120dc:	00 00 00 00 	.long 0x0

000120e0 <codelen>:
   120e0:	00 00 00 0d 	.long 0xd

000120e4 <ops>:
   120e4:	7c 61 cc 14 	addco   r3,r1,r25
   120e8:	7d 23 05 95 	addzeo. r9,r3
   120ec:	7a c3 73 92 	rldcr   r3,r22,r14,14
   120f0:	7e 09 4c 11 	subfco. r16,r9,r9
   120f4:	7e 1c b1 15 	adde.   r16,r28,r22
   120f8:	7a 33 88 86 	rldicr  r19,r17,49,2
   120fc:	7c 60 04 d1 	nego.   r3,r0
   12100:	7e 09 b0 38 	and     r9,r16,r22
   12104:	7c 36 05 91 	subfzeo. r1,r22
   12108:	7e 2b 00 d1 	neg.    r17,r11
   1210c:	60 00 00 00 	nop
   12110:	60 00 00 00 	nop
   12114:	60 00 00 00 	nop

00012118 <iars>:
   12118:	00 01 00 00 	.long 0x10000
   1211c:	00 01 00 04 	.long 0x10004
   12120:	00 01 00 08 	.long 0x10008
   12124:	00 01 00 0c 	.long 0x1000c
   12128:	00 01 00 10 	.long 0x10010
   1212c:	00 01 00 14 	.long 0x10014
   12130:	00 01 00 18 	.long 0x10018
   12134:	00 01 00 1c 	.long 0x1001c
   12138:	00 01 00 20 	.long 0x10020
   1213c:	00 01 00 24 	.long 0x10024
   12140:	00 01 00 28 	.long 0x10028
   12144:	00 01 00 2c 	.long 0x1002c
   12148:	00 01 00 30 	.long 0x10030
   1214c:	48 00 00 14 	b       12160 <init_tst>
   12150:	60 00 00 00 	nop
   12154:	60 00 00 00 	nop
   12158:	60 00 00 00 	nop
   1215c:	60 00 00 00 	nop

00012160 <init_tst>:
   12160:	90 23 00 9c 	stw     r1,156(r3)

00012164 <opcopy>:
   12164:	80 23 00 a0 	lwz     r1,160(r3)
   12168:	7c 29 03 a6 	mtctr   r1
   1216c:	38 23 00 a4 	addi    r1,r3,164
   12170:	38 43 00 d8 	addi    r2,r3,216

00012174 <opcopy_loop>:
   12174:	80 81 00 00 	lwz     r4,0(r1)
   12178:	80 a2 00 00 	lwz     r5,0(r2)
   1217c:	90 85 00 00 	stw     r4,0(r5)
   12180:	38 21 00 04 	addi    r1,r1,4
   12184:	38 42 00 04 	addi    r2,r2,4
   12188:	42 00 ff ec 	bdnz    12174 <opcopy_loop>

0001218c <opcopy_eot>:
   1218c:	3c 80 48 00 	lis     r4,18432
   12190:	60 84 00 06 	ori     r4,r4,6
   12194:	90 85 00 00 	stw     r4,0(r5)
   12198:	80 23 00 94 	lwz     r1,148(r3)
   1219c:	7c 3b 03 a6 	mtsrr1  r1
   121a0:	80 23 00 98 	lwz     r1,152(r3)
   121a4:	7c 3a 03 a6 	mtsrr0  r1

000121a8 <init_regs>:
   121a8:	80 23 00 80 	lwz     r1,128(r3)
   121ac:	7c 2f f1 20 	mtcr    r1
   121b0:	80 23 00 84 	lwz     r1,132(r3)
   121b4:	7c 21 03 a6 	mtxer   r1
   121b8:	80 23 00 88 	lwz     r1,136(r3)
   121bc:	7c 29 03 a6 	mtctr   r1
   121c0:	80 23 00 8c 	lwz     r1,140(r3)
   121c4:	7c 28 03 a6 	mtlr    r1
   121c8:	80 23 00 90 	lwz     r1,144(r3)
   121cc:	7c 2f cb a6 	mtspr   815,r1
   121d0:	80 03 00 00 	lwz     r0,0(r3)
   121d4:	80 23 00 04 	lwz     r1,4(r3)
   121d8:	80 43 00 08 	lwz     r2,8(r3)
   121dc:	80 83 00 10 	lwz     r4,16(r3)
   121e0:	80 a3 00 14 	lwz     r5,20(r3)
   121e4:	80 c3 00 18 	lwz     r6,24(r3)
   121e8:	80 e3 00 1c 	lwz     r7,28(r3)
   121ec:	81 03 00 20 	lwz     r8,32(r3)
   121f0:	81 23 00 24 	lwz     r9,36(r3)
   121f4:	81 43 00 28 	lwz     r10,40(r3)
   121f8:	81 63 00 2c 	lwz     r11,44(r3)
   121fc:	81 83 00 30 	lwz     r12,48(r3)
   12200:	81 a3 00 34 	lwz     r13,52(r3)
   12204:	81 c3 00 38 	lwz     r14,56(r3)
   12208:	81 e3 00 3c 	lwz     r15,60(r3)
   1220c:	82 03 00 40 	lwz     r16,64(r3)
   12210:	82 23 00 44 	lwz     r17,68(r3)
   12214:	82 43 00 48 	lwz     r18,72(r3)
   12218:	82 63 00 4c 	lwz     r19,76(r3)
   1221c:	82 83 00 50 	lwz     r20,80(r3)
   12220:	82 a3 00 54 	lwz     r21,84(r3)
   12224:	82 c3 00 58 	lwz     r22,88(r3)
   12228:	82 e3 00 5c 	lwz     r23,92(r3)
   1222c:	83 03 00 60 	lwz     r24,96(r3)
   12230:	83 23 00 64 	lwz     r25,100(r3)
   12234:	83 43 00 68 	lwz     r26,104(r3)
   12238:	83 63 00 6c 	lwz     r27,108(r3)
   1223c:	83 83 00 70 	lwz     r28,112(r3)
   12240:	83 a3 00 74 	lwz     r29,116(r3)
   12244:	83 c3 00 78 	lwz     r30,120(r3)
   12248:	83 e3 00 7c 	lwz     r31,124(r3)
   1224c:	80 63 00 0c 	lwz     r3,12(r3)

00012250 <jmp2tst>:
   12250:	4c 00 00 64 	rfi

00012254 <tst_end>:
   12254:	48 00 00 0c 	b       12260 <save_results>
   12258:	60 00 00 00 	nop
   1225c:	60 00 00 00 	nop

00012260 <save_results>:
   12260:	7c 2f cb a6 	mtspr   815,r1
   12264:	3c 20 00 01 	lis     r1,1
   12268:	60 21 23 40 	ori     r1,r1,9024
   1226c:	90 01 00 00 	stw     r0,0(r1)
   12270:	90 41 00 08 	stw     r2,8(r1)
   12274:	90 61 00 0c 	stw     r3,12(r1)
   12278:	90 81 00 10 	stw     r4,16(r1)
   1227c:	90 a1 00 14 	stw     r5,20(r1)
   12280:	90 c1 00 18 	stw     r6,24(r1)
   12284:	90 e1 00 1c 	stw     r7,28(r1)
   12288:	91 01 00 20 	stw     r8,32(r1)
   1228c:	91 21 00 24 	stw     r9,36(r1)
   12290:	91 41 00 28 	stw     r10,40(r1)
   12294:	91 61 00 2c 	stw     r11,44(r1)
   12298:	91 81 00 30 	stw     r12,48(r1)
   1229c:	91 a1 00 34 	stw     r13,52(r1)
   122a0:	91 c1 00 38 	stw     r14,56(r1)
   122a4:	91 e1 00 3c 	stw     r15,60(r1)
   122a8:	92 01 00 40 	stw     r16,64(r1)
   122ac:	92 21 00 44 	stw     r17,68(r1)
   122b0:	92 41 00 48 	stw     r18,72(r1)
   122b4:	92 61 00 4c 	stw     r19,76(r1)
   122b8:	92 81 00 50 	stw     r20,80(r1)
   122bc:	92 a1 00 54 	stw     r21,84(r1)
   122c0:	92 c1 00 58 	stw     r22,88(r1)
   122c4:	92 e1 00 5c 	stw     r23,92(r1)
   122c8:	93 01 00 60 	stw     r24,96(r1)
   122cc:	93 21 00 64 	stw     r25,100(r1)
   122d0:	93 41 00 68 	stw     r26,104(r1)
   122d4:	93 61 00 6c 	stw     r27,108(r1)
   122d8:	93 81 00 70 	stw     r28,112(r1)
   122dc:	93 a1 00 74 	stw     r29,116(r1)
   122e0:	93 c1 00 78 	stw     r30,120(r1)
   122e4:	93 e1 00 7c 	stw     r31,124(r1)
   122e8:	7c 4f ca a6 	mfspr   r2,815
   122ec:	90 41 00 04 	stw     r2,4(r1)
   122f0:	7c 40 00 26 	mfcr    r2
   122f4:	90 41 00 80 	stw     r2,128(r1)
   122f8:	7c 41 02 a6 	mfxer   r2
   122fc:	90 41 00 84 	stw     r2,132(r1)
   12300:	7c 49 02 a6 	mfctr   r2
   12304:	90 41 00 88 	stw     r2,136(r1)
   12308:	7c 48 02 a6 	mflr    r2
   1230c:	90 41 00 8c 	stw     r2,140(r1)
   12310:	7c 4f ca a6 	mfspr   r2,815
   12314:	90 41 00 90 	stw     r2,144(r1)

00012318 <tst_cleanup>:
   12318:	3c 60 00 01 	lis     r3,1
   1231c:	60 63 20 40 	ori     r3,r3,8256
   12320:	80 23 00 9c 	lwz     r1,156(r3)
   12324:	3c 60 08 67 	lis     r3,2151
   12328:	60 63 53 09 	ori     r3,r3,21257
   1232c:	48 00 0e 13 	bla     e10 <tst_done>
   12330:	60 00 00 00 	nop
   12334:	60 00 00 00 	nop
   12338:	60 00 00 00 	nop
   1233c:	60 00 00 00 	nop

00012340 <tst_results>:
   12340:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012344 <rslt_r1>:
   12344:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012348 <rslt_r2>:
   12348:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001234c <rslt_r3>:
   1234c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012350 <rslt_r4>:
   12350:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012354 <rslt_r5>:
   12354:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012358 <rslt_r6>:
   12358:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001235c <rslt_r7>:
   1235c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012360 <rslt_r8>:
   12360:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012364 <rslt_r9>:
   12364:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012368 <rslt_r10>:
   12368:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001236c <rslt_r11>:
   1236c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012370 <rslt_r12>:
   12370:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012374 <rslt_r13>:
   12374:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012378 <rslt_r14>:
   12378:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001237c <rslt_r15>:
   1237c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012380 <rslt_r16>:
   12380:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012384 <rslt_r17>:
   12384:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012388 <rslt_r18>:
   12388:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001238c <rslt_r19>:
   1238c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012390 <rslt_r20>:
   12390:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012394 <rslt_r21>:
   12394:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012398 <rslt_r22>:
   12398:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001239c <rslt_r23>:
   1239c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123a0 <rslt_r24>:
   123a0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123a4 <rslt_r25>:
   123a4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123a8 <rslt_r26>:
   123a8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123ac <rslt_r27>:
   123ac:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123b0 <rslt_r28>:
   123b0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123b4 <rslt_r29>:
   123b4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123b8 <rslt_r30>:
   123b8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123bc <rslt_r31>:
   123bc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123c0 <rslt_cr>:
   123c0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123c4 <rslt_xer>:
   123c4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123c8 <rslt_ctr>:
   123c8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123cc <rslt_lr>:
   123cc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123d0 <rslt_tar>:
   123d0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31
   123d4:	60 00 00 00 	nop
   123d8:	60 00 00 00 	nop
   123dc:	60 00 00 00 	nop

000123e0 <tst_expects>:
   123e0:	00 00 00 00 	.long 0x0

000123e4 <expt_r1>:
   123e4:	cd 75 f3 13 	lfdu    f11,-3309(r21)

000123e8 <expt_r2>:
   123e8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123ec <expt_r3>:
   123ec:	00 00 00 00 	.long 0x0

000123f0 <expt_r4>:
   123f0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123f4 <expt_r5>:
   123f4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123f8 <expt_r6>:
   123f8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000123fc <expt_r7>:
   123fc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012400 <expt_r8>:
   12400:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012404 <expt_r9>:
   12404:	00 8a 0c 68 	.long 0x8a0c68

00012408 <expt_r10>:
   12408:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001240c <expt_r11>:
   1240c:	7f ff ff ff 	.long 0x7fffffff

00012410 <expt_r12>:
   12410:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012414 <expt_r13>:
   12414:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012418 <expt_r14>:
   12418:	8c 20 bd e6 	.long 0x8c20bde6

0001241c <expt_r15>:
   1241c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012420 <expt_r16>:
   12420:	08 ae bf 68 	tdlgei  r14,-16536

00012424 <expt_r17>:
   12424:	80 00 00 01 	lwz     r0,1(0)

00012428 <expt_r18>:
   12428:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001242c <expt_r19>:
   1242c:	00 00 00 00 	.long 0x0

00012430 <expt_r20>:
   12430:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012434 <expt_r21>:
   12434:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012438 <expt_r22>:
   12438:	32 8a 0c ed 	addic   r20,r10,3309

0001243c <expt_r23>:
   1243c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012440 <expt_r24>:
   12440:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012444 <expt_r25>:
   12444:	af 22 4c 19 	lhau    r25,19481(r2)

00012448 <expt_r26>:
   12448:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001244c <expt_r27>:
   1244c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012450 <expt_r28>:
   12450:	d6 24 b2 7a 	stfsu   f17,-19846(r4)

00012454 <expt_r29>:
   12454:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012458 <expt_r30>:
   12458:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001245c <expt_r31>:
   1245c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012460 <expt_cr>:
   12460:	9b fd 36 28 	stb     r31,13864(r29)

00012464 <expt_xer>:
   12464:	98 f0 00 6e 	stb     r7,110(r16)

00012468 <expt_ctr>:
   12468:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0001246c <expt_lr>:
   1246c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012470 <expt_tar>:
   12470:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00012474 <expt_msr>:
   12474:	00 00 11 04 	.long 0x1104

00012478 <expt_iar>:
   12478:	00 01 00 38 	.long 0x10038


rom:     file format elf32-powerpc


Disassembly of section .kernel:

00000000 <_start>:
   0:	48 00 04 00 	b       400 <boot_start>
   4:	44 00 00 02 	sc
	...

00000020 <int_020>:
  20:	48 00 10 4c 	b       106c <int_unhandled>
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
 120:	48 00 11 94 	b       12b4 <tst_end>
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
     c50:	3d 20 00 00 	lis     r9,0
     c54:	39 29 10 a0 	addi    r9,r9,4256
     c58:	91 21 00 10 	stw     r9,16(r1)
     c5c:	81 21 00 38 	lwz     r9,56(r1)
     c60:	2c 09 00 00 	cmpwi   r9,0
     c64:	41 82 00 0c 	beq     c70 <main+0x3c>
     c68:	39 20 ff ff 	li      r9,-1
     c6c:	48 00 01 cc 	b       e38 <main+0x204>
     c70:	3d 20 00 00 	lis     r9,0
     c74:	39 29 10 70 	addi    r9,r9,4208
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
     cac:	39 29 10 78 	addi    r9,r9,4216
     cb0:	7c 0a 48 40 	cmplw   r10,r9
     cb4:	41 80 ff cc 	blt     c80 <main+0x4c>
     cb8:	3d 20 00 02 	lis     r9,2
     cbc:	39 29 e0 08 	addi    r9,r9,-8184
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
     cec:	3d 20 00 02 	lis     r9,2
     cf0:	39 29 e0 28 	addi    r9,r9,-8152
     cf4:	7c 0a 48 40 	cmplw   r10,r9
     cf8:	41 80 ff d0 	blt     cc8 <main+0x94>
     cfc:	3d 20 00 00 	lis     r9,0
     d00:	38 69 0c 00 	addi    r3,r9,3072
     d04:	48 00 2b 7d 	bl      3880 <console_set_write_hook>
     d08:	38 60 00 77 	li      r3,119
     d0c:	48 00 2b c5 	bl      38d0 <putchar>
     d10:	38 60 00 74 	li      r3,116
     d14:	48 00 2b bd 	bl      38d0 <putchar>
     d18:	38 60 00 66 	li      r3,102
     d1c:	48 00 2b b5 	bl      38d0 <putchar>
     d20:	38 60 00 0a 	li      r3,10
     d24:	48 00 2b ad 	bl      38d0 <putchar>
     d28:	80 81 00 38 	lwz     r4,56(r1)
     d2c:	3d 20 00 00 	lis     r9,0
     d30:	38 69 08 f0 	addi    r3,r9,2288
     d34:	4c c6 31 82 	crclr   4*cr1+eq
     d38:	48 00 2d a1 	bl      3ad8 <printf>
     d3c:	3d 20 03 00 	lis     r9,768
     d40:	91 21 00 34 	stw     r9,52(r1)
     d44:	81 21 00 34 	lwz     r9,52(r1)
     d48:	3c 80 00 00 	lis     r4,0
     d4c:	60 84 00 09 	ori     r4,r4,9
     d50:	7c 93 4b a6 	mtspr   307,r4
     d54:	60 00 00 00 	nop
     d58:	39 20 00 00 	li      r9,0
     d5c:	91 21 00 30 	stw     r9,48(r1)
     d60:	81 21 00 30 	lwz     r9,48(r1)
     d64:	3c 80 00 00 	lis     r4,0
     d68:	60 84 00 09 	ori     r4,r4,9
     d6c:	7c 96 03 a6 	mtdec   r4
     d70:	60 00 00 00 	nop
     d74:	39 20 00 00 	li      r9,0
     d78:	91 21 00 2c 	stw     r9,44(r1)
     d7c:	81 21 00 2c 	lwz     r9,44(r1)
     d80:	3c 80 00 00 	lis     r4,0
     d84:	60 84 00 09 	ori     r4,r4,9
     d88:	7c 9d 43 a6 	mttbu   r4
     d8c:	60 00 00 00 	nop
     d90:	39 20 00 00 	li      r9,0
     d94:	91 21 00 28 	stw     r9,40(r1)
     d98:	81 21 00 28 	lwz     r9,40(r1)
     d9c:	3c 80 00 00 	lis     r4,0
     da0:	60 84 00 09 	ori     r4,r4,9
     da4:	7c 9c 43 a6 	mttbl   r4
     da8:	60 00 00 00 	nop
     dac:	3d 20 fe 00 	lis     r9,-512
     db0:	91 21 00 24 	stw     r9,36(r1)
     db4:	81 21 00 24 	lwz     r9,36(r1)
     db8:	3c 80 00 00 	lis     r4,0
     dbc:	60 84 00 09 	ori     r4,r4,9
     dc0:	7c 90 53 a6 	mtspr   336,r4
     dc4:	60 00 00 00 	nop
     dc8:	7d 36 fa a6 	mfspr   r9,1014
     dcc:	91 21 00 20 	stw     r9,32(r1)
     dd0:	81 21 00 20 	lwz     r9,32(r1)
     dd4:	55 29 05 ac 	rlwinm  r9,r9,0,22,22
     dd8:	91 21 00 1c 	stw     r9,28(r1)
     ddc:	81 21 00 1c 	lwz     r9,28(r1)
     de0:	3c 80 00 00 	lis     r4,0
     de4:	60 84 00 09 	ori     r4,r4,9
     de8:	7c 96 fb a6 	mtspr   1014,r4
     dec:	60 00 00 00 	nop
     df0:	39 20 00 00 	li      r9,0
     df4:	91 21 00 18 	stw     r9,24(r1)
     df8:	81 21 00 18 	lwz     r9,24(r1)
     dfc:	3c 80 00 00 	lis     r4,0
     e00:	60 84 00 09 	ori     r4,r4,9
     e04:	7c 90 53 a6 	mtspr   336,r4
     e08:	60 00 00 00 	nop
     e0c:	39 20 00 00 	li      r9,0
     e10:	91 21 00 14 	stw     r9,20(r1)
     e14:	81 21 00 14 	lwz     r9,20(r1)
     e18:	3c 80 00 00 	lis     r4,0
     e1c:	60 84 00 09 	ori     r4,r4,9
     e20:	7c 94 53 a6 	mtspr   340,r4
     e24:	60 00 00 00 	nop
     e28:	81 21 00 10 	lwz     r9,16(r1)
     e2c:	7d 23 4b 78 	mr      r3,r9
     e30:	48 00 03 90 	b       11c0 <init_tst>
     e34:	48 00 00 00 	b       e34 <main+0x200>
     e38:	7d 23 4b 78 	mr      r3,r9
     e3c:	80 01 00 44 	lwz     r0,68(r1)
     e40:	7c 08 03 a6 	mtlr    r0
     e44:	38 21 00 40 	addi    r1,r1,64
     e48:	4e 80 00 20 	blr

00000e4c <tst_done>:
     e4c:	94 21 ff e0 	stwu    r1,-32(r1)
     e50:	7c 08 02 a6 	mflr    r0
     e54:	90 01 00 24 	stw     r0,36(r1)
     e58:	90 61 00 18 	stw     r3,24(r1)
     e5c:	39 20 00 01 	li      r9,1
     e60:	91 21 00 0c 	stw     r9,12(r1)
     e64:	81 41 00 18 	lwz     r10,24(r1)
     e68:	3d 20 08 67 	lis     r9,2151
     e6c:	61 29 53 09 	ori     r9,r9,21257
     e70:	7c 0a 48 00 	cmpw    r10,r9
     e74:	41 82 00 0c 	beq     e80 <tst_done+0x34>
     e78:	3c 60 80 00 	lis     r3,-32768
     e7c:	4b ff f9 79 	bl      7f4 <tst_fail>
     e80:	39 20 00 00 	li      r9,0
     e84:	91 21 00 08 	stw     r9,8(r1)
     e88:	48 00 00 8c 	b       f14 <tst_done+0xc8>
     e8c:	81 21 00 08 	lwz     r9,8(r1)
     e90:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     e94:	3d 20 00 00 	lis     r9,0
     e98:	39 29 13 a0 	addi    r9,r9,5024
     e9c:	7d 2a 4a 14 	add     r9,r10,r9
     ea0:	81 29 00 00 	lwz     r9,0(r9)
     ea4:	91 21 00 10 	stw     r9,16(r1)
     ea8:	81 21 00 08 	lwz     r9,8(r1)
     eac:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     eb0:	3d 20 00 00 	lis     r9,0
     eb4:	39 29 14 40 	addi    r9,r9,5184
     eb8:	7d 2a 4a 14 	add     r9,r10,r9
     ebc:	81 29 00 00 	lwz     r9,0(r9)
     ec0:	91 21 00 14 	stw     r9,20(r1)
     ec4:	81 21 00 0c 	lwz     r9,12(r1)
     ec8:	2c 09 00 00 	cmpwi   r9,0
     ecc:	41 82 00 1c 	beq     ee8 <tst_done+0x9c>
     ed0:	81 41 00 10 	lwz     r10,16(r1)
     ed4:	81 21 00 14 	lwz     r9,20(r1)
     ed8:	7c 0a 48 00 	cmpw    r10,r9
     edc:	40 82 00 0c 	bne     ee8 <tst_done+0x9c>
     ee0:	39 20 00 01 	li      r9,1
     ee4:	48 00 00 08 	b       eec <tst_done+0xa0>
     ee8:	39 20 00 00 	li      r9,0
     eec:	91 21 00 0c 	stw     r9,12(r1)
     ef0:	81 21 00 0c 	lwz     r9,12(r1)
     ef4:	2c 09 00 00 	cmpwi   r9,0
     ef8:	40 82 00 10 	bne     f08 <tst_done+0xbc>
     efc:	81 21 00 08 	lwz     r9,8(r1)
     f00:	7d 23 4b 78 	mr      r3,r9
     f04:	4b ff f8 f1 	bl      7f4 <tst_fail>
     f08:	81 21 00 08 	lwz     r9,8(r1)
     f0c:	39 29 00 01 	addi    r9,r9,1
     f10:	91 21 00 08 	stw     r9,8(r1)
     f14:	81 21 00 08 	lwz     r9,8(r1)
     f18:	28 09 00 1f 	cmplwi  r9,31
     f1c:	40 81 ff 70 	ble     e8c <tst_done+0x40>
     f20:	39 20 00 21 	li      r9,33
     f24:	91 21 00 08 	stw     r9,8(r1)
     f28:	81 21 00 08 	lwz     r9,8(r1)
     f2c:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     f30:	3d 20 00 00 	lis     r9,0
     f34:	39 29 13 a0 	addi    r9,r9,5024
     f38:	7d 2a 4a 14 	add     r9,r10,r9
     f3c:	81 29 00 00 	lwz     r9,0(r9)
     f40:	91 21 00 10 	stw     r9,16(r1)
     f44:	81 21 00 08 	lwz     r9,8(r1)
     f48:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     f4c:	3d 20 00 00 	lis     r9,0
     f50:	39 29 14 40 	addi    r9,r9,5184
     f54:	7d 2a 4a 14 	add     r9,r10,r9
     f58:	81 29 00 00 	lwz     r9,0(r9)
     f5c:	55 29 06 44 	rlwinm  r9,r9,0,25,2
     f60:	91 21 00 14 	stw     r9,20(r1)
     f64:	81 21 00 0c 	lwz     r9,12(r1)
     f68:	2c 09 00 00 	cmpwi   r9,0
     f6c:	41 82 00 1c 	beq     f88 <tst_done+0x13c>
     f70:	81 41 00 10 	lwz     r10,16(r1)
     f74:	81 21 00 14 	lwz     r9,20(r1)
     f78:	7c 0a 48 00 	cmpw    r10,r9
     f7c:	40 82 00 0c 	bne     f88 <tst_done+0x13c>
     f80:	39 20 00 01 	li      r9,1
     f84:	48 00 00 08 	b       f8c <tst_done+0x140>
     f88:	39 20 00 00 	li      r9,0
     f8c:	91 21 00 0c 	stw     r9,12(r1)
     f90:	81 21 00 0c 	lwz     r9,12(r1)
     f94:	2c 09 00 00 	cmpwi   r9,0
     f98:	40 82 00 10 	bne     fa8 <tst_done+0x15c>
     f9c:	81 21 00 08 	lwz     r9,8(r1)
     fa0:	7d 23 4b 78 	mr      r3,r9
     fa4:	4b ff f8 51 	bl      7f4 <tst_fail>
     fa8:	39 20 00 22 	li      r9,34
     fac:	91 21 00 08 	stw     r9,8(r1)
     fb0:	48 00 00 8c 	b       103c <tst_done+0x1f0>
     fb4:	81 21 00 08 	lwz     r9,8(r1)
     fb8:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     fbc:	3d 20 00 00 	lis     r9,0
     fc0:	39 29 13 a0 	addi    r9,r9,5024
     fc4:	7d 2a 4a 14 	add     r9,r10,r9
     fc8:	81 29 00 00 	lwz     r9,0(r9)
     fcc:	91 21 00 10 	stw     r9,16(r1)
     fd0:	81 21 00 08 	lwz     r9,8(r1)
     fd4:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     fd8:	3d 20 00 00 	lis     r9,0
     fdc:	39 29 14 40 	addi    r9,r9,5184
     fe0:	7d 2a 4a 14 	add     r9,r10,r9
     fe4:	81 29 00 00 	lwz     r9,0(r9)
     fe8:	91 21 00 14 	stw     r9,20(r1)
     fec:	81 21 00 0c 	lwz     r9,12(r1)
     ff0:	2c 09 00 00 	cmpwi   r9,0
     ff4:	41 82 00 1c 	beq     1010 <tst_done+0x1c4>
     ff8:	81 41 00 10 	lwz     r10,16(r1)
     ffc:	81 21 00 14 	lwz     r9,20(r1)
    1000:	7c 0a 48 00 	cmpw    r10,r9
    1004:	40 82 00 0c 	bne     1010 <tst_done+0x1c4>
    1008:	39 20 00 01 	li      r9,1
    100c:	48 00 00 08 	b       1014 <tst_done+0x1c8>
    1010:	39 20 00 00 	li      r9,0
    1014:	91 21 00 0c 	stw     r9,12(r1)
    1018:	81 21 00 0c 	lwz     r9,12(r1)
    101c:	2c 09 00 00 	cmpwi   r9,0
    1020:	40 82 00 10 	bne     1030 <tst_done+0x1e4>
    1024:	81 21 00 08 	lwz     r9,8(r1)
    1028:	7d 23 4b 78 	mr      r3,r9
    102c:	4b ff f7 c9 	bl      7f4 <tst_fail>
    1030:	81 21 00 08 	lwz     r9,8(r1)
    1034:	39 29 00 01 	addi    r9,r9,1
    1038:	91 21 00 08 	stw     r9,8(r1)
    103c:	81 21 00 08 	lwz     r9,8(r1)
    1040:	28 09 00 23 	cmplwi  r9,35
    1044:	40 81 ff 70 	ble     fb4 <tst_done+0x168>
    1048:	4b ff f7 a9 	bl      7f0 <tst_pass>
    104c:	48 00 00 00 	b       104c <tst_done+0x200>

00001050 <int_sc>:
    1050:	94 21 ff f0 	stwu    r1,-16(r1)
    1054:	90 61 00 08 	stw     r3,8(r1)
    1058:	90 81 00 0c 	stw     r4,12(r1)
    105c:	48 00 02 58 	b       12b4 <tst_end>
    1060:	60 00 00 00 	nop
    1064:	38 21 00 10 	addi    r1,r1,16
    1068:	4e 80 00 20 	blr

0000106c <int_unhandled>:
    106c:	48 00 00 00 	b       106c <int_unhandled>

Disassembly of section .arcitst:

00001080 <tst_info>:
    1080:	69 6e 66 6f 	xori    r14,r11,26223
    1084:	20 74 65 78 	subfic  r3,r20,25976
    1088:	Address 0x0000000000001088 is out of bounds.


0000108a <tst_header>:
    108a:	68 65 61 64 	xori    r5,r3,24932
    108e:	65 72 20 74 	oris    r18,r11,8308
    1092:	65 78 74 00 	oris    r24,r11,29696
	...

000010a0 <tst_inits>:
    10a0:	00 00 00 00 	.long 0x0

000010a4 <init_r1>:
    10a4:	58 22 c9 05 	rlmi.   r2,r1,r25,4,2

000010a8 <init_r2>:
    10a8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010ac <init_r3>:
    10ac:	91 b6 d1 a3 	stw     r13,-11869(r22)

000010b0 <init_r4>:
    10b0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010b4 <init_r5>:
    10b4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010b8 <init_r6>:
    10b8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010bc <init_r7>:
    10bc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010c0 <init_r8>:
    10c0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010c4 <init_r9>:
    10c4:	7e 11 ee 88 	.long 0x7e11ee88

000010c8 <init_r10>:
    10c8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010cc <init_r11>:
    10cc:	7f ff ff ff 	.long 0x7fffffff

000010d0 <init_r12>:
    10d0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010d4 <init_r13>:
    10d4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010d8 <init_r14>:
    10d8:	8c 20 bd e6 	.long 0x8c20bde6

000010dc <init_r15>:
    10dc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010e0 <init_r16>:
    10e0:	76 d0 da df 	andis.  r16,r22,56031

000010e4 <init_r17>:
    10e4:	15 11 1f 42 	.long 0x15111f42

000010e8 <init_r18>:
    10e8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010ec <init_r19>:
    10ec:	36 10 8e 50 	addic.  r16,r16,-29104

000010f0 <init_r20>:
    10f0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010f4 <init_r21>:
    10f4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010f8 <init_r22>:
    10f8:	32 8a 0c ed 	addic   r20,r10,3309

000010fc <init_r23>:
    10fc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001100 <init_r24>:
    1100:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001104 <init_r25>:
    1104:	af 22 4c 19 	lhau    r25,19481(r2)

00001108 <init_r26>:
    1108:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000110c <init_r27>:
    110c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001110 <init_r28>:
    1110:	d6 24 b2 7a 	stfsu   f17,-19846(r4)

00001114 <init_r29>:
    1114:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001118 <init_r30>:
    1118:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000111c <init_r31>:
    111c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001120 <init_cr>:
    1120:	db fd 36 28 	stfd    f31,13864(r29)

00001124 <init_xer>:
    1124:	89 f0 00 6e 	lbz     r15,110(r16)

00001128 <init_ctr>:
    1128:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000112c <init_lr>:
    112c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001130 <init_tar>:
    1130:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001134 <init_msr>:
    1134:	00 00 11 04 	.long 0x1104

00001138 <init_iar>:
    1138:	00 01 00 00 	.long 0x10000

0000113c <save_r1>:
    113c:	00 00 00 00 	.long 0x0

00001140 <codelen>:
    1140:	00 00 00 0d 	.long 0xd

00001144 <ops>:
    1144:	7c 61 cc 14 	addco   r3,r1,r25
    1148:	7d 23 05 95 	addzeo. r9,r3
    114c:	7a c3 73 92 	rldcr   r3,r22,r14,14
    1150:	7e 09 4c 11 	subfco. r16,r9,r9
    1154:	7e 1c b1 15 	adde.   r16,r28,r22
    1158:	7a 33 88 86 	rldicr  r19,r17,49,2
    115c:	7c 60 04 d1 	nego.   r3,r0
    1160:	7e 09 b0 38 	and     r9,r16,r22
    1164:	7c 36 05 91 	subfzeo. r1,r22
    1168:	7e 2b 00 d1 	neg.    r17,r11
    116c:	60 00 00 00 	nop
    1170:	60 00 00 00 	nop
    1174:	60 00 00 00 	nop

00001178 <iars>:
    1178:	00 01 00 00 	.long 0x10000
    117c:	00 01 00 04 	.long 0x10004
    1180:	00 01 00 08 	.long 0x10008
    1184:	00 01 00 0c 	.long 0x1000c
    1188:	00 01 00 10 	.long 0x10010
    118c:	00 01 00 14 	.long 0x10014
    1190:	00 01 00 18 	.long 0x10018
    1194:	00 01 00 1c 	.long 0x1001c
    1198:	00 01 00 20 	.long 0x10020
    119c:	00 01 00 24 	.long 0x10024
    11a0:	00 01 00 28 	.long 0x10028
    11a4:	00 01 00 2c 	.long 0x1002c
    11a8:	00 01 00 30 	.long 0x10030
    11ac:	48 00 00 14 	b       11c0 <init_tst>
    11b0:	60 00 00 00 	nop
    11b4:	60 00 00 00 	nop
    11b8:	60 00 00 00 	nop
    11bc:	60 00 00 00 	nop

000011c0 <init_tst>:
    11c0:	90 23 00 9c 	stw     r1,156(r3)

000011c4 <opcopy>:
    11c4:	80 23 00 a0 	lwz     r1,160(r3)
    11c8:	7c 29 03 a6 	mtctr   r1
    11cc:	38 23 00 a4 	addi    r1,r3,164
    11d0:	38 43 00 d8 	addi    r2,r3,216

000011d4 <opcopy_loop>:
    11d4:	80 81 00 00 	lwz     r4,0(r1)
    11d8:	80 a2 00 00 	lwz     r5,0(r2)
    11dc:	90 85 00 00 	stw     r4,0(r5)
    11e0:	38 21 00 04 	addi    r1,r1,4
    11e4:	38 42 00 04 	addi    r2,r2,4
    11e8:	42 00 ff ec 	bdnz    11d4 <opcopy_loop>

000011ec <opcopy_eot>:
    11ec:	3c 80 48 00 	lis     r4,18432
    11f0:	60 84 00 06 	ori     r4,r4,6
    11f4:	90 85 00 00 	stw     r4,0(r5)
    11f8:	80 20 11 34 	lwz     r1,4404(0)
    11fc:	7c 3b 03 a6 	mtsrr1  r1
    1200:	80 20 11 78 	lwz     r1,4472(0)
    1204:	7c 3a 03 a6 	mtsrr0  r1

00001208 <init_regs>:
    1208:	80 23 00 80 	lwz     r1,128(r3)
    120c:	7c 2f f1 20 	mtcr    r1
    1210:	80 23 00 84 	lwz     r1,132(r3)
    1214:	7c 21 03 a6 	mtxer   r1
    1218:	80 23 00 88 	lwz     r1,136(r3)
    121c:	7c 29 03 a6 	mtctr   r1
    1220:	80 23 00 8c 	lwz     r1,140(r3)
    1224:	7c 28 03 a6 	mtlr    r1
    1228:	80 23 00 90 	lwz     r1,144(r3)
    122c:	7c 2f cb a6 	mtspr   815,r1
    1230:	80 03 00 00 	lwz     r0,0(r3)
    1234:	80 23 00 04 	lwz     r1,4(r3)
    1238:	80 43 00 08 	lwz     r2,8(r3)
    123c:	80 83 00 10 	lwz     r4,16(r3)
    1240:	80 a3 00 14 	lwz     r5,20(r3)
    1244:	80 c3 00 18 	lwz     r6,24(r3)
    1248:	80 e3 00 1c 	lwz     r7,28(r3)
    124c:	81 03 00 20 	lwz     r8,32(r3)
    1250:	81 23 00 24 	lwz     r9,36(r3)
    1254:	81 43 00 28 	lwz     r10,40(r3)
    1258:	81 63 00 2c 	lwz     r11,44(r3)
    125c:	81 83 00 30 	lwz     r12,48(r3)
    1260:	81 a3 00 34 	lwz     r13,52(r3)
    1264:	81 c3 00 38 	lwz     r14,56(r3)
    1268:	81 e3 00 3c 	lwz     r15,60(r3)
    126c:	82 03 00 40 	lwz     r16,64(r3)
    1270:	82 23 00 44 	lwz     r17,68(r3)
    1274:	82 43 00 48 	lwz     r18,72(r3)
    1278:	82 63 00 4c 	lwz     r19,76(r3)
    127c:	82 83 00 50 	lwz     r20,80(r3)
    1280:	82 a3 00 54 	lwz     r21,84(r3)
    1284:	82 c3 00 58 	lwz     r22,88(r3)
    1288:	82 e3 00 5c 	lwz     r23,92(r3)
    128c:	83 03 00 60 	lwz     r24,96(r3)
    1290:	83 23 00 64 	lwz     r25,100(r3)
    1294:	83 43 00 68 	lwz     r26,104(r3)
    1298:	83 63 00 6c 	lwz     r27,108(r3)
    129c:	83 83 00 70 	lwz     r28,112(r3)
    12a0:	83 a3 00 74 	lwz     r29,116(r3)
    12a4:	83 c3 00 78 	lwz     r30,120(r3)
    12a8:	83 e3 00 7c 	lwz     r31,124(r3)
    12ac:	80 63 00 0c 	lwz     r3,12(r3)

000012b0 <jmp2tst>:
    12b0:	4c 00 00 64 	rfi

000012b4 <tst_end>:
    12b4:	48 00 00 0c 	b       12c0 <save_results>
    12b8:	60 00 00 00 	nop
    12bc:	60 00 00 00 	nop

000012c0 <save_results>:
    12c0:	7c 2f cb a6 	mtspr   815,r1
    12c4:	3c 20 00 00 	lis     r1,0
    12c8:	60 21 13 a0 	ori     r1,r1,5024
    12cc:	90 01 00 00 	stw     r0,0(r1)
    12d0:	90 41 00 08 	stw     r2,8(r1)
    12d4:	90 61 00 0c 	stw     r3,12(r1)
    12d8:	90 81 00 10 	stw     r4,16(r1)
    12dc:	90 a1 00 14 	stw     r5,20(r1)
    12e0:	90 c1 00 18 	stw     r6,24(r1)
    12e4:	90 e1 00 1c 	stw     r7,28(r1)
    12e8:	91 01 00 20 	stw     r8,32(r1)
    12ec:	91 21 00 24 	stw     r9,36(r1)
    12f0:	91 41 00 28 	stw     r10,40(r1)
    12f4:	91 61 00 2c 	stw     r11,44(r1)
    12f8:	91 81 00 30 	stw     r12,48(r1)
    12fc:	91 a1 00 34 	stw     r13,52(r1)
    1300:	91 c1 00 38 	stw     r14,56(r1)
    1304:	91 e1 00 3c 	stw     r15,60(r1)
    1308:	92 01 00 40 	stw     r16,64(r1)
    130c:	92 21 00 44 	stw     r17,68(r1)
    1310:	92 41 00 48 	stw     r18,72(r1)
    1314:	92 61 00 4c 	stw     r19,76(r1)
    1318:	92 81 00 50 	stw     r20,80(r1)
    131c:	92 a1 00 54 	stw     r21,84(r1)
    1320:	92 c1 00 58 	stw     r22,88(r1)
    1324:	92 e1 00 5c 	stw     r23,92(r1)
    1328:	93 01 00 60 	stw     r24,96(r1)
    132c:	93 21 00 64 	stw     r25,100(r1)
    1330:	93 41 00 68 	stw     r26,104(r1)
    1334:	93 61 00 6c 	stw     r27,108(r1)
    1338:	93 81 00 70 	stw     r28,112(r1)
    133c:	93 a1 00 74 	stw     r29,116(r1)
    1340:	93 c1 00 78 	stw     r30,120(r1)
    1344:	93 e1 00 7c 	stw     r31,124(r1)
    1348:	7c 4f ca a6 	mfspr   r2,815
    134c:	90 41 00 04 	stw     r2,4(r1)
    1350:	7c 40 00 26 	mfcr    r2
    1354:	90 41 00 80 	stw     r2,128(r1)
    1358:	7c 41 02 a6 	mfxer   r2
    135c:	90 41 00 84 	stw     r2,132(r1)
    1360:	7c 49 02 a6 	mfctr   r2
    1364:	90 41 00 88 	stw     r2,136(r1)
    1368:	7c 48 02 a6 	mflr    r2
    136c:	90 41 00 8c 	stw     r2,140(r1)
    1370:	7c 4f ca a6 	mfspr   r2,815
    1374:	90 41 00 90 	stw     r2,144(r1)

00001378 <tst_cleanup>:
    1378:	3c 60 00 00 	lis     r3,0
    137c:	60 63 10 a0 	ori     r3,r3,4256
    1380:	80 23 00 9c 	lwz     r1,156(r3)
    1384:	3c 60 08 67 	lis     r3,2151
    1388:	60 63 53 09 	ori     r3,r3,21257
    138c:	48 00 0e 4f 	bla     e4c <tst_done>
    1390:	60 00 00 00 	nop
    1394:	60 00 00 00 	nop
    1398:	60 00 00 00 	nop
    139c:	60 00 00 00 	nop

000013a0 <tst_results>:
    13a0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013a4 <rslt_r1>:
    13a4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013a8 <rslt_r2>:
    13a8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013ac <rslt_r3>:
    13ac:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013b0 <rslt_r4>:
    13b0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013b4 <rslt_r5>:
    13b4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013b8 <rslt_r6>:
    13b8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013bc <rslt_r7>:
    13bc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013c0 <rslt_r8>:
    13c0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013c4 <rslt_r9>:
    13c4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013c8 <rslt_r10>:
    13c8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013cc <rslt_r11>:
    13cc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013d0 <rslt_r12>:
    13d0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013d4 <rslt_r13>:
    13d4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013d8 <rslt_r14>:
    13d8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013dc <rslt_r15>:
    13dc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013e0 <rslt_r16>:
    13e0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013e4 <rslt_r17>:
    13e4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013e8 <rslt_r18>:
    13e8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013ec <rslt_r19>:
    13ec:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013f0 <rslt_r20>:
    13f0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013f4 <rslt_r21>:
    13f4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013f8 <rslt_r22>:
    13f8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013fc <rslt_r23>:
    13fc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001400 <rslt_r24>:
    1400:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001404 <rslt_r25>:
    1404:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001408 <rslt_r26>:
    1408:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000140c <rslt_r27>:
    140c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001410 <rslt_r28>:
    1410:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001414 <rslt_r29>:
    1414:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001418 <rslt_r30>:
    1418:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000141c <rslt_r31>:
    141c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001420 <rslt_cr>:
    1420:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001424 <rslt_xer>:
    1424:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001428 <rslt_ctr>:
    1428:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000142c <rslt_lr>:
    142c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001430 <rslt_tar>:
    1430:	ff ff ff ff 	fnmadd. f31,f31,f31,f31
    1434:	60 00 00 00 	nop
    1438:	60 00 00 00 	nop
    143c:	60 00 00 00 	nop

00001440 <tst_expects>:
    1440:	00 00 00 00 	.long 0x0

00001444 <expt_r1>:
    1444:	cd 75 f3 13 	lfdu    f11,-3309(r21)

00001448 <expt_r2>:
    1448:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000144c <expt_r3>:
    144c:	00 00 00 00 	.long 0x0

00001450 <expt_r4>:
    1450:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001454 <expt_r5>:
    1454:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001458 <expt_r6>:
    1458:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000145c <expt_r7>:
    145c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001460 <expt_r8>:
    1460:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001464 <expt_r9>:
    1464:	00 8a 0c 68 	.long 0x8a0c68

00001468 <expt_r10>:
    1468:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000146c <expt_r11>:
    146c:	7f ff ff ff 	.long 0x7fffffff

00001470 <expt_r12>:
    1470:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001474 <expt_r13>:
    1474:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001478 <expt_r14>:
    1478:	8c 20 bd e6 	.long 0x8c20bde6

0000147c <expt_r15>:
    147c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001480 <expt_r16>:
    1480:	08 ae bf 68 	tdlgei  r14,-16536

00001484 <expt_r17>:
    1484:	80 00 00 01 	lwz     r0,1(0)

00001488 <expt_r18>:
    1488:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000148c <expt_r19>:
    148c:	00 00 00 00 	.long 0x0

00001490 <expt_r20>:
    1490:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001494 <expt_r21>:
    1494:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001498 <expt_r22>:
    1498:	32 8a 0c ed 	addic   r20,r10,3309

0000149c <expt_r23>:
    149c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000014a0 <expt_r24>:
    14a0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000014a4 <expt_r25>:
    14a4:	af 22 4c 19 	lhau    r25,19481(r2)

000014a8 <expt_r26>:
    14a8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000014ac <expt_r27>:
    14ac:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000014b0 <expt_r28>:
    14b0:	d6 24 b2 7a 	stfsu   f17,-19846(r4)

000014b4 <expt_r29>:
    14b4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000014b8 <expt_r30>:
    14b8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000014bc <expt_r31>:
    14bc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000014c0 <expt_cr>:
    14c0:	9b fd 36 28 	stb     r31,13864(r29)

000014c4 <expt_xer>:
    14c4:	98 f0 00 6e 	stb     r7,110(r16)

000014c8 <expt_ctr>:
    14c8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000014cc <expt_lr>:
    14cc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000014d0 <expt_tar>:
    14d0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000014d4 <expt_msr>:
    14d4:	00 00 11 04 	.long 0x1104

000014d8 <expt_iar>:
    14d8:	00 01 00 38 	.long 0x10038

Disassembly of section .text:

000014dc <__toupper>:
    14dc:	94 21 ff f0 	stwu    r1,-16(r1)
    14e0:	7c 69 1b 78 	mr      r9,r3
    14e4:	99 21 00 08 	stb     r9,8(r1)
    14e8:	89 21 00 08 	lbz     r9,8(r1)
    14ec:	3d 40 00 00 	lis     r10,0
    14f0:	39 4a 09 04 	addi    r10,r10,2308
    14f4:	7d 2a 48 ae 	lbzx    r9,r10,r9
    14f8:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    14fc:	2c 09 00 00 	cmpwi   r9,0
    1500:	41 82 00 10 	beq     1510 <__toupper+0x34>
    1504:	89 21 00 08 	lbz     r9,8(r1)
    1508:	39 29 ff e0 	addi    r9,r9,-32
    150c:	99 21 00 08 	stb     r9,8(r1)
    1510:	89 21 00 08 	lbz     r9,8(r1)
    1514:	7d 23 4b 78 	mr      r3,r9
    1518:	38 21 00 10 	addi    r1,r1,16
    151c:	4e 80 00 20 	blr

00001520 <__bswap_16>:
    1520:	94 21 ff f0 	stwu    r1,-16(r1)
    1524:	7c 69 1b 78 	mr      r9,r3
    1528:	b1 21 00 08 	sth     r9,8(r1)
    152c:	a1 21 00 08 	lhz     r9,8(r1)
    1530:	55 29 40 2e 	rlwinm  r9,r9,8,0,23
    1534:	7d 2a 07 34 	extsh   r10,r9
    1538:	a1 21 00 08 	lhz     r9,8(r1)
    153c:	55 29 c2 3e 	rlwinm  r9,r9,24,8,31
    1540:	55 29 04 3e 	clrlwi  r9,r9,16
    1544:	7d 29 07 34 	extsh   r9,r9
    1548:	7d 49 4b 78 	or      r9,r10,r9
    154c:	7d 29 07 34 	extsh   r9,r9
    1550:	55 29 04 3e 	clrlwi  r9,r9,16
    1554:	7d 23 4b 78 	mr      r3,r9
    1558:	38 21 00 10 	addi    r1,r1,16
    155c:	4e 80 00 20 	blr

00001560 <__bswap_32>:
    1560:	94 21 ff f0 	stwu    r1,-16(r1)
    1564:	90 61 00 08 	stw     r3,8(r1)
    1568:	81 21 00 08 	lwz     r9,8(r1)
    156c:	55 2a 46 3e 	rlwinm  r10,r9,8,24,31
    1570:	81 21 00 08 	lwz     r9,8(r1)
    1574:	55 29 c2 3e 	rlwinm  r9,r9,24,8,31
    1578:	55 29 04 2e 	rlwinm  r9,r9,0,16,23
    157c:	7d 4a 4b 78 	or      r10,r10,r9
    1580:	81 21 00 08 	lwz     r9,8(r1)
    1584:	55 29 40 2e 	rlwinm  r9,r9,8,0,23
    1588:	55 29 02 1e 	rlwinm  r9,r9,0,8,15
    158c:	7d 4a 4b 78 	or      r10,r10,r9
    1590:	81 21 00 08 	lwz     r9,8(r1)
    1594:	55 29 c0 0e 	rlwinm  r9,r9,24,0,7
    1598:	7d 49 4b 78 	or      r9,r10,r9
    159c:	7d 23 4b 78 	mr      r3,r9
    15a0:	38 21 00 10 	addi    r1,r1,16
    15a4:	4e 80 00 20 	blr

000015a8 <strchr>:
    15a8:	94 21 ff f0 	stwu    r1,-16(r1)
    15ac:	90 61 00 08 	stw     r3,8(r1)
    15b0:	90 81 00 0c 	stw     r4,12(r1)
    15b4:	48 00 00 28 	b       15dc <strchr+0x34>
    15b8:	81 21 00 08 	lwz     r9,8(r1)
    15bc:	89 29 00 00 	lbz     r9,0(r9)
    15c0:	2c 09 00 00 	cmpwi   r9,0
    15c4:	40 82 00 0c 	bne     15d0 <strchr+0x28>
    15c8:	39 20 00 00 	li      r9,0
    15cc:	48 00 00 2c 	b       15f8 <strchr+0x50>
    15d0:	81 21 00 08 	lwz     r9,8(r1)
    15d4:	39 29 00 01 	addi    r9,r9,1
    15d8:	91 21 00 08 	stw     r9,8(r1)
    15dc:	81 21 00 08 	lwz     r9,8(r1)
    15e0:	89 49 00 00 	lbz     r10,0(r9)
    15e4:	81 21 00 0c 	lwz     r9,12(r1)
    15e8:	55 29 06 3e 	clrlwi  r9,r9,24
    15ec:	7c 0a 48 40 	cmplw   r10,r9
    15f0:	40 82 ff c8 	bne     15b8 <strchr+0x10>
    15f4:	81 21 00 08 	lwz     r9,8(r1)
    15f8:	7d 23 4b 78 	mr      r3,r9
    15fc:	38 21 00 10 	addi    r1,r1,16
    1600:	4e 80 00 20 	blr

00001604 <strpbrk>:
    1604:	94 21 ff e0 	stwu    r1,-32(r1)
    1608:	90 61 00 18 	stw     r3,24(r1)
    160c:	90 81 00 1c 	stw     r4,28(r1)
    1610:	81 21 00 18 	lwz     r9,24(r1)
    1614:	91 21 00 08 	stw     r9,8(r1)
    1618:	48 00 00 58 	b       1670 <strpbrk+0x6c>
    161c:	81 21 00 1c 	lwz     r9,28(r1)
    1620:	91 21 00 0c 	stw     r9,12(r1)
    1624:	48 00 00 30 	b       1654 <strpbrk+0x50>
    1628:	81 21 00 08 	lwz     r9,8(r1)
    162c:	89 49 00 00 	lbz     r10,0(r9)
    1630:	81 21 00 0c 	lwz     r9,12(r1)
    1634:	89 29 00 00 	lbz     r9,0(r9)
    1638:	7c 0a 48 40 	cmplw   r10,r9
    163c:	40 82 00 0c 	bne     1648 <strpbrk+0x44>
    1640:	81 21 00 08 	lwz     r9,8(r1)
    1644:	48 00 00 40 	b       1684 <strpbrk+0x80>
    1648:	81 21 00 0c 	lwz     r9,12(r1)
    164c:	39 29 00 01 	addi    r9,r9,1
    1650:	91 21 00 0c 	stw     r9,12(r1)
    1654:	81 21 00 0c 	lwz     r9,12(r1)
    1658:	89 29 00 00 	lbz     r9,0(r9)
    165c:	2c 09 00 00 	cmpwi   r9,0
    1660:	40 82 ff c8 	bne     1628 <strpbrk+0x24>
    1664:	81 21 00 08 	lwz     r9,8(r1)
    1668:	39 29 00 01 	addi    r9,r9,1
    166c:	91 21 00 08 	stw     r9,8(r1)
    1670:	81 21 00 08 	lwz     r9,8(r1)
    1674:	89 29 00 00 	lbz     r9,0(r9)
    1678:	2c 09 00 00 	cmpwi   r9,0
    167c:	40 82 ff a0 	bne     161c <strpbrk+0x18>
    1680:	39 20 00 00 	li      r9,0
    1684:	7d 23 4b 78 	mr      r3,r9
    1688:	38 21 00 20 	addi    r1,r1,32
    168c:	4e 80 00 20 	blr

00001690 <strrchr>:
    1690:	94 21 ff e0 	stwu    r1,-32(r1)
    1694:	7c 08 02 a6 	mflr    r0
    1698:	90 01 00 24 	stw     r0,36(r1)
    169c:	90 61 00 18 	stw     r3,24(r1)
    16a0:	90 81 00 1c 	stw     r4,28(r1)
    16a4:	80 61 00 18 	lwz     r3,24(r1)
    16a8:	48 00 03 dd 	bl      1a84 <strlen>
    16ac:	7c 6a 1b 78 	mr      r10,r3
    16b0:	81 21 00 18 	lwz     r9,24(r1)
    16b4:	7d 29 52 14 	add     r9,r9,r10
    16b8:	91 21 00 08 	stw     r9,8(r1)
    16bc:	81 21 00 08 	lwz     r9,8(r1)
    16c0:	89 49 00 00 	lbz     r10,0(r9)
    16c4:	81 21 00 1c 	lwz     r9,28(r1)
    16c8:	55 29 06 3e 	clrlwi  r9,r9,24
    16cc:	7c 0a 48 40 	cmplw   r10,r9
    16d0:	40 82 00 0c 	bne     16dc <strrchr+0x4c>
    16d4:	81 21 00 08 	lwz     r9,8(r1)
    16d8:	48 00 00 24 	b       16fc <strrchr+0x6c>
    16dc:	81 21 00 08 	lwz     r9,8(r1)
    16e0:	39 29 ff ff 	addi    r9,r9,-1
    16e4:	91 21 00 08 	stw     r9,8(r1)
    16e8:	81 41 00 08 	lwz     r10,8(r1)
    16ec:	81 21 00 18 	lwz     r9,24(r1)
    16f0:	7c 0a 48 40 	cmplw   r10,r9
    16f4:	40 80 ff c8 	bge     16bc <strrchr+0x2c>
    16f8:	39 20 00 00 	li      r9,0
    16fc:	7d 23 4b 78 	mr      r3,r9
    1700:	80 01 00 24 	lwz     r0,36(r1)
    1704:	7c 08 03 a6 	mtlr    r0
    1708:	38 21 00 20 	addi    r1,r1,32
    170c:	4e 80 00 20 	blr

00001710 <strnchr>:
    1710:	94 21 ff e0 	stwu    r1,-32(r1)
    1714:	90 61 00 08 	stw     r3,8(r1)
    1718:	90 81 00 0c 	stw     r4,12(r1)
    171c:	90 a1 00 10 	stw     r5,16(r1)
    1720:	48 00 00 30 	b       1750 <strnchr+0x40>
    1724:	81 21 00 08 	lwz     r9,8(r1)
    1728:	89 49 00 00 	lbz     r10,0(r9)
    172c:	81 21 00 10 	lwz     r9,16(r1)
    1730:	55 29 06 3e 	clrlwi  r9,r9,24
    1734:	7c 0a 48 40 	cmplw   r10,r9
    1738:	40 82 00 0c 	bne     1744 <strnchr+0x34>
    173c:	81 21 00 08 	lwz     r9,8(r1)
    1740:	48 00 00 38 	b       1778 <strnchr+0x68>
    1744:	81 21 00 08 	lwz     r9,8(r1)
    1748:	39 29 00 01 	addi    r9,r9,1
    174c:	91 21 00 08 	stw     r9,8(r1)
    1750:	81 21 00 0c 	lwz     r9,12(r1)
    1754:	39 49 ff ff 	addi    r10,r9,-1
    1758:	91 41 00 0c 	stw     r10,12(r1)
    175c:	2c 09 00 00 	cmpwi   r9,0
    1760:	41 82 00 14 	beq     1774 <strnchr+0x64>
    1764:	81 21 00 08 	lwz     r9,8(r1)
    1768:	89 29 00 00 	lbz     r9,0(r9)
    176c:	2c 09 00 00 	cmpwi   r9,0
    1770:	40 82 ff b4 	bne     1724 <strnchr+0x14>
    1774:	39 20 00 00 	li      r9,0
    1778:	7d 23 4b 78 	mr      r3,r9
    177c:	38 21 00 20 	addi    r1,r1,32
    1780:	4e 80 00 20 	blr

00001784 <strcpy>:
    1784:	94 21 ff e0 	stwu    r1,-32(r1)
    1788:	90 61 00 18 	stw     r3,24(r1)
    178c:	90 81 00 1c 	stw     r4,28(r1)
    1790:	81 21 00 18 	lwz     r9,24(r1)
    1794:	91 21 00 08 	stw     r9,8(r1)
    1798:	60 00 00 00 	nop
    179c:	81 41 00 1c 	lwz     r10,28(r1)
    17a0:	39 2a 00 01 	addi    r9,r10,1
    17a4:	91 21 00 1c 	stw     r9,28(r1)
    17a8:	81 21 00 18 	lwz     r9,24(r1)
    17ac:	39 09 00 01 	addi    r8,r9,1
    17b0:	91 01 00 18 	stw     r8,24(r1)
    17b4:	89 4a 00 00 	lbz     r10,0(r10)
    17b8:	99 49 00 00 	stb     r10,0(r9)
    17bc:	89 29 00 00 	lbz     r9,0(r9)
    17c0:	2c 09 00 00 	cmpwi   r9,0
    17c4:	40 82 ff d8 	bne     179c <strcpy+0x18>
    17c8:	81 21 00 08 	lwz     r9,8(r1)
    17cc:	7d 23 4b 78 	mr      r3,r9
    17d0:	38 21 00 20 	addi    r1,r1,32
    17d4:	4e 80 00 20 	blr

000017d8 <strncpy>:
    17d8:	94 21 ff d0 	stwu    r1,-48(r1)
    17dc:	90 61 00 18 	stw     r3,24(r1)
    17e0:	90 81 00 1c 	stw     r4,28(r1)
    17e4:	90 a1 00 20 	stw     r5,32(r1)
    17e8:	81 21 00 18 	lwz     r9,24(r1)
    17ec:	91 21 00 08 	stw     r9,8(r1)
    17f0:	48 00 00 48 	b       1838 <strncpy+0x60>
    17f4:	81 21 00 1c 	lwz     r9,28(r1)
    17f8:	89 49 00 00 	lbz     r10,0(r9)
    17fc:	81 21 00 08 	lwz     r9,8(r1)
    1800:	99 49 00 00 	stb     r10,0(r9)
    1804:	81 21 00 08 	lwz     r9,8(r1)
    1808:	89 29 00 00 	lbz     r9,0(r9)
    180c:	2c 09 00 00 	cmpwi   r9,0
    1810:	41 82 00 10 	beq     1820 <strncpy+0x48>
    1814:	81 21 00 1c 	lwz     r9,28(r1)
    1818:	39 29 00 01 	addi    r9,r9,1
    181c:	91 21 00 1c 	stw     r9,28(r1)
    1820:	81 21 00 08 	lwz     r9,8(r1)
    1824:	39 29 00 01 	addi    r9,r9,1
    1828:	91 21 00 08 	stw     r9,8(r1)
    182c:	81 21 00 20 	lwz     r9,32(r1)
    1830:	39 29 ff ff 	addi    r9,r9,-1
    1834:	91 21 00 20 	stw     r9,32(r1)
    1838:	81 21 00 20 	lwz     r9,32(r1)
    183c:	2c 09 00 00 	cmpwi   r9,0
    1840:	40 82 ff b4 	bne     17f4 <strncpy+0x1c>
    1844:	81 21 00 18 	lwz     r9,24(r1)
    1848:	7d 23 4b 78 	mr      r3,r9
    184c:	38 21 00 30 	addi    r1,r1,48
    1850:	4e 80 00 20 	blr

00001854 <strcmp>:
    1854:	94 21 ff e0 	stwu    r1,-32(r1)
    1858:	90 61 00 18 	stw     r3,24(r1)
    185c:	90 81 00 1c 	stw     r4,28(r1)
    1860:	81 21 00 18 	lwz     r9,24(r1)
    1864:	89 49 00 00 	lbz     r10,0(r9)
    1868:	81 21 00 1c 	lwz     r9,28(r1)
    186c:	39 09 00 01 	addi    r8,r9,1
    1870:	91 01 00 1c 	stw     r8,28(r1)
    1874:	89 29 00 00 	lbz     r9,0(r9)
    1878:	7d 29 50 50 	subf    r9,r9,r10
    187c:	55 29 06 3e 	clrlwi  r9,r9,24
    1880:	99 21 00 08 	stb     r9,8(r1)
    1884:	89 21 00 08 	lbz     r9,8(r1)
    1888:	7d 29 07 74 	extsb   r9,r9
    188c:	2c 09 00 00 	cmpwi   r9,0
    1890:	40 82 00 20 	bne     18b0 <strcmp+0x5c>
    1894:	81 21 00 18 	lwz     r9,24(r1)
    1898:	39 49 00 01 	addi    r10,r9,1
    189c:	91 41 00 18 	stw     r10,24(r1)
    18a0:	89 29 00 00 	lbz     r9,0(r9)
    18a4:	2c 09 00 00 	cmpwi   r9,0
    18a8:	41 82 00 08 	beq     18b0 <strcmp+0x5c>
    18ac:	4b ff ff b4 	b       1860 <strcmp+0xc>
    18b0:	89 21 00 08 	lbz     r9,8(r1)
    18b4:	7d 29 07 74 	extsb   r9,r9
    18b8:	7d 23 4b 78 	mr      r3,r9
    18bc:	38 21 00 20 	addi    r1,r1,32
    18c0:	4e 80 00 20 	blr

000018c4 <strncmp>:
    18c4:	94 21 ff d0 	stwu    r1,-48(r1)
    18c8:	90 61 00 18 	stw     r3,24(r1)
    18cc:	90 81 00 1c 	stw     r4,28(r1)
    18d0:	90 a1 00 20 	stw     r5,32(r1)
    18d4:	39 20 00 00 	li      r9,0
    18d8:	91 21 00 0c 	stw     r9,12(r1)
    18dc:	39 20 00 00 	li      r9,0
    18e0:	99 21 00 08 	stb     r9,8(r1)
    18e4:	48 00 00 5c 	b       1940 <strncmp+0x7c>
    18e8:	81 21 00 18 	lwz     r9,24(r1)
    18ec:	89 49 00 00 	lbz     r10,0(r9)
    18f0:	81 21 00 1c 	lwz     r9,28(r1)
    18f4:	39 09 00 01 	addi    r8,r9,1
    18f8:	91 01 00 1c 	stw     r8,28(r1)
    18fc:	89 29 00 00 	lbz     r9,0(r9)
    1900:	7d 29 50 50 	subf    r9,r9,r10
    1904:	55 29 06 3e 	clrlwi  r9,r9,24
    1908:	99 21 00 08 	stb     r9,8(r1)
    190c:	89 21 00 08 	lbz     r9,8(r1)
    1910:	7d 29 07 74 	extsb   r9,r9
    1914:	2c 09 00 00 	cmpwi   r9,0
    1918:	40 82 00 38 	bne     1950 <strncmp+0x8c>
    191c:	81 21 00 18 	lwz     r9,24(r1)
    1920:	39 49 00 01 	addi    r10,r9,1
    1924:	91 41 00 18 	stw     r10,24(r1)
    1928:	89 29 00 00 	lbz     r9,0(r9)
    192c:	2c 09 00 00 	cmpwi   r9,0
    1930:	41 82 00 20 	beq     1950 <strncmp+0x8c>
    1934:	81 21 00 0c 	lwz     r9,12(r1)
    1938:	39 29 00 01 	addi    r9,r9,1
    193c:	91 21 00 0c 	stw     r9,12(r1)
    1940:	81 41 00 0c 	lwz     r10,12(r1)
    1944:	81 21 00 20 	lwz     r9,32(r1)
    1948:	7c 0a 48 40 	cmplw   r10,r9
    194c:	41 80 ff 9c 	blt     18e8 <strncmp+0x24>
    1950:	89 21 00 08 	lbz     r9,8(r1)
    1954:	7d 29 07 74 	extsb   r9,r9
    1958:	7d 23 4b 78 	mr      r3,r9
    195c:	38 21 00 30 	addi    r1,r1,48
    1960:	4e 80 00 20 	blr

00001964 <strcat>:
    1964:	94 21 ff e0 	stwu    r1,-32(r1)
    1968:	90 61 00 18 	stw     r3,24(r1)
    196c:	90 81 00 1c 	stw     r4,28(r1)
    1970:	81 21 00 18 	lwz     r9,24(r1)
    1974:	91 21 00 08 	stw     r9,8(r1)
    1978:	48 00 00 10 	b       1988 <strcat+0x24>
    197c:	81 21 00 18 	lwz     r9,24(r1)
    1980:	39 29 00 01 	addi    r9,r9,1
    1984:	91 21 00 18 	stw     r9,24(r1)
    1988:	81 21 00 18 	lwz     r9,24(r1)
    198c:	89 29 00 00 	lbz     r9,0(r9)
    1990:	2c 09 00 00 	cmpwi   r9,0
    1994:	40 82 ff e8 	bne     197c <strcat+0x18>
    1998:	60 00 00 00 	nop
    199c:	81 41 00 1c 	lwz     r10,28(r1)
    19a0:	39 2a 00 01 	addi    r9,r10,1
    19a4:	91 21 00 1c 	stw     r9,28(r1)
    19a8:	81 21 00 18 	lwz     r9,24(r1)
    19ac:	39 09 00 01 	addi    r8,r9,1
    19b0:	91 01 00 18 	stw     r8,24(r1)
    19b4:	89 4a 00 00 	lbz     r10,0(r10)
    19b8:	99 49 00 00 	stb     r10,0(r9)
    19bc:	89 29 00 00 	lbz     r9,0(r9)
    19c0:	2c 09 00 00 	cmpwi   r9,0
    19c4:	40 82 ff d8 	bne     199c <strcat+0x38>
    19c8:	81 21 00 08 	lwz     r9,8(r1)
    19cc:	7d 23 4b 78 	mr      r3,r9
    19d0:	38 21 00 20 	addi    r1,r1,32
    19d4:	4e 80 00 20 	blr

000019d8 <strncat>:
    19d8:	94 21 ff d0 	stwu    r1,-48(r1)
    19dc:	90 61 00 18 	stw     r3,24(r1)
    19e0:	90 81 00 1c 	stw     r4,28(r1)
    19e4:	90 a1 00 20 	stw     r5,32(r1)
    19e8:	81 21 00 18 	lwz     r9,24(r1)
    19ec:	91 21 00 08 	stw     r9,8(r1)
    19f0:	81 21 00 20 	lwz     r9,32(r1)
    19f4:	2c 09 00 00 	cmpwi   r9,0
    19f8:	41 82 00 7c 	beq     1a74 <strncat+0x9c>
    19fc:	48 00 00 10 	b       1a0c <strncat+0x34>
    1a00:	81 21 00 18 	lwz     r9,24(r1)
    1a04:	39 29 00 01 	addi    r9,r9,1
    1a08:	91 21 00 18 	stw     r9,24(r1)
    1a0c:	81 21 00 18 	lwz     r9,24(r1)
    1a10:	89 29 00 00 	lbz     r9,0(r9)
    1a14:	2c 09 00 00 	cmpwi   r9,0
    1a18:	40 82 ff e8 	bne     1a00 <strncat+0x28>
    1a1c:	48 00 00 2c 	b       1a48 <strncat+0x70>
    1a20:	81 21 00 20 	lwz     r9,32(r1)
    1a24:	39 29 ff ff 	addi    r9,r9,-1
    1a28:	91 21 00 20 	stw     r9,32(r1)
    1a2c:	81 21 00 20 	lwz     r9,32(r1)
    1a30:	2c 09 00 00 	cmpwi   r9,0
    1a34:	40 82 00 14 	bne     1a48 <strncat+0x70>
    1a38:	81 21 00 18 	lwz     r9,24(r1)
    1a3c:	39 40 00 00 	li      r10,0
    1a40:	99 49 00 00 	stb     r10,0(r9)
    1a44:	48 00 00 30 	b       1a74 <strncat+0x9c>
    1a48:	81 41 00 1c 	lwz     r10,28(r1)
    1a4c:	39 2a 00 01 	addi    r9,r10,1
    1a50:	91 21 00 1c 	stw     r9,28(r1)
    1a54:	81 21 00 18 	lwz     r9,24(r1)
    1a58:	39 09 00 01 	addi    r8,r9,1
    1a5c:	91 01 00 18 	stw     r8,24(r1)
    1a60:	89 4a 00 00 	lbz     r10,0(r10)
    1a64:	99 49 00 00 	stb     r10,0(r9)
    1a68:	89 29 00 00 	lbz     r9,0(r9)
    1a6c:	2c 09 00 00 	cmpwi   r9,0
    1a70:	40 82 ff b0 	bne     1a20 <strncat+0x48>
    1a74:	81 21 00 08 	lwz     r9,8(r1)
    1a78:	7d 23 4b 78 	mr      r3,r9
    1a7c:	38 21 00 30 	addi    r1,r1,48
    1a80:	4e 80 00 20 	blr

00001a84 <strlen>:
    1a84:	94 21 ff e0 	stwu    r1,-32(r1)
    1a88:	90 61 00 18 	stw     r3,24(r1)
    1a8c:	81 21 00 18 	lwz     r9,24(r1)
    1a90:	91 21 00 08 	stw     r9,8(r1)
    1a94:	48 00 00 10 	b       1aa4 <strlen+0x20>
    1a98:	81 21 00 08 	lwz     r9,8(r1)
    1a9c:	39 29 00 01 	addi    r9,r9,1
    1aa0:	91 21 00 08 	stw     r9,8(r1)
    1aa4:	81 21 00 08 	lwz     r9,8(r1)
    1aa8:	89 29 00 00 	lbz     r9,0(r9)
    1aac:	2c 09 00 00 	cmpwi   r9,0
    1ab0:	40 82 ff e8 	bne     1a98 <strlen+0x14>
    1ab4:	81 41 00 08 	lwz     r10,8(r1)
    1ab8:	81 21 00 18 	lwz     r9,24(r1)
    1abc:	7d 29 50 50 	subf    r9,r9,r10
    1ac0:	7d 23 4b 78 	mr      r3,r9
    1ac4:	38 21 00 20 	addi    r1,r1,32
    1ac8:	4e 80 00 20 	blr

00001acc <strnlen>:
    1acc:	94 21 ff e0 	stwu    r1,-32(r1)
    1ad0:	90 61 00 18 	stw     r3,24(r1)
    1ad4:	90 81 00 1c 	stw     r4,28(r1)
    1ad8:	81 21 00 18 	lwz     r9,24(r1)
    1adc:	91 21 00 08 	stw     r9,8(r1)
    1ae0:	48 00 00 10 	b       1af0 <strnlen+0x24>
    1ae4:	81 21 00 08 	lwz     r9,8(r1)
    1ae8:	39 29 00 01 	addi    r9,r9,1
    1aec:	91 21 00 08 	stw     r9,8(r1)
    1af0:	81 21 00 1c 	lwz     r9,28(r1)
    1af4:	39 49 ff ff 	addi    r10,r9,-1
    1af8:	91 41 00 1c 	stw     r10,28(r1)
    1afc:	2c 09 00 00 	cmpwi   r9,0
    1b00:	41 82 00 14 	beq     1b14 <strnlen+0x48>
    1b04:	81 21 00 08 	lwz     r9,8(r1)
    1b08:	89 29 00 00 	lbz     r9,0(r9)
    1b0c:	2c 09 00 00 	cmpwi   r9,0
    1b10:	40 82 ff d4 	bne     1ae4 <strnlen+0x18>
    1b14:	81 41 00 08 	lwz     r10,8(r1)
    1b18:	81 21 00 18 	lwz     r9,24(r1)
    1b1c:	7d 29 50 50 	subf    r9,r9,r10
    1b20:	7d 23 4b 78 	mr      r3,r9
    1b24:	38 21 00 20 	addi    r1,r1,32
    1b28:	4e 80 00 20 	blr

00001b2c <strspn>:
    1b2c:	94 21 ff e0 	stwu    r1,-32(r1)
    1b30:	90 61 00 18 	stw     r3,24(r1)
    1b34:	90 81 00 1c 	stw     r4,28(r1)
    1b38:	39 20 00 00 	li      r9,0
    1b3c:	91 21 00 10 	stw     r9,16(r1)
    1b40:	81 21 00 18 	lwz     r9,24(r1)
    1b44:	91 21 00 08 	stw     r9,8(r1)
    1b48:	48 00 00 7c 	b       1bc4 <strspn+0x98>
    1b4c:	81 21 00 1c 	lwz     r9,28(r1)
    1b50:	91 21 00 0c 	stw     r9,12(r1)
    1b54:	48 00 00 28 	b       1b7c <strspn+0x50>
    1b58:	81 21 00 08 	lwz     r9,8(r1)
    1b5c:	89 49 00 00 	lbz     r10,0(r9)
    1b60:	81 21 00 0c 	lwz     r9,12(r1)
    1b64:	89 29 00 00 	lbz     r9,0(r9)
    1b68:	7c 0a 48 40 	cmplw   r10,r9
    1b6c:	41 82 00 24 	beq     1b90 <strspn+0x64>
    1b70:	81 21 00 0c 	lwz     r9,12(r1)
    1b74:	39 29 00 01 	addi    r9,r9,1
    1b78:	91 21 00 0c 	stw     r9,12(r1)
    1b7c:	81 21 00 0c 	lwz     r9,12(r1)
    1b80:	89 29 00 00 	lbz     r9,0(r9)
    1b84:	2c 09 00 00 	cmpwi   r9,0
    1b88:	40 82 ff d0 	bne     1b58 <strspn+0x2c>
    1b8c:	48 00 00 08 	b       1b94 <strspn+0x68>
    1b90:	60 00 00 00 	nop
    1b94:	81 21 00 0c 	lwz     r9,12(r1)
    1b98:	89 29 00 00 	lbz     r9,0(r9)
    1b9c:	2c 09 00 00 	cmpwi   r9,0
    1ba0:	40 82 00 0c 	bne     1bac <strspn+0x80>
    1ba4:	81 21 00 10 	lwz     r9,16(r1)
    1ba8:	48 00 00 30 	b       1bd8 <strspn+0xac>
    1bac:	81 21 00 10 	lwz     r9,16(r1)
    1bb0:	39 29 00 01 	addi    r9,r9,1
    1bb4:	91 21 00 10 	stw     r9,16(r1)
    1bb8:	81 21 00 08 	lwz     r9,8(r1)
    1bbc:	39 29 00 01 	addi    r9,r9,1
    1bc0:	91 21 00 08 	stw     r9,8(r1)
    1bc4:	81 21 00 08 	lwz     r9,8(r1)
    1bc8:	89 29 00 00 	lbz     r9,0(r9)
    1bcc:	2c 09 00 00 	cmpwi   r9,0
    1bd0:	40 82 ff 7c 	bne     1b4c <strspn+0x20>
    1bd4:	81 21 00 10 	lwz     r9,16(r1)
    1bd8:	7d 23 4b 78 	mr      r3,r9
    1bdc:	38 21 00 20 	addi    r1,r1,32
    1be0:	4e 80 00 20 	blr

00001be4 <memcmp>:
    1be4:	94 21 ff d0 	stwu    r1,-48(r1)
    1be8:	90 61 00 18 	stw     r3,24(r1)
    1bec:	90 81 00 1c 	stw     r4,28(r1)
    1bf0:	90 a1 00 20 	stw     r5,32(r1)
    1bf4:	39 20 00 00 	li      r9,0
    1bf8:	91 21 00 10 	stw     r9,16(r1)
    1bfc:	81 21 00 18 	lwz     r9,24(r1)
    1c00:	91 21 00 08 	stw     r9,8(r1)
    1c04:	81 21 00 1c 	lwz     r9,28(r1)
    1c08:	91 21 00 0c 	stw     r9,12(r1)
    1c0c:	48 00 00 50 	b       1c5c <memcmp+0x78>
    1c10:	81 21 00 08 	lwz     r9,8(r1)
    1c14:	89 29 00 00 	lbz     r9,0(r9)
    1c18:	7d 2a 4b 78 	mr      r10,r9
    1c1c:	81 21 00 0c 	lwz     r9,12(r1)
    1c20:	89 29 00 00 	lbz     r9,0(r9)
    1c24:	7d 29 50 50 	subf    r9,r9,r10
    1c28:	91 21 00 10 	stw     r9,16(r1)
    1c2c:	81 21 00 10 	lwz     r9,16(r1)
    1c30:	2c 09 00 00 	cmpwi   r9,0
    1c34:	40 82 00 38 	bne     1c6c <memcmp+0x88>
    1c38:	81 21 00 08 	lwz     r9,8(r1)
    1c3c:	39 29 00 01 	addi    r9,r9,1
    1c40:	91 21 00 08 	stw     r9,8(r1)
    1c44:	81 21 00 0c 	lwz     r9,12(r1)
    1c48:	39 29 00 01 	addi    r9,r9,1
    1c4c:	91 21 00 0c 	stw     r9,12(r1)
    1c50:	81 21 00 20 	lwz     r9,32(r1)
    1c54:	39 29 ff ff 	addi    r9,r9,-1
    1c58:	91 21 00 20 	stw     r9,32(r1)
    1c5c:	81 21 00 20 	lwz     r9,32(r1)
    1c60:	2c 09 00 00 	cmpwi   r9,0
    1c64:	40 82 ff ac 	bne     1c10 <memcmp+0x2c>
    1c68:	48 00 00 08 	b       1c70 <memcmp+0x8c>
    1c6c:	60 00 00 00 	nop
    1c70:	81 21 00 10 	lwz     r9,16(r1)
    1c74:	7d 23 4b 78 	mr      r3,r9
    1c78:	38 21 00 30 	addi    r1,r1,48
    1c7c:	4e 80 00 20 	blr

00001c80 <memset>:
    1c80:	94 21 ff d0 	stwu    r1,-48(r1)
    1c84:	90 61 00 18 	stw     r3,24(r1)
    1c88:	90 81 00 1c 	stw     r4,28(r1)
    1c8c:	90 a1 00 20 	stw     r5,32(r1)
    1c90:	81 21 00 18 	lwz     r9,24(r1)
    1c94:	91 21 00 08 	stw     r9,8(r1)
    1c98:	48 00 00 1c 	b       1cb4 <memset+0x34>
    1c9c:	81 21 00 08 	lwz     r9,8(r1)
    1ca0:	39 49 00 01 	addi    r10,r9,1
    1ca4:	91 41 00 08 	stw     r10,8(r1)
    1ca8:	81 41 00 1c 	lwz     r10,28(r1)
    1cac:	55 4a 06 3e 	clrlwi  r10,r10,24
    1cb0:	99 49 00 00 	stb     r10,0(r9)
    1cb4:	81 21 00 20 	lwz     r9,32(r1)
    1cb8:	39 49 ff ff 	addi    r10,r9,-1
    1cbc:	91 41 00 20 	stw     r10,32(r1)
    1cc0:	2c 09 00 00 	cmpwi   r9,0
    1cc4:	40 82 ff d8 	bne     1c9c <memset+0x1c>
    1cc8:	81 21 00 18 	lwz     r9,24(r1)
    1ccc:	7d 23 4b 78 	mr      r3,r9
    1cd0:	38 21 00 30 	addi    r1,r1,48
    1cd4:	4e 80 00 20 	blr

00001cd8 <memcpy>:
    1cd8:	94 21 ff d0 	stwu    r1,-48(r1)
    1cdc:	90 61 00 18 	stw     r3,24(r1)
    1ce0:	90 81 00 1c 	stw     r4,28(r1)
    1ce4:	90 a1 00 20 	stw     r5,32(r1)
    1ce8:	81 21 00 18 	lwz     r9,24(r1)
    1cec:	91 21 00 08 	stw     r9,8(r1)
    1cf0:	81 21 00 1c 	lwz     r9,28(r1)
    1cf4:	91 21 00 0c 	stw     r9,12(r1)
    1cf8:	48 00 00 24 	b       1d1c <memcpy+0x44>
    1cfc:	81 41 00 0c 	lwz     r10,12(r1)
    1d00:	39 2a 00 01 	addi    r9,r10,1
    1d04:	91 21 00 0c 	stw     r9,12(r1)
    1d08:	81 21 00 08 	lwz     r9,8(r1)
    1d0c:	39 09 00 01 	addi    r8,r9,1
    1d10:	91 01 00 08 	stw     r8,8(r1)
    1d14:	89 4a 00 00 	lbz     r10,0(r10)
    1d18:	99 49 00 00 	stb     r10,0(r9)
    1d1c:	81 21 00 20 	lwz     r9,32(r1)
    1d20:	39 49 ff ff 	addi    r10,r9,-1
    1d24:	91 41 00 20 	stw     r10,32(r1)
    1d28:	2c 09 00 00 	cmpwi   r9,0
    1d2c:	40 82 ff d0 	bne     1cfc <memcpy+0x24>
    1d30:	81 21 00 18 	lwz     r9,24(r1)
    1d34:	7d 23 4b 78 	mr      r3,r9
    1d38:	38 21 00 30 	addi    r1,r1,48
    1d3c:	4e 80 00 20 	blr

00001d40 <memmove>:
    1d40:	94 21 ff d0 	stwu    r1,-48(r1)
    1d44:	90 61 00 18 	stw     r3,24(r1)
    1d48:	90 81 00 1c 	stw     r4,28(r1)
    1d4c:	90 a1 00 20 	stw     r5,32(r1)
    1d50:	81 41 00 18 	lwz     r10,24(r1)
    1d54:	81 21 00 1c 	lwz     r9,28(r1)
    1d58:	7c 0a 48 40 	cmplw   r10,r9
    1d5c:	41 81 00 50 	bgt     1dac <memmove+0x6c>
    1d60:	81 21 00 18 	lwz     r9,24(r1)
    1d64:	91 21 00 08 	stw     r9,8(r1)
    1d68:	81 21 00 1c 	lwz     r9,28(r1)
    1d6c:	91 21 00 0c 	stw     r9,12(r1)
    1d70:	48 00 00 24 	b       1d94 <memmove+0x54>
    1d74:	81 41 00 0c 	lwz     r10,12(r1)
    1d78:	39 2a 00 01 	addi    r9,r10,1
    1d7c:	91 21 00 0c 	stw     r9,12(r1)
    1d80:	81 21 00 08 	lwz     r9,8(r1)
    1d84:	39 09 00 01 	addi    r8,r9,1
    1d88:	91 01 00 08 	stw     r8,8(r1)
    1d8c:	89 4a 00 00 	lbz     r10,0(r10)
    1d90:	99 49 00 00 	stb     r10,0(r9)
    1d94:	81 21 00 20 	lwz     r9,32(r1)
    1d98:	39 49 ff ff 	addi    r10,r9,-1
    1d9c:	91 41 00 20 	stw     r10,32(r1)
    1da0:	2c 09 00 00 	cmpwi   r9,0
    1da4:	40 82 ff d0 	bne     1d74 <memmove+0x34>
    1da8:	48 00 00 64 	b       1e0c <memmove+0xcc>
    1dac:	81 41 00 18 	lwz     r10,24(r1)
    1db0:	81 21 00 20 	lwz     r9,32(r1)
    1db4:	7d 2a 4a 14 	add     r9,r10,r9
    1db8:	91 21 00 08 	stw     r9,8(r1)
    1dbc:	81 41 00 1c 	lwz     r10,28(r1)
    1dc0:	81 21 00 20 	lwz     r9,32(r1)
    1dc4:	7d 2a 4a 14 	add     r9,r10,r9
    1dc8:	91 21 00 0c 	stw     r9,12(r1)
    1dcc:	48 00 00 2c 	b       1df8 <memmove+0xb8>
    1dd0:	81 21 00 0c 	lwz     r9,12(r1)
    1dd4:	39 29 ff ff 	addi    r9,r9,-1
    1dd8:	91 21 00 0c 	stw     r9,12(r1)
    1ddc:	81 21 00 08 	lwz     r9,8(r1)
    1de0:	39 29 ff ff 	addi    r9,r9,-1
    1de4:	91 21 00 08 	stw     r9,8(r1)
    1de8:	81 21 00 0c 	lwz     r9,12(r1)
    1dec:	89 49 00 00 	lbz     r10,0(r9)
    1df0:	81 21 00 08 	lwz     r9,8(r1)
    1df4:	99 49 00 00 	stb     r10,0(r9)
    1df8:	81 21 00 20 	lwz     r9,32(r1)
    1dfc:	39 49 ff ff 	addi    r10,r9,-1
    1e00:	91 41 00 20 	stw     r10,32(r1)
    1e04:	2c 09 00 00 	cmpwi   r9,0
    1e08:	40 82 ff c8 	bne     1dd0 <memmove+0x90>
    1e0c:	81 21 00 18 	lwz     r9,24(r1)
    1e10:	7d 23 4b 78 	mr      r3,r9
    1e14:	38 21 00 30 	addi    r1,r1,48
    1e18:	4e 80 00 20 	blr

00001e1c <strstr>:
    1e1c:	94 21 ff e0 	stwu    r1,-32(r1)
    1e20:	7c 08 02 a6 	mflr    r0
    1e24:	90 01 00 24 	stw     r0,36(r1)
    1e28:	90 61 00 18 	stw     r3,24(r1)
    1e2c:	90 81 00 1c 	stw     r4,28(r1)
    1e30:	80 61 00 1c 	lwz     r3,28(r1)
    1e34:	4b ff fc 51 	bl      1a84 <strlen>
    1e38:	7c 69 1b 78 	mr      r9,r3
    1e3c:	91 21 00 0c 	stw     r9,12(r1)
    1e40:	81 21 00 0c 	lwz     r9,12(r1)
    1e44:	2c 09 00 00 	cmpwi   r9,0
    1e48:	40 82 00 0c 	bne     1e54 <strstr+0x38>
    1e4c:	81 21 00 18 	lwz     r9,24(r1)
    1e50:	48 00 00 68 	b       1eb8 <strstr+0x9c>
    1e54:	80 61 00 18 	lwz     r3,24(r1)
    1e58:	4b ff fc 2d 	bl      1a84 <strlen>
    1e5c:	7c 69 1b 78 	mr      r9,r3
    1e60:	91 21 00 08 	stw     r9,8(r1)
    1e64:	48 00 00 40 	b       1ea4 <strstr+0x88>
    1e68:	81 21 00 08 	lwz     r9,8(r1)
    1e6c:	39 29 ff ff 	addi    r9,r9,-1
    1e70:	91 21 00 08 	stw     r9,8(r1)
    1e74:	80 a1 00 0c 	lwz     r5,12(r1)
    1e78:	80 81 00 1c 	lwz     r4,28(r1)
    1e7c:	80 61 00 18 	lwz     r3,24(r1)
    1e80:	4b ff fd 65 	bl      1be4 <memcmp>
    1e84:	7c 69 1b 78 	mr      r9,r3
    1e88:	2c 09 00 00 	cmpwi   r9,0
    1e8c:	40 82 00 0c 	bne     1e98 <strstr+0x7c>
    1e90:	81 21 00 18 	lwz     r9,24(r1)
    1e94:	48 00 00 24 	b       1eb8 <strstr+0x9c>
    1e98:	81 21 00 18 	lwz     r9,24(r1)
    1e9c:	39 29 00 01 	addi    r9,r9,1
    1ea0:	91 21 00 18 	stw     r9,24(r1)
    1ea4:	81 41 00 08 	lwz     r10,8(r1)
    1ea8:	81 21 00 0c 	lwz     r9,12(r1)
    1eac:	7c 0a 48 40 	cmplw   r10,r9
    1eb0:	40 80 ff b8 	bge     1e68 <strstr+0x4c>
    1eb4:	39 20 00 00 	li      r9,0
    1eb8:	7d 23 4b 78 	mr      r3,r9
    1ebc:	80 01 00 24 	lwz     r0,36(r1)
    1ec0:	7c 08 03 a6 	mtlr    r0
    1ec4:	38 21 00 20 	addi    r1,r1,32
    1ec8:	4e 80 00 20 	blr

00001ecc <memchr>:
    1ecc:	94 21 ff d0 	stwu    r1,-48(r1)
    1ed0:	90 61 00 18 	stw     r3,24(r1)
    1ed4:	90 81 00 1c 	stw     r4,28(r1)
    1ed8:	90 a1 00 20 	stw     r5,32(r1)
    1edc:	81 21 00 18 	lwz     r9,24(r1)
    1ee0:	91 21 00 08 	stw     r9,8(r1)
    1ee4:	48 00 00 30 	b       1f14 <memchr+0x48>
    1ee8:	81 21 00 1c 	lwz     r9,28(r1)
    1eec:	55 2a 06 3e 	clrlwi  r10,r9,24
    1ef0:	81 21 00 08 	lwz     r9,8(r1)
    1ef4:	39 09 00 01 	addi    r8,r9,1
    1ef8:	91 01 00 08 	stw     r8,8(r1)
    1efc:	89 29 00 00 	lbz     r9,0(r9)
    1f00:	7c 0a 48 40 	cmplw   r10,r9
    1f04:	40 82 00 10 	bne     1f14 <memchr+0x48>
    1f08:	81 21 00 08 	lwz     r9,8(r1)
    1f0c:	39 29 ff ff 	addi    r9,r9,-1
    1f10:	48 00 00 1c 	b       1f2c <memchr+0x60>
    1f14:	81 21 00 20 	lwz     r9,32(r1)
    1f18:	39 49 ff ff 	addi    r10,r9,-1
    1f1c:	91 41 00 20 	stw     r10,32(r1)
    1f20:	2c 09 00 00 	cmpwi   r9,0
    1f24:	40 82 ff c4 	bne     1ee8 <memchr+0x1c>
    1f28:	39 20 00 00 	li      r9,0
    1f2c:	7d 23 4b 78 	mr      r3,r9
    1f30:	38 21 00 30 	addi    r1,r1,48
    1f34:	4e 80 00 20 	blr

00001f38 <strtoul>:
    1f38:	94 21 ff d0 	stwu    r1,-48(r1)
    1f3c:	7c 08 02 a6 	mflr    r0
    1f40:	90 01 00 34 	stw     r0,52(r1)
    1f44:	90 61 00 18 	stw     r3,24(r1)
    1f48:	90 81 00 1c 	stw     r4,28(r1)
    1f4c:	90 a1 00 20 	stw     r5,32(r1)
    1f50:	39 20 00 00 	li      r9,0
    1f54:	91 21 00 08 	stw     r9,8(r1)
    1f58:	81 21 00 20 	lwz     r9,32(r1)
    1f5c:	2c 09 00 00 	cmpwi   r9,0
    1f60:	40 82 00 8c 	bne     1fec <strtoul+0xb4>
    1f64:	39 20 00 0a 	li      r9,10
    1f68:	91 21 00 20 	stw     r9,32(r1)
    1f6c:	81 21 00 18 	lwz     r9,24(r1)
    1f70:	89 29 00 00 	lbz     r9,0(r9)
    1f74:	28 09 00 30 	cmplwi  r9,48
    1f78:	40 82 00 e4 	bne     205c <strtoul+0x124>
    1f7c:	39 20 00 08 	li      r9,8
    1f80:	91 21 00 20 	stw     r9,32(r1)
    1f84:	81 21 00 18 	lwz     r9,24(r1)
    1f88:	39 29 00 01 	addi    r9,r9,1
    1f8c:	91 21 00 18 	stw     r9,24(r1)
    1f90:	81 21 00 18 	lwz     r9,24(r1)
    1f94:	89 29 00 00 	lbz     r9,0(r9)
    1f98:	7d 23 4b 78 	mr      r3,r9
    1f9c:	4b ff f5 41 	bl      14dc <__toupper>
    1fa0:	7c 69 1b 78 	mr      r9,r3
    1fa4:	28 09 00 58 	cmplwi  r9,88
    1fa8:	40 82 00 b4 	bne     205c <strtoul+0x124>
    1fac:	81 21 00 18 	lwz     r9,24(r1)
    1fb0:	39 29 00 01 	addi    r9,r9,1
    1fb4:	89 29 00 00 	lbz     r9,0(r9)
    1fb8:	7d 2a 4b 78 	mr      r10,r9
    1fbc:	3d 20 00 00 	lis     r9,0
    1fc0:	39 29 09 04 	addi    r9,r9,2308
    1fc4:	7d 29 50 ae 	lbzx    r9,r9,r10
    1fc8:	71 29 00 44 	andi.   r9,r9,68
    1fcc:	2c 09 00 00 	cmpwi   r9,0
    1fd0:	41 82 00 8c 	beq     205c <strtoul+0x124>
    1fd4:	81 21 00 18 	lwz     r9,24(r1)
    1fd8:	39 29 00 01 	addi    r9,r9,1
    1fdc:	91 21 00 18 	stw     r9,24(r1)
    1fe0:	39 20 00 10 	li      r9,16
    1fe4:	91 21 00 20 	stw     r9,32(r1)
    1fe8:	48 00 00 74 	b       205c <strtoul+0x124>
    1fec:	81 21 00 20 	lwz     r9,32(r1)
    1ff0:	2c 09 00 10 	cmpwi   r9,16
    1ff4:	40 82 00 68 	bne     205c <strtoul+0x124>
    1ff8:	81 21 00 18 	lwz     r9,24(r1)
    1ffc:	89 29 00 00 	lbz     r9,0(r9)
    2000:	28 09 00 30 	cmplwi  r9,48
    2004:	40 82 00 58 	bne     205c <strtoul+0x124>
    2008:	81 21 00 18 	lwz     r9,24(r1)
    200c:	39 29 00 01 	addi    r9,r9,1
    2010:	89 29 00 00 	lbz     r9,0(r9)
    2014:	7d 23 4b 78 	mr      r3,r9
    2018:	4b ff f4 c5 	bl      14dc <__toupper>
    201c:	7c 69 1b 78 	mr      r9,r3
    2020:	28 09 00 58 	cmplwi  r9,88
    2024:	40 82 00 38 	bne     205c <strtoul+0x124>
    2028:	81 21 00 18 	lwz     r9,24(r1)
    202c:	39 29 00 02 	addi    r9,r9,2
    2030:	91 21 00 18 	stw     r9,24(r1)
    2034:	48 00 00 28 	b       205c <strtoul+0x124>
    2038:	81 41 00 08 	lwz     r10,8(r1)
    203c:	81 21 00 20 	lwz     r9,32(r1)
    2040:	7d 2a 49 d6 	mullw   r9,r10,r9
    2044:	81 41 00 0c 	lwz     r10,12(r1)
    2048:	7d 2a 4a 14 	add     r9,r10,r9
    204c:	91 21 00 08 	stw     r9,8(r1)
    2050:	81 21 00 18 	lwz     r9,24(r1)
    2054:	39 29 00 01 	addi    r9,r9,1
    2058:	91 21 00 18 	stw     r9,24(r1)
    205c:	81 21 00 18 	lwz     r9,24(r1)
    2060:	89 29 00 00 	lbz     r9,0(r9)
    2064:	7d 2a 4b 78 	mr      r10,r9
    2068:	3d 20 00 00 	lis     r9,0
    206c:	39 29 09 04 	addi    r9,r9,2308
    2070:	7d 29 50 ae 	lbzx    r9,r9,r10
    2074:	71 29 00 44 	andi.   r9,r9,68
    2078:	2c 09 00 00 	cmpwi   r9,0
    207c:	41 82 00 64 	beq     20e0 <strtoul+0x1a8>
    2080:	81 21 00 18 	lwz     r9,24(r1)
    2084:	89 29 00 00 	lbz     r9,0(r9)
    2088:	7d 2a 4b 78 	mr      r10,r9
    208c:	3d 20 00 00 	lis     r9,0
    2090:	39 29 09 04 	addi    r9,r9,2308
    2094:	7d 29 50 ae 	lbzx    r9,r9,r10
    2098:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    209c:	2c 09 00 00 	cmpwi   r9,0
    20a0:	41 82 00 14 	beq     20b4 <strtoul+0x17c>
    20a4:	81 21 00 18 	lwz     r9,24(r1)
    20a8:	89 29 00 00 	lbz     r9,0(r9)
    20ac:	39 29 ff d0 	addi    r9,r9,-48
    20b0:	48 00 00 1c 	b       20cc <strtoul+0x194>
    20b4:	81 21 00 18 	lwz     r9,24(r1)
    20b8:	89 29 00 00 	lbz     r9,0(r9)
    20bc:	7d 23 4b 78 	mr      r3,r9
    20c0:	4b ff f4 1d 	bl      14dc <__toupper>
    20c4:	7c 69 1b 78 	mr      r9,r3
    20c8:	39 29 ff c9 	addi    r9,r9,-55
    20cc:	91 21 00 0c 	stw     r9,12(r1)
    20d0:	81 41 00 0c 	lwz     r10,12(r1)
    20d4:	81 21 00 20 	lwz     r9,32(r1)
    20d8:	7c 0a 48 40 	cmplw   r10,r9
    20dc:	41 80 ff 5c 	blt     2038 <strtoul+0x100>
    20e0:	81 21 00 1c 	lwz     r9,28(r1)
    20e4:	2c 09 00 00 	cmpwi   r9,0
    20e8:	41 82 00 10 	beq     20f8 <strtoul+0x1c0>
    20ec:	81 21 00 1c 	lwz     r9,28(r1)
    20f0:	81 41 00 18 	lwz     r10,24(r1)
    20f4:	91 49 00 00 	stw     r10,0(r9)
    20f8:	81 21 00 08 	lwz     r9,8(r1)
    20fc:	7d 23 4b 78 	mr      r3,r9
    2100:	80 01 00 34 	lwz     r0,52(r1)
    2104:	7c 08 03 a6 	mtlr    r0
    2108:	38 21 00 30 	addi    r1,r1,48
    210c:	4e 80 00 20 	blr

00002110 <strtol>:
    2110:	94 21 ff e0 	stwu    r1,-32(r1)
    2114:	7c 08 02 a6 	mflr    r0
    2118:	90 01 00 24 	stw     r0,36(r1)
    211c:	90 61 00 08 	stw     r3,8(r1)
    2120:	90 81 00 0c 	stw     r4,12(r1)
    2124:	90 a1 00 10 	stw     r5,16(r1)
    2128:	81 21 00 08 	lwz     r9,8(r1)
    212c:	89 29 00 00 	lbz     r9,0(r9)
    2130:	28 09 00 2d 	cmplwi  r9,45
    2134:	40 82 00 2c 	bne     2160 <strtol+0x50>
    2138:	81 21 00 08 	lwz     r9,8(r1)
    213c:	39 29 00 01 	addi    r9,r9,1
    2140:	81 41 00 10 	lwz     r10,16(r1)
    2144:	7d 45 53 78 	mr      r5,r10
    2148:	80 81 00 0c 	lwz     r4,12(r1)
    214c:	7d 23 4b 78 	mr      r3,r9
    2150:	4b ff fd e9 	bl      1f38 <strtoul>
    2154:	7c 69 1b 78 	mr      r9,r3
    2158:	7d 29 00 d0 	neg     r9,r9
    215c:	48 00 00 1c 	b       2178 <strtol+0x68>
    2160:	81 21 00 10 	lwz     r9,16(r1)
    2164:	7d 25 4b 78 	mr      r5,r9
    2168:	80 81 00 0c 	lwz     r4,12(r1)
    216c:	80 61 00 08 	lwz     r3,8(r1)
    2170:	4b ff fd c9 	bl      1f38 <strtoul>
    2174:	7c 69 1b 78 	mr      r9,r3
    2178:	7d 23 4b 78 	mr      r3,r9
    217c:	80 01 00 24 	lwz     r0,36(r1)
    2180:	7c 08 03 a6 	mtlr    r0
    2184:	38 21 00 20 	addi    r1,r1,32
    2188:	4e 80 00 20 	blr

0000218c <skip_atoi>:
    218c:	94 21 ff e0 	stwu    r1,-32(r1)
    2190:	90 61 00 18 	stw     r3,24(r1)
    2194:	39 20 00 00 	li      r9,0
    2198:	91 21 00 08 	stw     r9,8(r1)
    219c:	48 00 00 30 	b       21cc <skip_atoi+0x40>
    21a0:	81 21 00 08 	lwz     r9,8(r1)
    21a4:	1d 49 00 0a 	mulli   r10,r9,10
    21a8:	81 21 00 18 	lwz     r9,24(r1)
    21ac:	81 29 00 00 	lwz     r9,0(r9)
    21b0:	38 e9 00 01 	addi    r7,r9,1
    21b4:	81 01 00 18 	lwz     r8,24(r1)
    21b8:	90 e8 00 00 	stw     r7,0(r8)
    21bc:	89 29 00 00 	lbz     r9,0(r9)
    21c0:	7d 2a 4a 14 	add     r9,r10,r9
    21c4:	39 29 ff d0 	addi    r9,r9,-48
    21c8:	91 21 00 08 	stw     r9,8(r1)
    21cc:	81 21 00 18 	lwz     r9,24(r1)
    21d0:	81 29 00 00 	lwz     r9,0(r9)
    21d4:	89 29 00 00 	lbz     r9,0(r9)
    21d8:	7d 2a 4b 78 	mr      r10,r9
    21dc:	3d 20 00 00 	lis     r9,0
    21e0:	39 29 09 04 	addi    r9,r9,2308
    21e4:	7d 29 50 ae 	lbzx    r9,r9,r10
    21e8:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    21ec:	2c 09 00 00 	cmpwi   r9,0
    21f0:	40 82 ff b0 	bne     21a0 <skip_atoi+0x14>
    21f4:	81 21 00 08 	lwz     r9,8(r1)
    21f8:	7d 23 4b 78 	mr      r3,r9
    21fc:	38 21 00 20 	addi    r1,r1,32
    2200:	4e 80 00 20 	blr

00002204 <number>:
    2204:	94 21 ff 70 	stwu    r1,-144(r1)
    2208:	90 61 00 68 	stw     r3,104(r1)
    220c:	90 81 00 6c 	stw     r4,108(r1)
    2210:	90 a1 00 70 	stw     r5,112(r1)
    2214:	90 c1 00 74 	stw     r6,116(r1)
    2218:	90 e1 00 78 	stw     r7,120(r1)
    221c:	91 01 00 7c 	stw     r8,124(r1)
    2220:	91 21 00 80 	stw     r9,128(r1)
    2224:	81 21 00 80 	lwz     r9,128(r1)
    2228:	55 29 06 72 	rlwinm  r9,r9,0,25,25
    222c:	2c 09 00 00 	cmpwi   r9,0
    2230:	41 82 00 10 	beq     2240 <number+0x3c>
    2234:	3d 20 00 00 	lis     r9,0
    2238:	39 29 0a 10 	addi    r9,r9,2576
    223c:	48 00 00 0c 	b       2248 <number+0x44>
    2240:	3d 20 00 00 	lis     r9,0
    2244:	39 29 0a 38 	addi    r9,r9,2616
    2248:	91 21 00 10 	stw     r9,16(r1)
    224c:	81 21 00 80 	lwz     r9,128(r1)
    2250:	55 29 06 f6 	rlwinm  r9,r9,0,27,27
    2254:	2c 09 00 00 	cmpwi   r9,0
    2258:	41 82 00 10 	beq     2268 <number+0x64>
    225c:	81 21 00 80 	lwz     r9,128(r1)
    2260:	55 29 00 3c 	rlwinm  r9,r9,0,0,30
    2264:	91 21 00 80 	stw     r9,128(r1)
    2268:	81 21 00 74 	lwz     r9,116(r1)
    226c:	2c 09 00 01 	cmpwi   r9,1
    2270:	40 81 00 10 	ble     2280 <number+0x7c>
    2274:	81 21 00 74 	lwz     r9,116(r1)
    2278:	2c 09 00 24 	cmpwi   r9,36
    227c:	40 81 00 0c 	ble     2288 <number+0x84>
    2280:	39 20 00 00 	li      r9,0
    2284:	48 00 03 fc 	b       2680 <number+0x47c>
    2288:	81 21 00 80 	lwz     r9,128(r1)
    228c:	55 29 07 fe 	clrlwi  r9,r9,31
    2290:	2c 09 00 00 	cmpwi   r9,0
    2294:	41 82 00 0c 	beq     22a0 <number+0x9c>
    2298:	39 20 00 30 	li      r9,48
    229c:	48 00 00 08 	b       22a4 <number+0xa0>
    22a0:	39 20 00 20 	li      r9,32
    22a4:	99 21 00 14 	stb     r9,20(r1)
    22a8:	39 20 00 00 	li      r9,0
    22ac:	99 21 00 08 	stb     r9,8(r1)
    22b0:	81 21 00 80 	lwz     r9,128(r1)
    22b4:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    22b8:	2c 09 00 00 	cmpwi   r9,0
    22bc:	41 82 00 80 	beq     233c <number+0x138>
    22c0:	81 21 00 70 	lwz     r9,112(r1)
    22c4:	2c 09 00 00 	cmpwi   r9,0
    22c8:	40 80 00 28 	bge     22f0 <number+0xec>
    22cc:	39 20 00 2d 	li      r9,45
    22d0:	99 21 00 08 	stb     r9,8(r1)
    22d4:	81 21 00 70 	lwz     r9,112(r1)
    22d8:	7d 29 00 d0 	neg     r9,r9
    22dc:	91 21 00 70 	stw     r9,112(r1)
    22e0:	81 21 00 78 	lwz     r9,120(r1)
    22e4:	39 29 ff ff 	addi    r9,r9,-1
    22e8:	91 21 00 78 	stw     r9,120(r1)
    22ec:	48 00 00 50 	b       233c <number+0x138>
    22f0:	81 21 00 80 	lwz     r9,128(r1)
    22f4:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    22f8:	2c 09 00 00 	cmpwi   r9,0
    22fc:	41 82 00 1c 	beq     2318 <number+0x114>
    2300:	39 20 00 2b 	li      r9,43
    2304:	99 21 00 08 	stb     r9,8(r1)
    2308:	81 21 00 78 	lwz     r9,120(r1)
    230c:	39 29 ff ff 	addi    r9,r9,-1
    2310:	91 21 00 78 	stw     r9,120(r1)
    2314:	48 00 00 28 	b       233c <number+0x138>
    2318:	81 21 00 80 	lwz     r9,128(r1)
    231c:	55 29 07 38 	rlwinm  r9,r9,0,28,28
    2320:	2c 09 00 00 	cmpwi   r9,0
    2324:	41 82 00 18 	beq     233c <number+0x138>
    2328:	39 20 00 20 	li      r9,32
    232c:	99 21 00 08 	stb     r9,8(r1)
    2330:	81 21 00 78 	lwz     r9,120(r1)
    2334:	39 29 ff ff 	addi    r9,r9,-1
    2338:	91 21 00 78 	stw     r9,120(r1)
    233c:	81 21 00 80 	lwz     r9,128(r1)
    2340:	55 29 06 b4 	rlwinm  r9,r9,0,26,26
    2344:	2c 09 00 00 	cmpwi   r9,0
    2348:	41 82 00 38 	beq     2380 <number+0x17c>
    234c:	81 21 00 74 	lwz     r9,116(r1)
    2350:	2c 09 00 10 	cmpwi   r9,16
    2354:	40 82 00 14 	bne     2368 <number+0x164>
    2358:	81 21 00 78 	lwz     r9,120(r1)
    235c:	39 29 ff fe 	addi    r9,r9,-2
    2360:	91 21 00 78 	stw     r9,120(r1)
    2364:	48 00 00 1c 	b       2380 <number+0x17c>
    2368:	81 21 00 74 	lwz     r9,116(r1)
    236c:	2c 09 00 08 	cmpwi   r9,8
    2370:	40 82 00 10 	bne     2380 <number+0x17c>
    2374:	81 21 00 78 	lwz     r9,120(r1)
    2378:	39 29 ff ff 	addi    r9,r9,-1
    237c:	91 21 00 78 	stw     r9,120(r1)
    2380:	39 20 00 00 	li      r9,0
    2384:	91 21 00 0c 	stw     r9,12(r1)
    2388:	81 21 00 70 	lwz     r9,112(r1)
    238c:	2c 09 00 00 	cmpwi   r9,0
    2390:	40 82 00 6c 	bne     23fc <number+0x1f8>
    2394:	81 21 00 0c 	lwz     r9,12(r1)
    2398:	39 49 00 01 	addi    r10,r9,1
    239c:	91 41 00 0c 	stw     r10,12(r1)
    23a0:	39 41 00 08 	addi    r10,r1,8
    23a4:	7d 2a 4a 14 	add     r9,r10,r9
    23a8:	39 40 00 30 	li      r10,48
    23ac:	99 49 00 10 	stb     r10,16(r9)
    23b0:	48 00 00 58 	b       2408 <number+0x204>
    23b4:	81 41 00 74 	lwz     r10,116(r1)
    23b8:	81 21 00 70 	lwz     r9,112(r1)
    23bc:	7d 09 53 96 	divwu   r8,r9,r10
    23c0:	7d 48 51 d6 	mullw   r10,r8,r10
    23c4:	7d 2a 48 50 	subf    r9,r10,r9
    23c8:	81 41 00 10 	lwz     r10,16(r1)
    23cc:	7d 4a 4a 14 	add     r10,r10,r9
    23d0:	81 21 00 0c 	lwz     r9,12(r1)
    23d4:	39 09 00 01 	addi    r8,r9,1
    23d8:	91 01 00 0c 	stw     r8,12(r1)
    23dc:	89 4a 00 00 	lbz     r10,0(r10)
    23e0:	39 01 00 08 	addi    r8,r1,8
    23e4:	7d 28 4a 14 	add     r9,r8,r9
    23e8:	99 49 00 10 	stb     r10,16(r9)
    23ec:	81 21 00 74 	lwz     r9,116(r1)
    23f0:	81 41 00 70 	lwz     r10,112(r1)
    23f4:	7d 2a 4b 96 	divwu   r9,r10,r9
    23f8:	91 21 00 70 	stw     r9,112(r1)
    23fc:	81 21 00 70 	lwz     r9,112(r1)
    2400:	2c 09 00 00 	cmpwi   r9,0
    2404:	40 82 ff b0 	bne     23b4 <number+0x1b0>
    2408:	81 41 00 0c 	lwz     r10,12(r1)
    240c:	81 21 00 7c 	lwz     r9,124(r1)
    2410:	7c 0a 48 00 	cmpw    r10,r9
    2414:	40 81 00 0c 	ble     2420 <number+0x21c>
    2418:	81 21 00 0c 	lwz     r9,12(r1)
    241c:	91 21 00 7c 	stw     r9,124(r1)
    2420:	81 41 00 78 	lwz     r10,120(r1)
    2424:	81 21 00 7c 	lwz     r9,124(r1)
    2428:	7d 29 50 50 	subf    r9,r9,r10
    242c:	91 21 00 78 	stw     r9,120(r1)
    2430:	81 21 00 80 	lwz     r9,128(r1)
    2434:	71 29 00 11 	andi.   r9,r9,17
    2438:	2c 09 00 00 	cmpwi   r9,0
    243c:	40 82 00 44 	bne     2480 <number+0x27c>
    2440:	48 00 00 2c 	b       246c <number+0x268>
    2444:	81 41 00 68 	lwz     r10,104(r1)
    2448:	81 21 00 6c 	lwz     r9,108(r1)
    244c:	7c 0a 48 40 	cmplw   r10,r9
    2450:	40 80 00 10 	bge     2460 <number+0x25c>
    2454:	81 21 00 68 	lwz     r9,104(r1)
    2458:	39 40 00 20 	li      r10,32
    245c:	99 49 00 00 	stb     r10,0(r9)
    2460:	81 21 00 68 	lwz     r9,104(r1)
    2464:	39 29 00 01 	addi    r9,r9,1
    2468:	91 21 00 68 	stw     r9,104(r1)
    246c:	81 21 00 78 	lwz     r9,120(r1)
    2470:	39 49 ff ff 	addi    r10,r9,-1
    2474:	91 41 00 78 	stw     r10,120(r1)
    2478:	2c 09 00 00 	cmpwi   r9,0
    247c:	41 81 ff c8 	bgt     2444 <number+0x240>
    2480:	89 21 00 08 	lbz     r9,8(r1)
    2484:	2c 09 00 00 	cmpwi   r9,0
    2488:	41 82 00 2c 	beq     24b4 <number+0x2b0>
    248c:	81 41 00 68 	lwz     r10,104(r1)
    2490:	81 21 00 6c 	lwz     r9,108(r1)
    2494:	7c 0a 48 40 	cmplw   r10,r9
    2498:	40 80 00 10 	bge     24a8 <number+0x2a4>
    249c:	81 21 00 68 	lwz     r9,104(r1)
    24a0:	89 41 00 08 	lbz     r10,8(r1)
    24a4:	99 49 00 00 	stb     r10,0(r9)
    24a8:	81 21 00 68 	lwz     r9,104(r1)
    24ac:	39 29 00 01 	addi    r9,r9,1
    24b0:	91 21 00 68 	stw     r9,104(r1)
    24b4:	81 21 00 80 	lwz     r9,128(r1)
    24b8:	55 29 06 b4 	rlwinm  r9,r9,0,26,26
    24bc:	2c 09 00 00 	cmpwi   r9,0
    24c0:	41 82 00 9c 	beq     255c <number+0x358>
    24c4:	81 21 00 74 	lwz     r9,116(r1)
    24c8:	2c 09 00 08 	cmpwi   r9,8
    24cc:	40 82 00 30 	bne     24fc <number+0x2f8>
    24d0:	81 41 00 68 	lwz     r10,104(r1)
    24d4:	81 21 00 6c 	lwz     r9,108(r1)
    24d8:	7c 0a 48 40 	cmplw   r10,r9
    24dc:	40 80 00 10 	bge     24ec <number+0x2e8>
    24e0:	81 21 00 68 	lwz     r9,104(r1)
    24e4:	39 40 00 30 	li      r10,48
    24e8:	99 49 00 00 	stb     r10,0(r9)
    24ec:	81 21 00 68 	lwz     r9,104(r1)
    24f0:	39 29 00 01 	addi    r9,r9,1
    24f4:	91 21 00 68 	stw     r9,104(r1)
    24f8:	48 00 00 64 	b       255c <number+0x358>
    24fc:	81 21 00 74 	lwz     r9,116(r1)
    2500:	2c 09 00 10 	cmpwi   r9,16
    2504:	40 82 00 58 	bne     255c <number+0x358>
    2508:	81 41 00 68 	lwz     r10,104(r1)
    250c:	81 21 00 6c 	lwz     r9,108(r1)
    2510:	7c 0a 48 40 	cmplw   r10,r9
    2514:	40 80 00 10 	bge     2524 <number+0x320>
    2518:	81 21 00 68 	lwz     r9,104(r1)
    251c:	39 40 00 30 	li      r10,48
    2520:	99 49 00 00 	stb     r10,0(r9)
    2524:	81 21 00 68 	lwz     r9,104(r1)
    2528:	39 29 00 01 	addi    r9,r9,1
    252c:	91 21 00 68 	stw     r9,104(r1)
    2530:	81 41 00 68 	lwz     r10,104(r1)
    2534:	81 21 00 6c 	lwz     r9,108(r1)
    2538:	7c 0a 48 40 	cmplw   r10,r9
    253c:	40 80 00 14 	bge     2550 <number+0x34c>
    2540:	81 21 00 10 	lwz     r9,16(r1)
    2544:	89 49 00 21 	lbz     r10,33(r9)
    2548:	81 21 00 68 	lwz     r9,104(r1)
    254c:	99 49 00 00 	stb     r10,0(r9)
    2550:	81 21 00 68 	lwz     r9,104(r1)
    2554:	39 29 00 01 	addi    r9,r9,1
    2558:	91 21 00 68 	stw     r9,104(r1)
    255c:	81 21 00 80 	lwz     r9,128(r1)
    2560:	55 29 06 f6 	rlwinm  r9,r9,0,27,27
    2564:	2c 09 00 00 	cmpwi   r9,0
    2568:	40 82 00 70 	bne     25d8 <number+0x3d4>
    256c:	48 00 00 2c 	b       2598 <number+0x394>
    2570:	81 41 00 68 	lwz     r10,104(r1)
    2574:	81 21 00 6c 	lwz     r9,108(r1)
    2578:	7c 0a 48 40 	cmplw   r10,r9
    257c:	40 80 00 10 	bge     258c <number+0x388>
    2580:	81 21 00 68 	lwz     r9,104(r1)
    2584:	89 41 00 14 	lbz     r10,20(r1)
    2588:	99 49 00 00 	stb     r10,0(r9)
    258c:	81 21 00 68 	lwz     r9,104(r1)
    2590:	39 29 00 01 	addi    r9,r9,1
    2594:	91 21 00 68 	stw     r9,104(r1)
    2598:	81 21 00 78 	lwz     r9,120(r1)
    259c:	39 49 ff ff 	addi    r10,r9,-1
    25a0:	91 41 00 78 	stw     r10,120(r1)
    25a4:	2c 09 00 00 	cmpwi   r9,0
    25a8:	41 81 ff c8 	bgt     2570 <number+0x36c>
    25ac:	48 00 00 2c 	b       25d8 <number+0x3d4>
    25b0:	81 41 00 68 	lwz     r10,104(r1)
    25b4:	81 21 00 6c 	lwz     r9,108(r1)
    25b8:	7c 0a 48 40 	cmplw   r10,r9
    25bc:	40 80 00 10 	bge     25cc <number+0x3c8>
    25c0:	81 21 00 68 	lwz     r9,104(r1)
    25c4:	39 40 00 30 	li      r10,48
    25c8:	99 49 00 00 	stb     r10,0(r9)
    25cc:	81 21 00 68 	lwz     r9,104(r1)
    25d0:	39 29 00 01 	addi    r9,r9,1
    25d4:	91 21 00 68 	stw     r9,104(r1)
    25d8:	81 21 00 7c 	lwz     r9,124(r1)
    25dc:	39 49 ff ff 	addi    r10,r9,-1
    25e0:	91 41 00 7c 	stw     r10,124(r1)
    25e4:	81 41 00 0c 	lwz     r10,12(r1)
    25e8:	7c 0a 48 00 	cmpw    r10,r9
    25ec:	41 80 ff c4 	blt     25b0 <number+0x3ac>
    25f0:	48 00 00 38 	b       2628 <number+0x424>
    25f4:	81 41 00 68 	lwz     r10,104(r1)
    25f8:	81 21 00 6c 	lwz     r9,108(r1)
    25fc:	7c 0a 48 40 	cmplw   r10,r9
    2600:	40 80 00 1c 	bge     261c <number+0x418>
    2604:	39 41 00 18 	addi    r10,r1,24
    2608:	81 21 00 0c 	lwz     r9,12(r1)
    260c:	7d 2a 4a 14 	add     r9,r10,r9
    2610:	89 49 00 00 	lbz     r10,0(r9)
    2614:	81 21 00 68 	lwz     r9,104(r1)
    2618:	99 49 00 00 	stb     r10,0(r9)
    261c:	81 21 00 68 	lwz     r9,104(r1)
    2620:	39 29 00 01 	addi    r9,r9,1
    2624:	91 21 00 68 	stw     r9,104(r1)
    2628:	81 21 00 0c 	lwz     r9,12(r1)
    262c:	39 49 ff ff 	addi    r10,r9,-1
    2630:	91 41 00 0c 	stw     r10,12(r1)
    2634:	2c 09 00 00 	cmpwi   r9,0
    2638:	41 81 ff bc 	bgt     25f4 <number+0x3f0>
    263c:	48 00 00 2c 	b       2668 <number+0x464>
    2640:	81 41 00 68 	lwz     r10,104(r1)
    2644:	81 21 00 6c 	lwz     r9,108(r1)
    2648:	7c 0a 48 40 	cmplw   r10,r9
    264c:	40 80 00 10 	bge     265c <number+0x458>
    2650:	81 21 00 68 	lwz     r9,104(r1)
    2654:	39 40 00 20 	li      r10,32
    2658:	99 49 00 00 	stb     r10,0(r9)
    265c:	81 21 00 68 	lwz     r9,104(r1)
    2660:	39 29 00 01 	addi    r9,r9,1
    2664:	91 21 00 68 	stw     r9,104(r1)
    2668:	81 21 00 78 	lwz     r9,120(r1)
    266c:	39 49 ff ff 	addi    r10,r9,-1
    2670:	91 41 00 78 	stw     r10,120(r1)
    2674:	2c 09 00 00 	cmpwi   r9,0
    2678:	41 81 ff c8 	bgt     2640 <number+0x43c>
    267c:	81 21 00 68 	lwz     r9,104(r1)
    2680:	7d 23 4b 78 	mr      r3,r9
    2684:	38 21 00 90 	addi    r1,r1,144
    2688:	4e 80 00 20 	blr

0000268c <vscnprintf>:
    268c:	94 21 ff d0 	stwu    r1,-48(r1)
    2690:	7c 08 02 a6 	mflr    r0
    2694:	90 01 00 34 	stw     r0,52(r1)
    2698:	90 61 00 18 	stw     r3,24(r1)
    269c:	90 81 00 1c 	stw     r4,28(r1)
    26a0:	90 a1 00 20 	stw     r5,32(r1)
    26a4:	90 c1 00 24 	stw     r6,36(r1)
    26a8:	80 c1 00 24 	lwz     r6,36(r1)
    26ac:	80 a1 00 20 	lwz     r5,32(r1)
    26b0:	80 81 00 1c 	lwz     r4,28(r1)
    26b4:	80 61 00 18 	lwz     r3,24(r1)
    26b8:	48 00 04 4d 	bl      2b04 <vsnprintf>
    26bc:	7c 69 1b 78 	mr      r9,r3
    26c0:	91 21 00 08 	stw     r9,8(r1)
    26c4:	81 41 00 08 	lwz     r10,8(r1)
    26c8:	81 21 00 1c 	lwz     r9,28(r1)
    26cc:	7c 0a 48 40 	cmplw   r10,r9
    26d0:	41 80 00 10 	blt     26e0 <vscnprintf+0x54>
    26d4:	81 21 00 1c 	lwz     r9,28(r1)
    26d8:	39 29 ff ff 	addi    r9,r9,-1
    26dc:	48 00 00 08 	b       26e4 <vscnprintf+0x58>
    26e0:	81 21 00 08 	lwz     r9,8(r1)
    26e4:	7d 23 4b 78 	mr      r3,r9
    26e8:	80 01 00 34 	lwz     r0,52(r1)
    26ec:	7c 08 03 a6 	mtlr    r0
    26f0:	38 21 00 30 	addi    r1,r1,48
    26f4:	4e 80 00 20 	blr

000026f8 <snprintf>:
    26f8:	94 21 ff 80 	stwu    r1,-128(r1)
    26fc:	7c 08 02 a6 	mflr    r0
    2700:	90 01 00 84 	stw     r0,132(r1)
    2704:	90 61 00 18 	stw     r3,24(r1)
    2708:	90 81 00 1c 	stw     r4,28(r1)
    270c:	90 a1 00 20 	stw     r5,32(r1)
    2710:	90 c1 00 2c 	stw     r6,44(r1)
    2714:	90 e1 00 30 	stw     r7,48(r1)
    2718:	91 01 00 34 	stw     r8,52(r1)
    271c:	91 21 00 38 	stw     r9,56(r1)
    2720:	91 41 00 3c 	stw     r10,60(r1)
    2724:	40 86 00 24 	bne     cr1,2748 <snprintf+0x50>
    2728:	d8 21 00 40 	stfd    f1,64(r1)
    272c:	d8 41 00 48 	stfd    f2,72(r1)
    2730:	d8 61 00 50 	stfd    f3,80(r1)
    2734:	d8 81 00 58 	stfd    f4,88(r1)
    2738:	d8 a1 00 60 	stfd    f5,96(r1)
    273c:	d8 c1 00 68 	stfd    f6,104(r1)
    2740:	d8 e1 00 70 	stfd    f7,112(r1)
    2744:	d9 01 00 78 	stfd    f8,120(r1)
    2748:	39 20 00 03 	li      r9,3
    274c:	99 21 00 0c 	stb     r9,12(r1)
    2750:	39 20 00 00 	li      r9,0
    2754:	99 21 00 0d 	stb     r9,13(r1)
    2758:	39 21 00 88 	addi    r9,r1,136
    275c:	91 21 00 10 	stw     r9,16(r1)
    2760:	39 21 00 20 	addi    r9,r1,32
    2764:	91 21 00 14 	stw     r9,20(r1)
    2768:	39 21 00 0c 	addi    r9,r1,12
    276c:	7d 26 4b 78 	mr      r6,r9
    2770:	80 a1 00 20 	lwz     r5,32(r1)
    2774:	80 81 00 1c 	lwz     r4,28(r1)
    2778:	80 61 00 18 	lwz     r3,24(r1)
    277c:	48 00 03 89 	bl      2b04 <vsnprintf>
    2780:	7c 69 1b 78 	mr      r9,r3
    2784:	91 21 00 08 	stw     r9,8(r1)
    2788:	81 21 00 08 	lwz     r9,8(r1)
    278c:	7d 23 4b 78 	mr      r3,r9
    2790:	80 01 00 84 	lwz     r0,132(r1)
    2794:	7c 08 03 a6 	mtlr    r0
    2798:	38 21 00 80 	addi    r1,r1,128
    279c:	4e 80 00 20 	blr

000027a0 <scnprintf>:
    27a0:	94 21 ff 80 	stwu    r1,-128(r1)
    27a4:	7c 08 02 a6 	mflr    r0
    27a8:	90 01 00 84 	stw     r0,132(r1)
    27ac:	90 61 00 18 	stw     r3,24(r1)
    27b0:	90 81 00 1c 	stw     r4,28(r1)
    27b4:	90 a1 00 20 	stw     r5,32(r1)
    27b8:	90 c1 00 2c 	stw     r6,44(r1)
    27bc:	90 e1 00 30 	stw     r7,48(r1)
    27c0:	91 01 00 34 	stw     r8,52(r1)
    27c4:	91 21 00 38 	stw     r9,56(r1)
    27c8:	91 41 00 3c 	stw     r10,60(r1)
    27cc:	40 86 00 24 	bne     cr1,27f0 <scnprintf+0x50>
    27d0:	d8 21 00 40 	stfd    f1,64(r1)
    27d4:	d8 41 00 48 	stfd    f2,72(r1)
    27d8:	d8 61 00 50 	stfd    f3,80(r1)
    27dc:	d8 81 00 58 	stfd    f4,88(r1)
    27e0:	d8 a1 00 60 	stfd    f5,96(r1)
    27e4:	d8 c1 00 68 	stfd    f6,104(r1)
    27e8:	d8 e1 00 70 	stfd    f7,112(r1)
    27ec:	d9 01 00 78 	stfd    f8,120(r1)
    27f0:	39 20 00 03 	li      r9,3
    27f4:	99 21 00 0c 	stb     r9,12(r1)
    27f8:	39 20 00 00 	li      r9,0
    27fc:	99 21 00 0d 	stb     r9,13(r1)
    2800:	39 21 00 88 	addi    r9,r1,136
    2804:	91 21 00 10 	stw     r9,16(r1)
    2808:	39 21 00 20 	addi    r9,r1,32
    280c:	91 21 00 14 	stw     r9,20(r1)
    2810:	39 21 00 0c 	addi    r9,r1,12
    2814:	7d 26 4b 78 	mr      r6,r9
    2818:	80 a1 00 20 	lwz     r5,32(r1)
    281c:	80 81 00 1c 	lwz     r4,28(r1)
    2820:	80 61 00 18 	lwz     r3,24(r1)
    2824:	48 00 02 e1 	bl      2b04 <vsnprintf>
    2828:	7c 69 1b 78 	mr      r9,r3
    282c:	91 21 00 08 	stw     r9,8(r1)
    2830:	81 41 00 08 	lwz     r10,8(r1)
    2834:	81 21 00 1c 	lwz     r9,28(r1)
    2838:	7c 0a 48 40 	cmplw   r10,r9
    283c:	41 80 00 10 	blt     284c <scnprintf+0xac>
    2840:	81 21 00 1c 	lwz     r9,28(r1)
    2844:	39 29 ff ff 	addi    r9,r9,-1
    2848:	48 00 00 08 	b       2850 <scnprintf+0xb0>
    284c:	81 21 00 08 	lwz     r9,8(r1)
    2850:	7d 23 4b 78 	mr      r3,r9
    2854:	80 01 00 84 	lwz     r0,132(r1)
    2858:	7c 08 03 a6 	mtlr    r0
    285c:	38 21 00 80 	addi    r1,r1,128
    2860:	4e 80 00 20 	blr

00002864 <vsprintf>:
    2864:	94 21 ff e0 	stwu    r1,-32(r1)
    2868:	7c 08 02 a6 	mflr    r0
    286c:	90 01 00 24 	stw     r0,36(r1)
    2870:	90 61 00 08 	stw     r3,8(r1)
    2874:	90 81 00 0c 	stw     r4,12(r1)
    2878:	90 a1 00 10 	stw     r5,16(r1)
    287c:	80 c1 00 10 	lwz     r6,16(r1)
    2880:	80 a1 00 0c 	lwz     r5,12(r1)
    2884:	3d 20 7f ff 	lis     r9,32767
    2888:	61 24 ff ff 	ori     r4,r9,65535
    288c:	80 61 00 08 	lwz     r3,8(r1)
    2890:	48 00 02 75 	bl      2b04 <vsnprintf>
    2894:	7c 69 1b 78 	mr      r9,r3
    2898:	7d 23 4b 78 	mr      r3,r9
    289c:	80 01 00 24 	lwz     r0,36(r1)
    28a0:	7c 08 03 a6 	mtlr    r0
    28a4:	38 21 00 20 	addi    r1,r1,32
    28a8:	4e 80 00 20 	blr

000028ac <sprintf>:
    28ac:	94 21 ff 80 	stwu    r1,-128(r1)
    28b0:	7c 08 02 a6 	mflr    r0
    28b4:	90 01 00 84 	stw     r0,132(r1)
    28b8:	90 61 00 18 	stw     r3,24(r1)
    28bc:	90 81 00 1c 	stw     r4,28(r1)
    28c0:	90 a1 00 20 	stw     r5,32(r1)
    28c4:	90 c1 00 24 	stw     r6,36(r1)
    28c8:	90 e1 00 28 	stw     r7,40(r1)
    28cc:	91 01 00 2c 	stw     r8,44(r1)
    28d0:	91 21 00 30 	stw     r9,48(r1)
    28d4:	91 41 00 34 	stw     r10,52(r1)
    28d8:	40 86 00 24 	bne     cr1,28fc <sprintf+0x50>
    28dc:	d8 21 00 38 	stfd    f1,56(r1)
    28e0:	d8 41 00 40 	stfd    f2,64(r1)
    28e4:	d8 61 00 48 	stfd    f3,72(r1)
    28e8:	d8 81 00 50 	stfd    f4,80(r1)
    28ec:	d8 a1 00 58 	stfd    f5,88(r1)
    28f0:	d8 c1 00 60 	stfd    f6,96(r1)
    28f4:	d8 e1 00 68 	stfd    f7,104(r1)
    28f8:	d9 01 00 70 	stfd    f8,112(r1)
    28fc:	39 20 00 02 	li      r9,2
    2900:	99 21 00 0c 	stb     r9,12(r1)
    2904:	39 20 00 00 	li      r9,0
    2908:	99 21 00 0d 	stb     r9,13(r1)
    290c:	39 21 00 88 	addi    r9,r1,136
    2910:	91 21 00 10 	stw     r9,16(r1)
    2914:	39 21 00 18 	addi    r9,r1,24
    2918:	91 21 00 14 	stw     r9,20(r1)
    291c:	39 21 00 0c 	addi    r9,r1,12
    2920:	7d 26 4b 78 	mr      r6,r9
    2924:	80 a1 00 1c 	lwz     r5,28(r1)
    2928:	3d 20 7f ff 	lis     r9,32767
    292c:	61 24 ff ff 	ori     r4,r9,65535
    2930:	80 61 00 18 	lwz     r3,24(r1)
    2934:	48 00 01 d1 	bl      2b04 <vsnprintf>
    2938:	7c 69 1b 78 	mr      r9,r3
    293c:	91 21 00 08 	stw     r9,8(r1)
    2940:	81 21 00 08 	lwz     r9,8(r1)
    2944:	7d 23 4b 78 	mr      r3,r9
    2948:	80 01 00 84 	lwz     r0,132(r1)
    294c:	7c 08 03 a6 	mtlr    r0
    2950:	38 21 00 80 	addi    r1,r1,128
    2954:	4e 80 00 20 	blr

00002958 <rand>:
    2958:	3d 20 00 02 	lis     r9,2
    295c:	81 29 e0 14 	lwz     r9,-8172(r9)
    2960:	1d 29 00 81 	mulli   r9,r9,129
    2964:	3d 29 36 19 	addis   r9,r9,13849
    2968:	39 49 62 e9 	addi    r10,r9,25321
    296c:	3d 20 00 02 	lis     r9,2
    2970:	91 49 e0 14 	stw     r10,-8172(r9)
    2974:	3d 20 00 02 	lis     r9,2
    2978:	81 29 e0 14 	lwz     r9,-8172(r9)
    297c:	7d 23 4b 78 	mr      r3,r9
    2980:	4e 80 00 20 	blr

00002984 <srand>:
    2984:	94 21 ff f0 	stwu    r1,-16(r1)
    2988:	90 61 00 08 	stw     r3,8(r1)
    298c:	3d 20 00 02 	lis     r9,2
    2990:	81 41 00 08 	lwz     r10,8(r1)
    2994:	91 49 e0 14 	stw     r10,-8172(r9)
    2998:	60 00 00 00 	nop
    299c:	38 21 00 10 	addi    r1,r1,16
    29a0:	4e 80 00 20 	blr

000029a4 <abort>:
    29a4:	94 21 ff f0 	stwu    r1,-16(r1)
    29a8:	7c 08 02 a6 	mflr    r0
    29ac:	90 01 00 14 	stw     r0,20(r1)
    29b0:	3d 20 00 00 	lis     r9,0
    29b4:	38 69 0a 04 	addi    r3,r9,2564
    29b8:	4c c6 31 82 	crclr   4*cr1+eq
    29bc:	48 00 11 1d 	bl      3ad8 <printf>
    29c0:	48 00 00 00 	b       29c0 <abort+0x1c>

000029c4 <htonl>:
    29c4:	94 21 ff e0 	stwu    r1,-32(r1)
    29c8:	7c 08 02 a6 	mflr    r0
    29cc:	90 01 00 24 	stw     r0,36(r1)
    29d0:	90 61 00 18 	stw     r3,24(r1)
    29d4:	39 20 00 01 	li      r9,1
    29d8:	91 21 00 08 	stw     r9,8(r1)
    29dc:	89 21 00 08 	lbz     r9,8(r1)
    29e0:	2c 09 00 00 	cmpwi   r9,0
    29e4:	41 82 00 14 	beq     29f8 <htonl+0x34>
    29e8:	80 61 00 18 	lwz     r3,24(r1)
    29ec:	4b ff eb 75 	bl      1560 <__bswap_32>
    29f0:	7c 69 1b 78 	mr      r9,r3
    29f4:	48 00 00 08 	b       29fc <htonl+0x38>
    29f8:	81 21 00 18 	lwz     r9,24(r1)
    29fc:	7d 23 4b 78 	mr      r3,r9
    2a00:	80 01 00 24 	lwz     r0,36(r1)
    2a04:	7c 08 03 a6 	mtlr    r0
    2a08:	38 21 00 20 	addi    r1,r1,32
    2a0c:	4e 80 00 20 	blr

00002a10 <htons>:
    2a10:	94 21 ff e0 	stwu    r1,-32(r1)
    2a14:	7c 08 02 a6 	mflr    r0
    2a18:	90 01 00 24 	stw     r0,36(r1)
    2a1c:	7c 69 1b 78 	mr      r9,r3
    2a20:	b1 21 00 18 	sth     r9,24(r1)
    2a24:	39 20 00 01 	li      r9,1
    2a28:	91 21 00 08 	stw     r9,8(r1)
    2a2c:	89 21 00 08 	lbz     r9,8(r1)
    2a30:	2c 09 00 00 	cmpwi   r9,0
    2a34:	41 82 00 18 	beq     2a4c <htons+0x3c>
    2a38:	a1 21 00 18 	lhz     r9,24(r1)
    2a3c:	7d 23 4b 78 	mr      r3,r9
    2a40:	4b ff ea e1 	bl      1520 <__bswap_16>
    2a44:	7c 69 1b 78 	mr      r9,r3
    2a48:	48 00 00 08 	b       2a50 <htons+0x40>
    2a4c:	a1 21 00 18 	lhz     r9,24(r1)
    2a50:	7d 23 4b 78 	mr      r3,r9
    2a54:	80 01 00 24 	lwz     r0,36(r1)
    2a58:	7c 08 03 a6 	mtlr    r0
    2a5c:	38 21 00 20 	addi    r1,r1,32
    2a60:	4e 80 00 20 	blr

00002a64 <ntohl>:
    2a64:	94 21 ff e0 	stwu    r1,-32(r1)
    2a68:	7c 08 02 a6 	mflr    r0
    2a6c:	90 01 00 24 	stw     r0,36(r1)
    2a70:	90 61 00 18 	stw     r3,24(r1)
    2a74:	39 20 00 01 	li      r9,1
    2a78:	91 21 00 08 	stw     r9,8(r1)
    2a7c:	89 21 00 08 	lbz     r9,8(r1)
    2a80:	2c 09 00 00 	cmpwi   r9,0
    2a84:	41 82 00 14 	beq     2a98 <ntohl+0x34>
    2a88:	80 61 00 18 	lwz     r3,24(r1)
    2a8c:	4b ff ea d5 	bl      1560 <__bswap_32>
    2a90:	7c 69 1b 78 	mr      r9,r3
    2a94:	48 00 00 08 	b       2a9c <ntohl+0x38>
    2a98:	81 21 00 18 	lwz     r9,24(r1)
    2a9c:	7d 23 4b 78 	mr      r3,r9
    2aa0:	80 01 00 24 	lwz     r0,36(r1)
    2aa4:	7c 08 03 a6 	mtlr    r0
    2aa8:	38 21 00 20 	addi    r1,r1,32
    2aac:	4e 80 00 20 	blr

00002ab0 <ntohs>:
    2ab0:	94 21 ff e0 	stwu    r1,-32(r1)
    2ab4:	7c 08 02 a6 	mflr    r0
    2ab8:	90 01 00 24 	stw     r0,36(r1)
    2abc:	7c 69 1b 78 	mr      r9,r3
    2ac0:	b1 21 00 18 	sth     r9,24(r1)
    2ac4:	39 20 00 01 	li      r9,1
    2ac8:	91 21 00 08 	stw     r9,8(r1)
    2acc:	89 21 00 08 	lbz     r9,8(r1)
    2ad0:	2c 09 00 00 	cmpwi   r9,0
    2ad4:	41 82 00 18 	beq     2aec <ntohs+0x3c>
    2ad8:	a1 21 00 18 	lhz     r9,24(r1)
    2adc:	7d 23 4b 78 	mr      r3,r9
    2ae0:	4b ff ea 41 	bl      1520 <__bswap_16>
    2ae4:	7c 69 1b 78 	mr      r9,r3
    2ae8:	48 00 00 08 	b       2af0 <ntohs+0x40>
    2aec:	a1 21 00 18 	lhz     r9,24(r1)
    2af0:	7d 23 4b 78 	mr      r3,r9
    2af4:	80 01 00 24 	lwz     r0,36(r1)
    2af8:	7c 08 03 a6 	mtlr    r0
    2afc:	38 21 00 20 	addi    r1,r1,32
    2b00:	4e 80 00 20 	blr

00002b04 <vsnprintf>:
    2b04:	94 21 ff a0 	stwu    r1,-96(r1)
    2b08:	7c 08 02 a6 	mflr    r0
    2b0c:	90 01 00 64 	stw     r0,100(r1)
    2b10:	90 61 00 48 	stw     r3,72(r1)
    2b14:	90 81 00 4c 	stw     r4,76(r1)
    2b18:	90 a1 00 50 	stw     r5,80(r1)
    2b1c:	90 c1 00 54 	stw     r6,84(r1)
    2b20:	81 21 00 4c 	lwz     r9,76(r1)
    2b24:	2c 09 00 00 	cmpwi   r9,0
    2b28:	40 80 00 0c 	bge     2b34 <vsnprintf+0x30>
    2b2c:	39 20 00 00 	li      r9,0
    2b30:	48 00 0d 3c 	b       386c <vsnprintf+0xd68>
    2b34:	81 21 00 48 	lwz     r9,72(r1)
    2b38:	91 21 00 18 	stw     r9,24(r1)
    2b3c:	81 41 00 48 	lwz     r10,72(r1)
    2b40:	81 21 00 4c 	lwz     r9,76(r1)
    2b44:	7d 2a 4a 14 	add     r9,r10,r9
    2b48:	91 21 00 1c 	stw     r9,28(r1)
    2b4c:	81 41 00 1c 	lwz     r10,28(r1)
    2b50:	81 21 00 48 	lwz     r9,72(r1)
    2b54:	7c 0a 48 40 	cmplw   r10,r9
    2b58:	40 80 0c bc 	bge     3814 <vsnprintf+0xd10>
    2b5c:	39 20 ff ff 	li      r9,-1
    2b60:	91 21 00 1c 	stw     r9,28(r1)
    2b64:	81 41 00 1c 	lwz     r10,28(r1)
    2b68:	81 21 00 48 	lwz     r9,72(r1)
    2b6c:	7d 29 50 50 	subf    r9,r9,r10
    2b70:	91 21 00 4c 	stw     r9,76(r1)
    2b74:	48 00 0c a0 	b       3814 <vsnprintf+0xd10>
    2b78:	81 21 00 50 	lwz     r9,80(r1)
    2b7c:	89 29 00 00 	lbz     r9,0(r9)
    2b80:	28 09 00 25 	cmplwi  r9,37
    2b84:	41 82 00 34 	beq     2bb8 <vsnprintf+0xb4>
    2b88:	81 41 00 18 	lwz     r10,24(r1)
    2b8c:	81 21 00 1c 	lwz     r9,28(r1)
    2b90:	7c 0a 48 40 	cmplw   r10,r9
    2b94:	40 80 00 14 	bge     2ba8 <vsnprintf+0xa4>
    2b98:	81 21 00 50 	lwz     r9,80(r1)
    2b9c:	89 49 00 00 	lbz     r10,0(r9)
    2ba0:	81 21 00 18 	lwz     r9,24(r1)
    2ba4:	99 49 00 00 	stb     r10,0(r9)
    2ba8:	81 21 00 18 	lwz     r9,24(r1)
    2bac:	39 29 00 01 	addi    r9,r9,1
    2bb0:	91 21 00 18 	stw     r9,24(r1)
    2bb4:	48 00 0c 54 	b       3808 <vsnprintf+0xd04>
    2bb8:	39 20 00 00 	li      r9,0
    2bbc:	91 21 00 24 	stw     r9,36(r1)
    2bc0:	81 21 00 50 	lwz     r9,80(r1)
    2bc4:	39 29 00 01 	addi    r9,r9,1
    2bc8:	91 21 00 50 	stw     r9,80(r1)
    2bcc:	81 21 00 50 	lwz     r9,80(r1)
    2bd0:	89 29 00 00 	lbz     r9,0(r9)
    2bd4:	39 29 ff e0 	addi    r9,r9,-32
    2bd8:	28 09 00 10 	cmplwi  r9,16
    2bdc:	41 81 00 7c 	bgt     2c58 <vsnprintf+0x154>
    2be0:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
    2be4:	3d 20 00 00 	lis     r9,0
    2be8:	39 29 0a 68 	addi    r9,r9,2664
    2bec:	7d 2a 4a 14 	add     r9,r10,r9
    2bf0:	81 49 00 00 	lwz     r10,0(r9)
    2bf4:	3d 20 00 00 	lis     r9,0
    2bf8:	39 29 0a 68 	addi    r9,r9,2664
    2bfc:	7d 2a 4a 14 	add     r9,r10,r9
    2c00:	7d 29 03 a6 	mtctr   r9
    2c04:	4e 80 04 20 	bctr
    2c08:	81 21 00 24 	lwz     r9,36(r1)
    2c0c:	61 29 00 10 	ori     r9,r9,16
    2c10:	91 21 00 24 	stw     r9,36(r1)
    2c14:	4b ff ff ac 	b       2bc0 <vsnprintf+0xbc>
    2c18:	81 21 00 24 	lwz     r9,36(r1)
    2c1c:	61 29 00 04 	ori     r9,r9,4
    2c20:	91 21 00 24 	stw     r9,36(r1)
    2c24:	4b ff ff 9c 	b       2bc0 <vsnprintf+0xbc>
    2c28:	81 21 00 24 	lwz     r9,36(r1)
    2c2c:	61 29 00 08 	ori     r9,r9,8
    2c30:	91 21 00 24 	stw     r9,36(r1)
    2c34:	4b ff ff 8c 	b       2bc0 <vsnprintf+0xbc>
    2c38:	81 21 00 24 	lwz     r9,36(r1)
    2c3c:	61 29 00 20 	ori     r9,r9,32
    2c40:	91 21 00 24 	stw     r9,36(r1)
    2c44:	4b ff ff 7c 	b       2bc0 <vsnprintf+0xbc>
    2c48:	81 21 00 24 	lwz     r9,36(r1)
    2c4c:	61 29 00 01 	ori     r9,r9,1
    2c50:	91 21 00 24 	stw     r9,36(r1)
    2c54:	4b ff ff 6c 	b       2bc0 <vsnprintf+0xbc>
    2c58:	39 20 ff ff 	li      r9,-1
    2c5c:	91 21 00 28 	stw     r9,40(r1)
    2c60:	81 21 00 50 	lwz     r9,80(r1)
    2c64:	89 29 00 00 	lbz     r9,0(r9)
    2c68:	7d 2a 4b 78 	mr      r10,r9
    2c6c:	3d 20 00 00 	lis     r9,0
    2c70:	39 29 09 04 	addi    r9,r9,2308
    2c74:	7d 29 50 ae 	lbzx    r9,r9,r10
    2c78:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    2c7c:	2c 09 00 00 	cmpwi   r9,0
    2c80:	41 82 00 1c 	beq     2c9c <vsnprintf+0x198>
    2c84:	39 21 00 50 	addi    r9,r1,80
    2c88:	7d 23 4b 78 	mr      r3,r9
    2c8c:	4b ff f5 01 	bl      218c <skip_atoi>
    2c90:	7c 69 1b 78 	mr      r9,r3
    2c94:	91 21 00 28 	stw     r9,40(r1)
    2c98:	48 00 00 9c 	b       2d34 <vsnprintf+0x230>
    2c9c:	81 21 00 50 	lwz     r9,80(r1)
    2ca0:	89 29 00 00 	lbz     r9,0(r9)
    2ca4:	28 09 00 2a 	cmplwi  r9,42
    2ca8:	40 82 00 8c 	bne     2d34 <vsnprintf+0x230>
    2cac:	81 21 00 50 	lwz     r9,80(r1)
    2cb0:	39 29 00 01 	addi    r9,r9,1
    2cb4:	91 21 00 50 	stw     r9,80(r1)
    2cb8:	81 21 00 54 	lwz     r9,84(r1)
    2cbc:	89 29 00 00 	lbz     r9,0(r9)
    2cc0:	28 09 00 07 	cmplwi  r9,7
    2cc4:	41 81 00 30 	bgt     2cf4 <vsnprintf+0x1f0>
    2cc8:	81 21 00 54 	lwz     r9,84(r1)
    2ccc:	81 49 00 08 	lwz     r10,8(r9)
    2cd0:	81 21 00 54 	lwz     r9,84(r1)
    2cd4:	89 29 00 00 	lbz     r9,0(r9)
    2cd8:	39 09 00 01 	addi    r8,r9,1
    2cdc:	55 07 06 3e 	clrlwi  r7,r8,24
    2ce0:	81 01 00 54 	lwz     r8,84(r1)
    2ce4:	98 e8 00 00 	stb     r7,0(r8)
    2ce8:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    2cec:	7d 2a 4a 14 	add     r9,r10,r9
    2cf0:	48 00 00 18 	b       2d08 <vsnprintf+0x204>
    2cf4:	81 21 00 54 	lwz     r9,84(r1)
    2cf8:	81 29 00 04 	lwz     r9,4(r9)
    2cfc:	39 09 00 04 	addi    r8,r9,4
    2d00:	81 41 00 54 	lwz     r10,84(r1)
    2d04:	91 0a 00 04 	stw     r8,4(r10)
    2d08:	81 29 00 00 	lwz     r9,0(r9)
    2d0c:	91 21 00 28 	stw     r9,40(r1)
    2d10:	81 21 00 28 	lwz     r9,40(r1)
    2d14:	2c 09 00 00 	cmpwi   r9,0
    2d18:	40 80 00 1c 	bge     2d34 <vsnprintf+0x230>
    2d1c:	81 21 00 28 	lwz     r9,40(r1)
    2d20:	7d 29 00 d0 	neg     r9,r9
    2d24:	91 21 00 28 	stw     r9,40(r1)
    2d28:	81 21 00 24 	lwz     r9,36(r1)
    2d2c:	61 29 00 10 	ori     r9,r9,16
    2d30:	91 21 00 24 	stw     r9,36(r1)
    2d34:	39 20 ff ff 	li      r9,-1
    2d38:	91 21 00 2c 	stw     r9,44(r1)
    2d3c:	81 21 00 50 	lwz     r9,80(r1)
    2d40:	89 29 00 00 	lbz     r9,0(r9)
    2d44:	28 09 00 2e 	cmplwi  r9,46
    2d48:	40 82 00 d4 	bne     2e1c <vsnprintf+0x318>
    2d4c:	81 21 00 50 	lwz     r9,80(r1)
    2d50:	39 29 00 01 	addi    r9,r9,1
    2d54:	91 21 00 50 	stw     r9,80(r1)
    2d58:	81 21 00 50 	lwz     r9,80(r1)
    2d5c:	89 29 00 00 	lbz     r9,0(r9)
    2d60:	7d 2a 4b 78 	mr      r10,r9
    2d64:	3d 20 00 00 	lis     r9,0
    2d68:	39 29 09 04 	addi    r9,r9,2308
    2d6c:	7d 29 50 ae 	lbzx    r9,r9,r10
    2d70:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    2d74:	2c 09 00 00 	cmpwi   r9,0
    2d78:	41 82 00 1c 	beq     2d94 <vsnprintf+0x290>
    2d7c:	39 21 00 50 	addi    r9,r1,80
    2d80:	7d 23 4b 78 	mr      r3,r9
    2d84:	4b ff f4 09 	bl      218c <skip_atoi>
    2d88:	7c 69 1b 78 	mr      r9,r3
    2d8c:	91 21 00 2c 	stw     r9,44(r1)
    2d90:	48 00 00 78 	b       2e08 <vsnprintf+0x304>
    2d94:	81 21 00 50 	lwz     r9,80(r1)
    2d98:	89 29 00 00 	lbz     r9,0(r9)
    2d9c:	28 09 00 2a 	cmplwi  r9,42
    2da0:	40 82 00 68 	bne     2e08 <vsnprintf+0x304>
    2da4:	81 21 00 50 	lwz     r9,80(r1)
    2da8:	39 29 00 01 	addi    r9,r9,1
    2dac:	91 21 00 50 	stw     r9,80(r1)
    2db0:	81 21 00 54 	lwz     r9,84(r1)
    2db4:	89 29 00 00 	lbz     r9,0(r9)
    2db8:	28 09 00 07 	cmplwi  r9,7
    2dbc:	41 81 00 30 	bgt     2dec <vsnprintf+0x2e8>
    2dc0:	81 21 00 54 	lwz     r9,84(r1)
    2dc4:	81 49 00 08 	lwz     r10,8(r9)
    2dc8:	81 21 00 54 	lwz     r9,84(r1)
    2dcc:	89 29 00 00 	lbz     r9,0(r9)
    2dd0:	39 09 00 01 	addi    r8,r9,1
    2dd4:	55 07 06 3e 	clrlwi  r7,r8,24
    2dd8:	81 01 00 54 	lwz     r8,84(r1)
    2ddc:	98 e8 00 00 	stb     r7,0(r8)
    2de0:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    2de4:	7d 2a 4a 14 	add     r9,r10,r9
    2de8:	48 00 00 18 	b       2e00 <vsnprintf+0x2fc>
    2dec:	81 21 00 54 	lwz     r9,84(r1)
    2df0:	81 29 00 04 	lwz     r9,4(r9)
    2df4:	39 09 00 04 	addi    r8,r9,4
    2df8:	81 41 00 54 	lwz     r10,84(r1)
    2dfc:	91 0a 00 04 	stw     r8,4(r10)
    2e00:	81 29 00 00 	lwz     r9,0(r9)
    2e04:	91 21 00 2c 	stw     r9,44(r1)
    2e08:	81 21 00 2c 	lwz     r9,44(r1)
    2e0c:	2c 09 00 00 	cmpwi   r9,0
    2e10:	40 80 00 0c 	bge     2e1c <vsnprintf+0x318>
    2e14:	39 20 00 00 	li      r9,0
    2e18:	91 21 00 2c 	stw     r9,44(r1)
    2e1c:	39 20 ff ff 	li      r9,-1
    2e20:	91 21 00 30 	stw     r9,48(r1)
    2e24:	81 21 00 50 	lwz     r9,80(r1)
    2e28:	89 29 00 00 	lbz     r9,0(r9)
    2e2c:	28 09 00 68 	cmplwi  r9,104
    2e30:	41 82 00 54 	beq     2e84 <vsnprintf+0x380>
    2e34:	81 21 00 50 	lwz     r9,80(r1)
    2e38:	89 29 00 00 	lbz     r9,0(r9)
    2e3c:	28 09 00 6c 	cmplwi  r9,108
    2e40:	41 82 00 44 	beq     2e84 <vsnprintf+0x380>
    2e44:	81 21 00 50 	lwz     r9,80(r1)
    2e48:	89 29 00 00 	lbz     r9,0(r9)
    2e4c:	28 09 00 4c 	cmplwi  r9,76
    2e50:	41 82 00 34 	beq     2e84 <vsnprintf+0x380>
    2e54:	81 21 00 50 	lwz     r9,80(r1)
    2e58:	89 29 00 00 	lbz     r9,0(r9)
    2e5c:	28 09 00 5a 	cmplwi  r9,90
    2e60:	41 82 00 24 	beq     2e84 <vsnprintf+0x380>
    2e64:	81 21 00 50 	lwz     r9,80(r1)
    2e68:	89 29 00 00 	lbz     r9,0(r9)
    2e6c:	28 09 00 7a 	cmplwi  r9,122
    2e70:	41 82 00 14 	beq     2e84 <vsnprintf+0x380>
    2e74:	81 21 00 50 	lwz     r9,80(r1)
    2e78:	89 29 00 00 	lbz     r9,0(r9)
    2e7c:	28 09 00 74 	cmplwi  r9,116
    2e80:	40 82 00 4c 	bne     2ecc <vsnprintf+0x3c8>
    2e84:	81 21 00 50 	lwz     r9,80(r1)
    2e88:	89 29 00 00 	lbz     r9,0(r9)
    2e8c:	91 21 00 30 	stw     r9,48(r1)
    2e90:	81 21 00 50 	lwz     r9,80(r1)
    2e94:	39 29 00 01 	addi    r9,r9,1
    2e98:	91 21 00 50 	stw     r9,80(r1)
    2e9c:	81 21 00 30 	lwz     r9,48(r1)
    2ea0:	2c 09 00 6c 	cmpwi   r9,108
    2ea4:	40 82 00 28 	bne     2ecc <vsnprintf+0x3c8>
    2ea8:	81 21 00 50 	lwz     r9,80(r1)
    2eac:	89 29 00 00 	lbz     r9,0(r9)
    2eb0:	28 09 00 6c 	cmplwi  r9,108
    2eb4:	40 82 00 18 	bne     2ecc <vsnprintf+0x3c8>
    2eb8:	39 20 00 4c 	li      r9,76
    2ebc:	91 21 00 30 	stw     r9,48(r1)
    2ec0:	81 21 00 50 	lwz     r9,80(r1)
    2ec4:	39 29 00 01 	addi    r9,r9,1
    2ec8:	91 21 00 50 	stw     r9,80(r1)
    2ecc:	39 20 00 0a 	li      r9,10
    2ed0:	91 21 00 14 	stw     r9,20(r1)
    2ed4:	81 21 00 50 	lwz     r9,80(r1)
    2ed8:	89 29 00 00 	lbz     r9,0(r9)
    2edc:	39 29 ff db 	addi    r9,r9,-37
    2ee0:	28 09 00 53 	cmplwi  r9,83
    2ee4:	41 81 05 50 	bgt     3434 <vsnprintf+0x930>
    2ee8:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
    2eec:	3d 20 00 00 	lis     r9,0
    2ef0:	39 29 0a ac 	addi    r9,r9,2732
    2ef4:	7d 2a 4a 14 	add     r9,r10,r9
    2ef8:	81 49 00 00 	lwz     r10,0(r9)
    2efc:	3d 20 00 00 	lis     r9,0
    2f00:	39 29 0a ac 	addi    r9,r9,2732
    2f04:	7d 2a 4a 14 	add     r9,r10,r9
    2f08:	7d 29 03 a6 	mtctr   r9
    2f0c:	4e 80 04 20 	bctr
    2f10:	81 21 00 24 	lwz     r9,36(r1)
    2f14:	55 29 06 f6 	rlwinm  r9,r9,0,27,27
    2f18:	2c 09 00 00 	cmpwi   r9,0
    2f1c:	40 82 00 48 	bne     2f64 <vsnprintf+0x460>
    2f20:	48 00 00 2c 	b       2f4c <vsnprintf+0x448>
    2f24:	81 41 00 18 	lwz     r10,24(r1)
    2f28:	81 21 00 1c 	lwz     r9,28(r1)
    2f2c:	7c 0a 48 40 	cmplw   r10,r9
    2f30:	40 80 00 10 	bge     2f40 <vsnprintf+0x43c>
    2f34:	81 21 00 18 	lwz     r9,24(r1)
    2f38:	39 40 00 20 	li      r10,32
    2f3c:	99 49 00 00 	stb     r10,0(r9)
    2f40:	81 21 00 18 	lwz     r9,24(r1)
    2f44:	39 29 00 01 	addi    r9,r9,1
    2f48:	91 21 00 18 	stw     r9,24(r1)
    2f4c:	81 21 00 28 	lwz     r9,40(r1)
    2f50:	39 29 ff ff 	addi    r9,r9,-1
    2f54:	91 21 00 28 	stw     r9,40(r1)
    2f58:	81 21 00 28 	lwz     r9,40(r1)
    2f5c:	2c 09 00 00 	cmpwi   r9,0
    2f60:	41 81 ff c4 	bgt     2f24 <vsnprintf+0x420>
    2f64:	81 21 00 54 	lwz     r9,84(r1)
    2f68:	89 29 00 00 	lbz     r9,0(r9)
    2f6c:	28 09 00 07 	cmplwi  r9,7
    2f70:	41 81 00 30 	bgt     2fa0 <vsnprintf+0x49c>
    2f74:	81 21 00 54 	lwz     r9,84(r1)
    2f78:	81 49 00 08 	lwz     r10,8(r9)
    2f7c:	81 21 00 54 	lwz     r9,84(r1)
    2f80:	89 29 00 00 	lbz     r9,0(r9)
    2f84:	39 09 00 01 	addi    r8,r9,1
    2f88:	55 07 06 3e 	clrlwi  r7,r8,24
    2f8c:	81 01 00 54 	lwz     r8,84(r1)
    2f90:	98 e8 00 00 	stb     r7,0(r8)
    2f94:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    2f98:	7d 2a 4a 14 	add     r9,r10,r9
    2f9c:	48 00 00 18 	b       2fb4 <vsnprintf+0x4b0>
    2fa0:	81 21 00 54 	lwz     r9,84(r1)
    2fa4:	81 29 00 04 	lwz     r9,4(r9)
    2fa8:	39 09 00 04 	addi    r8,r9,4
    2fac:	81 41 00 54 	lwz     r10,84(r1)
    2fb0:	91 0a 00 04 	stw     r8,4(r10)
    2fb4:	81 29 00 00 	lwz     r9,0(r9)
    2fb8:	99 21 00 44 	stb     r9,68(r1)
    2fbc:	81 41 00 18 	lwz     r10,24(r1)
    2fc0:	81 21 00 1c 	lwz     r9,28(r1)
    2fc4:	7c 0a 48 40 	cmplw   r10,r9
    2fc8:	40 80 00 10 	bge     2fd8 <vsnprintf+0x4d4>
    2fcc:	81 21 00 18 	lwz     r9,24(r1)
    2fd0:	89 41 00 44 	lbz     r10,68(r1)
    2fd4:	99 49 00 00 	stb     r10,0(r9)
    2fd8:	81 21 00 18 	lwz     r9,24(r1)
    2fdc:	39 29 00 01 	addi    r9,r9,1
    2fe0:	91 21 00 18 	stw     r9,24(r1)
    2fe4:	48 00 00 2c 	b       3010 <vsnprintf+0x50c>
    2fe8:	81 41 00 18 	lwz     r10,24(r1)
    2fec:	81 21 00 1c 	lwz     r9,28(r1)
    2ff0:	7c 0a 48 40 	cmplw   r10,r9
    2ff4:	40 80 00 10 	bge     3004 <vsnprintf+0x500>
    2ff8:	81 21 00 18 	lwz     r9,24(r1)
    2ffc:	39 40 00 20 	li      r10,32
    3000:	99 49 00 00 	stb     r10,0(r9)
    3004:	81 21 00 18 	lwz     r9,24(r1)
    3008:	39 29 00 01 	addi    r9,r9,1
    300c:	91 21 00 18 	stw     r9,24(r1)
    3010:	81 21 00 28 	lwz     r9,40(r1)
    3014:	39 29 ff ff 	addi    r9,r9,-1
    3018:	91 21 00 28 	stw     r9,40(r1)
    301c:	81 21 00 28 	lwz     r9,40(r1)
    3020:	2c 09 00 00 	cmpwi   r9,0
    3024:	41 81 ff c4 	bgt     2fe8 <vsnprintf+0x4e4>
    3028:	48 00 07 e0 	b       3808 <vsnprintf+0xd04>
    302c:	81 21 00 54 	lwz     r9,84(r1)
    3030:	89 29 00 00 	lbz     r9,0(r9)
    3034:	28 09 00 07 	cmplwi  r9,7
    3038:	41 81 00 30 	bgt     3068 <vsnprintf+0x564>
    303c:	81 21 00 54 	lwz     r9,84(r1)
    3040:	81 49 00 08 	lwz     r10,8(r9)
    3044:	81 21 00 54 	lwz     r9,84(r1)
    3048:	89 29 00 00 	lbz     r9,0(r9)
    304c:	39 09 00 01 	addi    r8,r9,1
    3050:	55 07 06 3e 	clrlwi  r7,r8,24
    3054:	81 01 00 54 	lwz     r8,84(r1)
    3058:	98 e8 00 00 	stb     r7,0(r8)
    305c:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3060:	7d 2a 4a 14 	add     r9,r10,r9
    3064:	48 00 00 18 	b       307c <vsnprintf+0x578>
    3068:	81 21 00 54 	lwz     r9,84(r1)
    306c:	81 29 00 04 	lwz     r9,4(r9)
    3070:	39 09 00 04 	addi    r8,r9,4
    3074:	81 41 00 54 	lwz     r10,84(r1)
    3078:	91 0a 00 04 	stw     r8,4(r10)
    307c:	81 29 00 00 	lwz     r9,0(r9)
    3080:	91 21 00 20 	stw     r9,32(r1)
    3084:	81 21 00 20 	lwz     r9,32(r1)
    3088:	2c 09 00 00 	cmpwi   r9,0
    308c:	40 82 00 10 	bne     309c <vsnprintf+0x598>
    3090:	3d 20 00 00 	lis     r9,0
    3094:	39 29 0a 60 	addi    r9,r9,2656
    3098:	91 21 00 20 	stw     r9,32(r1)
    309c:	81 21 00 2c 	lwz     r9,44(r1)
    30a0:	7d 24 4b 78 	mr      r4,r9
    30a4:	80 61 00 20 	lwz     r3,32(r1)
    30a8:	4b ff ea 25 	bl      1acc <strnlen>
    30ac:	7c 69 1b 78 	mr      r9,r3
    30b0:	91 21 00 34 	stw     r9,52(r1)
    30b4:	81 21 00 24 	lwz     r9,36(r1)
    30b8:	55 29 06 f6 	rlwinm  r9,r9,0,27,27
    30bc:	2c 09 00 00 	cmpwi   r9,0
    30c0:	40 82 00 48 	bne     3108 <vsnprintf+0x604>
    30c4:	48 00 00 2c 	b       30f0 <vsnprintf+0x5ec>
    30c8:	81 41 00 18 	lwz     r10,24(r1)
    30cc:	81 21 00 1c 	lwz     r9,28(r1)
    30d0:	7c 0a 48 40 	cmplw   r10,r9
    30d4:	40 80 00 10 	bge     30e4 <vsnprintf+0x5e0>
    30d8:	81 21 00 18 	lwz     r9,24(r1)
    30dc:	39 40 00 20 	li      r10,32
    30e0:	99 49 00 00 	stb     r10,0(r9)
    30e4:	81 21 00 18 	lwz     r9,24(r1)
    30e8:	39 29 00 01 	addi    r9,r9,1
    30ec:	91 21 00 18 	stw     r9,24(r1)
    30f0:	81 21 00 28 	lwz     r9,40(r1)
    30f4:	39 49 ff ff 	addi    r10,r9,-1
    30f8:	91 41 00 28 	stw     r10,40(r1)
    30fc:	81 41 00 34 	lwz     r10,52(r1)
    3100:	7c 0a 48 00 	cmpw    r10,r9
    3104:	41 80 ff c4 	blt     30c8 <vsnprintf+0x5c4>
    3108:	39 20 00 00 	li      r9,0
    310c:	91 21 00 10 	stw     r9,16(r1)
    3110:	48 00 00 48 	b       3158 <vsnprintf+0x654>
    3114:	81 41 00 18 	lwz     r10,24(r1)
    3118:	81 21 00 1c 	lwz     r9,28(r1)
    311c:	7c 0a 48 40 	cmplw   r10,r9
    3120:	40 80 00 14 	bge     3134 <vsnprintf+0x630>
    3124:	81 21 00 20 	lwz     r9,32(r1)
    3128:	89 49 00 00 	lbz     r10,0(r9)
    312c:	81 21 00 18 	lwz     r9,24(r1)
    3130:	99 49 00 00 	stb     r10,0(r9)
    3134:	81 21 00 18 	lwz     r9,24(r1)
    3138:	39 29 00 01 	addi    r9,r9,1
    313c:	91 21 00 18 	stw     r9,24(r1)
    3140:	81 21 00 20 	lwz     r9,32(r1)
    3144:	39 29 00 01 	addi    r9,r9,1
    3148:	91 21 00 20 	stw     r9,32(r1)
    314c:	81 21 00 10 	lwz     r9,16(r1)
    3150:	39 29 00 01 	addi    r9,r9,1
    3154:	91 21 00 10 	stw     r9,16(r1)
    3158:	81 41 00 10 	lwz     r10,16(r1)
    315c:	81 21 00 34 	lwz     r9,52(r1)
    3160:	7c 0a 48 00 	cmpw    r10,r9
    3164:	41 80 ff b0 	blt     3114 <vsnprintf+0x610>
    3168:	48 00 00 2c 	b       3194 <vsnprintf+0x690>
    316c:	81 41 00 18 	lwz     r10,24(r1)
    3170:	81 21 00 1c 	lwz     r9,28(r1)
    3174:	7c 0a 48 40 	cmplw   r10,r9
    3178:	40 80 00 10 	bge     3188 <vsnprintf+0x684>
    317c:	81 21 00 18 	lwz     r9,24(r1)
    3180:	39 40 00 20 	li      r10,32
    3184:	99 49 00 00 	stb     r10,0(r9)
    3188:	81 21 00 18 	lwz     r9,24(r1)
    318c:	39 29 00 01 	addi    r9,r9,1
    3190:	91 21 00 18 	stw     r9,24(r1)
    3194:	81 21 00 28 	lwz     r9,40(r1)
    3198:	39 49 ff ff 	addi    r10,r9,-1
    319c:	91 41 00 28 	stw     r10,40(r1)
    31a0:	81 41 00 34 	lwz     r10,52(r1)
    31a4:	7c 0a 48 00 	cmpw    r10,r9
    31a8:	41 80 ff c4 	blt     316c <vsnprintf+0x668>
    31ac:	48 00 06 5c 	b       3808 <vsnprintf+0xd04>
    31b0:	81 41 00 28 	lwz     r10,40(r1)
    31b4:	39 20 ff ff 	li      r9,-1
    31b8:	7c 0a 48 00 	cmpw    r10,r9
    31bc:	40 82 00 18 	bne     31d4 <vsnprintf+0x6d0>
    31c0:	39 20 00 08 	li      r9,8
    31c4:	91 21 00 28 	stw     r9,40(r1)
    31c8:	81 21 00 24 	lwz     r9,36(r1)
    31cc:	61 29 00 21 	ori     r9,r9,33
    31d0:	91 21 00 24 	stw     r9,36(r1)
    31d4:	81 21 00 54 	lwz     r9,84(r1)
    31d8:	89 29 00 00 	lbz     r9,0(r9)
    31dc:	28 09 00 07 	cmplwi  r9,7
    31e0:	41 81 00 30 	bgt     3210 <vsnprintf+0x70c>
    31e4:	81 21 00 54 	lwz     r9,84(r1)
    31e8:	81 49 00 08 	lwz     r10,8(r9)
    31ec:	81 21 00 54 	lwz     r9,84(r1)
    31f0:	89 29 00 00 	lbz     r9,0(r9)
    31f4:	39 09 00 01 	addi    r8,r9,1
    31f8:	55 07 06 3e 	clrlwi  r7,r8,24
    31fc:	81 01 00 54 	lwz     r8,84(r1)
    3200:	98 e8 00 00 	stb     r7,0(r8)
    3204:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3208:	7d 2a 4a 14 	add     r9,r10,r9
    320c:	48 00 00 18 	b       3224 <vsnprintf+0x720>
    3210:	81 21 00 54 	lwz     r9,84(r1)
    3214:	81 29 00 04 	lwz     r9,4(r9)
    3218:	39 09 00 04 	addi    r8,r9,4
    321c:	81 41 00 54 	lwz     r10,84(r1)
    3220:	91 0a 00 04 	stw     r8,4(r10)
    3224:	81 29 00 00 	lwz     r9,0(r9)
    3228:	7d 2a 4b 78 	mr      r10,r9
    322c:	81 21 00 24 	lwz     r9,36(r1)
    3230:	81 01 00 2c 	lwz     r8,44(r1)
    3234:	80 e1 00 28 	lwz     r7,40(r1)
    3238:	38 c0 00 10 	li      r6,16
    323c:	7d 45 53 78 	mr      r5,r10
    3240:	80 81 00 1c 	lwz     r4,28(r1)
    3244:	80 61 00 18 	lwz     r3,24(r1)
    3248:	4b ff ef bd 	bl      2204 <number>
    324c:	7c 69 1b 78 	mr      r9,r3
    3250:	91 21 00 18 	stw     r9,24(r1)
    3254:	48 00 05 b4 	b       3808 <vsnprintf+0xd04>
    3258:	81 21 00 30 	lwz     r9,48(r1)
    325c:	2c 09 00 6c 	cmpwi   r9,108
    3260:	40 82 00 74 	bne     32d4 <vsnprintf+0x7d0>
    3264:	81 21 00 54 	lwz     r9,84(r1)
    3268:	89 29 00 00 	lbz     r9,0(r9)
    326c:	28 09 00 07 	cmplwi  r9,7
    3270:	41 81 00 30 	bgt     32a0 <vsnprintf+0x79c>
    3274:	81 21 00 54 	lwz     r9,84(r1)
    3278:	81 49 00 08 	lwz     r10,8(r9)
    327c:	81 21 00 54 	lwz     r9,84(r1)
    3280:	89 29 00 00 	lbz     r9,0(r9)
    3284:	39 09 00 01 	addi    r8,r9,1
    3288:	55 07 06 3e 	clrlwi  r7,r8,24
    328c:	81 01 00 54 	lwz     r8,84(r1)
    3290:	98 e8 00 00 	stb     r7,0(r8)
    3294:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3298:	7d 2a 4a 14 	add     r9,r10,r9
    329c:	48 00 00 18 	b       32b4 <vsnprintf+0x7b0>
    32a0:	81 21 00 54 	lwz     r9,84(r1)
    32a4:	81 29 00 04 	lwz     r9,4(r9)
    32a8:	39 09 00 04 	addi    r8,r9,4
    32ac:	81 41 00 54 	lwz     r10,84(r1)
    32b0:	91 0a 00 04 	stw     r8,4(r10)
    32b4:	81 29 00 00 	lwz     r9,0(r9)
    32b8:	91 21 00 40 	stw     r9,64(r1)
    32bc:	81 41 00 18 	lwz     r10,24(r1)
    32c0:	81 21 00 48 	lwz     r9,72(r1)
    32c4:	7d 49 50 50 	subf    r10,r9,r10
    32c8:	81 21 00 40 	lwz     r9,64(r1)
    32cc:	91 49 00 00 	stw     r10,0(r9)
    32d0:	48 00 05 38 	b       3808 <vsnprintf+0xd04>
    32d4:	81 21 00 30 	lwz     r9,48(r1)
    32d8:	2c 09 00 5a 	cmpwi   r9,90
    32dc:	41 82 00 10 	beq     32ec <vsnprintf+0x7e8>
    32e0:	81 21 00 30 	lwz     r9,48(r1)
    32e4:	2c 09 00 7a 	cmpwi   r9,122
    32e8:	40 82 00 7c 	bne     3364 <vsnprintf+0x860>
    32ec:	81 21 00 54 	lwz     r9,84(r1)
    32f0:	89 29 00 00 	lbz     r9,0(r9)
    32f4:	28 09 00 07 	cmplwi  r9,7
    32f8:	41 81 00 30 	bgt     3328 <vsnprintf+0x824>
    32fc:	81 21 00 54 	lwz     r9,84(r1)
    3300:	81 49 00 08 	lwz     r10,8(r9)
    3304:	81 21 00 54 	lwz     r9,84(r1)
    3308:	89 29 00 00 	lbz     r9,0(r9)
    330c:	39 09 00 01 	addi    r8,r9,1
    3310:	55 07 06 3e 	clrlwi  r7,r8,24
    3314:	81 01 00 54 	lwz     r8,84(r1)
    3318:	98 e8 00 00 	stb     r7,0(r8)
    331c:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3320:	7d 2a 4a 14 	add     r9,r10,r9
    3324:	48 00 00 18 	b       333c <vsnprintf+0x838>
    3328:	81 21 00 54 	lwz     r9,84(r1)
    332c:	81 29 00 04 	lwz     r9,4(r9)
    3330:	39 09 00 04 	addi    r8,r9,4
    3334:	81 41 00 54 	lwz     r10,84(r1)
    3338:	91 0a 00 04 	stw     r8,4(r10)
    333c:	81 29 00 00 	lwz     r9,0(r9)
    3340:	91 21 00 3c 	stw     r9,60(r1)
    3344:	81 41 00 18 	lwz     r10,24(r1)
    3348:	81 21 00 48 	lwz     r9,72(r1)
    334c:	7d 29 50 50 	subf    r9,r9,r10
    3350:	7d 2a 4b 78 	mr      r10,r9
    3354:	81 21 00 3c 	lwz     r9,60(r1)
    3358:	91 49 00 00 	stw     r10,0(r9)
    335c:	60 00 00 00 	nop
    3360:	48 00 04 a8 	b       3808 <vsnprintf+0xd04>
    3364:	81 21 00 54 	lwz     r9,84(r1)
    3368:	89 29 00 00 	lbz     r9,0(r9)
    336c:	28 09 00 07 	cmplwi  r9,7
    3370:	41 81 00 30 	bgt     33a0 <vsnprintf+0x89c>
    3374:	81 21 00 54 	lwz     r9,84(r1)
    3378:	81 49 00 08 	lwz     r10,8(r9)
    337c:	81 21 00 54 	lwz     r9,84(r1)
    3380:	89 29 00 00 	lbz     r9,0(r9)
    3384:	39 09 00 01 	addi    r8,r9,1
    3388:	55 07 06 3e 	clrlwi  r7,r8,24
    338c:	81 01 00 54 	lwz     r8,84(r1)
    3390:	98 e8 00 00 	stb     r7,0(r8)
    3394:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3398:	7d 2a 4a 14 	add     r9,r10,r9
    339c:	48 00 00 18 	b       33b4 <vsnprintf+0x8b0>
    33a0:	81 21 00 54 	lwz     r9,84(r1)
    33a4:	81 29 00 04 	lwz     r9,4(r9)
    33a8:	39 09 00 04 	addi    r8,r9,4
    33ac:	81 41 00 54 	lwz     r10,84(r1)
    33b0:	91 0a 00 04 	stw     r8,4(r10)
    33b4:	81 29 00 00 	lwz     r9,0(r9)
    33b8:	91 21 00 38 	stw     r9,56(r1)
    33bc:	81 41 00 18 	lwz     r10,24(r1)
    33c0:	81 21 00 48 	lwz     r9,72(r1)
    33c4:	7d 49 50 50 	subf    r10,r9,r10
    33c8:	81 21 00 38 	lwz     r9,56(r1)
    33cc:	91 49 00 00 	stw     r10,0(r9)
    33d0:	48 00 04 38 	b       3808 <vsnprintf+0xd04>
    33d4:	81 41 00 18 	lwz     r10,24(r1)
    33d8:	81 21 00 1c 	lwz     r9,28(r1)
    33dc:	7c 0a 48 40 	cmplw   r10,r9
    33e0:	40 80 00 10 	bge     33f0 <vsnprintf+0x8ec>
    33e4:	81 21 00 18 	lwz     r9,24(r1)
    33e8:	39 40 00 25 	li      r10,37
    33ec:	99 49 00 00 	stb     r10,0(r9)
    33f0:	81 21 00 18 	lwz     r9,24(r1)
    33f4:	39 29 00 01 	addi    r9,r9,1
    33f8:	91 21 00 18 	stw     r9,24(r1)
    33fc:	48 00 04 0c 	b       3808 <vsnprintf+0xd04>
    3400:	39 20 00 08 	li      r9,8
    3404:	91 21 00 14 	stw     r9,20(r1)
    3408:	48 00 00 a8 	b       34b0 <vsnprintf+0x9ac>
    340c:	81 21 00 24 	lwz     r9,36(r1)
    3410:	61 29 00 40 	ori     r9,r9,64
    3414:	91 21 00 24 	stw     r9,36(r1)
    3418:	39 20 00 10 	li      r9,16
    341c:	91 21 00 14 	stw     r9,20(r1)
    3420:	48 00 00 90 	b       34b0 <vsnprintf+0x9ac>
    3424:	81 21 00 24 	lwz     r9,36(r1)
    3428:	61 29 00 02 	ori     r9,r9,2
    342c:	91 21 00 24 	stw     r9,36(r1)
    3430:	48 00 00 7c 	b       34ac <vsnprintf+0x9a8>
    3434:	81 41 00 18 	lwz     r10,24(r1)
    3438:	81 21 00 1c 	lwz     r9,28(r1)
    343c:	7c 0a 48 40 	cmplw   r10,r9
    3440:	40 80 00 10 	bge     3450 <vsnprintf+0x94c>
    3444:	81 21 00 18 	lwz     r9,24(r1)
    3448:	39 40 00 25 	li      r10,37
    344c:	99 49 00 00 	stb     r10,0(r9)
    3450:	81 21 00 18 	lwz     r9,24(r1)
    3454:	39 29 00 01 	addi    r9,r9,1
    3458:	91 21 00 18 	stw     r9,24(r1)
    345c:	81 21 00 50 	lwz     r9,80(r1)
    3460:	89 29 00 00 	lbz     r9,0(r9)
    3464:	2c 09 00 00 	cmpwi   r9,0
    3468:	41 82 00 34 	beq     349c <vsnprintf+0x998>
    346c:	81 41 00 18 	lwz     r10,24(r1)
    3470:	81 21 00 1c 	lwz     r9,28(r1)
    3474:	7c 0a 48 40 	cmplw   r10,r9
    3478:	40 80 00 14 	bge     348c <vsnprintf+0x988>
    347c:	81 21 00 50 	lwz     r9,80(r1)
    3480:	89 49 00 00 	lbz     r10,0(r9)
    3484:	81 21 00 18 	lwz     r9,24(r1)
    3488:	99 49 00 00 	stb     r10,0(r9)
    348c:	81 21 00 18 	lwz     r9,24(r1)
    3490:	39 29 00 01 	addi    r9,r9,1
    3494:	91 21 00 18 	stw     r9,24(r1)
    3498:	48 00 03 70 	b       3808 <vsnprintf+0xd04>
    349c:	81 21 00 50 	lwz     r9,80(r1)
    34a0:	39 29 ff ff 	addi    r9,r9,-1
    34a4:	91 21 00 50 	stw     r9,80(r1)
    34a8:	48 00 03 60 	b       3808 <vsnprintf+0xd04>
    34ac:	60 00 00 00 	nop
    34b0:	81 21 00 30 	lwz     r9,48(r1)
    34b4:	2c 09 00 4c 	cmpwi   r9,76
    34b8:	40 82 00 90 	bne     3548 <vsnprintf+0xa44>
    34bc:	81 21 00 54 	lwz     r9,84(r1)
    34c0:	89 29 00 00 	lbz     r9,0(r9)
    34c4:	81 41 00 54 	lwz     r10,84(r1)
    34c8:	89 4a 00 00 	lbz     r10,0(r10)
    34cc:	55 4a 07 fe 	clrlwi  r10,r10,31
    34d0:	55 4a 06 3e 	clrlwi  r10,r10,24
    34d4:	7d 4a 4a 14 	add     r10,r10,r9
    34d8:	55 48 06 3e 	clrlwi  r8,r10,24
    34dc:	81 41 00 54 	lwz     r10,84(r1)
    34e0:	99 0a 00 00 	stb     r8,0(r10)
    34e4:	28 09 00 06 	cmplwi  r9,6
    34e8:	41 81 00 30 	bgt     3518 <vsnprintf+0xa14>
    34ec:	81 21 00 54 	lwz     r9,84(r1)
    34f0:	81 49 00 08 	lwz     r10,8(r9)
    34f4:	81 21 00 54 	lwz     r9,84(r1)
    34f8:	89 29 00 00 	lbz     r9,0(r9)
    34fc:	39 09 00 02 	addi    r8,r9,2
    3500:	55 07 06 3e 	clrlwi  r7,r8,24
    3504:	81 01 00 54 	lwz     r8,84(r1)
    3508:	98 e8 00 00 	stb     r7,0(r8)
    350c:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3510:	7d 2a 4a 14 	add     r9,r10,r9
    3514:	48 00 00 20 	b       3534 <vsnprintf+0xa30>
    3518:	81 21 00 54 	lwz     r9,84(r1)
    351c:	81 29 00 04 	lwz     r9,4(r9)
    3520:	39 29 00 07 	addi    r9,r9,7
    3524:	55 29 00 38 	rlwinm  r9,r9,0,0,28
    3528:	39 09 00 08 	addi    r8,r9,8
    352c:	81 41 00 54 	lwz     r10,84(r1)
    3530:	91 0a 00 04 	stw     r8,4(r10)
    3534:	81 49 00 00 	lwz     r10,0(r9)
    3538:	81 69 00 04 	lwz     r11,4(r9)
    353c:	91 41 00 08 	stw     r10,8(r1)
    3540:	91 61 00 0c 	stw     r11,12(r1)
    3544:	48 00 02 98 	b       37dc <vsnprintf+0xcd8>
    3548:	81 21 00 30 	lwz     r9,48(r1)
    354c:	2c 09 00 6c 	cmpwi   r9,108
    3550:	40 82 00 88 	bne     35d8 <vsnprintf+0xad4>
    3554:	81 21 00 54 	lwz     r9,84(r1)
    3558:	89 29 00 00 	lbz     r9,0(r9)
    355c:	28 09 00 07 	cmplwi  r9,7
    3560:	41 81 00 30 	bgt     3590 <vsnprintf+0xa8c>
    3564:	81 21 00 54 	lwz     r9,84(r1)
    3568:	81 49 00 08 	lwz     r10,8(r9)
    356c:	81 21 00 54 	lwz     r9,84(r1)
    3570:	89 29 00 00 	lbz     r9,0(r9)
    3574:	39 09 00 01 	addi    r8,r9,1
    3578:	55 07 06 3e 	clrlwi  r7,r8,24
    357c:	81 01 00 54 	lwz     r8,84(r1)
    3580:	98 e8 00 00 	stb     r7,0(r8)
    3584:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3588:	7d 2a 4a 14 	add     r9,r10,r9
    358c:	48 00 00 18 	b       35a4 <vsnprintf+0xaa0>
    3590:	81 21 00 54 	lwz     r9,84(r1)
    3594:	81 29 00 04 	lwz     r9,4(r9)
    3598:	39 09 00 04 	addi    r8,r9,4
    359c:	81 41 00 54 	lwz     r10,84(r1)
    35a0:	91 0a 00 04 	stw     r8,4(r10)
    35a4:	81 29 00 00 	lwz     r9,0(r9)
    35a8:	91 21 00 0c 	stw     r9,12(r1)
    35ac:	39 20 00 00 	li      r9,0
    35b0:	91 21 00 08 	stw     r9,8(r1)
    35b4:	81 21 00 24 	lwz     r9,36(r1)
    35b8:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    35bc:	2c 09 00 00 	cmpwi   r9,0
    35c0:	41 82 02 1c 	beq     37dc <vsnprintf+0xcd8>
    35c4:	81 21 00 0c 	lwz     r9,12(r1)
    35c8:	91 21 00 0c 	stw     r9,12(r1)
    35cc:	7d 29 fe 70 	srawi   r9,r9,31
    35d0:	91 21 00 08 	stw     r9,8(r1)
    35d4:	48 00 02 08 	b       37dc <vsnprintf+0xcd8>
    35d8:	81 21 00 30 	lwz     r9,48(r1)
    35dc:	2c 09 00 5a 	cmpwi   r9,90
    35e0:	41 82 00 10 	beq     35f0 <vsnprintf+0xaec>
    35e4:	81 21 00 30 	lwz     r9,48(r1)
    35e8:	2c 09 00 7a 	cmpwi   r9,122
    35ec:	40 82 00 68 	bne     3654 <vsnprintf+0xb50>
    35f0:	81 21 00 54 	lwz     r9,84(r1)
    35f4:	89 29 00 00 	lbz     r9,0(r9)
    35f8:	28 09 00 07 	cmplwi  r9,7
    35fc:	41 81 00 30 	bgt     362c <vsnprintf+0xb28>
    3600:	81 21 00 54 	lwz     r9,84(r1)
    3604:	81 49 00 08 	lwz     r10,8(r9)
    3608:	81 21 00 54 	lwz     r9,84(r1)
    360c:	89 29 00 00 	lbz     r9,0(r9)
    3610:	39 09 00 01 	addi    r8,r9,1
    3614:	55 07 06 3e 	clrlwi  r7,r8,24
    3618:	81 01 00 54 	lwz     r8,84(r1)
    361c:	98 e8 00 00 	stb     r7,0(r8)
    3620:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3624:	7d 2a 4a 14 	add     r9,r10,r9
    3628:	48 00 00 18 	b       3640 <vsnprintf+0xb3c>
    362c:	81 21 00 54 	lwz     r9,84(r1)
    3630:	81 29 00 04 	lwz     r9,4(r9)
    3634:	39 09 00 04 	addi    r8,r9,4
    3638:	81 41 00 54 	lwz     r10,84(r1)
    363c:	91 0a 00 04 	stw     r8,4(r10)
    3640:	81 29 00 00 	lwz     r9,0(r9)
    3644:	91 21 00 0c 	stw     r9,12(r1)
    3648:	39 20 00 00 	li      r9,0
    364c:	91 21 00 08 	stw     r9,8(r1)
    3650:	48 00 01 8c 	b       37dc <vsnprintf+0xcd8>
    3654:	81 21 00 30 	lwz     r9,48(r1)
    3658:	2c 09 00 74 	cmpwi   r9,116
    365c:	40 82 00 68 	bne     36c4 <vsnprintf+0xbc0>
    3660:	81 21 00 54 	lwz     r9,84(r1)
    3664:	89 29 00 00 	lbz     r9,0(r9)
    3668:	28 09 00 07 	cmplwi  r9,7
    366c:	41 81 00 30 	bgt     369c <vsnprintf+0xb98>
    3670:	81 21 00 54 	lwz     r9,84(r1)
    3674:	81 49 00 08 	lwz     r10,8(r9)
    3678:	81 21 00 54 	lwz     r9,84(r1)
    367c:	89 29 00 00 	lbz     r9,0(r9)
    3680:	39 09 00 01 	addi    r8,r9,1
    3684:	55 07 06 3e 	clrlwi  r7,r8,24
    3688:	81 01 00 54 	lwz     r8,84(r1)
    368c:	98 e8 00 00 	stb     r7,0(r8)
    3690:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3694:	7d 2a 4a 14 	add     r9,r10,r9
    3698:	48 00 00 18 	b       36b0 <vsnprintf+0xbac>
    369c:	81 21 00 54 	lwz     r9,84(r1)
    36a0:	81 29 00 04 	lwz     r9,4(r9)
    36a4:	39 09 00 04 	addi    r8,r9,4
    36a8:	81 41 00 54 	lwz     r10,84(r1)
    36ac:	91 0a 00 04 	stw     r8,4(r10)
    36b0:	81 29 00 00 	lwz     r9,0(r9)
    36b4:	91 21 00 0c 	stw     r9,12(r1)
    36b8:	7d 29 fe 70 	srawi   r9,r9,31
    36bc:	91 21 00 08 	stw     r9,8(r1)
    36c0:	48 00 01 1c 	b       37dc <vsnprintf+0xcd8>
    36c4:	81 21 00 30 	lwz     r9,48(r1)
    36c8:	2c 09 00 68 	cmpwi   r9,104
    36cc:	40 82 00 90 	bne     375c <vsnprintf+0xc58>
    36d0:	81 21 00 54 	lwz     r9,84(r1)
    36d4:	89 29 00 00 	lbz     r9,0(r9)
    36d8:	28 09 00 07 	cmplwi  r9,7
    36dc:	41 81 00 30 	bgt     370c <vsnprintf+0xc08>
    36e0:	81 21 00 54 	lwz     r9,84(r1)
    36e4:	81 49 00 08 	lwz     r10,8(r9)
    36e8:	81 21 00 54 	lwz     r9,84(r1)
    36ec:	89 29 00 00 	lbz     r9,0(r9)
    36f0:	39 09 00 01 	addi    r8,r9,1
    36f4:	55 07 06 3e 	clrlwi  r7,r8,24
    36f8:	81 01 00 54 	lwz     r8,84(r1)
    36fc:	98 e8 00 00 	stb     r7,0(r8)
    3700:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3704:	7d 2a 4a 14 	add     r9,r10,r9
    3708:	48 00 00 18 	b       3720 <vsnprintf+0xc1c>
    370c:	81 21 00 54 	lwz     r9,84(r1)
    3710:	81 29 00 04 	lwz     r9,4(r9)
    3714:	39 09 00 04 	addi    r8,r9,4
    3718:	81 41 00 54 	lwz     r10,84(r1)
    371c:	91 0a 00 04 	stw     r8,4(r10)
    3720:	81 29 00 00 	lwz     r9,0(r9)
    3724:	55 29 04 3e 	clrlwi  r9,r9,16
    3728:	91 21 00 0c 	stw     r9,12(r1)
    372c:	39 20 00 00 	li      r9,0
    3730:	91 21 00 08 	stw     r9,8(r1)
    3734:	81 21 00 24 	lwz     r9,36(r1)
    3738:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    373c:	2c 09 00 00 	cmpwi   r9,0
    3740:	41 82 00 9c 	beq     37dc <vsnprintf+0xcd8>
    3744:	a1 21 00 0e 	lhz     r9,14(r1)
    3748:	7d 29 07 34 	extsh   r9,r9
    374c:	91 21 00 0c 	stw     r9,12(r1)
    3750:	7d 29 fe 70 	srawi   r9,r9,31
    3754:	91 21 00 08 	stw     r9,8(r1)
    3758:	48 00 00 84 	b       37dc <vsnprintf+0xcd8>
    375c:	81 21 00 54 	lwz     r9,84(r1)
    3760:	89 29 00 00 	lbz     r9,0(r9)
    3764:	28 09 00 07 	cmplwi  r9,7
    3768:	41 81 00 30 	bgt     3798 <vsnprintf+0xc94>
    376c:	81 21 00 54 	lwz     r9,84(r1)
    3770:	81 49 00 08 	lwz     r10,8(r9)
    3774:	81 21 00 54 	lwz     r9,84(r1)
    3778:	89 29 00 00 	lbz     r9,0(r9)
    377c:	39 09 00 01 	addi    r8,r9,1
    3780:	55 07 06 3e 	clrlwi  r7,r8,24
    3784:	81 01 00 54 	lwz     r8,84(r1)
    3788:	98 e8 00 00 	stb     r7,0(r8)
    378c:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3790:	7d 2a 4a 14 	add     r9,r10,r9
    3794:	48 00 00 18 	b       37ac <vsnprintf+0xca8>
    3798:	81 21 00 54 	lwz     r9,84(r1)
    379c:	81 29 00 04 	lwz     r9,4(r9)
    37a0:	39 09 00 04 	addi    r8,r9,4
    37a4:	81 41 00 54 	lwz     r10,84(r1)
    37a8:	91 0a 00 04 	stw     r8,4(r10)
    37ac:	81 29 00 00 	lwz     r9,0(r9)
    37b0:	91 21 00 0c 	stw     r9,12(r1)
    37b4:	39 20 00 00 	li      r9,0
    37b8:	91 21 00 08 	stw     r9,8(r1)
    37bc:	81 21 00 24 	lwz     r9,36(r1)
    37c0:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    37c4:	2c 09 00 00 	cmpwi   r9,0
    37c8:	41 82 00 14 	beq     37dc <vsnprintf+0xcd8>
    37cc:	81 21 00 0c 	lwz     r9,12(r1)
    37d0:	91 21 00 0c 	stw     r9,12(r1)
    37d4:	7d 29 fe 70 	srawi   r9,r9,31
    37d8:	91 21 00 08 	stw     r9,8(r1)
    37dc:	81 41 00 0c 	lwz     r10,12(r1)
    37e0:	81 21 00 24 	lwz     r9,36(r1)
    37e4:	81 01 00 2c 	lwz     r8,44(r1)
    37e8:	80 e1 00 28 	lwz     r7,40(r1)
    37ec:	80 c1 00 14 	lwz     r6,20(r1)
    37f0:	7d 45 53 78 	mr      r5,r10
    37f4:	80 81 00 1c 	lwz     r4,28(r1)
    37f8:	80 61 00 18 	lwz     r3,24(r1)
    37fc:	4b ff ea 09 	bl      2204 <number>
    3800:	7c 69 1b 78 	mr      r9,r3
    3804:	91 21 00 18 	stw     r9,24(r1)
    3808:	81 21 00 50 	lwz     r9,80(r1)
    380c:	39 29 00 01 	addi    r9,r9,1
    3810:	91 21 00 50 	stw     r9,80(r1)
    3814:	81 21 00 50 	lwz     r9,80(r1)
    3818:	89 29 00 00 	lbz     r9,0(r9)
    381c:	2c 09 00 00 	cmpwi   r9,0
    3820:	40 82 f3 58 	bne     2b78 <vsnprintf+0x74>
    3824:	81 21 00 4c 	lwz     r9,76(r1)
    3828:	2c 09 00 00 	cmpwi   r9,0
    382c:	41 82 00 34 	beq     3860 <vsnprintf+0xd5c>
    3830:	81 41 00 18 	lwz     r10,24(r1)
    3834:	81 21 00 1c 	lwz     r9,28(r1)
    3838:	7c 0a 48 40 	cmplw   r10,r9
    383c:	40 80 00 14 	bge     3850 <vsnprintf+0xd4c>
    3840:	81 21 00 18 	lwz     r9,24(r1)
    3844:	39 40 00 00 	li      r10,0
    3848:	99 49 00 00 	stb     r10,0(r9)
    384c:	48 00 00 14 	b       3860 <vsnprintf+0xd5c>
    3850:	81 21 00 1c 	lwz     r9,28(r1)
    3854:	39 29 ff ff 	addi    r9,r9,-1
    3858:	39 40 00 00 	li      r10,0
    385c:	99 49 00 00 	stb     r10,0(r9)
    3860:	81 41 00 18 	lwz     r10,24(r1)
    3864:	81 21 00 48 	lwz     r9,72(r1)
    3868:	7d 29 50 50 	subf    r9,r9,r10
    386c:	7d 23 4b 78 	mr      r3,r9
    3870:	80 01 00 64 	lwz     r0,100(r1)
    3874:	7c 08 03 a6 	mtlr    r0
    3878:	38 21 00 60 	addi    r1,r1,96
    387c:	4e 80 00 20 	blr

00003880 <console_set_write_hook>:
    3880:	94 21 ff f0 	stwu    r1,-16(r1)
    3884:	90 61 00 08 	stw     r3,8(r1)
    3888:	3d 20 00 02 	lis     r9,2
    388c:	81 41 00 08 	lwz     r10,8(r1)
    3890:	91 49 e0 18 	stw     r10,-8168(r9)
    3894:	60 00 00 00 	nop
    3898:	38 21 00 10 	addi    r1,r1,16
    389c:	4e 80 00 20 	blr

000038a0 <console_set_read_hook>:
    38a0:	94 21 ff f0 	stwu    r1,-16(r1)
    38a4:	90 61 00 08 	stw     r3,8(r1)
    38a8:	90 81 00 0c 	stw     r4,12(r1)
    38ac:	3d 20 00 02 	lis     r9,2
    38b0:	81 41 00 08 	lwz     r10,8(r1)
    38b4:	91 49 e0 1c 	stw     r10,-8164(r9)
    38b8:	3d 20 00 02 	lis     r9,2
    38bc:	81 41 00 0c 	lwz     r10,12(r1)
    38c0:	91 49 e0 20 	stw     r10,-8160(r9)
    38c4:	60 00 00 00 	nop
    38c8:	38 21 00 10 	addi    r1,r1,16
    38cc:	4e 80 00 20 	blr

000038d0 <putchar>:
    38d0:	94 21 ff f0 	stwu    r1,-16(r1)
    38d4:	7c 08 02 a6 	mflr    r0
    38d8:	90 01 00 14 	stw     r0,20(r1)
    38dc:	90 61 00 08 	stw     r3,8(r1)
    38e0:	3d 20 00 02 	lis     r9,2
    38e4:	81 29 e0 18 	lwz     r9,-8168(r9)
    38e8:	2c 09 00 00 	cmpwi   r9,0
    38ec:	41 82 00 20 	beq     390c <putchar+0x3c>
    38f0:	3d 20 00 02 	lis     r9,2
    38f4:	81 29 e0 18 	lwz     r9,-8168(r9)
    38f8:	81 41 00 08 	lwz     r10,8(r1)
    38fc:	55 4a 06 3e 	clrlwi  r10,r10,24
    3900:	7d 43 53 78 	mr      r3,r10
    3904:	7d 29 03 a6 	mtctr   r9
    3908:	4e 80 04 21 	bctrl
    390c:	81 21 00 08 	lwz     r9,8(r1)
    3910:	7d 23 4b 78 	mr      r3,r9
    3914:	80 01 00 14 	lwz     r0,20(r1)
    3918:	7c 08 03 a6 	mtlr    r0
    391c:	38 21 00 10 	addi    r1,r1,16
    3920:	4e 80 00 20 	blr

00003924 <readchar>:
    3924:	94 21 ff f0 	stwu    r1,-16(r1)
    3928:	7c 08 02 a6 	mflr    r0
    392c:	90 01 00 14 	stw     r0,20(r1)
    3930:	3d 20 00 02 	lis     r9,2
    3934:	81 29 e0 20 	lwz     r9,-8160(r9)
    3938:	2c 09 00 00 	cmpwi   r9,0
    393c:	41 82 ff f4 	beq     3930 <readchar+0xc>
    3940:	3d 20 00 02 	lis     r9,2
    3944:	81 29 e0 20 	lwz     r9,-8160(r9)
    3948:	7d 29 03 a6 	mtctr   r9
    394c:	4e 80 04 21 	bctrl
    3950:	7c 69 1b 78 	mr      r9,r3
    3954:	2c 09 00 00 	cmpwi   r9,0
    3958:	41 82 ff d8 	beq     3930 <readchar+0xc>
    395c:	3d 20 00 02 	lis     r9,2
    3960:	81 29 e0 1c 	lwz     r9,-8164(r9)
    3964:	7d 29 03 a6 	mtctr   r9
    3968:	4e 80 04 21 	bctrl
    396c:	7c 69 1b 78 	mr      r9,r3
    3970:	7d 23 4b 78 	mr      r3,r9
    3974:	80 01 00 14 	lwz     r0,20(r1)
    3978:	7c 08 03 a6 	mtlr    r0
    397c:	38 21 00 10 	addi    r1,r1,16
    3980:	4e 80 00 20 	blr

00003984 <readchar_nonblock>:
    3984:	94 21 ff f0 	stwu    r1,-16(r1)
    3988:	7c 08 02 a6 	mflr    r0
    398c:	90 01 00 14 	stw     r0,20(r1)
    3990:	3d 20 00 02 	lis     r9,2
    3994:	81 29 e0 20 	lwz     r9,-8160(r9)
    3998:	2c 09 00 00 	cmpwi   r9,0
    399c:	41 82 00 28 	beq     39c4 <readchar_nonblock+0x40>
    39a0:	3d 20 00 02 	lis     r9,2
    39a4:	81 29 e0 20 	lwz     r9,-8160(r9)
    39a8:	7d 29 03 a6 	mtctr   r9
    39ac:	4e 80 04 21 	bctrl
    39b0:	7c 69 1b 78 	mr      r9,r3
    39b4:	2c 09 00 00 	cmpwi   r9,0
    39b8:	41 82 00 0c 	beq     39c4 <readchar_nonblock+0x40>
    39bc:	39 20 00 01 	li      r9,1
    39c0:	48 00 00 08 	b       39c8 <readchar_nonblock+0x44>
    39c4:	39 20 00 00 	li      r9,0
    39c8:	7d 23 4b 78 	mr      r3,r9
    39cc:	80 01 00 14 	lwz     r0,20(r1)
    39d0:	7c 08 03 a6 	mtlr    r0
    39d4:	38 21 00 10 	addi    r1,r1,16
    39d8:	4e 80 00 20 	blr

000039dc <puts>:
    39dc:	94 21 ff f0 	stwu    r1,-16(r1)
    39e0:	7c 08 02 a6 	mflr    r0
    39e4:	90 01 00 14 	stw     r0,20(r1)
    39e8:	90 61 00 08 	stw     r3,8(r1)
    39ec:	80 61 00 08 	lwz     r3,8(r1)
    39f0:	48 00 00 25 	bl      3a14 <putsnonl>
    39f4:	38 60 00 0a 	li      r3,10
    39f8:	4b ff fe d9 	bl      38d0 <putchar>
    39fc:	39 20 00 01 	li      r9,1
    3a00:	7d 23 4b 78 	mr      r3,r9
    3a04:	80 01 00 14 	lwz     r0,20(r1)
    3a08:	7c 08 03 a6 	mtlr    r0
    3a0c:	38 21 00 10 	addi    r1,r1,16
    3a10:	4e 80 00 20 	blr

00003a14 <putsnonl>:
    3a14:	94 21 ff f0 	stwu    r1,-16(r1)
    3a18:	7c 08 02 a6 	mflr    r0
    3a1c:	90 01 00 14 	stw     r0,20(r1)
    3a20:	90 61 00 08 	stw     r3,8(r1)
    3a24:	48 00 00 20 	b       3a44 <putsnonl+0x30>
    3a28:	81 21 00 08 	lwz     r9,8(r1)
    3a2c:	89 29 00 00 	lbz     r9,0(r9)
    3a30:	7d 23 4b 78 	mr      r3,r9
    3a34:	4b ff fe 9d 	bl      38d0 <putchar>
    3a38:	81 21 00 08 	lwz     r9,8(r1)
    3a3c:	39 29 00 01 	addi    r9,r9,1
    3a40:	91 21 00 08 	stw     r9,8(r1)
    3a44:	81 21 00 08 	lwz     r9,8(r1)
    3a48:	89 29 00 00 	lbz     r9,0(r9)
    3a4c:	2c 09 00 00 	cmpwi   r9,0
    3a50:	40 82 ff d8 	bne     3a28 <putsnonl+0x14>
    3a54:	60 00 00 00 	nop
    3a58:	60 00 00 00 	nop
    3a5c:	80 01 00 14 	lwz     r0,20(r1)
    3a60:	7c 08 03 a6 	mtlr    r0
    3a64:	38 21 00 10 	addi    r1,r1,16
    3a68:	4e 80 00 20 	blr

00003a6c <vprintf>:
    3a6c:	94 21 fe e0 	stwu    r1,-288(r1)
    3a70:	7c 08 02 a6 	mflr    r0
    3a74:	90 01 01 24 	stw     r0,292(r1)
    3a78:	90 61 01 18 	stw     r3,280(r1)
    3a7c:	90 81 01 1c 	stw     r4,284(r1)
    3a80:	39 21 00 0c 	addi    r9,r1,12
    3a84:	80 c1 01 1c 	lwz     r6,284(r1)
    3a88:	80 a1 01 18 	lwz     r5,280(r1)
    3a8c:	38 80 01 00 	li      r4,256
    3a90:	7d 23 4b 78 	mr      r3,r9
    3a94:	4b ff eb f9 	bl      268c <vscnprintf>
    3a98:	7c 69 1b 78 	mr      r9,r3
    3a9c:	91 21 00 08 	stw     r9,8(r1)
    3aa0:	39 41 00 0c 	addi    r10,r1,12
    3aa4:	81 21 00 08 	lwz     r9,8(r1)
    3aa8:	7d 2a 4a 14 	add     r9,r10,r9
    3aac:	39 40 00 00 	li      r10,0
    3ab0:	99 49 00 00 	stb     r10,0(r9)
    3ab4:	39 21 00 0c 	addi    r9,r1,12
    3ab8:	7d 23 4b 78 	mr      r3,r9
    3abc:	4b ff ff 59 	bl      3a14 <putsnonl>
    3ac0:	81 21 00 08 	lwz     r9,8(r1)
    3ac4:	7d 23 4b 78 	mr      r3,r9
    3ac8:	80 01 01 24 	lwz     r0,292(r1)
    3acc:	7c 08 03 a6 	mtlr    r0
    3ad0:	38 21 01 20 	addi    r1,r1,288
    3ad4:	4e 80 00 20 	blr

00003ad8 <printf>:
    3ad8:	94 21 ff 80 	stwu    r1,-128(r1)
    3adc:	7c 08 02 a6 	mflr    r0
    3ae0:	90 01 00 84 	stw     r0,132(r1)
    3ae4:	90 61 00 18 	stw     r3,24(r1)
    3ae8:	90 81 00 24 	stw     r4,36(r1)
    3aec:	90 a1 00 28 	stw     r5,40(r1)
    3af0:	90 c1 00 2c 	stw     r6,44(r1)
    3af4:	90 e1 00 30 	stw     r7,48(r1)
    3af8:	91 01 00 34 	stw     r8,52(r1)
    3afc:	91 21 00 38 	stw     r9,56(r1)
    3b00:	91 41 00 3c 	stw     r10,60(r1)
    3b04:	40 86 00 24 	bne     cr1,3b28 <printf+0x50>
    3b08:	d8 21 00 40 	stfd    f1,64(r1)
    3b0c:	d8 41 00 48 	stfd    f2,72(r1)
    3b10:	d8 61 00 50 	stfd    f3,80(r1)
    3b14:	d8 81 00 58 	stfd    f4,88(r1)
    3b18:	d8 a1 00 60 	stfd    f5,96(r1)
    3b1c:	d8 c1 00 68 	stfd    f6,104(r1)
    3b20:	d8 e1 00 70 	stfd    f7,112(r1)
    3b24:	d9 01 00 78 	stfd    f8,120(r1)
    3b28:	39 20 00 01 	li      r9,1
    3b2c:	99 21 00 0c 	stb     r9,12(r1)
    3b30:	39 20 00 00 	li      r9,0
    3b34:	99 21 00 0d 	stb     r9,13(r1)
    3b38:	39 21 00 88 	addi    r9,r1,136
    3b3c:	91 21 00 10 	stw     r9,16(r1)
    3b40:	39 21 00 20 	addi    r9,r1,32
    3b44:	91 21 00 14 	stw     r9,20(r1)
    3b48:	39 21 00 0c 	addi    r9,r1,12
    3b4c:	7d 24 4b 78 	mr      r4,r9
    3b50:	80 61 00 18 	lwz     r3,24(r1)
    3b54:	4b ff ff 19 	bl      3a6c <vprintf>
    3b58:	7c 69 1b 78 	mr      r9,r3
    3b5c:	91 21 00 08 	stw     r9,8(r1)
    3b60:	81 21 00 08 	lwz     r9,8(r1)
    3b64:	7d 23 4b 78 	mr      r3,r9
    3b68:	80 01 00 84 	lwz     r0,132(r1)
    3b6c:	7c 08 03 a6 	mtlr    r0
    3b70:	38 21 00 80 	addi    r1,r1,128
    3b74:	4e 80 00 20 	blr


rom:     file format elf32-powerpc


Disassembly of section .kernel:

00000000 <_start>:
   0:	48 00 04 00 	b       400 <boot_start>
   4:	44 00 00 02 	sc
	...

00000020 <int_020>:
  20:	48 00 10 0c 	b       102c <int_unhandled>
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
 120:	48 00 11 54 	b       1274 <tst_end>
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
     c54:	39 29 10 60 	addi    r9,r9,4192
     c58:	91 21 00 10 	stw     r9,16(r1)
     c5c:	81 21 00 38 	lwz     r9,56(r1)
     c60:	2c 09 00 00 	cmpwi   r9,0
     c64:	41 82 00 0c 	beq     c70 <main+0x3c>
     c68:	39 20 ff ff 	li      r9,-1
     c6c:	48 00 01 8c 	b       df8 <main+0x1c4>
     c70:	3d 20 00 00 	lis     r9,0
     c74:	39 29 10 30 	addi    r9,r9,4144
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
     cac:	39 29 10 38 	addi    r9,r9,4152
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
     d04:	48 00 2b 3d 	bl      3840 <console_set_write_hook>
     d08:	38 60 00 77 	li      r3,119
     d0c:	48 00 2b 85 	bl      3890 <putchar>
     d10:	38 60 00 74 	li      r3,116
     d14:	48 00 2b 7d 	bl      3890 <putchar>
     d18:	38 60 00 66 	li      r3,102
     d1c:	48 00 2b 75 	bl      3890 <putchar>
     d20:	38 60 00 0a 	li      r3,10
     d24:	48 00 2b 6d 	bl      3890 <putchar>
     d28:	80 81 00 38 	lwz     r4,56(r1)
     d2c:	3d 20 00 00 	lis     r9,0
     d30:	38 69 08 f0 	addi    r3,r9,2288
     d34:	4c c6 31 82 	crclr   4*cr1+eq
     d38:	48 00 2d 61 	bl      3a98 <printf>
     d3c:	3d 20 03 00 	lis     r9,768
     d40:	91 21 00 34 	stw     r9,52(r1)
     d44:	81 21 00 34 	lwz     r9,52(r1)
     d48:	7d 33 4b a6 	mtspr   307,r9
     d4c:	60 00 00 00 	nop
     d50:	39 20 00 00 	li      r9,0
     d54:	91 21 00 30 	stw     r9,48(r1)
     d58:	81 21 00 30 	lwz     r9,48(r1)
     d5c:	7d 36 03 a6 	mtdec   r9
     d60:	60 00 00 00 	nop
     d64:	39 20 00 00 	li      r9,0
     d68:	91 21 00 2c 	stw     r9,44(r1)
     d6c:	81 21 00 2c 	lwz     r9,44(r1)
     d70:	7d 3d 43 a6 	mttbu   r9
     d74:	60 00 00 00 	nop
     d78:	39 20 00 00 	li      r9,0
     d7c:	91 21 00 28 	stw     r9,40(r1)
     d80:	81 21 00 28 	lwz     r9,40(r1)
     d84:	7d 3c 43 a6 	mttbl   r9
     d88:	60 00 00 00 	nop
     d8c:	3d 20 fe 00 	lis     r9,-512
     d90:	91 21 00 24 	stw     r9,36(r1)
     d94:	81 21 00 24 	lwz     r9,36(r1)
     d98:	7d 30 53 a6 	mtspr   336,r9
     d9c:	60 00 00 00 	nop
     da0:	7d 36 fa a6 	mfspr   r9,1014
     da4:	91 21 00 20 	stw     r9,32(r1)
     da8:	81 21 00 20 	lwz     r9,32(r1)
     dac:	55 29 05 ea 	rlwinm  r9,r9,0,23,21
     db0:	91 21 00 1c 	stw     r9,28(r1)
     db4:	81 21 00 1c 	lwz     r9,28(r1)
     db8:	7d 36 fb a6 	mtspr   1014,r9
     dbc:	60 00 00 00 	nop
     dc0:	39 20 00 00 	li      r9,0
     dc4:	91 21 00 18 	stw     r9,24(r1)
     dc8:	81 21 00 18 	lwz     r9,24(r1)
     dcc:	7d 30 53 a6 	mtspr   336,r9
     dd0:	60 00 00 00 	nop
     dd4:	39 20 00 00 	li      r9,0
     dd8:	91 21 00 14 	stw     r9,20(r1)
     ddc:	81 21 00 14 	lwz     r9,20(r1)
     de0:	7d 34 53 a6 	mtspr   340,r9
     de4:	60 00 00 00 	nop
     de8:	81 21 00 10 	lwz     r9,16(r1)
     dec:	7d 23 4b 78 	mr      r3,r9
     df0:	48 00 03 90 	b       1180 <init_tst>
     df4:	48 00 00 00 	b       df4 <main+0x1c0>
     df8:	7d 23 4b 78 	mr      r3,r9
     dfc:	80 01 00 44 	lwz     r0,68(r1)
     e00:	7c 08 03 a6 	mtlr    r0
     e04:	38 21 00 40 	addi    r1,r1,64
     e08:	4e 80 00 20 	blr

00000e0c <tst_done>:
     e0c:	94 21 ff e0 	stwu    r1,-32(r1)
     e10:	7c 08 02 a6 	mflr    r0
     e14:	90 01 00 24 	stw     r0,36(r1)
     e18:	90 61 00 18 	stw     r3,24(r1)
     e1c:	39 20 00 01 	li      r9,1
     e20:	91 21 00 0c 	stw     r9,12(r1)
     e24:	81 41 00 18 	lwz     r10,24(r1)
     e28:	3d 20 08 67 	lis     r9,2151
     e2c:	61 29 53 09 	ori     r9,r9,21257
     e30:	7c 0a 48 00 	cmpw    r10,r9
     e34:	41 82 00 0c 	beq     e40 <tst_done+0x34>
     e38:	3c 60 80 00 	lis     r3,-32768
     e3c:	4b ff f9 b9 	bl      7f4 <tst_fail>
     e40:	39 20 00 00 	li      r9,0
     e44:	91 21 00 08 	stw     r9,8(r1)
     e48:	48 00 00 8c 	b       ed4 <tst_done+0xc8>
     e4c:	81 21 00 08 	lwz     r9,8(r1)
     e50:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     e54:	3d 20 00 00 	lis     r9,0
     e58:	39 29 13 60 	addi    r9,r9,4960
     e5c:	7d 2a 4a 14 	add     r9,r10,r9
     e60:	81 29 00 00 	lwz     r9,0(r9)
     e64:	91 21 00 10 	stw     r9,16(r1)
     e68:	81 21 00 08 	lwz     r9,8(r1)
     e6c:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     e70:	3d 20 00 00 	lis     r9,0
     e74:	39 29 14 00 	addi    r9,r9,5120
     e78:	7d 2a 4a 14 	add     r9,r10,r9
     e7c:	81 29 00 00 	lwz     r9,0(r9)
     e80:	91 21 00 14 	stw     r9,20(r1)
     e84:	81 21 00 0c 	lwz     r9,12(r1)
     e88:	2c 09 00 00 	cmpwi   r9,0
     e8c:	41 82 00 1c 	beq     ea8 <tst_done+0x9c>
     e90:	81 41 00 10 	lwz     r10,16(r1)
     e94:	81 21 00 14 	lwz     r9,20(r1)
     e98:	7c 0a 48 00 	cmpw    r10,r9
     e9c:	40 82 00 0c 	bne     ea8 <tst_done+0x9c>
     ea0:	39 20 00 01 	li      r9,1
     ea4:	48 00 00 08 	b       eac <tst_done+0xa0>
     ea8:	39 20 00 00 	li      r9,0
     eac:	91 21 00 0c 	stw     r9,12(r1)
     eb0:	81 21 00 0c 	lwz     r9,12(r1)
     eb4:	2c 09 00 00 	cmpwi   r9,0
     eb8:	40 82 00 10 	bne     ec8 <tst_done+0xbc>
     ebc:	81 21 00 08 	lwz     r9,8(r1)
     ec0:	7d 23 4b 78 	mr      r3,r9
     ec4:	4b ff f9 31 	bl      7f4 <tst_fail>
     ec8:	81 21 00 08 	lwz     r9,8(r1)
     ecc:	39 29 00 01 	addi    r9,r9,1
     ed0:	91 21 00 08 	stw     r9,8(r1)
     ed4:	81 21 00 08 	lwz     r9,8(r1)
     ed8:	28 09 00 1f 	cmplwi  r9,31
     edc:	40 81 ff 70 	ble     e4c <tst_done+0x40>
     ee0:	39 20 00 21 	li      r9,33
     ee4:	91 21 00 08 	stw     r9,8(r1)
     ee8:	81 21 00 08 	lwz     r9,8(r1)
     eec:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     ef0:	3d 20 00 00 	lis     r9,0
     ef4:	39 29 13 60 	addi    r9,r9,4960
     ef8:	7d 2a 4a 14 	add     r9,r10,r9
     efc:	81 29 00 00 	lwz     r9,0(r9)
     f00:	91 21 00 10 	stw     r9,16(r1)
     f04:	81 21 00 08 	lwz     r9,8(r1)
     f08:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     f0c:	3d 20 00 00 	lis     r9,0
     f10:	39 29 14 00 	addi    r9,r9,5120
     f14:	7d 2a 4a 14 	add     r9,r10,r9
     f18:	81 29 00 00 	lwz     r9,0(r9)
     f1c:	55 29 06 44 	rlwinm  r9,r9,0,25,2
     f20:	91 21 00 14 	stw     r9,20(r1)
     f24:	81 21 00 0c 	lwz     r9,12(r1)
     f28:	2c 09 00 00 	cmpwi   r9,0
     f2c:	41 82 00 1c 	beq     f48 <tst_done+0x13c>
     f30:	81 41 00 10 	lwz     r10,16(r1)
     f34:	81 21 00 14 	lwz     r9,20(r1)
     f38:	7c 0a 48 00 	cmpw    r10,r9
     f3c:	40 82 00 0c 	bne     f48 <tst_done+0x13c>
     f40:	39 20 00 01 	li      r9,1
     f44:	48 00 00 08 	b       f4c <tst_done+0x140>
     f48:	39 20 00 00 	li      r9,0
     f4c:	91 21 00 0c 	stw     r9,12(r1)
     f50:	81 21 00 0c 	lwz     r9,12(r1)
     f54:	2c 09 00 00 	cmpwi   r9,0
     f58:	40 82 00 10 	bne     f68 <tst_done+0x15c>
     f5c:	81 21 00 08 	lwz     r9,8(r1)
     f60:	7d 23 4b 78 	mr      r3,r9
     f64:	4b ff f8 91 	bl      7f4 <tst_fail>
     f68:	39 20 00 22 	li      r9,34
     f6c:	91 21 00 08 	stw     r9,8(r1)
     f70:	48 00 00 8c 	b       ffc <tst_done+0x1f0>
     f74:	81 21 00 08 	lwz     r9,8(r1)
     f78:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     f7c:	3d 20 00 00 	lis     r9,0
     f80:	39 29 13 60 	addi    r9,r9,4960
     f84:	7d 2a 4a 14 	add     r9,r10,r9
     f88:	81 29 00 00 	lwz     r9,0(r9)
     f8c:	91 21 00 10 	stw     r9,16(r1)
     f90:	81 21 00 08 	lwz     r9,8(r1)
     f94:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
     f98:	3d 20 00 00 	lis     r9,0
     f9c:	39 29 14 00 	addi    r9,r9,5120
     fa0:	7d 2a 4a 14 	add     r9,r10,r9
     fa4:	81 29 00 00 	lwz     r9,0(r9)
     fa8:	91 21 00 14 	stw     r9,20(r1)
     fac:	81 21 00 0c 	lwz     r9,12(r1)
     fb0:	2c 09 00 00 	cmpwi   r9,0
     fb4:	41 82 00 1c 	beq     fd0 <tst_done+0x1c4>
     fb8:	81 41 00 10 	lwz     r10,16(r1)
     fbc:	81 21 00 14 	lwz     r9,20(r1)
     fc0:	7c 0a 48 00 	cmpw    r10,r9
     fc4:	40 82 00 0c 	bne     fd0 <tst_done+0x1c4>
     fc8:	39 20 00 01 	li      r9,1
     fcc:	48 00 00 08 	b       fd4 <tst_done+0x1c8>
     fd0:	39 20 00 00 	li      r9,0
     fd4:	91 21 00 0c 	stw     r9,12(r1)
     fd8:	81 21 00 0c 	lwz     r9,12(r1)
     fdc:	2c 09 00 00 	cmpwi   r9,0
     fe0:	40 82 00 10 	bne     ff0 <tst_done+0x1e4>
     fe4:	81 21 00 08 	lwz     r9,8(r1)
     fe8:	7d 23 4b 78 	mr      r3,r9
     fec:	4b ff f8 09 	bl      7f4 <tst_fail>
     ff0:	81 21 00 08 	lwz     r9,8(r1)
     ff4:	39 29 00 01 	addi    r9,r9,1
     ff8:	91 21 00 08 	stw     r9,8(r1)
     ffc:	81 21 00 08 	lwz     r9,8(r1)
    1000:	28 09 00 23 	cmplwi  r9,35
    1004:	40 81 ff 70 	ble     f74 <tst_done+0x168>
    1008:	4b ff f7 e9 	bl      7f0 <tst_pass>
    100c:	48 00 00 00 	b       100c <tst_done+0x200>

00001010 <int_sc>:
    1010:	94 21 ff f0 	stwu    r1,-16(r1)
    1014:	90 61 00 08 	stw     r3,8(r1)
    1018:	90 81 00 0c 	stw     r4,12(r1)
    101c:	48 00 02 58 	b       1274 <tst_end>
    1020:	60 00 00 00 	nop
    1024:	38 21 00 10 	addi    r1,r1,16
    1028:	4e 80 00 20 	blr

0000102c <int_unhandled>:
    102c:	48 00 00 00 	b       102c <int_unhandled>

Disassembly of section .arcitst:

00001040 <tst_info>:
    1040:	69 6e 66 6f 	xori    r14,r11,26223
    1044:	20 74 65 78 	subfic  r3,r20,25976
    1048:	Address 0x0000000000001048 is out of bounds.


0000104a <tst_header>:
    104a:	68 65 61 64 	xori    r5,r3,24932
    104e:	65 72 20 74 	oris    r18,r11,8308
    1052:	65 78 74 00 	oris    r24,r11,29696
	...

00001060 <tst_inits>:
    1060:	00 00 00 00 	.long 0x0

00001064 <init_r1>:
    1064:	58 22 c9 05 	rlmi.   r2,r1,r25,4,2

00001068 <init_r2>:
    1068:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000106c <init_r3>:
    106c:	91 b6 d1 a3 	stw     r13,-11869(r22)

00001070 <init_r4>:
    1070:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001074 <init_r5>:
    1074:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001078 <init_r6>:
    1078:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000107c <init_r7>:
    107c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001080 <init_r8>:
    1080:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001084 <init_r9>:
    1084:	7e 11 ee 88 	.long 0x7e11ee88

00001088 <init_r10>:
    1088:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000108c <init_r11>:
    108c:	7f ff ff ff 	.long 0x7fffffff

00001090 <init_r12>:
    1090:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001094 <init_r13>:
    1094:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001098 <init_r14>:
    1098:	8c 20 bd e6 	.long 0x8c20bde6

0000109c <init_r15>:
    109c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010a0 <init_r16>:
    10a0:	76 d0 da df 	andis.  r16,r22,56031

000010a4 <init_r17>:
    10a4:	15 11 1f 42 	.long 0x15111f42

000010a8 <init_r18>:
    10a8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010ac <init_r19>:
    10ac:	36 10 8e 50 	addic.  r16,r16,-29104

000010b0 <init_r20>:
    10b0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010b4 <init_r21>:
    10b4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010b8 <init_r22>:
    10b8:	32 8a 0c ed 	addic   r20,r10,3309

000010bc <init_r23>:
    10bc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010c0 <init_r24>:
    10c0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010c4 <init_r25>:
    10c4:	af 22 4c 19 	lhau    r25,19481(r2)

000010c8 <init_r26>:
    10c8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010cc <init_r27>:
    10cc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010d0 <init_r28>:
    10d0:	d6 24 b2 7a 	stfsu   f17,-19846(r4)

000010d4 <init_r29>:
    10d4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010d8 <init_r30>:
    10d8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010dc <init_r31>:
    10dc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010e0 <init_cr>:
    10e0:	db fd 36 28 	stfd    f31,13864(r29)

000010e4 <init_xer>:
    10e4:	89 f0 00 6e 	lbz     r15,110(r16)

000010e8 <init_ctr>:
    10e8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010ec <init_lr>:
    10ec:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010f0 <init_tar>:
    10f0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010f4 <init_msr>:
    10f4:	00 00 11 04 	.long 0x1104

000010f8 <init_iar>:
    10f8:	00 01 00 00 	.long 0x10000

000010fc <save_r1>:
    10fc:	00 00 00 00 	.long 0x0

00001100 <codelen>:
    1100:	00 00 00 0d 	.long 0xd

00001104 <ops>:
    1104:	7c 61 cc 14 	addco   r3,r1,r25
    1108:	7d 23 05 95 	addzeo. r9,r3
    110c:	7a c3 73 92 	rldcr   r3,r22,r14,14
    1110:	7e 09 4c 11 	subfco. r16,r9,r9
    1114:	7e 1c b1 15 	adde.   r16,r28,r22
    1118:	7a 33 88 86 	rldicr  r19,r17,49,2
    111c:	7c 60 04 d1 	nego.   r3,r0
    1120:	7e 09 b0 38 	and     r9,r16,r22
    1124:	7c 36 05 91 	subfzeo. r1,r22
    1128:	7e 2b 00 d1 	neg.    r17,r11
    112c:	60 00 00 00 	nop
    1130:	60 00 00 00 	nop
    1134:	60 00 00 00 	nop

00001138 <iars>:
    1138:	00 01 00 00 	.long 0x10000
    113c:	00 01 00 04 	.long 0x10004
    1140:	00 01 00 08 	.long 0x10008
    1144:	00 01 00 0c 	.long 0x1000c
    1148:	00 01 00 10 	.long 0x10010
    114c:	00 01 00 14 	.long 0x10014
    1150:	00 01 00 18 	.long 0x10018
    1154:	00 01 00 1c 	.long 0x1001c
    1158:	00 01 00 20 	.long 0x10020
    115c:	00 01 00 24 	.long 0x10024
    1160:	00 01 00 28 	.long 0x10028
    1164:	00 01 00 2c 	.long 0x1002c
    1168:	00 01 00 30 	.long 0x10030
    116c:	48 00 00 14 	b       1180 <init_tst>
    1170:	60 00 00 00 	nop
    1174:	60 00 00 00 	nop
    1178:	60 00 00 00 	nop
    117c:	60 00 00 00 	nop

00001180 <init_tst>:
    1180:	90 23 00 9c 	stw     r1,156(r3)

00001184 <opcopy>:
    1184:	80 23 00 a0 	lwz     r1,160(r3)
    1188:	7c 29 03 a6 	mtctr   r1
    118c:	38 23 00 a4 	addi    r1,r3,164
    1190:	38 43 00 d8 	addi    r2,r3,216

00001194 <opcopy_loop>:
    1194:	80 81 00 00 	lwz     r4,0(r1)
    1198:	80 a2 00 00 	lwz     r5,0(r2)
    119c:	90 85 00 00 	stw     r4,0(r5)
    11a0:	38 21 00 04 	addi    r1,r1,4
    11a4:	38 42 00 04 	addi    r2,r2,4
    11a8:	42 00 ff ec 	bdnz    1194 <opcopy_loop>

000011ac <opcopy_eot>:
    11ac:	3c 80 48 00 	lis     r4,18432
    11b0:	60 84 00 06 	ori     r4,r4,6
    11b4:	90 85 00 00 	stw     r4,0(r5)
    11b8:	80 20 10 f4 	lwz     r1,4340(0)
    11bc:	7c 3b 03 a6 	mtsrr1  r1
    11c0:	80 20 11 38 	lwz     r1,4408(0)
    11c4:	7c 3a 03 a6 	mtsrr0  r1

000011c8 <init_regs>:
    11c8:	80 23 00 80 	lwz     r1,128(r3)
    11cc:	7c 2f f1 20 	mtcr    r1
    11d0:	80 23 00 84 	lwz     r1,132(r3)
    11d4:	7c 21 03 a6 	mtxer   r1
    11d8:	80 23 00 88 	lwz     r1,136(r3)
    11dc:	7c 29 03 a6 	mtctr   r1
    11e0:	80 23 00 8c 	lwz     r1,140(r3)
    11e4:	7c 28 03 a6 	mtlr    r1
    11e8:	80 23 00 90 	lwz     r1,144(r3)
    11ec:	7c 2f cb a6 	mtspr   815,r1
    11f0:	80 03 00 00 	lwz     r0,0(r3)
    11f4:	80 23 00 04 	lwz     r1,4(r3)
    11f8:	80 43 00 08 	lwz     r2,8(r3)
    11fc:	80 83 00 10 	lwz     r4,16(r3)
    1200:	80 a3 00 14 	lwz     r5,20(r3)
    1204:	80 c3 00 18 	lwz     r6,24(r3)
    1208:	80 e3 00 1c 	lwz     r7,28(r3)
    120c:	81 03 00 20 	lwz     r8,32(r3)
    1210:	81 23 00 24 	lwz     r9,36(r3)
    1214:	81 43 00 28 	lwz     r10,40(r3)
    1218:	81 63 00 2c 	lwz     r11,44(r3)
    121c:	81 83 00 30 	lwz     r12,48(r3)
    1220:	81 a3 00 34 	lwz     r13,52(r3)
    1224:	81 c3 00 38 	lwz     r14,56(r3)
    1228:	81 e3 00 3c 	lwz     r15,60(r3)
    122c:	82 03 00 40 	lwz     r16,64(r3)
    1230:	82 23 00 44 	lwz     r17,68(r3)
    1234:	82 43 00 48 	lwz     r18,72(r3)
    1238:	82 63 00 4c 	lwz     r19,76(r3)
    123c:	82 83 00 50 	lwz     r20,80(r3)
    1240:	82 a3 00 54 	lwz     r21,84(r3)
    1244:	82 c3 00 58 	lwz     r22,88(r3)
    1248:	82 e3 00 5c 	lwz     r23,92(r3)
    124c:	83 03 00 60 	lwz     r24,96(r3)
    1250:	83 23 00 64 	lwz     r25,100(r3)
    1254:	83 43 00 68 	lwz     r26,104(r3)
    1258:	83 63 00 6c 	lwz     r27,108(r3)
    125c:	83 83 00 70 	lwz     r28,112(r3)
    1260:	83 a3 00 74 	lwz     r29,116(r3)
    1264:	83 c3 00 78 	lwz     r30,120(r3)
    1268:	83 e3 00 7c 	lwz     r31,124(r3)
    126c:	80 63 00 0c 	lwz     r3,12(r3)

00001270 <jmp2tst>:
    1270:	4c 00 00 64 	rfi

00001274 <tst_end>:
    1274:	48 00 00 0c 	b       1280 <save_results>
    1278:	60 00 00 00 	nop
    127c:	60 00 00 00 	nop

00001280 <save_results>:
    1280:	7c 2f cb a6 	mtspr   815,r1
    1284:	3c 20 00 00 	lis     r1,0
    1288:	60 21 13 60 	ori     r1,r1,4960
    128c:	90 01 00 00 	stw     r0,0(r1)
    1290:	90 41 00 08 	stw     r2,8(r1)
    1294:	90 61 00 0c 	stw     r3,12(r1)
    1298:	90 81 00 10 	stw     r4,16(r1)
    129c:	90 a1 00 14 	stw     r5,20(r1)
    12a0:	90 c1 00 18 	stw     r6,24(r1)
    12a4:	90 e1 00 1c 	stw     r7,28(r1)
    12a8:	91 01 00 20 	stw     r8,32(r1)
    12ac:	91 21 00 24 	stw     r9,36(r1)
    12b0:	91 41 00 28 	stw     r10,40(r1)
    12b4:	91 61 00 2c 	stw     r11,44(r1)
    12b8:	91 81 00 30 	stw     r12,48(r1)
    12bc:	91 a1 00 34 	stw     r13,52(r1)
    12c0:	91 c1 00 38 	stw     r14,56(r1)
    12c4:	91 e1 00 3c 	stw     r15,60(r1)
    12c8:	92 01 00 40 	stw     r16,64(r1)
    12cc:	92 21 00 44 	stw     r17,68(r1)
    12d0:	92 41 00 48 	stw     r18,72(r1)
    12d4:	92 61 00 4c 	stw     r19,76(r1)
    12d8:	92 81 00 50 	stw     r20,80(r1)
    12dc:	92 a1 00 54 	stw     r21,84(r1)
    12e0:	92 c1 00 58 	stw     r22,88(r1)
    12e4:	92 e1 00 5c 	stw     r23,92(r1)
    12e8:	93 01 00 60 	stw     r24,96(r1)
    12ec:	93 21 00 64 	stw     r25,100(r1)
    12f0:	93 41 00 68 	stw     r26,104(r1)
    12f4:	93 61 00 6c 	stw     r27,108(r1)
    12f8:	93 81 00 70 	stw     r28,112(r1)
    12fc:	93 a1 00 74 	stw     r29,116(r1)
    1300:	93 c1 00 78 	stw     r30,120(r1)
    1304:	93 e1 00 7c 	stw     r31,124(r1)
    1308:	7c 4f ca a6 	mfspr   r2,815
    130c:	90 41 00 04 	stw     r2,4(r1)
    1310:	7c 40 00 26 	mfcr    r2
    1314:	90 41 00 80 	stw     r2,128(r1)
    1318:	7c 41 02 a6 	mfxer   r2
    131c:	90 41 00 84 	stw     r2,132(r1)
    1320:	7c 49 02 a6 	mfctr   r2
    1324:	90 41 00 88 	stw     r2,136(r1)
    1328:	7c 48 02 a6 	mflr    r2
    132c:	90 41 00 8c 	stw     r2,140(r1)
    1330:	7c 4f ca a6 	mfspr   r2,815
    1334:	90 41 00 90 	stw     r2,144(r1)

00001338 <tst_cleanup>:
    1338:	3c 60 00 00 	lis     r3,0
    133c:	60 63 10 60 	ori     r3,r3,4192
    1340:	80 23 00 9c 	lwz     r1,156(r3)
    1344:	3c 60 08 67 	lis     r3,2151
    1348:	60 63 53 09 	ori     r3,r3,21257
    134c:	48 00 0e 0f 	bla     e0c <tst_done>
    1350:	60 00 00 00 	nop
    1354:	60 00 00 00 	nop
    1358:	60 00 00 00 	nop
    135c:	60 00 00 00 	nop

00001360 <tst_results>:
    1360:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001364 <rslt_r1>:
    1364:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001368 <rslt_r2>:
    1368:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000136c <rslt_r3>:
    136c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001370 <rslt_r4>:
    1370:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001374 <rslt_r5>:
    1374:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001378 <rslt_r6>:
    1378:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000137c <rslt_r7>:
    137c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001380 <rslt_r8>:
    1380:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001384 <rslt_r9>:
    1384:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001388 <rslt_r10>:
    1388:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000138c <rslt_r11>:
    138c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001390 <rslt_r12>:
    1390:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001394 <rslt_r13>:
    1394:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001398 <rslt_r14>:
    1398:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000139c <rslt_r15>:
    139c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013a0 <rslt_r16>:
    13a0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013a4 <rslt_r17>:
    13a4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013a8 <rslt_r18>:
    13a8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013ac <rslt_r19>:
    13ac:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013b0 <rslt_r20>:
    13b0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013b4 <rslt_r21>:
    13b4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013b8 <rslt_r22>:
    13b8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013bc <rslt_r23>:
    13bc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013c0 <rslt_r24>:
    13c0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013c4 <rslt_r25>:
    13c4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013c8 <rslt_r26>:
    13c8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013cc <rslt_r27>:
    13cc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013d0 <rslt_r28>:
    13d0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013d4 <rslt_r29>:
    13d4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013d8 <rslt_r30>:
    13d8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013dc <rslt_r31>:
    13dc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013e0 <rslt_cr>:
    13e0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013e4 <rslt_xer>:
    13e4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013e8 <rslt_ctr>:
    13e8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013ec <rslt_lr>:
    13ec:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000013f0 <rslt_tar>:
    13f0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31
    13f4:	60 00 00 00 	nop
    13f8:	60 00 00 00 	nop
    13fc:	60 00 00 00 	nop

00001400 <tst_expects>:
    1400:	00 00 00 00 	.long 0x0

00001404 <expt_r1>:
    1404:	cd 75 f3 13 	lfdu    f11,-3309(r21)

00001408 <expt_r2>:
    1408:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000140c <expt_r3>:
    140c:	00 00 00 00 	.long 0x0

00001410 <expt_r4>:
    1410:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001414 <expt_r5>:
    1414:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001418 <expt_r6>:
    1418:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000141c <expt_r7>:
    141c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001420 <expt_r8>:
    1420:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001424 <expt_r9>:
    1424:	00 8a 0c 68 	.long 0x8a0c68

00001428 <expt_r10>:
    1428:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000142c <expt_r11>:
    142c:	7f ff ff ff 	.long 0x7fffffff

00001430 <expt_r12>:
    1430:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001434 <expt_r13>:
    1434:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001438 <expt_r14>:
    1438:	8c 20 bd e6 	.long 0x8c20bde6

0000143c <expt_r15>:
    143c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001440 <expt_r16>:
    1440:	08 ae bf 68 	tdlgei  r14,-16536

00001444 <expt_r17>:
    1444:	80 00 00 01 	lwz     r0,1(0)

00001448 <expt_r18>:
    1448:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000144c <expt_r19>:
    144c:	00 00 00 00 	.long 0x0

00001450 <expt_r20>:
    1450:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001454 <expt_r21>:
    1454:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001458 <expt_r22>:
    1458:	32 8a 0c ed 	addic   r20,r10,3309

0000145c <expt_r23>:
    145c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001460 <expt_r24>:
    1460:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001464 <expt_r25>:
    1464:	af 22 4c 19 	lhau    r25,19481(r2)

00001468 <expt_r26>:
    1468:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000146c <expt_r27>:
    146c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001470 <expt_r28>:
    1470:	d6 24 b2 7a 	stfsu   f17,-19846(r4)

00001474 <expt_r29>:
    1474:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001478 <expt_r30>:
    1478:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000147c <expt_r31>:
    147c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001480 <expt_cr>:
    1480:	9b fd 36 28 	stb     r31,13864(r29)

00001484 <expt_xer>:
    1484:	98 f0 00 6e 	stb     r7,110(r16)

00001488 <expt_ctr>:
    1488:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000148c <expt_lr>:
    148c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001490 <expt_tar>:
    1490:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001494 <expt_msr>:
    1494:	00 00 11 04 	.long 0x1104

00001498 <expt_iar>:
    1498:	00 01 00 38 	.long 0x10038

Disassembly of section .text:

0000149c <__toupper>:
    149c:	94 21 ff f0 	stwu    r1,-16(r1)
    14a0:	7c 69 1b 78 	mr      r9,r3
    14a4:	99 21 00 08 	stb     r9,8(r1)
    14a8:	89 21 00 08 	lbz     r9,8(r1)
    14ac:	3d 40 00 00 	lis     r10,0
    14b0:	39 4a 09 04 	addi    r10,r10,2308
    14b4:	7d 2a 48 ae 	lbzx    r9,r10,r9
    14b8:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    14bc:	2c 09 00 00 	cmpwi   r9,0
    14c0:	41 82 00 10 	beq     14d0 <__toupper+0x34>
    14c4:	89 21 00 08 	lbz     r9,8(r1)
    14c8:	39 29 ff e0 	addi    r9,r9,-32
    14cc:	99 21 00 08 	stb     r9,8(r1)
    14d0:	89 21 00 08 	lbz     r9,8(r1)
    14d4:	7d 23 4b 78 	mr      r3,r9
    14d8:	38 21 00 10 	addi    r1,r1,16
    14dc:	4e 80 00 20 	blr

000014e0 <__bswap_16>:
    14e0:	94 21 ff f0 	stwu    r1,-16(r1)
    14e4:	7c 69 1b 78 	mr      r9,r3
    14e8:	b1 21 00 08 	sth     r9,8(r1)
    14ec:	a1 21 00 08 	lhz     r9,8(r1)
    14f0:	55 29 40 2e 	rlwinm  r9,r9,8,0,23
    14f4:	7d 2a 07 34 	extsh   r10,r9
    14f8:	a1 21 00 08 	lhz     r9,8(r1)
    14fc:	55 29 c2 3e 	rlwinm  r9,r9,24,8,31
    1500:	55 29 04 3e 	clrlwi  r9,r9,16
    1504:	7d 29 07 34 	extsh   r9,r9
    1508:	7d 49 4b 78 	or      r9,r10,r9
    150c:	7d 29 07 34 	extsh   r9,r9
    1510:	55 29 04 3e 	clrlwi  r9,r9,16
    1514:	7d 23 4b 78 	mr      r3,r9
    1518:	38 21 00 10 	addi    r1,r1,16
    151c:	4e 80 00 20 	blr

00001520 <__bswap_32>:
    1520:	94 21 ff f0 	stwu    r1,-16(r1)
    1524:	90 61 00 08 	stw     r3,8(r1)
    1528:	81 21 00 08 	lwz     r9,8(r1)
    152c:	55 2a 46 3e 	rlwinm  r10,r9,8,24,31
    1530:	81 21 00 08 	lwz     r9,8(r1)
    1534:	55 29 c2 3e 	rlwinm  r9,r9,24,8,31
    1538:	55 29 04 2e 	rlwinm  r9,r9,0,16,23
    153c:	7d 4a 4b 78 	or      r10,r10,r9
    1540:	81 21 00 08 	lwz     r9,8(r1)
    1544:	55 29 40 2e 	rlwinm  r9,r9,8,0,23
    1548:	55 29 02 1e 	rlwinm  r9,r9,0,8,15
    154c:	7d 4a 4b 78 	or      r10,r10,r9
    1550:	81 21 00 08 	lwz     r9,8(r1)
    1554:	55 29 c0 0e 	rlwinm  r9,r9,24,0,7
    1558:	7d 49 4b 78 	or      r9,r10,r9
    155c:	7d 23 4b 78 	mr      r3,r9
    1560:	38 21 00 10 	addi    r1,r1,16
    1564:	4e 80 00 20 	blr

00001568 <strchr>:
    1568:	94 21 ff f0 	stwu    r1,-16(r1)
    156c:	90 61 00 08 	stw     r3,8(r1)
    1570:	90 81 00 0c 	stw     r4,12(r1)
    1574:	48 00 00 28 	b       159c <strchr+0x34>
    1578:	81 21 00 08 	lwz     r9,8(r1)
    157c:	89 29 00 00 	lbz     r9,0(r9)
    1580:	2c 09 00 00 	cmpwi   r9,0
    1584:	40 82 00 0c 	bne     1590 <strchr+0x28>
    1588:	39 20 00 00 	li      r9,0
    158c:	48 00 00 2c 	b       15b8 <strchr+0x50>
    1590:	81 21 00 08 	lwz     r9,8(r1)
    1594:	39 29 00 01 	addi    r9,r9,1
    1598:	91 21 00 08 	stw     r9,8(r1)
    159c:	81 21 00 08 	lwz     r9,8(r1)
    15a0:	89 49 00 00 	lbz     r10,0(r9)
    15a4:	81 21 00 0c 	lwz     r9,12(r1)
    15a8:	55 29 06 3e 	clrlwi  r9,r9,24
    15ac:	7c 0a 48 40 	cmplw   r10,r9
    15b0:	40 82 ff c8 	bne     1578 <strchr+0x10>
    15b4:	81 21 00 08 	lwz     r9,8(r1)
    15b8:	7d 23 4b 78 	mr      r3,r9
    15bc:	38 21 00 10 	addi    r1,r1,16
    15c0:	4e 80 00 20 	blr

000015c4 <strpbrk>:
    15c4:	94 21 ff e0 	stwu    r1,-32(r1)
    15c8:	90 61 00 18 	stw     r3,24(r1)
    15cc:	90 81 00 1c 	stw     r4,28(r1)
    15d0:	81 21 00 18 	lwz     r9,24(r1)
    15d4:	91 21 00 08 	stw     r9,8(r1)
    15d8:	48 00 00 58 	b       1630 <strpbrk+0x6c>
    15dc:	81 21 00 1c 	lwz     r9,28(r1)
    15e0:	91 21 00 0c 	stw     r9,12(r1)
    15e4:	48 00 00 30 	b       1614 <strpbrk+0x50>
    15e8:	81 21 00 08 	lwz     r9,8(r1)
    15ec:	89 49 00 00 	lbz     r10,0(r9)
    15f0:	81 21 00 0c 	lwz     r9,12(r1)
    15f4:	89 29 00 00 	lbz     r9,0(r9)
    15f8:	7c 0a 48 40 	cmplw   r10,r9
    15fc:	40 82 00 0c 	bne     1608 <strpbrk+0x44>
    1600:	81 21 00 08 	lwz     r9,8(r1)
    1604:	48 00 00 40 	b       1644 <strpbrk+0x80>
    1608:	81 21 00 0c 	lwz     r9,12(r1)
    160c:	39 29 00 01 	addi    r9,r9,1
    1610:	91 21 00 0c 	stw     r9,12(r1)
    1614:	81 21 00 0c 	lwz     r9,12(r1)
    1618:	89 29 00 00 	lbz     r9,0(r9)
    161c:	2c 09 00 00 	cmpwi   r9,0
    1620:	40 82 ff c8 	bne     15e8 <strpbrk+0x24>
    1624:	81 21 00 08 	lwz     r9,8(r1)
    1628:	39 29 00 01 	addi    r9,r9,1
    162c:	91 21 00 08 	stw     r9,8(r1)
    1630:	81 21 00 08 	lwz     r9,8(r1)
    1634:	89 29 00 00 	lbz     r9,0(r9)
    1638:	2c 09 00 00 	cmpwi   r9,0
    163c:	40 82 ff a0 	bne     15dc <strpbrk+0x18>
    1640:	39 20 00 00 	li      r9,0
    1644:	7d 23 4b 78 	mr      r3,r9
    1648:	38 21 00 20 	addi    r1,r1,32
    164c:	4e 80 00 20 	blr

00001650 <strrchr>:
    1650:	94 21 ff e0 	stwu    r1,-32(r1)
    1654:	7c 08 02 a6 	mflr    r0
    1658:	90 01 00 24 	stw     r0,36(r1)
    165c:	90 61 00 18 	stw     r3,24(r1)
    1660:	90 81 00 1c 	stw     r4,28(r1)
    1664:	80 61 00 18 	lwz     r3,24(r1)
    1668:	48 00 03 dd 	bl      1a44 <strlen>
    166c:	7c 6a 1b 78 	mr      r10,r3
    1670:	81 21 00 18 	lwz     r9,24(r1)
    1674:	7d 29 52 14 	add     r9,r9,r10
    1678:	91 21 00 08 	stw     r9,8(r1)
    167c:	81 21 00 08 	lwz     r9,8(r1)
    1680:	89 49 00 00 	lbz     r10,0(r9)
    1684:	81 21 00 1c 	lwz     r9,28(r1)
    1688:	55 29 06 3e 	clrlwi  r9,r9,24
    168c:	7c 0a 48 40 	cmplw   r10,r9
    1690:	40 82 00 0c 	bne     169c <strrchr+0x4c>
    1694:	81 21 00 08 	lwz     r9,8(r1)
    1698:	48 00 00 24 	b       16bc <strrchr+0x6c>
    169c:	81 21 00 08 	lwz     r9,8(r1)
    16a0:	39 29 ff ff 	addi    r9,r9,-1
    16a4:	91 21 00 08 	stw     r9,8(r1)
    16a8:	81 41 00 08 	lwz     r10,8(r1)
    16ac:	81 21 00 18 	lwz     r9,24(r1)
    16b0:	7c 0a 48 40 	cmplw   r10,r9
    16b4:	40 80 ff c8 	bge     167c <strrchr+0x2c>
    16b8:	39 20 00 00 	li      r9,0
    16bc:	7d 23 4b 78 	mr      r3,r9
    16c0:	80 01 00 24 	lwz     r0,36(r1)
    16c4:	7c 08 03 a6 	mtlr    r0
    16c8:	38 21 00 20 	addi    r1,r1,32
    16cc:	4e 80 00 20 	blr

000016d0 <strnchr>:
    16d0:	94 21 ff e0 	stwu    r1,-32(r1)
    16d4:	90 61 00 08 	stw     r3,8(r1)
    16d8:	90 81 00 0c 	stw     r4,12(r1)
    16dc:	90 a1 00 10 	stw     r5,16(r1)
    16e0:	48 00 00 30 	b       1710 <strnchr+0x40>
    16e4:	81 21 00 08 	lwz     r9,8(r1)
    16e8:	89 49 00 00 	lbz     r10,0(r9)
    16ec:	81 21 00 10 	lwz     r9,16(r1)
    16f0:	55 29 06 3e 	clrlwi  r9,r9,24
    16f4:	7c 0a 48 40 	cmplw   r10,r9
    16f8:	40 82 00 0c 	bne     1704 <strnchr+0x34>
    16fc:	81 21 00 08 	lwz     r9,8(r1)
    1700:	48 00 00 38 	b       1738 <strnchr+0x68>
    1704:	81 21 00 08 	lwz     r9,8(r1)
    1708:	39 29 00 01 	addi    r9,r9,1
    170c:	91 21 00 08 	stw     r9,8(r1)
    1710:	81 21 00 0c 	lwz     r9,12(r1)
    1714:	39 49 ff ff 	addi    r10,r9,-1
    1718:	91 41 00 0c 	stw     r10,12(r1)
    171c:	2c 09 00 00 	cmpwi   r9,0
    1720:	41 82 00 14 	beq     1734 <strnchr+0x64>
    1724:	81 21 00 08 	lwz     r9,8(r1)
    1728:	89 29 00 00 	lbz     r9,0(r9)
    172c:	2c 09 00 00 	cmpwi   r9,0
    1730:	40 82 ff b4 	bne     16e4 <strnchr+0x14>
    1734:	39 20 00 00 	li      r9,0
    1738:	7d 23 4b 78 	mr      r3,r9
    173c:	38 21 00 20 	addi    r1,r1,32
    1740:	4e 80 00 20 	blr

00001744 <strcpy>:
    1744:	94 21 ff e0 	stwu    r1,-32(r1)
    1748:	90 61 00 18 	stw     r3,24(r1)
    174c:	90 81 00 1c 	stw     r4,28(r1)
    1750:	81 21 00 18 	lwz     r9,24(r1)
    1754:	91 21 00 08 	stw     r9,8(r1)
    1758:	60 00 00 00 	nop
    175c:	81 41 00 1c 	lwz     r10,28(r1)
    1760:	39 2a 00 01 	addi    r9,r10,1
    1764:	91 21 00 1c 	stw     r9,28(r1)
    1768:	81 21 00 18 	lwz     r9,24(r1)
    176c:	39 09 00 01 	addi    r8,r9,1
    1770:	91 01 00 18 	stw     r8,24(r1)
    1774:	89 4a 00 00 	lbz     r10,0(r10)
    1778:	99 49 00 00 	stb     r10,0(r9)
    177c:	89 29 00 00 	lbz     r9,0(r9)
    1780:	2c 09 00 00 	cmpwi   r9,0
    1784:	40 82 ff d8 	bne     175c <strcpy+0x18>
    1788:	81 21 00 08 	lwz     r9,8(r1)
    178c:	7d 23 4b 78 	mr      r3,r9
    1790:	38 21 00 20 	addi    r1,r1,32
    1794:	4e 80 00 20 	blr

00001798 <strncpy>:
    1798:	94 21 ff d0 	stwu    r1,-48(r1)
    179c:	90 61 00 18 	stw     r3,24(r1)
    17a0:	90 81 00 1c 	stw     r4,28(r1)
    17a4:	90 a1 00 20 	stw     r5,32(r1)
    17a8:	81 21 00 18 	lwz     r9,24(r1)
    17ac:	91 21 00 08 	stw     r9,8(r1)
    17b0:	48 00 00 48 	b       17f8 <strncpy+0x60>
    17b4:	81 21 00 1c 	lwz     r9,28(r1)
    17b8:	89 49 00 00 	lbz     r10,0(r9)
    17bc:	81 21 00 08 	lwz     r9,8(r1)
    17c0:	99 49 00 00 	stb     r10,0(r9)
    17c4:	81 21 00 08 	lwz     r9,8(r1)
    17c8:	89 29 00 00 	lbz     r9,0(r9)
    17cc:	2c 09 00 00 	cmpwi   r9,0
    17d0:	41 82 00 10 	beq     17e0 <strncpy+0x48>
    17d4:	81 21 00 1c 	lwz     r9,28(r1)
    17d8:	39 29 00 01 	addi    r9,r9,1
    17dc:	91 21 00 1c 	stw     r9,28(r1)
    17e0:	81 21 00 08 	lwz     r9,8(r1)
    17e4:	39 29 00 01 	addi    r9,r9,1
    17e8:	91 21 00 08 	stw     r9,8(r1)
    17ec:	81 21 00 20 	lwz     r9,32(r1)
    17f0:	39 29 ff ff 	addi    r9,r9,-1
    17f4:	91 21 00 20 	stw     r9,32(r1)
    17f8:	81 21 00 20 	lwz     r9,32(r1)
    17fc:	2c 09 00 00 	cmpwi   r9,0
    1800:	40 82 ff b4 	bne     17b4 <strncpy+0x1c>
    1804:	81 21 00 18 	lwz     r9,24(r1)
    1808:	7d 23 4b 78 	mr      r3,r9
    180c:	38 21 00 30 	addi    r1,r1,48
    1810:	4e 80 00 20 	blr

00001814 <strcmp>:
    1814:	94 21 ff e0 	stwu    r1,-32(r1)
    1818:	90 61 00 18 	stw     r3,24(r1)
    181c:	90 81 00 1c 	stw     r4,28(r1)
    1820:	81 21 00 18 	lwz     r9,24(r1)
    1824:	89 49 00 00 	lbz     r10,0(r9)
    1828:	81 21 00 1c 	lwz     r9,28(r1)
    182c:	39 09 00 01 	addi    r8,r9,1
    1830:	91 01 00 1c 	stw     r8,28(r1)
    1834:	89 29 00 00 	lbz     r9,0(r9)
    1838:	7d 29 50 50 	subf    r9,r9,r10
    183c:	55 29 06 3e 	clrlwi  r9,r9,24
    1840:	99 21 00 08 	stb     r9,8(r1)
    1844:	89 21 00 08 	lbz     r9,8(r1)
    1848:	7d 29 07 74 	extsb   r9,r9
    184c:	2c 09 00 00 	cmpwi   r9,0
    1850:	40 82 00 20 	bne     1870 <strcmp+0x5c>
    1854:	81 21 00 18 	lwz     r9,24(r1)
    1858:	39 49 00 01 	addi    r10,r9,1
    185c:	91 41 00 18 	stw     r10,24(r1)
    1860:	89 29 00 00 	lbz     r9,0(r9)
    1864:	2c 09 00 00 	cmpwi   r9,0
    1868:	41 82 00 08 	beq     1870 <strcmp+0x5c>
    186c:	4b ff ff b4 	b       1820 <strcmp+0xc>
    1870:	89 21 00 08 	lbz     r9,8(r1)
    1874:	7d 29 07 74 	extsb   r9,r9
    1878:	7d 23 4b 78 	mr      r3,r9
    187c:	38 21 00 20 	addi    r1,r1,32
    1880:	4e 80 00 20 	blr

00001884 <strncmp>:
    1884:	94 21 ff d0 	stwu    r1,-48(r1)
    1888:	90 61 00 18 	stw     r3,24(r1)
    188c:	90 81 00 1c 	stw     r4,28(r1)
    1890:	90 a1 00 20 	stw     r5,32(r1)
    1894:	39 20 00 00 	li      r9,0
    1898:	91 21 00 0c 	stw     r9,12(r1)
    189c:	39 20 00 00 	li      r9,0
    18a0:	99 21 00 08 	stb     r9,8(r1)
    18a4:	48 00 00 5c 	b       1900 <strncmp+0x7c>
    18a8:	81 21 00 18 	lwz     r9,24(r1)
    18ac:	89 49 00 00 	lbz     r10,0(r9)
    18b0:	81 21 00 1c 	lwz     r9,28(r1)
    18b4:	39 09 00 01 	addi    r8,r9,1
    18b8:	91 01 00 1c 	stw     r8,28(r1)
    18bc:	89 29 00 00 	lbz     r9,0(r9)
    18c0:	7d 29 50 50 	subf    r9,r9,r10
    18c4:	55 29 06 3e 	clrlwi  r9,r9,24
    18c8:	99 21 00 08 	stb     r9,8(r1)
    18cc:	89 21 00 08 	lbz     r9,8(r1)
    18d0:	7d 29 07 74 	extsb   r9,r9
    18d4:	2c 09 00 00 	cmpwi   r9,0
    18d8:	40 82 00 38 	bne     1910 <strncmp+0x8c>
    18dc:	81 21 00 18 	lwz     r9,24(r1)
    18e0:	39 49 00 01 	addi    r10,r9,1
    18e4:	91 41 00 18 	stw     r10,24(r1)
    18e8:	89 29 00 00 	lbz     r9,0(r9)
    18ec:	2c 09 00 00 	cmpwi   r9,0
    18f0:	41 82 00 20 	beq     1910 <strncmp+0x8c>
    18f4:	81 21 00 0c 	lwz     r9,12(r1)
    18f8:	39 29 00 01 	addi    r9,r9,1
    18fc:	91 21 00 0c 	stw     r9,12(r1)
    1900:	81 41 00 0c 	lwz     r10,12(r1)
    1904:	81 21 00 20 	lwz     r9,32(r1)
    1908:	7c 0a 48 40 	cmplw   r10,r9
    190c:	41 80 ff 9c 	blt     18a8 <strncmp+0x24>
    1910:	89 21 00 08 	lbz     r9,8(r1)
    1914:	7d 29 07 74 	extsb   r9,r9
    1918:	7d 23 4b 78 	mr      r3,r9
    191c:	38 21 00 30 	addi    r1,r1,48
    1920:	4e 80 00 20 	blr

00001924 <strcat>:
    1924:	94 21 ff e0 	stwu    r1,-32(r1)
    1928:	90 61 00 18 	stw     r3,24(r1)
    192c:	90 81 00 1c 	stw     r4,28(r1)
    1930:	81 21 00 18 	lwz     r9,24(r1)
    1934:	91 21 00 08 	stw     r9,8(r1)
    1938:	48 00 00 10 	b       1948 <strcat+0x24>
    193c:	81 21 00 18 	lwz     r9,24(r1)
    1940:	39 29 00 01 	addi    r9,r9,1
    1944:	91 21 00 18 	stw     r9,24(r1)
    1948:	81 21 00 18 	lwz     r9,24(r1)
    194c:	89 29 00 00 	lbz     r9,0(r9)
    1950:	2c 09 00 00 	cmpwi   r9,0
    1954:	40 82 ff e8 	bne     193c <strcat+0x18>
    1958:	60 00 00 00 	nop
    195c:	81 41 00 1c 	lwz     r10,28(r1)
    1960:	39 2a 00 01 	addi    r9,r10,1
    1964:	91 21 00 1c 	stw     r9,28(r1)
    1968:	81 21 00 18 	lwz     r9,24(r1)
    196c:	39 09 00 01 	addi    r8,r9,1
    1970:	91 01 00 18 	stw     r8,24(r1)
    1974:	89 4a 00 00 	lbz     r10,0(r10)
    1978:	99 49 00 00 	stb     r10,0(r9)
    197c:	89 29 00 00 	lbz     r9,0(r9)
    1980:	2c 09 00 00 	cmpwi   r9,0
    1984:	40 82 ff d8 	bne     195c <strcat+0x38>
    1988:	81 21 00 08 	lwz     r9,8(r1)
    198c:	7d 23 4b 78 	mr      r3,r9
    1990:	38 21 00 20 	addi    r1,r1,32
    1994:	4e 80 00 20 	blr

00001998 <strncat>:
    1998:	94 21 ff d0 	stwu    r1,-48(r1)
    199c:	90 61 00 18 	stw     r3,24(r1)
    19a0:	90 81 00 1c 	stw     r4,28(r1)
    19a4:	90 a1 00 20 	stw     r5,32(r1)
    19a8:	81 21 00 18 	lwz     r9,24(r1)
    19ac:	91 21 00 08 	stw     r9,8(r1)
    19b0:	81 21 00 20 	lwz     r9,32(r1)
    19b4:	2c 09 00 00 	cmpwi   r9,0
    19b8:	41 82 00 7c 	beq     1a34 <strncat+0x9c>
    19bc:	48 00 00 10 	b       19cc <strncat+0x34>
    19c0:	81 21 00 18 	lwz     r9,24(r1)
    19c4:	39 29 00 01 	addi    r9,r9,1
    19c8:	91 21 00 18 	stw     r9,24(r1)
    19cc:	81 21 00 18 	lwz     r9,24(r1)
    19d0:	89 29 00 00 	lbz     r9,0(r9)
    19d4:	2c 09 00 00 	cmpwi   r9,0
    19d8:	40 82 ff e8 	bne     19c0 <strncat+0x28>
    19dc:	48 00 00 2c 	b       1a08 <strncat+0x70>
    19e0:	81 21 00 20 	lwz     r9,32(r1)
    19e4:	39 29 ff ff 	addi    r9,r9,-1
    19e8:	91 21 00 20 	stw     r9,32(r1)
    19ec:	81 21 00 20 	lwz     r9,32(r1)
    19f0:	2c 09 00 00 	cmpwi   r9,0
    19f4:	40 82 00 14 	bne     1a08 <strncat+0x70>
    19f8:	81 21 00 18 	lwz     r9,24(r1)
    19fc:	39 40 00 00 	li      r10,0
    1a00:	99 49 00 00 	stb     r10,0(r9)
    1a04:	48 00 00 30 	b       1a34 <strncat+0x9c>
    1a08:	81 41 00 1c 	lwz     r10,28(r1)
    1a0c:	39 2a 00 01 	addi    r9,r10,1
    1a10:	91 21 00 1c 	stw     r9,28(r1)
    1a14:	81 21 00 18 	lwz     r9,24(r1)
    1a18:	39 09 00 01 	addi    r8,r9,1
    1a1c:	91 01 00 18 	stw     r8,24(r1)
    1a20:	89 4a 00 00 	lbz     r10,0(r10)
    1a24:	99 49 00 00 	stb     r10,0(r9)
    1a28:	89 29 00 00 	lbz     r9,0(r9)
    1a2c:	2c 09 00 00 	cmpwi   r9,0
    1a30:	40 82 ff b0 	bne     19e0 <strncat+0x48>
    1a34:	81 21 00 08 	lwz     r9,8(r1)
    1a38:	7d 23 4b 78 	mr      r3,r9
    1a3c:	38 21 00 30 	addi    r1,r1,48
    1a40:	4e 80 00 20 	blr

00001a44 <strlen>:
    1a44:	94 21 ff e0 	stwu    r1,-32(r1)
    1a48:	90 61 00 18 	stw     r3,24(r1)
    1a4c:	81 21 00 18 	lwz     r9,24(r1)
    1a50:	91 21 00 08 	stw     r9,8(r1)
    1a54:	48 00 00 10 	b       1a64 <strlen+0x20>
    1a58:	81 21 00 08 	lwz     r9,8(r1)
    1a5c:	39 29 00 01 	addi    r9,r9,1
    1a60:	91 21 00 08 	stw     r9,8(r1)
    1a64:	81 21 00 08 	lwz     r9,8(r1)
    1a68:	89 29 00 00 	lbz     r9,0(r9)
    1a6c:	2c 09 00 00 	cmpwi   r9,0
    1a70:	40 82 ff e8 	bne     1a58 <strlen+0x14>
    1a74:	81 41 00 08 	lwz     r10,8(r1)
    1a78:	81 21 00 18 	lwz     r9,24(r1)
    1a7c:	7d 29 50 50 	subf    r9,r9,r10
    1a80:	7d 23 4b 78 	mr      r3,r9
    1a84:	38 21 00 20 	addi    r1,r1,32
    1a88:	4e 80 00 20 	blr

00001a8c <strnlen>:
    1a8c:	94 21 ff e0 	stwu    r1,-32(r1)
    1a90:	90 61 00 18 	stw     r3,24(r1)
    1a94:	90 81 00 1c 	stw     r4,28(r1)
    1a98:	81 21 00 18 	lwz     r9,24(r1)
    1a9c:	91 21 00 08 	stw     r9,8(r1)
    1aa0:	48 00 00 10 	b       1ab0 <strnlen+0x24>
    1aa4:	81 21 00 08 	lwz     r9,8(r1)
    1aa8:	39 29 00 01 	addi    r9,r9,1
    1aac:	91 21 00 08 	stw     r9,8(r1)
    1ab0:	81 21 00 1c 	lwz     r9,28(r1)
    1ab4:	39 49 ff ff 	addi    r10,r9,-1
    1ab8:	91 41 00 1c 	stw     r10,28(r1)
    1abc:	2c 09 00 00 	cmpwi   r9,0
    1ac0:	41 82 00 14 	beq     1ad4 <strnlen+0x48>
    1ac4:	81 21 00 08 	lwz     r9,8(r1)
    1ac8:	89 29 00 00 	lbz     r9,0(r9)
    1acc:	2c 09 00 00 	cmpwi   r9,0
    1ad0:	40 82 ff d4 	bne     1aa4 <strnlen+0x18>
    1ad4:	81 41 00 08 	lwz     r10,8(r1)
    1ad8:	81 21 00 18 	lwz     r9,24(r1)
    1adc:	7d 29 50 50 	subf    r9,r9,r10
    1ae0:	7d 23 4b 78 	mr      r3,r9
    1ae4:	38 21 00 20 	addi    r1,r1,32
    1ae8:	4e 80 00 20 	blr

00001aec <strspn>:
    1aec:	94 21 ff e0 	stwu    r1,-32(r1)
    1af0:	90 61 00 18 	stw     r3,24(r1)
    1af4:	90 81 00 1c 	stw     r4,28(r1)
    1af8:	39 20 00 00 	li      r9,0
    1afc:	91 21 00 10 	stw     r9,16(r1)
    1b00:	81 21 00 18 	lwz     r9,24(r1)
    1b04:	91 21 00 08 	stw     r9,8(r1)
    1b08:	48 00 00 7c 	b       1b84 <strspn+0x98>
    1b0c:	81 21 00 1c 	lwz     r9,28(r1)
    1b10:	91 21 00 0c 	stw     r9,12(r1)
    1b14:	48 00 00 28 	b       1b3c <strspn+0x50>
    1b18:	81 21 00 08 	lwz     r9,8(r1)
    1b1c:	89 49 00 00 	lbz     r10,0(r9)
    1b20:	81 21 00 0c 	lwz     r9,12(r1)
    1b24:	89 29 00 00 	lbz     r9,0(r9)
    1b28:	7c 0a 48 40 	cmplw   r10,r9
    1b2c:	41 82 00 24 	beq     1b50 <strspn+0x64>
    1b30:	81 21 00 0c 	lwz     r9,12(r1)
    1b34:	39 29 00 01 	addi    r9,r9,1
    1b38:	91 21 00 0c 	stw     r9,12(r1)
    1b3c:	81 21 00 0c 	lwz     r9,12(r1)
    1b40:	89 29 00 00 	lbz     r9,0(r9)
    1b44:	2c 09 00 00 	cmpwi   r9,0
    1b48:	40 82 ff d0 	bne     1b18 <strspn+0x2c>
    1b4c:	48 00 00 08 	b       1b54 <strspn+0x68>
    1b50:	60 00 00 00 	nop
    1b54:	81 21 00 0c 	lwz     r9,12(r1)
    1b58:	89 29 00 00 	lbz     r9,0(r9)
    1b5c:	2c 09 00 00 	cmpwi   r9,0
    1b60:	40 82 00 0c 	bne     1b6c <strspn+0x80>
    1b64:	81 21 00 10 	lwz     r9,16(r1)
    1b68:	48 00 00 30 	b       1b98 <strspn+0xac>
    1b6c:	81 21 00 10 	lwz     r9,16(r1)
    1b70:	39 29 00 01 	addi    r9,r9,1
    1b74:	91 21 00 10 	stw     r9,16(r1)
    1b78:	81 21 00 08 	lwz     r9,8(r1)
    1b7c:	39 29 00 01 	addi    r9,r9,1
    1b80:	91 21 00 08 	stw     r9,8(r1)
    1b84:	81 21 00 08 	lwz     r9,8(r1)
    1b88:	89 29 00 00 	lbz     r9,0(r9)
    1b8c:	2c 09 00 00 	cmpwi   r9,0
    1b90:	40 82 ff 7c 	bne     1b0c <strspn+0x20>
    1b94:	81 21 00 10 	lwz     r9,16(r1)
    1b98:	7d 23 4b 78 	mr      r3,r9
    1b9c:	38 21 00 20 	addi    r1,r1,32
    1ba0:	4e 80 00 20 	blr

00001ba4 <memcmp>:
    1ba4:	94 21 ff d0 	stwu    r1,-48(r1)
    1ba8:	90 61 00 18 	stw     r3,24(r1)
    1bac:	90 81 00 1c 	stw     r4,28(r1)
    1bb0:	90 a1 00 20 	stw     r5,32(r1)
    1bb4:	39 20 00 00 	li      r9,0
    1bb8:	91 21 00 10 	stw     r9,16(r1)
    1bbc:	81 21 00 18 	lwz     r9,24(r1)
    1bc0:	91 21 00 08 	stw     r9,8(r1)
    1bc4:	81 21 00 1c 	lwz     r9,28(r1)
    1bc8:	91 21 00 0c 	stw     r9,12(r1)
    1bcc:	48 00 00 50 	b       1c1c <memcmp+0x78>
    1bd0:	81 21 00 08 	lwz     r9,8(r1)
    1bd4:	89 29 00 00 	lbz     r9,0(r9)
    1bd8:	7d 2a 4b 78 	mr      r10,r9
    1bdc:	81 21 00 0c 	lwz     r9,12(r1)
    1be0:	89 29 00 00 	lbz     r9,0(r9)
    1be4:	7d 29 50 50 	subf    r9,r9,r10
    1be8:	91 21 00 10 	stw     r9,16(r1)
    1bec:	81 21 00 10 	lwz     r9,16(r1)
    1bf0:	2c 09 00 00 	cmpwi   r9,0
    1bf4:	40 82 00 38 	bne     1c2c <memcmp+0x88>
    1bf8:	81 21 00 08 	lwz     r9,8(r1)
    1bfc:	39 29 00 01 	addi    r9,r9,1
    1c00:	91 21 00 08 	stw     r9,8(r1)
    1c04:	81 21 00 0c 	lwz     r9,12(r1)
    1c08:	39 29 00 01 	addi    r9,r9,1
    1c0c:	91 21 00 0c 	stw     r9,12(r1)
    1c10:	81 21 00 20 	lwz     r9,32(r1)
    1c14:	39 29 ff ff 	addi    r9,r9,-1
    1c18:	91 21 00 20 	stw     r9,32(r1)
    1c1c:	81 21 00 20 	lwz     r9,32(r1)
    1c20:	2c 09 00 00 	cmpwi   r9,0
    1c24:	40 82 ff ac 	bne     1bd0 <memcmp+0x2c>
    1c28:	48 00 00 08 	b       1c30 <memcmp+0x8c>
    1c2c:	60 00 00 00 	nop
    1c30:	81 21 00 10 	lwz     r9,16(r1)
    1c34:	7d 23 4b 78 	mr      r3,r9
    1c38:	38 21 00 30 	addi    r1,r1,48
    1c3c:	4e 80 00 20 	blr

00001c40 <memset>:
    1c40:	94 21 ff d0 	stwu    r1,-48(r1)
    1c44:	90 61 00 18 	stw     r3,24(r1)
    1c48:	90 81 00 1c 	stw     r4,28(r1)
    1c4c:	90 a1 00 20 	stw     r5,32(r1)
    1c50:	81 21 00 18 	lwz     r9,24(r1)
    1c54:	91 21 00 08 	stw     r9,8(r1)
    1c58:	48 00 00 1c 	b       1c74 <memset+0x34>
    1c5c:	81 21 00 08 	lwz     r9,8(r1)
    1c60:	39 49 00 01 	addi    r10,r9,1
    1c64:	91 41 00 08 	stw     r10,8(r1)
    1c68:	81 41 00 1c 	lwz     r10,28(r1)
    1c6c:	55 4a 06 3e 	clrlwi  r10,r10,24
    1c70:	99 49 00 00 	stb     r10,0(r9)
    1c74:	81 21 00 20 	lwz     r9,32(r1)
    1c78:	39 49 ff ff 	addi    r10,r9,-1
    1c7c:	91 41 00 20 	stw     r10,32(r1)
    1c80:	2c 09 00 00 	cmpwi   r9,0
    1c84:	40 82 ff d8 	bne     1c5c <memset+0x1c>
    1c88:	81 21 00 18 	lwz     r9,24(r1)
    1c8c:	7d 23 4b 78 	mr      r3,r9
    1c90:	38 21 00 30 	addi    r1,r1,48
    1c94:	4e 80 00 20 	blr

00001c98 <memcpy>:
    1c98:	94 21 ff d0 	stwu    r1,-48(r1)
    1c9c:	90 61 00 18 	stw     r3,24(r1)
    1ca0:	90 81 00 1c 	stw     r4,28(r1)
    1ca4:	90 a1 00 20 	stw     r5,32(r1)
    1ca8:	81 21 00 18 	lwz     r9,24(r1)
    1cac:	91 21 00 08 	stw     r9,8(r1)
    1cb0:	81 21 00 1c 	lwz     r9,28(r1)
    1cb4:	91 21 00 0c 	stw     r9,12(r1)
    1cb8:	48 00 00 24 	b       1cdc <memcpy+0x44>
    1cbc:	81 41 00 0c 	lwz     r10,12(r1)
    1cc0:	39 2a 00 01 	addi    r9,r10,1
    1cc4:	91 21 00 0c 	stw     r9,12(r1)
    1cc8:	81 21 00 08 	lwz     r9,8(r1)
    1ccc:	39 09 00 01 	addi    r8,r9,1
    1cd0:	91 01 00 08 	stw     r8,8(r1)
    1cd4:	89 4a 00 00 	lbz     r10,0(r10)
    1cd8:	99 49 00 00 	stb     r10,0(r9)
    1cdc:	81 21 00 20 	lwz     r9,32(r1)
    1ce0:	39 49 ff ff 	addi    r10,r9,-1
    1ce4:	91 41 00 20 	stw     r10,32(r1)
    1ce8:	2c 09 00 00 	cmpwi   r9,0
    1cec:	40 82 ff d0 	bne     1cbc <memcpy+0x24>
    1cf0:	81 21 00 18 	lwz     r9,24(r1)
    1cf4:	7d 23 4b 78 	mr      r3,r9
    1cf8:	38 21 00 30 	addi    r1,r1,48
    1cfc:	4e 80 00 20 	blr

00001d00 <memmove>:
    1d00:	94 21 ff d0 	stwu    r1,-48(r1)
    1d04:	90 61 00 18 	stw     r3,24(r1)
    1d08:	90 81 00 1c 	stw     r4,28(r1)
    1d0c:	90 a1 00 20 	stw     r5,32(r1)
    1d10:	81 41 00 18 	lwz     r10,24(r1)
    1d14:	81 21 00 1c 	lwz     r9,28(r1)
    1d18:	7c 0a 48 40 	cmplw   r10,r9
    1d1c:	41 81 00 50 	bgt     1d6c <memmove+0x6c>
    1d20:	81 21 00 18 	lwz     r9,24(r1)
    1d24:	91 21 00 08 	stw     r9,8(r1)
    1d28:	81 21 00 1c 	lwz     r9,28(r1)
    1d2c:	91 21 00 0c 	stw     r9,12(r1)
    1d30:	48 00 00 24 	b       1d54 <memmove+0x54>
    1d34:	81 41 00 0c 	lwz     r10,12(r1)
    1d38:	39 2a 00 01 	addi    r9,r10,1
    1d3c:	91 21 00 0c 	stw     r9,12(r1)
    1d40:	81 21 00 08 	lwz     r9,8(r1)
    1d44:	39 09 00 01 	addi    r8,r9,1
    1d48:	91 01 00 08 	stw     r8,8(r1)
    1d4c:	89 4a 00 00 	lbz     r10,0(r10)
    1d50:	99 49 00 00 	stb     r10,0(r9)
    1d54:	81 21 00 20 	lwz     r9,32(r1)
    1d58:	39 49 ff ff 	addi    r10,r9,-1
    1d5c:	91 41 00 20 	stw     r10,32(r1)
    1d60:	2c 09 00 00 	cmpwi   r9,0
    1d64:	40 82 ff d0 	bne     1d34 <memmove+0x34>
    1d68:	48 00 00 64 	b       1dcc <memmove+0xcc>
    1d6c:	81 41 00 18 	lwz     r10,24(r1)
    1d70:	81 21 00 20 	lwz     r9,32(r1)
    1d74:	7d 2a 4a 14 	add     r9,r10,r9
    1d78:	91 21 00 08 	stw     r9,8(r1)
    1d7c:	81 41 00 1c 	lwz     r10,28(r1)
    1d80:	81 21 00 20 	lwz     r9,32(r1)
    1d84:	7d 2a 4a 14 	add     r9,r10,r9
    1d88:	91 21 00 0c 	stw     r9,12(r1)
    1d8c:	48 00 00 2c 	b       1db8 <memmove+0xb8>
    1d90:	81 21 00 0c 	lwz     r9,12(r1)
    1d94:	39 29 ff ff 	addi    r9,r9,-1
    1d98:	91 21 00 0c 	stw     r9,12(r1)
    1d9c:	81 21 00 08 	lwz     r9,8(r1)
    1da0:	39 29 ff ff 	addi    r9,r9,-1
    1da4:	91 21 00 08 	stw     r9,8(r1)
    1da8:	81 21 00 0c 	lwz     r9,12(r1)
    1dac:	89 49 00 00 	lbz     r10,0(r9)
    1db0:	81 21 00 08 	lwz     r9,8(r1)
    1db4:	99 49 00 00 	stb     r10,0(r9)
    1db8:	81 21 00 20 	lwz     r9,32(r1)
    1dbc:	39 49 ff ff 	addi    r10,r9,-1
    1dc0:	91 41 00 20 	stw     r10,32(r1)
    1dc4:	2c 09 00 00 	cmpwi   r9,0
    1dc8:	40 82 ff c8 	bne     1d90 <memmove+0x90>
    1dcc:	81 21 00 18 	lwz     r9,24(r1)
    1dd0:	7d 23 4b 78 	mr      r3,r9
    1dd4:	38 21 00 30 	addi    r1,r1,48
    1dd8:	4e 80 00 20 	blr

00001ddc <strstr>:
    1ddc:	94 21 ff e0 	stwu    r1,-32(r1)
    1de0:	7c 08 02 a6 	mflr    r0
    1de4:	90 01 00 24 	stw     r0,36(r1)
    1de8:	90 61 00 18 	stw     r3,24(r1)
    1dec:	90 81 00 1c 	stw     r4,28(r1)
    1df0:	80 61 00 1c 	lwz     r3,28(r1)
    1df4:	4b ff fc 51 	bl      1a44 <strlen>
    1df8:	7c 69 1b 78 	mr      r9,r3
    1dfc:	91 21 00 0c 	stw     r9,12(r1)
    1e00:	81 21 00 0c 	lwz     r9,12(r1)
    1e04:	2c 09 00 00 	cmpwi   r9,0
    1e08:	40 82 00 0c 	bne     1e14 <strstr+0x38>
    1e0c:	81 21 00 18 	lwz     r9,24(r1)
    1e10:	48 00 00 68 	b       1e78 <strstr+0x9c>
    1e14:	80 61 00 18 	lwz     r3,24(r1)
    1e18:	4b ff fc 2d 	bl      1a44 <strlen>
    1e1c:	7c 69 1b 78 	mr      r9,r3
    1e20:	91 21 00 08 	stw     r9,8(r1)
    1e24:	48 00 00 40 	b       1e64 <strstr+0x88>
    1e28:	81 21 00 08 	lwz     r9,8(r1)
    1e2c:	39 29 ff ff 	addi    r9,r9,-1
    1e30:	91 21 00 08 	stw     r9,8(r1)
    1e34:	80 a1 00 0c 	lwz     r5,12(r1)
    1e38:	80 81 00 1c 	lwz     r4,28(r1)
    1e3c:	80 61 00 18 	lwz     r3,24(r1)
    1e40:	4b ff fd 65 	bl      1ba4 <memcmp>
    1e44:	7c 69 1b 78 	mr      r9,r3
    1e48:	2c 09 00 00 	cmpwi   r9,0
    1e4c:	40 82 00 0c 	bne     1e58 <strstr+0x7c>
    1e50:	81 21 00 18 	lwz     r9,24(r1)
    1e54:	48 00 00 24 	b       1e78 <strstr+0x9c>
    1e58:	81 21 00 18 	lwz     r9,24(r1)
    1e5c:	39 29 00 01 	addi    r9,r9,1
    1e60:	91 21 00 18 	stw     r9,24(r1)
    1e64:	81 41 00 08 	lwz     r10,8(r1)
    1e68:	81 21 00 0c 	lwz     r9,12(r1)
    1e6c:	7c 0a 48 40 	cmplw   r10,r9
    1e70:	40 80 ff b8 	bge     1e28 <strstr+0x4c>
    1e74:	39 20 00 00 	li      r9,0
    1e78:	7d 23 4b 78 	mr      r3,r9
    1e7c:	80 01 00 24 	lwz     r0,36(r1)
    1e80:	7c 08 03 a6 	mtlr    r0
    1e84:	38 21 00 20 	addi    r1,r1,32
    1e88:	4e 80 00 20 	blr

00001e8c <memchr>:
    1e8c:	94 21 ff d0 	stwu    r1,-48(r1)
    1e90:	90 61 00 18 	stw     r3,24(r1)
    1e94:	90 81 00 1c 	stw     r4,28(r1)
    1e98:	90 a1 00 20 	stw     r5,32(r1)
    1e9c:	81 21 00 18 	lwz     r9,24(r1)
    1ea0:	91 21 00 08 	stw     r9,8(r1)
    1ea4:	48 00 00 30 	b       1ed4 <memchr+0x48>
    1ea8:	81 21 00 1c 	lwz     r9,28(r1)
    1eac:	55 2a 06 3e 	clrlwi  r10,r9,24
    1eb0:	81 21 00 08 	lwz     r9,8(r1)
    1eb4:	39 09 00 01 	addi    r8,r9,1
    1eb8:	91 01 00 08 	stw     r8,8(r1)
    1ebc:	89 29 00 00 	lbz     r9,0(r9)
    1ec0:	7c 0a 48 40 	cmplw   r10,r9
    1ec4:	40 82 00 10 	bne     1ed4 <memchr+0x48>
    1ec8:	81 21 00 08 	lwz     r9,8(r1)
    1ecc:	39 29 ff ff 	addi    r9,r9,-1
    1ed0:	48 00 00 1c 	b       1eec <memchr+0x60>
    1ed4:	81 21 00 20 	lwz     r9,32(r1)
    1ed8:	39 49 ff ff 	addi    r10,r9,-1
    1edc:	91 41 00 20 	stw     r10,32(r1)
    1ee0:	2c 09 00 00 	cmpwi   r9,0
    1ee4:	40 82 ff c4 	bne     1ea8 <memchr+0x1c>
    1ee8:	39 20 00 00 	li      r9,0
    1eec:	7d 23 4b 78 	mr      r3,r9
    1ef0:	38 21 00 30 	addi    r1,r1,48
    1ef4:	4e 80 00 20 	blr

00001ef8 <strtoul>:
    1ef8:	94 21 ff d0 	stwu    r1,-48(r1)
    1efc:	7c 08 02 a6 	mflr    r0
    1f00:	90 01 00 34 	stw     r0,52(r1)
    1f04:	90 61 00 18 	stw     r3,24(r1)
    1f08:	90 81 00 1c 	stw     r4,28(r1)
    1f0c:	90 a1 00 20 	stw     r5,32(r1)
    1f10:	39 20 00 00 	li      r9,0
    1f14:	91 21 00 08 	stw     r9,8(r1)
    1f18:	81 21 00 20 	lwz     r9,32(r1)
    1f1c:	2c 09 00 00 	cmpwi   r9,0
    1f20:	40 82 00 8c 	bne     1fac <strtoul+0xb4>
    1f24:	39 20 00 0a 	li      r9,10
    1f28:	91 21 00 20 	stw     r9,32(r1)
    1f2c:	81 21 00 18 	lwz     r9,24(r1)
    1f30:	89 29 00 00 	lbz     r9,0(r9)
    1f34:	28 09 00 30 	cmplwi  r9,48
    1f38:	40 82 00 e4 	bne     201c <strtoul+0x124>
    1f3c:	39 20 00 08 	li      r9,8
    1f40:	91 21 00 20 	stw     r9,32(r1)
    1f44:	81 21 00 18 	lwz     r9,24(r1)
    1f48:	39 29 00 01 	addi    r9,r9,1
    1f4c:	91 21 00 18 	stw     r9,24(r1)
    1f50:	81 21 00 18 	lwz     r9,24(r1)
    1f54:	89 29 00 00 	lbz     r9,0(r9)
    1f58:	7d 23 4b 78 	mr      r3,r9
    1f5c:	4b ff f5 41 	bl      149c <__toupper>
    1f60:	7c 69 1b 78 	mr      r9,r3
    1f64:	28 09 00 58 	cmplwi  r9,88
    1f68:	40 82 00 b4 	bne     201c <strtoul+0x124>
    1f6c:	81 21 00 18 	lwz     r9,24(r1)
    1f70:	39 29 00 01 	addi    r9,r9,1
    1f74:	89 29 00 00 	lbz     r9,0(r9)
    1f78:	7d 2a 4b 78 	mr      r10,r9
    1f7c:	3d 20 00 00 	lis     r9,0
    1f80:	39 29 09 04 	addi    r9,r9,2308
    1f84:	7d 29 50 ae 	lbzx    r9,r9,r10
    1f88:	71 29 00 44 	andi.   r9,r9,68
    1f8c:	2c 09 00 00 	cmpwi   r9,0
    1f90:	41 82 00 8c 	beq     201c <strtoul+0x124>
    1f94:	81 21 00 18 	lwz     r9,24(r1)
    1f98:	39 29 00 01 	addi    r9,r9,1
    1f9c:	91 21 00 18 	stw     r9,24(r1)
    1fa0:	39 20 00 10 	li      r9,16
    1fa4:	91 21 00 20 	stw     r9,32(r1)
    1fa8:	48 00 00 74 	b       201c <strtoul+0x124>
    1fac:	81 21 00 20 	lwz     r9,32(r1)
    1fb0:	2c 09 00 10 	cmpwi   r9,16
    1fb4:	40 82 00 68 	bne     201c <strtoul+0x124>
    1fb8:	81 21 00 18 	lwz     r9,24(r1)
    1fbc:	89 29 00 00 	lbz     r9,0(r9)
    1fc0:	28 09 00 30 	cmplwi  r9,48
    1fc4:	40 82 00 58 	bne     201c <strtoul+0x124>
    1fc8:	81 21 00 18 	lwz     r9,24(r1)
    1fcc:	39 29 00 01 	addi    r9,r9,1
    1fd0:	89 29 00 00 	lbz     r9,0(r9)
    1fd4:	7d 23 4b 78 	mr      r3,r9
    1fd8:	4b ff f4 c5 	bl      149c <__toupper>
    1fdc:	7c 69 1b 78 	mr      r9,r3
    1fe0:	28 09 00 58 	cmplwi  r9,88
    1fe4:	40 82 00 38 	bne     201c <strtoul+0x124>
    1fe8:	81 21 00 18 	lwz     r9,24(r1)
    1fec:	39 29 00 02 	addi    r9,r9,2
    1ff0:	91 21 00 18 	stw     r9,24(r1)
    1ff4:	48 00 00 28 	b       201c <strtoul+0x124>
    1ff8:	81 41 00 08 	lwz     r10,8(r1)
    1ffc:	81 21 00 20 	lwz     r9,32(r1)
    2000:	7d 2a 49 d6 	mullw   r9,r10,r9
    2004:	81 41 00 0c 	lwz     r10,12(r1)
    2008:	7d 2a 4a 14 	add     r9,r10,r9
    200c:	91 21 00 08 	stw     r9,8(r1)
    2010:	81 21 00 18 	lwz     r9,24(r1)
    2014:	39 29 00 01 	addi    r9,r9,1
    2018:	91 21 00 18 	stw     r9,24(r1)
    201c:	81 21 00 18 	lwz     r9,24(r1)
    2020:	89 29 00 00 	lbz     r9,0(r9)
    2024:	7d 2a 4b 78 	mr      r10,r9
    2028:	3d 20 00 00 	lis     r9,0
    202c:	39 29 09 04 	addi    r9,r9,2308
    2030:	7d 29 50 ae 	lbzx    r9,r9,r10
    2034:	71 29 00 44 	andi.   r9,r9,68
    2038:	2c 09 00 00 	cmpwi   r9,0
    203c:	41 82 00 64 	beq     20a0 <strtoul+0x1a8>
    2040:	81 21 00 18 	lwz     r9,24(r1)
    2044:	89 29 00 00 	lbz     r9,0(r9)
    2048:	7d 2a 4b 78 	mr      r10,r9
    204c:	3d 20 00 00 	lis     r9,0
    2050:	39 29 09 04 	addi    r9,r9,2308
    2054:	7d 29 50 ae 	lbzx    r9,r9,r10
    2058:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    205c:	2c 09 00 00 	cmpwi   r9,0
    2060:	41 82 00 14 	beq     2074 <strtoul+0x17c>
    2064:	81 21 00 18 	lwz     r9,24(r1)
    2068:	89 29 00 00 	lbz     r9,0(r9)
    206c:	39 29 ff d0 	addi    r9,r9,-48
    2070:	48 00 00 1c 	b       208c <strtoul+0x194>
    2074:	81 21 00 18 	lwz     r9,24(r1)
    2078:	89 29 00 00 	lbz     r9,0(r9)
    207c:	7d 23 4b 78 	mr      r3,r9
    2080:	4b ff f4 1d 	bl      149c <__toupper>
    2084:	7c 69 1b 78 	mr      r9,r3
    2088:	39 29 ff c9 	addi    r9,r9,-55
    208c:	91 21 00 0c 	stw     r9,12(r1)
    2090:	81 41 00 0c 	lwz     r10,12(r1)
    2094:	81 21 00 20 	lwz     r9,32(r1)
    2098:	7c 0a 48 40 	cmplw   r10,r9
    209c:	41 80 ff 5c 	blt     1ff8 <strtoul+0x100>
    20a0:	81 21 00 1c 	lwz     r9,28(r1)
    20a4:	2c 09 00 00 	cmpwi   r9,0
    20a8:	41 82 00 10 	beq     20b8 <strtoul+0x1c0>
    20ac:	81 21 00 1c 	lwz     r9,28(r1)
    20b0:	81 41 00 18 	lwz     r10,24(r1)
    20b4:	91 49 00 00 	stw     r10,0(r9)
    20b8:	81 21 00 08 	lwz     r9,8(r1)
    20bc:	7d 23 4b 78 	mr      r3,r9
    20c0:	80 01 00 34 	lwz     r0,52(r1)
    20c4:	7c 08 03 a6 	mtlr    r0
    20c8:	38 21 00 30 	addi    r1,r1,48
    20cc:	4e 80 00 20 	blr

000020d0 <strtol>:
    20d0:	94 21 ff e0 	stwu    r1,-32(r1)
    20d4:	7c 08 02 a6 	mflr    r0
    20d8:	90 01 00 24 	stw     r0,36(r1)
    20dc:	90 61 00 08 	stw     r3,8(r1)
    20e0:	90 81 00 0c 	stw     r4,12(r1)
    20e4:	90 a1 00 10 	stw     r5,16(r1)
    20e8:	81 21 00 08 	lwz     r9,8(r1)
    20ec:	89 29 00 00 	lbz     r9,0(r9)
    20f0:	28 09 00 2d 	cmplwi  r9,45
    20f4:	40 82 00 2c 	bne     2120 <strtol+0x50>
    20f8:	81 21 00 08 	lwz     r9,8(r1)
    20fc:	39 29 00 01 	addi    r9,r9,1
    2100:	81 41 00 10 	lwz     r10,16(r1)
    2104:	7d 45 53 78 	mr      r5,r10
    2108:	80 81 00 0c 	lwz     r4,12(r1)
    210c:	7d 23 4b 78 	mr      r3,r9
    2110:	4b ff fd e9 	bl      1ef8 <strtoul>
    2114:	7c 69 1b 78 	mr      r9,r3
    2118:	7d 29 00 d0 	neg     r9,r9
    211c:	48 00 00 1c 	b       2138 <strtol+0x68>
    2120:	81 21 00 10 	lwz     r9,16(r1)
    2124:	7d 25 4b 78 	mr      r5,r9
    2128:	80 81 00 0c 	lwz     r4,12(r1)
    212c:	80 61 00 08 	lwz     r3,8(r1)
    2130:	4b ff fd c9 	bl      1ef8 <strtoul>
    2134:	7c 69 1b 78 	mr      r9,r3
    2138:	7d 23 4b 78 	mr      r3,r9
    213c:	80 01 00 24 	lwz     r0,36(r1)
    2140:	7c 08 03 a6 	mtlr    r0
    2144:	38 21 00 20 	addi    r1,r1,32
    2148:	4e 80 00 20 	blr

0000214c <skip_atoi>:
    214c:	94 21 ff e0 	stwu    r1,-32(r1)
    2150:	90 61 00 18 	stw     r3,24(r1)
    2154:	39 20 00 00 	li      r9,0
    2158:	91 21 00 08 	stw     r9,8(r1)
    215c:	48 00 00 30 	b       218c <skip_atoi+0x40>
    2160:	81 21 00 08 	lwz     r9,8(r1)
    2164:	1d 49 00 0a 	mulli   r10,r9,10
    2168:	81 21 00 18 	lwz     r9,24(r1)
    216c:	81 29 00 00 	lwz     r9,0(r9)
    2170:	38 e9 00 01 	addi    r7,r9,1
    2174:	81 01 00 18 	lwz     r8,24(r1)
    2178:	90 e8 00 00 	stw     r7,0(r8)
    217c:	89 29 00 00 	lbz     r9,0(r9)
    2180:	7d 2a 4a 14 	add     r9,r10,r9
    2184:	39 29 ff d0 	addi    r9,r9,-48
    2188:	91 21 00 08 	stw     r9,8(r1)
    218c:	81 21 00 18 	lwz     r9,24(r1)
    2190:	81 29 00 00 	lwz     r9,0(r9)
    2194:	89 29 00 00 	lbz     r9,0(r9)
    2198:	7d 2a 4b 78 	mr      r10,r9
    219c:	3d 20 00 00 	lis     r9,0
    21a0:	39 29 09 04 	addi    r9,r9,2308
    21a4:	7d 29 50 ae 	lbzx    r9,r9,r10
    21a8:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    21ac:	2c 09 00 00 	cmpwi   r9,0
    21b0:	40 82 ff b0 	bne     2160 <skip_atoi+0x14>
    21b4:	81 21 00 08 	lwz     r9,8(r1)
    21b8:	7d 23 4b 78 	mr      r3,r9
    21bc:	38 21 00 20 	addi    r1,r1,32
    21c0:	4e 80 00 20 	blr

000021c4 <number>:
    21c4:	94 21 ff 70 	stwu    r1,-144(r1)
    21c8:	90 61 00 68 	stw     r3,104(r1)
    21cc:	90 81 00 6c 	stw     r4,108(r1)
    21d0:	90 a1 00 70 	stw     r5,112(r1)
    21d4:	90 c1 00 74 	stw     r6,116(r1)
    21d8:	90 e1 00 78 	stw     r7,120(r1)
    21dc:	91 01 00 7c 	stw     r8,124(r1)
    21e0:	91 21 00 80 	stw     r9,128(r1)
    21e4:	81 21 00 80 	lwz     r9,128(r1)
    21e8:	55 29 06 72 	rlwinm  r9,r9,0,25,25
    21ec:	2c 09 00 00 	cmpwi   r9,0
    21f0:	41 82 00 10 	beq     2200 <number+0x3c>
    21f4:	3d 20 00 00 	lis     r9,0
    21f8:	39 29 0a 10 	addi    r9,r9,2576
    21fc:	48 00 00 0c 	b       2208 <number+0x44>
    2200:	3d 20 00 00 	lis     r9,0
    2204:	39 29 0a 38 	addi    r9,r9,2616
    2208:	91 21 00 10 	stw     r9,16(r1)
    220c:	81 21 00 80 	lwz     r9,128(r1)
    2210:	55 29 06 f6 	rlwinm  r9,r9,0,27,27
    2214:	2c 09 00 00 	cmpwi   r9,0
    2218:	41 82 00 10 	beq     2228 <number+0x64>
    221c:	81 21 00 80 	lwz     r9,128(r1)
    2220:	55 29 00 3c 	rlwinm  r9,r9,0,0,30
    2224:	91 21 00 80 	stw     r9,128(r1)
    2228:	81 21 00 74 	lwz     r9,116(r1)
    222c:	2c 09 00 01 	cmpwi   r9,1
    2230:	40 81 00 10 	ble     2240 <number+0x7c>
    2234:	81 21 00 74 	lwz     r9,116(r1)
    2238:	2c 09 00 24 	cmpwi   r9,36
    223c:	40 81 00 0c 	ble     2248 <number+0x84>
    2240:	39 20 00 00 	li      r9,0
    2244:	48 00 03 fc 	b       2640 <number+0x47c>
    2248:	81 21 00 80 	lwz     r9,128(r1)
    224c:	55 29 07 fe 	clrlwi  r9,r9,31
    2250:	2c 09 00 00 	cmpwi   r9,0
    2254:	41 82 00 0c 	beq     2260 <number+0x9c>
    2258:	39 20 00 30 	li      r9,48
    225c:	48 00 00 08 	b       2264 <number+0xa0>
    2260:	39 20 00 20 	li      r9,32
    2264:	99 21 00 14 	stb     r9,20(r1)
    2268:	39 20 00 00 	li      r9,0
    226c:	99 21 00 08 	stb     r9,8(r1)
    2270:	81 21 00 80 	lwz     r9,128(r1)
    2274:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    2278:	2c 09 00 00 	cmpwi   r9,0
    227c:	41 82 00 80 	beq     22fc <number+0x138>
    2280:	81 21 00 70 	lwz     r9,112(r1)
    2284:	2c 09 00 00 	cmpwi   r9,0
    2288:	40 80 00 28 	bge     22b0 <number+0xec>
    228c:	39 20 00 2d 	li      r9,45
    2290:	99 21 00 08 	stb     r9,8(r1)
    2294:	81 21 00 70 	lwz     r9,112(r1)
    2298:	7d 29 00 d0 	neg     r9,r9
    229c:	91 21 00 70 	stw     r9,112(r1)
    22a0:	81 21 00 78 	lwz     r9,120(r1)
    22a4:	39 29 ff ff 	addi    r9,r9,-1
    22a8:	91 21 00 78 	stw     r9,120(r1)
    22ac:	48 00 00 50 	b       22fc <number+0x138>
    22b0:	81 21 00 80 	lwz     r9,128(r1)
    22b4:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    22b8:	2c 09 00 00 	cmpwi   r9,0
    22bc:	41 82 00 1c 	beq     22d8 <number+0x114>
    22c0:	39 20 00 2b 	li      r9,43
    22c4:	99 21 00 08 	stb     r9,8(r1)
    22c8:	81 21 00 78 	lwz     r9,120(r1)
    22cc:	39 29 ff ff 	addi    r9,r9,-1
    22d0:	91 21 00 78 	stw     r9,120(r1)
    22d4:	48 00 00 28 	b       22fc <number+0x138>
    22d8:	81 21 00 80 	lwz     r9,128(r1)
    22dc:	55 29 07 38 	rlwinm  r9,r9,0,28,28
    22e0:	2c 09 00 00 	cmpwi   r9,0
    22e4:	41 82 00 18 	beq     22fc <number+0x138>
    22e8:	39 20 00 20 	li      r9,32
    22ec:	99 21 00 08 	stb     r9,8(r1)
    22f0:	81 21 00 78 	lwz     r9,120(r1)
    22f4:	39 29 ff ff 	addi    r9,r9,-1
    22f8:	91 21 00 78 	stw     r9,120(r1)
    22fc:	81 21 00 80 	lwz     r9,128(r1)
    2300:	55 29 06 b4 	rlwinm  r9,r9,0,26,26
    2304:	2c 09 00 00 	cmpwi   r9,0
    2308:	41 82 00 38 	beq     2340 <number+0x17c>
    230c:	81 21 00 74 	lwz     r9,116(r1)
    2310:	2c 09 00 10 	cmpwi   r9,16
    2314:	40 82 00 14 	bne     2328 <number+0x164>
    2318:	81 21 00 78 	lwz     r9,120(r1)
    231c:	39 29 ff fe 	addi    r9,r9,-2
    2320:	91 21 00 78 	stw     r9,120(r1)
    2324:	48 00 00 1c 	b       2340 <number+0x17c>
    2328:	81 21 00 74 	lwz     r9,116(r1)
    232c:	2c 09 00 08 	cmpwi   r9,8
    2330:	40 82 00 10 	bne     2340 <number+0x17c>
    2334:	81 21 00 78 	lwz     r9,120(r1)
    2338:	39 29 ff ff 	addi    r9,r9,-1
    233c:	91 21 00 78 	stw     r9,120(r1)
    2340:	39 20 00 00 	li      r9,0
    2344:	91 21 00 0c 	stw     r9,12(r1)
    2348:	81 21 00 70 	lwz     r9,112(r1)
    234c:	2c 09 00 00 	cmpwi   r9,0
    2350:	40 82 00 6c 	bne     23bc <number+0x1f8>
    2354:	81 21 00 0c 	lwz     r9,12(r1)
    2358:	39 49 00 01 	addi    r10,r9,1
    235c:	91 41 00 0c 	stw     r10,12(r1)
    2360:	39 41 00 08 	addi    r10,r1,8
    2364:	7d 2a 4a 14 	add     r9,r10,r9
    2368:	39 40 00 30 	li      r10,48
    236c:	99 49 00 10 	stb     r10,16(r9)
    2370:	48 00 00 58 	b       23c8 <number+0x204>
    2374:	81 41 00 74 	lwz     r10,116(r1)
    2378:	81 21 00 70 	lwz     r9,112(r1)
    237c:	7d 09 53 96 	divwu   r8,r9,r10
    2380:	7d 48 51 d6 	mullw   r10,r8,r10
    2384:	7d 2a 48 50 	subf    r9,r10,r9
    2388:	81 41 00 10 	lwz     r10,16(r1)
    238c:	7d 4a 4a 14 	add     r10,r10,r9
    2390:	81 21 00 0c 	lwz     r9,12(r1)
    2394:	39 09 00 01 	addi    r8,r9,1
    2398:	91 01 00 0c 	stw     r8,12(r1)
    239c:	89 4a 00 00 	lbz     r10,0(r10)
    23a0:	39 01 00 08 	addi    r8,r1,8
    23a4:	7d 28 4a 14 	add     r9,r8,r9
    23a8:	99 49 00 10 	stb     r10,16(r9)
    23ac:	81 21 00 74 	lwz     r9,116(r1)
    23b0:	81 41 00 70 	lwz     r10,112(r1)
    23b4:	7d 2a 4b 96 	divwu   r9,r10,r9
    23b8:	91 21 00 70 	stw     r9,112(r1)
    23bc:	81 21 00 70 	lwz     r9,112(r1)
    23c0:	2c 09 00 00 	cmpwi   r9,0
    23c4:	40 82 ff b0 	bne     2374 <number+0x1b0>
    23c8:	81 41 00 0c 	lwz     r10,12(r1)
    23cc:	81 21 00 7c 	lwz     r9,124(r1)
    23d0:	7c 0a 48 00 	cmpw    r10,r9
    23d4:	40 81 00 0c 	ble     23e0 <number+0x21c>
    23d8:	81 21 00 0c 	lwz     r9,12(r1)
    23dc:	91 21 00 7c 	stw     r9,124(r1)
    23e0:	81 41 00 78 	lwz     r10,120(r1)
    23e4:	81 21 00 7c 	lwz     r9,124(r1)
    23e8:	7d 29 50 50 	subf    r9,r9,r10
    23ec:	91 21 00 78 	stw     r9,120(r1)
    23f0:	81 21 00 80 	lwz     r9,128(r1)
    23f4:	71 29 00 11 	andi.   r9,r9,17
    23f8:	2c 09 00 00 	cmpwi   r9,0
    23fc:	40 82 00 44 	bne     2440 <number+0x27c>
    2400:	48 00 00 2c 	b       242c <number+0x268>
    2404:	81 41 00 68 	lwz     r10,104(r1)
    2408:	81 21 00 6c 	lwz     r9,108(r1)
    240c:	7c 0a 48 40 	cmplw   r10,r9
    2410:	40 80 00 10 	bge     2420 <number+0x25c>
    2414:	81 21 00 68 	lwz     r9,104(r1)
    2418:	39 40 00 20 	li      r10,32
    241c:	99 49 00 00 	stb     r10,0(r9)
    2420:	81 21 00 68 	lwz     r9,104(r1)
    2424:	39 29 00 01 	addi    r9,r9,1
    2428:	91 21 00 68 	stw     r9,104(r1)
    242c:	81 21 00 78 	lwz     r9,120(r1)
    2430:	39 49 ff ff 	addi    r10,r9,-1
    2434:	91 41 00 78 	stw     r10,120(r1)
    2438:	2c 09 00 00 	cmpwi   r9,0
    243c:	41 81 ff c8 	bgt     2404 <number+0x240>
    2440:	89 21 00 08 	lbz     r9,8(r1)
    2444:	2c 09 00 00 	cmpwi   r9,0
    2448:	41 82 00 2c 	beq     2474 <number+0x2b0>
    244c:	81 41 00 68 	lwz     r10,104(r1)
    2450:	81 21 00 6c 	lwz     r9,108(r1)
    2454:	7c 0a 48 40 	cmplw   r10,r9
    2458:	40 80 00 10 	bge     2468 <number+0x2a4>
    245c:	81 21 00 68 	lwz     r9,104(r1)
    2460:	89 41 00 08 	lbz     r10,8(r1)
    2464:	99 49 00 00 	stb     r10,0(r9)
    2468:	81 21 00 68 	lwz     r9,104(r1)
    246c:	39 29 00 01 	addi    r9,r9,1
    2470:	91 21 00 68 	stw     r9,104(r1)
    2474:	81 21 00 80 	lwz     r9,128(r1)
    2478:	55 29 06 b4 	rlwinm  r9,r9,0,26,26
    247c:	2c 09 00 00 	cmpwi   r9,0
    2480:	41 82 00 9c 	beq     251c <number+0x358>
    2484:	81 21 00 74 	lwz     r9,116(r1)
    2488:	2c 09 00 08 	cmpwi   r9,8
    248c:	40 82 00 30 	bne     24bc <number+0x2f8>
    2490:	81 41 00 68 	lwz     r10,104(r1)
    2494:	81 21 00 6c 	lwz     r9,108(r1)
    2498:	7c 0a 48 40 	cmplw   r10,r9
    249c:	40 80 00 10 	bge     24ac <number+0x2e8>
    24a0:	81 21 00 68 	lwz     r9,104(r1)
    24a4:	39 40 00 30 	li      r10,48
    24a8:	99 49 00 00 	stb     r10,0(r9)
    24ac:	81 21 00 68 	lwz     r9,104(r1)
    24b0:	39 29 00 01 	addi    r9,r9,1
    24b4:	91 21 00 68 	stw     r9,104(r1)
    24b8:	48 00 00 64 	b       251c <number+0x358>
    24bc:	81 21 00 74 	lwz     r9,116(r1)
    24c0:	2c 09 00 10 	cmpwi   r9,16
    24c4:	40 82 00 58 	bne     251c <number+0x358>
    24c8:	81 41 00 68 	lwz     r10,104(r1)
    24cc:	81 21 00 6c 	lwz     r9,108(r1)
    24d0:	7c 0a 48 40 	cmplw   r10,r9
    24d4:	40 80 00 10 	bge     24e4 <number+0x320>
    24d8:	81 21 00 68 	lwz     r9,104(r1)
    24dc:	39 40 00 30 	li      r10,48
    24e0:	99 49 00 00 	stb     r10,0(r9)
    24e4:	81 21 00 68 	lwz     r9,104(r1)
    24e8:	39 29 00 01 	addi    r9,r9,1
    24ec:	91 21 00 68 	stw     r9,104(r1)
    24f0:	81 41 00 68 	lwz     r10,104(r1)
    24f4:	81 21 00 6c 	lwz     r9,108(r1)
    24f8:	7c 0a 48 40 	cmplw   r10,r9
    24fc:	40 80 00 14 	bge     2510 <number+0x34c>
    2500:	81 21 00 10 	lwz     r9,16(r1)
    2504:	89 49 00 21 	lbz     r10,33(r9)
    2508:	81 21 00 68 	lwz     r9,104(r1)
    250c:	99 49 00 00 	stb     r10,0(r9)
    2510:	81 21 00 68 	lwz     r9,104(r1)
    2514:	39 29 00 01 	addi    r9,r9,1
    2518:	91 21 00 68 	stw     r9,104(r1)
    251c:	81 21 00 80 	lwz     r9,128(r1)
    2520:	55 29 06 f6 	rlwinm  r9,r9,0,27,27
    2524:	2c 09 00 00 	cmpwi   r9,0
    2528:	40 82 00 70 	bne     2598 <number+0x3d4>
    252c:	48 00 00 2c 	b       2558 <number+0x394>
    2530:	81 41 00 68 	lwz     r10,104(r1)
    2534:	81 21 00 6c 	lwz     r9,108(r1)
    2538:	7c 0a 48 40 	cmplw   r10,r9
    253c:	40 80 00 10 	bge     254c <number+0x388>
    2540:	81 21 00 68 	lwz     r9,104(r1)
    2544:	89 41 00 14 	lbz     r10,20(r1)
    2548:	99 49 00 00 	stb     r10,0(r9)
    254c:	81 21 00 68 	lwz     r9,104(r1)
    2550:	39 29 00 01 	addi    r9,r9,1
    2554:	91 21 00 68 	stw     r9,104(r1)
    2558:	81 21 00 78 	lwz     r9,120(r1)
    255c:	39 49 ff ff 	addi    r10,r9,-1
    2560:	91 41 00 78 	stw     r10,120(r1)
    2564:	2c 09 00 00 	cmpwi   r9,0
    2568:	41 81 ff c8 	bgt     2530 <number+0x36c>
    256c:	48 00 00 2c 	b       2598 <number+0x3d4>
    2570:	81 41 00 68 	lwz     r10,104(r1)
    2574:	81 21 00 6c 	lwz     r9,108(r1)
    2578:	7c 0a 48 40 	cmplw   r10,r9
    257c:	40 80 00 10 	bge     258c <number+0x3c8>
    2580:	81 21 00 68 	lwz     r9,104(r1)
    2584:	39 40 00 30 	li      r10,48
    2588:	99 49 00 00 	stb     r10,0(r9)
    258c:	81 21 00 68 	lwz     r9,104(r1)
    2590:	39 29 00 01 	addi    r9,r9,1
    2594:	91 21 00 68 	stw     r9,104(r1)
    2598:	81 21 00 7c 	lwz     r9,124(r1)
    259c:	39 49 ff ff 	addi    r10,r9,-1
    25a0:	91 41 00 7c 	stw     r10,124(r1)
    25a4:	81 41 00 0c 	lwz     r10,12(r1)
    25a8:	7c 0a 48 00 	cmpw    r10,r9
    25ac:	41 80 ff c4 	blt     2570 <number+0x3ac>
    25b0:	48 00 00 38 	b       25e8 <number+0x424>
    25b4:	81 41 00 68 	lwz     r10,104(r1)
    25b8:	81 21 00 6c 	lwz     r9,108(r1)
    25bc:	7c 0a 48 40 	cmplw   r10,r9
    25c0:	40 80 00 1c 	bge     25dc <number+0x418>
    25c4:	39 41 00 18 	addi    r10,r1,24
    25c8:	81 21 00 0c 	lwz     r9,12(r1)
    25cc:	7d 2a 4a 14 	add     r9,r10,r9
    25d0:	89 49 00 00 	lbz     r10,0(r9)
    25d4:	81 21 00 68 	lwz     r9,104(r1)
    25d8:	99 49 00 00 	stb     r10,0(r9)
    25dc:	81 21 00 68 	lwz     r9,104(r1)
    25e0:	39 29 00 01 	addi    r9,r9,1
    25e4:	91 21 00 68 	stw     r9,104(r1)
    25e8:	81 21 00 0c 	lwz     r9,12(r1)
    25ec:	39 49 ff ff 	addi    r10,r9,-1
    25f0:	91 41 00 0c 	stw     r10,12(r1)
    25f4:	2c 09 00 00 	cmpwi   r9,0
    25f8:	41 81 ff bc 	bgt     25b4 <number+0x3f0>
    25fc:	48 00 00 2c 	b       2628 <number+0x464>
    2600:	81 41 00 68 	lwz     r10,104(r1)
    2604:	81 21 00 6c 	lwz     r9,108(r1)
    2608:	7c 0a 48 40 	cmplw   r10,r9
    260c:	40 80 00 10 	bge     261c <number+0x458>
    2610:	81 21 00 68 	lwz     r9,104(r1)
    2614:	39 40 00 20 	li      r10,32
    2618:	99 49 00 00 	stb     r10,0(r9)
    261c:	81 21 00 68 	lwz     r9,104(r1)
    2620:	39 29 00 01 	addi    r9,r9,1
    2624:	91 21 00 68 	stw     r9,104(r1)
    2628:	81 21 00 78 	lwz     r9,120(r1)
    262c:	39 49 ff ff 	addi    r10,r9,-1
    2630:	91 41 00 78 	stw     r10,120(r1)
    2634:	2c 09 00 00 	cmpwi   r9,0
    2638:	41 81 ff c8 	bgt     2600 <number+0x43c>
    263c:	81 21 00 68 	lwz     r9,104(r1)
    2640:	7d 23 4b 78 	mr      r3,r9
    2644:	38 21 00 90 	addi    r1,r1,144
    2648:	4e 80 00 20 	blr

0000264c <vscnprintf>:
    264c:	94 21 ff d0 	stwu    r1,-48(r1)
    2650:	7c 08 02 a6 	mflr    r0
    2654:	90 01 00 34 	stw     r0,52(r1)
    2658:	90 61 00 18 	stw     r3,24(r1)
    265c:	90 81 00 1c 	stw     r4,28(r1)
    2660:	90 a1 00 20 	stw     r5,32(r1)
    2664:	90 c1 00 24 	stw     r6,36(r1)
    2668:	80 c1 00 24 	lwz     r6,36(r1)
    266c:	80 a1 00 20 	lwz     r5,32(r1)
    2670:	80 81 00 1c 	lwz     r4,28(r1)
    2674:	80 61 00 18 	lwz     r3,24(r1)
    2678:	48 00 04 4d 	bl      2ac4 <vsnprintf>
    267c:	7c 69 1b 78 	mr      r9,r3
    2680:	91 21 00 08 	stw     r9,8(r1)
    2684:	81 41 00 08 	lwz     r10,8(r1)
    2688:	81 21 00 1c 	lwz     r9,28(r1)
    268c:	7c 0a 48 40 	cmplw   r10,r9
    2690:	41 80 00 10 	blt     26a0 <vscnprintf+0x54>
    2694:	81 21 00 1c 	lwz     r9,28(r1)
    2698:	39 29 ff ff 	addi    r9,r9,-1
    269c:	48 00 00 08 	b       26a4 <vscnprintf+0x58>
    26a0:	81 21 00 08 	lwz     r9,8(r1)
    26a4:	7d 23 4b 78 	mr      r3,r9
    26a8:	80 01 00 34 	lwz     r0,52(r1)
    26ac:	7c 08 03 a6 	mtlr    r0
    26b0:	38 21 00 30 	addi    r1,r1,48
    26b4:	4e 80 00 20 	blr

000026b8 <snprintf>:
    26b8:	94 21 ff 80 	stwu    r1,-128(r1)
    26bc:	7c 08 02 a6 	mflr    r0
    26c0:	90 01 00 84 	stw     r0,132(r1)
    26c4:	90 61 00 18 	stw     r3,24(r1)
    26c8:	90 81 00 1c 	stw     r4,28(r1)
    26cc:	90 a1 00 20 	stw     r5,32(r1)
    26d0:	90 c1 00 2c 	stw     r6,44(r1)
    26d4:	90 e1 00 30 	stw     r7,48(r1)
    26d8:	91 01 00 34 	stw     r8,52(r1)
    26dc:	91 21 00 38 	stw     r9,56(r1)
    26e0:	91 41 00 3c 	stw     r10,60(r1)
    26e4:	40 86 00 24 	bne     cr1,2708 <snprintf+0x50>
    26e8:	d8 21 00 40 	stfd    f1,64(r1)
    26ec:	d8 41 00 48 	stfd    f2,72(r1)
    26f0:	d8 61 00 50 	stfd    f3,80(r1)
    26f4:	d8 81 00 58 	stfd    f4,88(r1)
    26f8:	d8 a1 00 60 	stfd    f5,96(r1)
    26fc:	d8 c1 00 68 	stfd    f6,104(r1)
    2700:	d8 e1 00 70 	stfd    f7,112(r1)
    2704:	d9 01 00 78 	stfd    f8,120(r1)
    2708:	39 20 00 03 	li      r9,3
    270c:	99 21 00 0c 	stb     r9,12(r1)
    2710:	39 20 00 00 	li      r9,0
    2714:	99 21 00 0d 	stb     r9,13(r1)
    2718:	39 21 00 88 	addi    r9,r1,136
    271c:	91 21 00 10 	stw     r9,16(r1)
    2720:	39 21 00 20 	addi    r9,r1,32
    2724:	91 21 00 14 	stw     r9,20(r1)
    2728:	39 21 00 0c 	addi    r9,r1,12
    272c:	7d 26 4b 78 	mr      r6,r9
    2730:	80 a1 00 20 	lwz     r5,32(r1)
    2734:	80 81 00 1c 	lwz     r4,28(r1)
    2738:	80 61 00 18 	lwz     r3,24(r1)
    273c:	48 00 03 89 	bl      2ac4 <vsnprintf>
    2740:	7c 69 1b 78 	mr      r9,r3
    2744:	91 21 00 08 	stw     r9,8(r1)
    2748:	81 21 00 08 	lwz     r9,8(r1)
    274c:	7d 23 4b 78 	mr      r3,r9
    2750:	80 01 00 84 	lwz     r0,132(r1)
    2754:	7c 08 03 a6 	mtlr    r0
    2758:	38 21 00 80 	addi    r1,r1,128
    275c:	4e 80 00 20 	blr

00002760 <scnprintf>:
    2760:	94 21 ff 80 	stwu    r1,-128(r1)
    2764:	7c 08 02 a6 	mflr    r0
    2768:	90 01 00 84 	stw     r0,132(r1)
    276c:	90 61 00 18 	stw     r3,24(r1)
    2770:	90 81 00 1c 	stw     r4,28(r1)
    2774:	90 a1 00 20 	stw     r5,32(r1)
    2778:	90 c1 00 2c 	stw     r6,44(r1)
    277c:	90 e1 00 30 	stw     r7,48(r1)
    2780:	91 01 00 34 	stw     r8,52(r1)
    2784:	91 21 00 38 	stw     r9,56(r1)
    2788:	91 41 00 3c 	stw     r10,60(r1)
    278c:	40 86 00 24 	bne     cr1,27b0 <scnprintf+0x50>
    2790:	d8 21 00 40 	stfd    f1,64(r1)
    2794:	d8 41 00 48 	stfd    f2,72(r1)
    2798:	d8 61 00 50 	stfd    f3,80(r1)
    279c:	d8 81 00 58 	stfd    f4,88(r1)
    27a0:	d8 a1 00 60 	stfd    f5,96(r1)
    27a4:	d8 c1 00 68 	stfd    f6,104(r1)
    27a8:	d8 e1 00 70 	stfd    f7,112(r1)
    27ac:	d9 01 00 78 	stfd    f8,120(r1)
    27b0:	39 20 00 03 	li      r9,3
    27b4:	99 21 00 0c 	stb     r9,12(r1)
    27b8:	39 20 00 00 	li      r9,0
    27bc:	99 21 00 0d 	stb     r9,13(r1)
    27c0:	39 21 00 88 	addi    r9,r1,136
    27c4:	91 21 00 10 	stw     r9,16(r1)
    27c8:	39 21 00 20 	addi    r9,r1,32
    27cc:	91 21 00 14 	stw     r9,20(r1)
    27d0:	39 21 00 0c 	addi    r9,r1,12
    27d4:	7d 26 4b 78 	mr      r6,r9
    27d8:	80 a1 00 20 	lwz     r5,32(r1)
    27dc:	80 81 00 1c 	lwz     r4,28(r1)
    27e0:	80 61 00 18 	lwz     r3,24(r1)
    27e4:	48 00 02 e1 	bl      2ac4 <vsnprintf>
    27e8:	7c 69 1b 78 	mr      r9,r3
    27ec:	91 21 00 08 	stw     r9,8(r1)
    27f0:	81 41 00 08 	lwz     r10,8(r1)
    27f4:	81 21 00 1c 	lwz     r9,28(r1)
    27f8:	7c 0a 48 40 	cmplw   r10,r9
    27fc:	41 80 00 10 	blt     280c <scnprintf+0xac>
    2800:	81 21 00 1c 	lwz     r9,28(r1)
    2804:	39 29 ff ff 	addi    r9,r9,-1
    2808:	48 00 00 08 	b       2810 <scnprintf+0xb0>
    280c:	81 21 00 08 	lwz     r9,8(r1)
    2810:	7d 23 4b 78 	mr      r3,r9
    2814:	80 01 00 84 	lwz     r0,132(r1)
    2818:	7c 08 03 a6 	mtlr    r0
    281c:	38 21 00 80 	addi    r1,r1,128
    2820:	4e 80 00 20 	blr

00002824 <vsprintf>:
    2824:	94 21 ff e0 	stwu    r1,-32(r1)
    2828:	7c 08 02 a6 	mflr    r0
    282c:	90 01 00 24 	stw     r0,36(r1)
    2830:	90 61 00 08 	stw     r3,8(r1)
    2834:	90 81 00 0c 	stw     r4,12(r1)
    2838:	90 a1 00 10 	stw     r5,16(r1)
    283c:	80 c1 00 10 	lwz     r6,16(r1)
    2840:	80 a1 00 0c 	lwz     r5,12(r1)
    2844:	3d 20 7f ff 	lis     r9,32767
    2848:	61 24 ff ff 	ori     r4,r9,65535
    284c:	80 61 00 08 	lwz     r3,8(r1)
    2850:	48 00 02 75 	bl      2ac4 <vsnprintf>
    2854:	7c 69 1b 78 	mr      r9,r3
    2858:	7d 23 4b 78 	mr      r3,r9
    285c:	80 01 00 24 	lwz     r0,36(r1)
    2860:	7c 08 03 a6 	mtlr    r0
    2864:	38 21 00 20 	addi    r1,r1,32
    2868:	4e 80 00 20 	blr

0000286c <sprintf>:
    286c:	94 21 ff 80 	stwu    r1,-128(r1)
    2870:	7c 08 02 a6 	mflr    r0
    2874:	90 01 00 84 	stw     r0,132(r1)
    2878:	90 61 00 18 	stw     r3,24(r1)
    287c:	90 81 00 1c 	stw     r4,28(r1)
    2880:	90 a1 00 20 	stw     r5,32(r1)
    2884:	90 c1 00 24 	stw     r6,36(r1)
    2888:	90 e1 00 28 	stw     r7,40(r1)
    288c:	91 01 00 2c 	stw     r8,44(r1)
    2890:	91 21 00 30 	stw     r9,48(r1)
    2894:	91 41 00 34 	stw     r10,52(r1)
    2898:	40 86 00 24 	bne     cr1,28bc <sprintf+0x50>
    289c:	d8 21 00 38 	stfd    f1,56(r1)
    28a0:	d8 41 00 40 	stfd    f2,64(r1)
    28a4:	d8 61 00 48 	stfd    f3,72(r1)
    28a8:	d8 81 00 50 	stfd    f4,80(r1)
    28ac:	d8 a1 00 58 	stfd    f5,88(r1)
    28b0:	d8 c1 00 60 	stfd    f6,96(r1)
    28b4:	d8 e1 00 68 	stfd    f7,104(r1)
    28b8:	d9 01 00 70 	stfd    f8,112(r1)
    28bc:	39 20 00 02 	li      r9,2
    28c0:	99 21 00 0c 	stb     r9,12(r1)
    28c4:	39 20 00 00 	li      r9,0
    28c8:	99 21 00 0d 	stb     r9,13(r1)
    28cc:	39 21 00 88 	addi    r9,r1,136
    28d0:	91 21 00 10 	stw     r9,16(r1)
    28d4:	39 21 00 18 	addi    r9,r1,24
    28d8:	91 21 00 14 	stw     r9,20(r1)
    28dc:	39 21 00 0c 	addi    r9,r1,12
    28e0:	7d 26 4b 78 	mr      r6,r9
    28e4:	80 a1 00 1c 	lwz     r5,28(r1)
    28e8:	3d 20 7f ff 	lis     r9,32767
    28ec:	61 24 ff ff 	ori     r4,r9,65535
    28f0:	80 61 00 18 	lwz     r3,24(r1)
    28f4:	48 00 01 d1 	bl      2ac4 <vsnprintf>
    28f8:	7c 69 1b 78 	mr      r9,r3
    28fc:	91 21 00 08 	stw     r9,8(r1)
    2900:	81 21 00 08 	lwz     r9,8(r1)
    2904:	7d 23 4b 78 	mr      r3,r9
    2908:	80 01 00 84 	lwz     r0,132(r1)
    290c:	7c 08 03 a6 	mtlr    r0
    2910:	38 21 00 80 	addi    r1,r1,128
    2914:	4e 80 00 20 	blr

00002918 <rand>:
    2918:	3d 20 00 02 	lis     r9,2
    291c:	81 29 e0 14 	lwz     r9,-8172(r9)
    2920:	1d 29 00 81 	mulli   r9,r9,129
    2924:	3d 29 36 19 	addis   r9,r9,13849
    2928:	39 49 62 e9 	addi    r10,r9,25321
    292c:	3d 20 00 02 	lis     r9,2
    2930:	91 49 e0 14 	stw     r10,-8172(r9)
    2934:	3d 20 00 02 	lis     r9,2
    2938:	81 29 e0 14 	lwz     r9,-8172(r9)
    293c:	7d 23 4b 78 	mr      r3,r9
    2940:	4e 80 00 20 	blr

00002944 <srand>:
    2944:	94 21 ff f0 	stwu    r1,-16(r1)
    2948:	90 61 00 08 	stw     r3,8(r1)
    294c:	3d 20 00 02 	lis     r9,2
    2950:	81 41 00 08 	lwz     r10,8(r1)
    2954:	91 49 e0 14 	stw     r10,-8172(r9)
    2958:	60 00 00 00 	nop
    295c:	38 21 00 10 	addi    r1,r1,16
    2960:	4e 80 00 20 	blr

00002964 <abort>:
    2964:	94 21 ff f0 	stwu    r1,-16(r1)
    2968:	7c 08 02 a6 	mflr    r0
    296c:	90 01 00 14 	stw     r0,20(r1)
    2970:	3d 20 00 00 	lis     r9,0
    2974:	38 69 0a 04 	addi    r3,r9,2564
    2978:	4c c6 31 82 	crclr   4*cr1+eq
    297c:	48 00 11 1d 	bl      3a98 <printf>
    2980:	48 00 00 00 	b       2980 <abort+0x1c>

00002984 <htonl>:
    2984:	94 21 ff e0 	stwu    r1,-32(r1)
    2988:	7c 08 02 a6 	mflr    r0
    298c:	90 01 00 24 	stw     r0,36(r1)
    2990:	90 61 00 18 	stw     r3,24(r1)
    2994:	39 20 00 01 	li      r9,1
    2998:	91 21 00 08 	stw     r9,8(r1)
    299c:	89 21 00 08 	lbz     r9,8(r1)
    29a0:	2c 09 00 00 	cmpwi   r9,0
    29a4:	41 82 00 14 	beq     29b8 <htonl+0x34>
    29a8:	80 61 00 18 	lwz     r3,24(r1)
    29ac:	4b ff eb 75 	bl      1520 <__bswap_32>
    29b0:	7c 69 1b 78 	mr      r9,r3
    29b4:	48 00 00 08 	b       29bc <htonl+0x38>
    29b8:	81 21 00 18 	lwz     r9,24(r1)
    29bc:	7d 23 4b 78 	mr      r3,r9
    29c0:	80 01 00 24 	lwz     r0,36(r1)
    29c4:	7c 08 03 a6 	mtlr    r0
    29c8:	38 21 00 20 	addi    r1,r1,32
    29cc:	4e 80 00 20 	blr

000029d0 <htons>:
    29d0:	94 21 ff e0 	stwu    r1,-32(r1)
    29d4:	7c 08 02 a6 	mflr    r0
    29d8:	90 01 00 24 	stw     r0,36(r1)
    29dc:	7c 69 1b 78 	mr      r9,r3
    29e0:	b1 21 00 18 	sth     r9,24(r1)
    29e4:	39 20 00 01 	li      r9,1
    29e8:	91 21 00 08 	stw     r9,8(r1)
    29ec:	89 21 00 08 	lbz     r9,8(r1)
    29f0:	2c 09 00 00 	cmpwi   r9,0
    29f4:	41 82 00 18 	beq     2a0c <htons+0x3c>
    29f8:	a1 21 00 18 	lhz     r9,24(r1)
    29fc:	7d 23 4b 78 	mr      r3,r9
    2a00:	4b ff ea e1 	bl      14e0 <__bswap_16>
    2a04:	7c 69 1b 78 	mr      r9,r3
    2a08:	48 00 00 08 	b       2a10 <htons+0x40>
    2a0c:	a1 21 00 18 	lhz     r9,24(r1)
    2a10:	7d 23 4b 78 	mr      r3,r9
    2a14:	80 01 00 24 	lwz     r0,36(r1)
    2a18:	7c 08 03 a6 	mtlr    r0
    2a1c:	38 21 00 20 	addi    r1,r1,32
    2a20:	4e 80 00 20 	blr

00002a24 <ntohl>:
    2a24:	94 21 ff e0 	stwu    r1,-32(r1)
    2a28:	7c 08 02 a6 	mflr    r0
    2a2c:	90 01 00 24 	stw     r0,36(r1)
    2a30:	90 61 00 18 	stw     r3,24(r1)
    2a34:	39 20 00 01 	li      r9,1
    2a38:	91 21 00 08 	stw     r9,8(r1)
    2a3c:	89 21 00 08 	lbz     r9,8(r1)
    2a40:	2c 09 00 00 	cmpwi   r9,0
    2a44:	41 82 00 14 	beq     2a58 <ntohl+0x34>
    2a48:	80 61 00 18 	lwz     r3,24(r1)
    2a4c:	4b ff ea d5 	bl      1520 <__bswap_32>
    2a50:	7c 69 1b 78 	mr      r9,r3
    2a54:	48 00 00 08 	b       2a5c <ntohl+0x38>
    2a58:	81 21 00 18 	lwz     r9,24(r1)
    2a5c:	7d 23 4b 78 	mr      r3,r9
    2a60:	80 01 00 24 	lwz     r0,36(r1)
    2a64:	7c 08 03 a6 	mtlr    r0
    2a68:	38 21 00 20 	addi    r1,r1,32
    2a6c:	4e 80 00 20 	blr

00002a70 <ntohs>:
    2a70:	94 21 ff e0 	stwu    r1,-32(r1)
    2a74:	7c 08 02 a6 	mflr    r0
    2a78:	90 01 00 24 	stw     r0,36(r1)
    2a7c:	7c 69 1b 78 	mr      r9,r3
    2a80:	b1 21 00 18 	sth     r9,24(r1)
    2a84:	39 20 00 01 	li      r9,1
    2a88:	91 21 00 08 	stw     r9,8(r1)
    2a8c:	89 21 00 08 	lbz     r9,8(r1)
    2a90:	2c 09 00 00 	cmpwi   r9,0
    2a94:	41 82 00 18 	beq     2aac <ntohs+0x3c>
    2a98:	a1 21 00 18 	lhz     r9,24(r1)
    2a9c:	7d 23 4b 78 	mr      r3,r9
    2aa0:	4b ff ea 41 	bl      14e0 <__bswap_16>
    2aa4:	7c 69 1b 78 	mr      r9,r3
    2aa8:	48 00 00 08 	b       2ab0 <ntohs+0x40>
    2aac:	a1 21 00 18 	lhz     r9,24(r1)
    2ab0:	7d 23 4b 78 	mr      r3,r9
    2ab4:	80 01 00 24 	lwz     r0,36(r1)
    2ab8:	7c 08 03 a6 	mtlr    r0
    2abc:	38 21 00 20 	addi    r1,r1,32
    2ac0:	4e 80 00 20 	blr

00002ac4 <vsnprintf>:
    2ac4:	94 21 ff a0 	stwu    r1,-96(r1)
    2ac8:	7c 08 02 a6 	mflr    r0
    2acc:	90 01 00 64 	stw     r0,100(r1)
    2ad0:	90 61 00 48 	stw     r3,72(r1)
    2ad4:	90 81 00 4c 	stw     r4,76(r1)
    2ad8:	90 a1 00 50 	stw     r5,80(r1)
    2adc:	90 c1 00 54 	stw     r6,84(r1)
    2ae0:	81 21 00 4c 	lwz     r9,76(r1)
    2ae4:	2c 09 00 00 	cmpwi   r9,0
    2ae8:	40 80 00 0c 	bge     2af4 <vsnprintf+0x30>
    2aec:	39 20 00 00 	li      r9,0
    2af0:	48 00 0d 3c 	b       382c <vsnprintf+0xd68>
    2af4:	81 21 00 48 	lwz     r9,72(r1)
    2af8:	91 21 00 18 	stw     r9,24(r1)
    2afc:	81 41 00 48 	lwz     r10,72(r1)
    2b00:	81 21 00 4c 	lwz     r9,76(r1)
    2b04:	7d 2a 4a 14 	add     r9,r10,r9
    2b08:	91 21 00 1c 	stw     r9,28(r1)
    2b0c:	81 41 00 1c 	lwz     r10,28(r1)
    2b10:	81 21 00 48 	lwz     r9,72(r1)
    2b14:	7c 0a 48 40 	cmplw   r10,r9
    2b18:	40 80 0c bc 	bge     37d4 <vsnprintf+0xd10>
    2b1c:	39 20 ff ff 	li      r9,-1
    2b20:	91 21 00 1c 	stw     r9,28(r1)
    2b24:	81 41 00 1c 	lwz     r10,28(r1)
    2b28:	81 21 00 48 	lwz     r9,72(r1)
    2b2c:	7d 29 50 50 	subf    r9,r9,r10
    2b30:	91 21 00 4c 	stw     r9,76(r1)
    2b34:	48 00 0c a0 	b       37d4 <vsnprintf+0xd10>
    2b38:	81 21 00 50 	lwz     r9,80(r1)
    2b3c:	89 29 00 00 	lbz     r9,0(r9)
    2b40:	28 09 00 25 	cmplwi  r9,37
    2b44:	41 82 00 34 	beq     2b78 <vsnprintf+0xb4>
    2b48:	81 41 00 18 	lwz     r10,24(r1)
    2b4c:	81 21 00 1c 	lwz     r9,28(r1)
    2b50:	7c 0a 48 40 	cmplw   r10,r9
    2b54:	40 80 00 14 	bge     2b68 <vsnprintf+0xa4>
    2b58:	81 21 00 50 	lwz     r9,80(r1)
    2b5c:	89 49 00 00 	lbz     r10,0(r9)
    2b60:	81 21 00 18 	lwz     r9,24(r1)
    2b64:	99 49 00 00 	stb     r10,0(r9)
    2b68:	81 21 00 18 	lwz     r9,24(r1)
    2b6c:	39 29 00 01 	addi    r9,r9,1
    2b70:	91 21 00 18 	stw     r9,24(r1)
    2b74:	48 00 0c 54 	b       37c8 <vsnprintf+0xd04>
    2b78:	39 20 00 00 	li      r9,0
    2b7c:	91 21 00 24 	stw     r9,36(r1)
    2b80:	81 21 00 50 	lwz     r9,80(r1)
    2b84:	39 29 00 01 	addi    r9,r9,1
    2b88:	91 21 00 50 	stw     r9,80(r1)
    2b8c:	81 21 00 50 	lwz     r9,80(r1)
    2b90:	89 29 00 00 	lbz     r9,0(r9)
    2b94:	39 29 ff e0 	addi    r9,r9,-32
    2b98:	28 09 00 10 	cmplwi  r9,16
    2b9c:	41 81 00 7c 	bgt     2c18 <vsnprintf+0x154>
    2ba0:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
    2ba4:	3d 20 00 00 	lis     r9,0
    2ba8:	39 29 0a 68 	addi    r9,r9,2664
    2bac:	7d 2a 4a 14 	add     r9,r10,r9
    2bb0:	81 49 00 00 	lwz     r10,0(r9)
    2bb4:	3d 20 00 00 	lis     r9,0
    2bb8:	39 29 0a 68 	addi    r9,r9,2664
    2bbc:	7d 2a 4a 14 	add     r9,r10,r9
    2bc0:	7d 29 03 a6 	mtctr   r9
    2bc4:	4e 80 04 20 	bctr
    2bc8:	81 21 00 24 	lwz     r9,36(r1)
    2bcc:	61 29 00 10 	ori     r9,r9,16
    2bd0:	91 21 00 24 	stw     r9,36(r1)
    2bd4:	4b ff ff ac 	b       2b80 <vsnprintf+0xbc>
    2bd8:	81 21 00 24 	lwz     r9,36(r1)
    2bdc:	61 29 00 04 	ori     r9,r9,4
    2be0:	91 21 00 24 	stw     r9,36(r1)
    2be4:	4b ff ff 9c 	b       2b80 <vsnprintf+0xbc>
    2be8:	81 21 00 24 	lwz     r9,36(r1)
    2bec:	61 29 00 08 	ori     r9,r9,8
    2bf0:	91 21 00 24 	stw     r9,36(r1)
    2bf4:	4b ff ff 8c 	b       2b80 <vsnprintf+0xbc>
    2bf8:	81 21 00 24 	lwz     r9,36(r1)
    2bfc:	61 29 00 20 	ori     r9,r9,32
    2c00:	91 21 00 24 	stw     r9,36(r1)
    2c04:	4b ff ff 7c 	b       2b80 <vsnprintf+0xbc>
    2c08:	81 21 00 24 	lwz     r9,36(r1)
    2c0c:	61 29 00 01 	ori     r9,r9,1
    2c10:	91 21 00 24 	stw     r9,36(r1)
    2c14:	4b ff ff 6c 	b       2b80 <vsnprintf+0xbc>
    2c18:	39 20 ff ff 	li      r9,-1
    2c1c:	91 21 00 28 	stw     r9,40(r1)
    2c20:	81 21 00 50 	lwz     r9,80(r1)
    2c24:	89 29 00 00 	lbz     r9,0(r9)
    2c28:	7d 2a 4b 78 	mr      r10,r9
    2c2c:	3d 20 00 00 	lis     r9,0
    2c30:	39 29 09 04 	addi    r9,r9,2308
    2c34:	7d 29 50 ae 	lbzx    r9,r9,r10
    2c38:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    2c3c:	2c 09 00 00 	cmpwi   r9,0
    2c40:	41 82 00 1c 	beq     2c5c <vsnprintf+0x198>
    2c44:	39 21 00 50 	addi    r9,r1,80
    2c48:	7d 23 4b 78 	mr      r3,r9
    2c4c:	4b ff f5 01 	bl      214c <skip_atoi>
    2c50:	7c 69 1b 78 	mr      r9,r3
    2c54:	91 21 00 28 	stw     r9,40(r1)
    2c58:	48 00 00 9c 	b       2cf4 <vsnprintf+0x230>
    2c5c:	81 21 00 50 	lwz     r9,80(r1)
    2c60:	89 29 00 00 	lbz     r9,0(r9)
    2c64:	28 09 00 2a 	cmplwi  r9,42
    2c68:	40 82 00 8c 	bne     2cf4 <vsnprintf+0x230>
    2c6c:	81 21 00 50 	lwz     r9,80(r1)
    2c70:	39 29 00 01 	addi    r9,r9,1
    2c74:	91 21 00 50 	stw     r9,80(r1)
    2c78:	81 21 00 54 	lwz     r9,84(r1)
    2c7c:	89 29 00 00 	lbz     r9,0(r9)
    2c80:	28 09 00 07 	cmplwi  r9,7
    2c84:	41 81 00 30 	bgt     2cb4 <vsnprintf+0x1f0>
    2c88:	81 21 00 54 	lwz     r9,84(r1)
    2c8c:	81 49 00 08 	lwz     r10,8(r9)
    2c90:	81 21 00 54 	lwz     r9,84(r1)
    2c94:	89 29 00 00 	lbz     r9,0(r9)
    2c98:	39 09 00 01 	addi    r8,r9,1
    2c9c:	55 07 06 3e 	clrlwi  r7,r8,24
    2ca0:	81 01 00 54 	lwz     r8,84(r1)
    2ca4:	98 e8 00 00 	stb     r7,0(r8)
    2ca8:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    2cac:	7d 2a 4a 14 	add     r9,r10,r9
    2cb0:	48 00 00 18 	b       2cc8 <vsnprintf+0x204>
    2cb4:	81 21 00 54 	lwz     r9,84(r1)
    2cb8:	81 29 00 04 	lwz     r9,4(r9)
    2cbc:	39 09 00 04 	addi    r8,r9,4
    2cc0:	81 41 00 54 	lwz     r10,84(r1)
    2cc4:	91 0a 00 04 	stw     r8,4(r10)
    2cc8:	81 29 00 00 	lwz     r9,0(r9)
    2ccc:	91 21 00 28 	stw     r9,40(r1)
    2cd0:	81 21 00 28 	lwz     r9,40(r1)
    2cd4:	2c 09 00 00 	cmpwi   r9,0
    2cd8:	40 80 00 1c 	bge     2cf4 <vsnprintf+0x230>
    2cdc:	81 21 00 28 	lwz     r9,40(r1)
    2ce0:	7d 29 00 d0 	neg     r9,r9
    2ce4:	91 21 00 28 	stw     r9,40(r1)
    2ce8:	81 21 00 24 	lwz     r9,36(r1)
    2cec:	61 29 00 10 	ori     r9,r9,16
    2cf0:	91 21 00 24 	stw     r9,36(r1)
    2cf4:	39 20 ff ff 	li      r9,-1
    2cf8:	91 21 00 2c 	stw     r9,44(r1)
    2cfc:	81 21 00 50 	lwz     r9,80(r1)
    2d00:	89 29 00 00 	lbz     r9,0(r9)
    2d04:	28 09 00 2e 	cmplwi  r9,46
    2d08:	40 82 00 d4 	bne     2ddc <vsnprintf+0x318>
    2d0c:	81 21 00 50 	lwz     r9,80(r1)
    2d10:	39 29 00 01 	addi    r9,r9,1
    2d14:	91 21 00 50 	stw     r9,80(r1)
    2d18:	81 21 00 50 	lwz     r9,80(r1)
    2d1c:	89 29 00 00 	lbz     r9,0(r9)
    2d20:	7d 2a 4b 78 	mr      r10,r9
    2d24:	3d 20 00 00 	lis     r9,0
    2d28:	39 29 09 04 	addi    r9,r9,2308
    2d2c:	7d 29 50 ae 	lbzx    r9,r9,r10
    2d30:	55 29 07 7a 	rlwinm  r9,r9,0,29,29
    2d34:	2c 09 00 00 	cmpwi   r9,0
    2d38:	41 82 00 1c 	beq     2d54 <vsnprintf+0x290>
    2d3c:	39 21 00 50 	addi    r9,r1,80
    2d40:	7d 23 4b 78 	mr      r3,r9
    2d44:	4b ff f4 09 	bl      214c <skip_atoi>
    2d48:	7c 69 1b 78 	mr      r9,r3
    2d4c:	91 21 00 2c 	stw     r9,44(r1)
    2d50:	48 00 00 78 	b       2dc8 <vsnprintf+0x304>
    2d54:	81 21 00 50 	lwz     r9,80(r1)
    2d58:	89 29 00 00 	lbz     r9,0(r9)
    2d5c:	28 09 00 2a 	cmplwi  r9,42
    2d60:	40 82 00 68 	bne     2dc8 <vsnprintf+0x304>
    2d64:	81 21 00 50 	lwz     r9,80(r1)
    2d68:	39 29 00 01 	addi    r9,r9,1
    2d6c:	91 21 00 50 	stw     r9,80(r1)
    2d70:	81 21 00 54 	lwz     r9,84(r1)
    2d74:	89 29 00 00 	lbz     r9,0(r9)
    2d78:	28 09 00 07 	cmplwi  r9,7
    2d7c:	41 81 00 30 	bgt     2dac <vsnprintf+0x2e8>
    2d80:	81 21 00 54 	lwz     r9,84(r1)
    2d84:	81 49 00 08 	lwz     r10,8(r9)
    2d88:	81 21 00 54 	lwz     r9,84(r1)
    2d8c:	89 29 00 00 	lbz     r9,0(r9)
    2d90:	39 09 00 01 	addi    r8,r9,1
    2d94:	55 07 06 3e 	clrlwi  r7,r8,24
    2d98:	81 01 00 54 	lwz     r8,84(r1)
    2d9c:	98 e8 00 00 	stb     r7,0(r8)
    2da0:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    2da4:	7d 2a 4a 14 	add     r9,r10,r9
    2da8:	48 00 00 18 	b       2dc0 <vsnprintf+0x2fc>
    2dac:	81 21 00 54 	lwz     r9,84(r1)
    2db0:	81 29 00 04 	lwz     r9,4(r9)
    2db4:	39 09 00 04 	addi    r8,r9,4
    2db8:	81 41 00 54 	lwz     r10,84(r1)
    2dbc:	91 0a 00 04 	stw     r8,4(r10)
    2dc0:	81 29 00 00 	lwz     r9,0(r9)
    2dc4:	91 21 00 2c 	stw     r9,44(r1)
    2dc8:	81 21 00 2c 	lwz     r9,44(r1)
    2dcc:	2c 09 00 00 	cmpwi   r9,0
    2dd0:	40 80 00 0c 	bge     2ddc <vsnprintf+0x318>
    2dd4:	39 20 00 00 	li      r9,0
    2dd8:	91 21 00 2c 	stw     r9,44(r1)
    2ddc:	39 20 ff ff 	li      r9,-1
    2de0:	91 21 00 30 	stw     r9,48(r1)
    2de4:	81 21 00 50 	lwz     r9,80(r1)
    2de8:	89 29 00 00 	lbz     r9,0(r9)
    2dec:	28 09 00 68 	cmplwi  r9,104
    2df0:	41 82 00 54 	beq     2e44 <vsnprintf+0x380>
    2df4:	81 21 00 50 	lwz     r9,80(r1)
    2df8:	89 29 00 00 	lbz     r9,0(r9)
    2dfc:	28 09 00 6c 	cmplwi  r9,108
    2e00:	41 82 00 44 	beq     2e44 <vsnprintf+0x380>
    2e04:	81 21 00 50 	lwz     r9,80(r1)
    2e08:	89 29 00 00 	lbz     r9,0(r9)
    2e0c:	28 09 00 4c 	cmplwi  r9,76
    2e10:	41 82 00 34 	beq     2e44 <vsnprintf+0x380>
    2e14:	81 21 00 50 	lwz     r9,80(r1)
    2e18:	89 29 00 00 	lbz     r9,0(r9)
    2e1c:	28 09 00 5a 	cmplwi  r9,90
    2e20:	41 82 00 24 	beq     2e44 <vsnprintf+0x380>
    2e24:	81 21 00 50 	lwz     r9,80(r1)
    2e28:	89 29 00 00 	lbz     r9,0(r9)
    2e2c:	28 09 00 7a 	cmplwi  r9,122
    2e30:	41 82 00 14 	beq     2e44 <vsnprintf+0x380>
    2e34:	81 21 00 50 	lwz     r9,80(r1)
    2e38:	89 29 00 00 	lbz     r9,0(r9)
    2e3c:	28 09 00 74 	cmplwi  r9,116
    2e40:	40 82 00 4c 	bne     2e8c <vsnprintf+0x3c8>
    2e44:	81 21 00 50 	lwz     r9,80(r1)
    2e48:	89 29 00 00 	lbz     r9,0(r9)
    2e4c:	91 21 00 30 	stw     r9,48(r1)
    2e50:	81 21 00 50 	lwz     r9,80(r1)
    2e54:	39 29 00 01 	addi    r9,r9,1
    2e58:	91 21 00 50 	stw     r9,80(r1)
    2e5c:	81 21 00 30 	lwz     r9,48(r1)
    2e60:	2c 09 00 6c 	cmpwi   r9,108
    2e64:	40 82 00 28 	bne     2e8c <vsnprintf+0x3c8>
    2e68:	81 21 00 50 	lwz     r9,80(r1)
    2e6c:	89 29 00 00 	lbz     r9,0(r9)
    2e70:	28 09 00 6c 	cmplwi  r9,108
    2e74:	40 82 00 18 	bne     2e8c <vsnprintf+0x3c8>
    2e78:	39 20 00 4c 	li      r9,76
    2e7c:	91 21 00 30 	stw     r9,48(r1)
    2e80:	81 21 00 50 	lwz     r9,80(r1)
    2e84:	39 29 00 01 	addi    r9,r9,1
    2e88:	91 21 00 50 	stw     r9,80(r1)
    2e8c:	39 20 00 0a 	li      r9,10
    2e90:	91 21 00 14 	stw     r9,20(r1)
    2e94:	81 21 00 50 	lwz     r9,80(r1)
    2e98:	89 29 00 00 	lbz     r9,0(r9)
    2e9c:	39 29 ff db 	addi    r9,r9,-37
    2ea0:	28 09 00 53 	cmplwi  r9,83
    2ea4:	41 81 05 50 	bgt     33f4 <vsnprintf+0x930>
    2ea8:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
    2eac:	3d 20 00 00 	lis     r9,0
    2eb0:	39 29 0a ac 	addi    r9,r9,2732
    2eb4:	7d 2a 4a 14 	add     r9,r10,r9
    2eb8:	81 49 00 00 	lwz     r10,0(r9)
    2ebc:	3d 20 00 00 	lis     r9,0
    2ec0:	39 29 0a ac 	addi    r9,r9,2732
    2ec4:	7d 2a 4a 14 	add     r9,r10,r9
    2ec8:	7d 29 03 a6 	mtctr   r9
    2ecc:	4e 80 04 20 	bctr
    2ed0:	81 21 00 24 	lwz     r9,36(r1)
    2ed4:	55 29 06 f6 	rlwinm  r9,r9,0,27,27
    2ed8:	2c 09 00 00 	cmpwi   r9,0
    2edc:	40 82 00 48 	bne     2f24 <vsnprintf+0x460>
    2ee0:	48 00 00 2c 	b       2f0c <vsnprintf+0x448>
    2ee4:	81 41 00 18 	lwz     r10,24(r1)
    2ee8:	81 21 00 1c 	lwz     r9,28(r1)
    2eec:	7c 0a 48 40 	cmplw   r10,r9
    2ef0:	40 80 00 10 	bge     2f00 <vsnprintf+0x43c>
    2ef4:	81 21 00 18 	lwz     r9,24(r1)
    2ef8:	39 40 00 20 	li      r10,32
    2efc:	99 49 00 00 	stb     r10,0(r9)
    2f00:	81 21 00 18 	lwz     r9,24(r1)
    2f04:	39 29 00 01 	addi    r9,r9,1
    2f08:	91 21 00 18 	stw     r9,24(r1)
    2f0c:	81 21 00 28 	lwz     r9,40(r1)
    2f10:	39 29 ff ff 	addi    r9,r9,-1
    2f14:	91 21 00 28 	stw     r9,40(r1)
    2f18:	81 21 00 28 	lwz     r9,40(r1)
    2f1c:	2c 09 00 00 	cmpwi   r9,0
    2f20:	41 81 ff c4 	bgt     2ee4 <vsnprintf+0x420>
    2f24:	81 21 00 54 	lwz     r9,84(r1)
    2f28:	89 29 00 00 	lbz     r9,0(r9)
    2f2c:	28 09 00 07 	cmplwi  r9,7
    2f30:	41 81 00 30 	bgt     2f60 <vsnprintf+0x49c>
    2f34:	81 21 00 54 	lwz     r9,84(r1)
    2f38:	81 49 00 08 	lwz     r10,8(r9)
    2f3c:	81 21 00 54 	lwz     r9,84(r1)
    2f40:	89 29 00 00 	lbz     r9,0(r9)
    2f44:	39 09 00 01 	addi    r8,r9,1
    2f48:	55 07 06 3e 	clrlwi  r7,r8,24
    2f4c:	81 01 00 54 	lwz     r8,84(r1)
    2f50:	98 e8 00 00 	stb     r7,0(r8)
    2f54:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    2f58:	7d 2a 4a 14 	add     r9,r10,r9
    2f5c:	48 00 00 18 	b       2f74 <vsnprintf+0x4b0>
    2f60:	81 21 00 54 	lwz     r9,84(r1)
    2f64:	81 29 00 04 	lwz     r9,4(r9)
    2f68:	39 09 00 04 	addi    r8,r9,4
    2f6c:	81 41 00 54 	lwz     r10,84(r1)
    2f70:	91 0a 00 04 	stw     r8,4(r10)
    2f74:	81 29 00 00 	lwz     r9,0(r9)
    2f78:	99 21 00 44 	stb     r9,68(r1)
    2f7c:	81 41 00 18 	lwz     r10,24(r1)
    2f80:	81 21 00 1c 	lwz     r9,28(r1)
    2f84:	7c 0a 48 40 	cmplw   r10,r9
    2f88:	40 80 00 10 	bge     2f98 <vsnprintf+0x4d4>
    2f8c:	81 21 00 18 	lwz     r9,24(r1)
    2f90:	89 41 00 44 	lbz     r10,68(r1)
    2f94:	99 49 00 00 	stb     r10,0(r9)
    2f98:	81 21 00 18 	lwz     r9,24(r1)
    2f9c:	39 29 00 01 	addi    r9,r9,1
    2fa0:	91 21 00 18 	stw     r9,24(r1)
    2fa4:	48 00 00 2c 	b       2fd0 <vsnprintf+0x50c>
    2fa8:	81 41 00 18 	lwz     r10,24(r1)
    2fac:	81 21 00 1c 	lwz     r9,28(r1)
    2fb0:	7c 0a 48 40 	cmplw   r10,r9
    2fb4:	40 80 00 10 	bge     2fc4 <vsnprintf+0x500>
    2fb8:	81 21 00 18 	lwz     r9,24(r1)
    2fbc:	39 40 00 20 	li      r10,32
    2fc0:	99 49 00 00 	stb     r10,0(r9)
    2fc4:	81 21 00 18 	lwz     r9,24(r1)
    2fc8:	39 29 00 01 	addi    r9,r9,1
    2fcc:	91 21 00 18 	stw     r9,24(r1)
    2fd0:	81 21 00 28 	lwz     r9,40(r1)
    2fd4:	39 29 ff ff 	addi    r9,r9,-1
    2fd8:	91 21 00 28 	stw     r9,40(r1)
    2fdc:	81 21 00 28 	lwz     r9,40(r1)
    2fe0:	2c 09 00 00 	cmpwi   r9,0
    2fe4:	41 81 ff c4 	bgt     2fa8 <vsnprintf+0x4e4>
    2fe8:	48 00 07 e0 	b       37c8 <vsnprintf+0xd04>
    2fec:	81 21 00 54 	lwz     r9,84(r1)
    2ff0:	89 29 00 00 	lbz     r9,0(r9)
    2ff4:	28 09 00 07 	cmplwi  r9,7
    2ff8:	41 81 00 30 	bgt     3028 <vsnprintf+0x564>
    2ffc:	81 21 00 54 	lwz     r9,84(r1)
    3000:	81 49 00 08 	lwz     r10,8(r9)
    3004:	81 21 00 54 	lwz     r9,84(r1)
    3008:	89 29 00 00 	lbz     r9,0(r9)
    300c:	39 09 00 01 	addi    r8,r9,1
    3010:	55 07 06 3e 	clrlwi  r7,r8,24
    3014:	81 01 00 54 	lwz     r8,84(r1)
    3018:	98 e8 00 00 	stb     r7,0(r8)
    301c:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3020:	7d 2a 4a 14 	add     r9,r10,r9
    3024:	48 00 00 18 	b       303c <vsnprintf+0x578>
    3028:	81 21 00 54 	lwz     r9,84(r1)
    302c:	81 29 00 04 	lwz     r9,4(r9)
    3030:	39 09 00 04 	addi    r8,r9,4
    3034:	81 41 00 54 	lwz     r10,84(r1)
    3038:	91 0a 00 04 	stw     r8,4(r10)
    303c:	81 29 00 00 	lwz     r9,0(r9)
    3040:	91 21 00 20 	stw     r9,32(r1)
    3044:	81 21 00 20 	lwz     r9,32(r1)
    3048:	2c 09 00 00 	cmpwi   r9,0
    304c:	40 82 00 10 	bne     305c <vsnprintf+0x598>
    3050:	3d 20 00 00 	lis     r9,0
    3054:	39 29 0a 60 	addi    r9,r9,2656
    3058:	91 21 00 20 	stw     r9,32(r1)
    305c:	81 21 00 2c 	lwz     r9,44(r1)
    3060:	7d 24 4b 78 	mr      r4,r9
    3064:	80 61 00 20 	lwz     r3,32(r1)
    3068:	4b ff ea 25 	bl      1a8c <strnlen>
    306c:	7c 69 1b 78 	mr      r9,r3
    3070:	91 21 00 34 	stw     r9,52(r1)
    3074:	81 21 00 24 	lwz     r9,36(r1)
    3078:	55 29 06 f6 	rlwinm  r9,r9,0,27,27
    307c:	2c 09 00 00 	cmpwi   r9,0
    3080:	40 82 00 48 	bne     30c8 <vsnprintf+0x604>
    3084:	48 00 00 2c 	b       30b0 <vsnprintf+0x5ec>
    3088:	81 41 00 18 	lwz     r10,24(r1)
    308c:	81 21 00 1c 	lwz     r9,28(r1)
    3090:	7c 0a 48 40 	cmplw   r10,r9
    3094:	40 80 00 10 	bge     30a4 <vsnprintf+0x5e0>
    3098:	81 21 00 18 	lwz     r9,24(r1)
    309c:	39 40 00 20 	li      r10,32
    30a0:	99 49 00 00 	stb     r10,0(r9)
    30a4:	81 21 00 18 	lwz     r9,24(r1)
    30a8:	39 29 00 01 	addi    r9,r9,1
    30ac:	91 21 00 18 	stw     r9,24(r1)
    30b0:	81 21 00 28 	lwz     r9,40(r1)
    30b4:	39 49 ff ff 	addi    r10,r9,-1
    30b8:	91 41 00 28 	stw     r10,40(r1)
    30bc:	81 41 00 34 	lwz     r10,52(r1)
    30c0:	7c 0a 48 00 	cmpw    r10,r9
    30c4:	41 80 ff c4 	blt     3088 <vsnprintf+0x5c4>
    30c8:	39 20 00 00 	li      r9,0
    30cc:	91 21 00 10 	stw     r9,16(r1)
    30d0:	48 00 00 48 	b       3118 <vsnprintf+0x654>
    30d4:	81 41 00 18 	lwz     r10,24(r1)
    30d8:	81 21 00 1c 	lwz     r9,28(r1)
    30dc:	7c 0a 48 40 	cmplw   r10,r9
    30e0:	40 80 00 14 	bge     30f4 <vsnprintf+0x630>
    30e4:	81 21 00 20 	lwz     r9,32(r1)
    30e8:	89 49 00 00 	lbz     r10,0(r9)
    30ec:	81 21 00 18 	lwz     r9,24(r1)
    30f0:	99 49 00 00 	stb     r10,0(r9)
    30f4:	81 21 00 18 	lwz     r9,24(r1)
    30f8:	39 29 00 01 	addi    r9,r9,1
    30fc:	91 21 00 18 	stw     r9,24(r1)
    3100:	81 21 00 20 	lwz     r9,32(r1)
    3104:	39 29 00 01 	addi    r9,r9,1
    3108:	91 21 00 20 	stw     r9,32(r1)
    310c:	81 21 00 10 	lwz     r9,16(r1)
    3110:	39 29 00 01 	addi    r9,r9,1
    3114:	91 21 00 10 	stw     r9,16(r1)
    3118:	81 41 00 10 	lwz     r10,16(r1)
    311c:	81 21 00 34 	lwz     r9,52(r1)
    3120:	7c 0a 48 00 	cmpw    r10,r9
    3124:	41 80 ff b0 	blt     30d4 <vsnprintf+0x610>
    3128:	48 00 00 2c 	b       3154 <vsnprintf+0x690>
    312c:	81 41 00 18 	lwz     r10,24(r1)
    3130:	81 21 00 1c 	lwz     r9,28(r1)
    3134:	7c 0a 48 40 	cmplw   r10,r9
    3138:	40 80 00 10 	bge     3148 <vsnprintf+0x684>
    313c:	81 21 00 18 	lwz     r9,24(r1)
    3140:	39 40 00 20 	li      r10,32
    3144:	99 49 00 00 	stb     r10,0(r9)
    3148:	81 21 00 18 	lwz     r9,24(r1)
    314c:	39 29 00 01 	addi    r9,r9,1
    3150:	91 21 00 18 	stw     r9,24(r1)
    3154:	81 21 00 28 	lwz     r9,40(r1)
    3158:	39 49 ff ff 	addi    r10,r9,-1
    315c:	91 41 00 28 	stw     r10,40(r1)
    3160:	81 41 00 34 	lwz     r10,52(r1)
    3164:	7c 0a 48 00 	cmpw    r10,r9
    3168:	41 80 ff c4 	blt     312c <vsnprintf+0x668>
    316c:	48 00 06 5c 	b       37c8 <vsnprintf+0xd04>
    3170:	81 41 00 28 	lwz     r10,40(r1)
    3174:	39 20 ff ff 	li      r9,-1
    3178:	7c 0a 48 00 	cmpw    r10,r9
    317c:	40 82 00 18 	bne     3194 <vsnprintf+0x6d0>
    3180:	39 20 00 08 	li      r9,8
    3184:	91 21 00 28 	stw     r9,40(r1)
    3188:	81 21 00 24 	lwz     r9,36(r1)
    318c:	61 29 00 21 	ori     r9,r9,33
    3190:	91 21 00 24 	stw     r9,36(r1)
    3194:	81 21 00 54 	lwz     r9,84(r1)
    3198:	89 29 00 00 	lbz     r9,0(r9)
    319c:	28 09 00 07 	cmplwi  r9,7
    31a0:	41 81 00 30 	bgt     31d0 <vsnprintf+0x70c>
    31a4:	81 21 00 54 	lwz     r9,84(r1)
    31a8:	81 49 00 08 	lwz     r10,8(r9)
    31ac:	81 21 00 54 	lwz     r9,84(r1)
    31b0:	89 29 00 00 	lbz     r9,0(r9)
    31b4:	39 09 00 01 	addi    r8,r9,1
    31b8:	55 07 06 3e 	clrlwi  r7,r8,24
    31bc:	81 01 00 54 	lwz     r8,84(r1)
    31c0:	98 e8 00 00 	stb     r7,0(r8)
    31c4:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    31c8:	7d 2a 4a 14 	add     r9,r10,r9
    31cc:	48 00 00 18 	b       31e4 <vsnprintf+0x720>
    31d0:	81 21 00 54 	lwz     r9,84(r1)
    31d4:	81 29 00 04 	lwz     r9,4(r9)
    31d8:	39 09 00 04 	addi    r8,r9,4
    31dc:	81 41 00 54 	lwz     r10,84(r1)
    31e0:	91 0a 00 04 	stw     r8,4(r10)
    31e4:	81 29 00 00 	lwz     r9,0(r9)
    31e8:	7d 2a 4b 78 	mr      r10,r9
    31ec:	81 21 00 24 	lwz     r9,36(r1)
    31f0:	81 01 00 2c 	lwz     r8,44(r1)
    31f4:	80 e1 00 28 	lwz     r7,40(r1)
    31f8:	38 c0 00 10 	li      r6,16
    31fc:	7d 45 53 78 	mr      r5,r10
    3200:	80 81 00 1c 	lwz     r4,28(r1)
    3204:	80 61 00 18 	lwz     r3,24(r1)
    3208:	4b ff ef bd 	bl      21c4 <number>
    320c:	7c 69 1b 78 	mr      r9,r3
    3210:	91 21 00 18 	stw     r9,24(r1)
    3214:	48 00 05 b4 	b       37c8 <vsnprintf+0xd04>
    3218:	81 21 00 30 	lwz     r9,48(r1)
    321c:	2c 09 00 6c 	cmpwi   r9,108
    3220:	40 82 00 74 	bne     3294 <vsnprintf+0x7d0>
    3224:	81 21 00 54 	lwz     r9,84(r1)
    3228:	89 29 00 00 	lbz     r9,0(r9)
    322c:	28 09 00 07 	cmplwi  r9,7
    3230:	41 81 00 30 	bgt     3260 <vsnprintf+0x79c>
    3234:	81 21 00 54 	lwz     r9,84(r1)
    3238:	81 49 00 08 	lwz     r10,8(r9)
    323c:	81 21 00 54 	lwz     r9,84(r1)
    3240:	89 29 00 00 	lbz     r9,0(r9)
    3244:	39 09 00 01 	addi    r8,r9,1
    3248:	55 07 06 3e 	clrlwi  r7,r8,24
    324c:	81 01 00 54 	lwz     r8,84(r1)
    3250:	98 e8 00 00 	stb     r7,0(r8)
    3254:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3258:	7d 2a 4a 14 	add     r9,r10,r9
    325c:	48 00 00 18 	b       3274 <vsnprintf+0x7b0>
    3260:	81 21 00 54 	lwz     r9,84(r1)
    3264:	81 29 00 04 	lwz     r9,4(r9)
    3268:	39 09 00 04 	addi    r8,r9,4
    326c:	81 41 00 54 	lwz     r10,84(r1)
    3270:	91 0a 00 04 	stw     r8,4(r10)
    3274:	81 29 00 00 	lwz     r9,0(r9)
    3278:	91 21 00 40 	stw     r9,64(r1)
    327c:	81 41 00 18 	lwz     r10,24(r1)
    3280:	81 21 00 48 	lwz     r9,72(r1)
    3284:	7d 49 50 50 	subf    r10,r9,r10
    3288:	81 21 00 40 	lwz     r9,64(r1)
    328c:	91 49 00 00 	stw     r10,0(r9)
    3290:	48 00 05 38 	b       37c8 <vsnprintf+0xd04>
    3294:	81 21 00 30 	lwz     r9,48(r1)
    3298:	2c 09 00 5a 	cmpwi   r9,90
    329c:	41 82 00 10 	beq     32ac <vsnprintf+0x7e8>
    32a0:	81 21 00 30 	lwz     r9,48(r1)
    32a4:	2c 09 00 7a 	cmpwi   r9,122
    32a8:	40 82 00 7c 	bne     3324 <vsnprintf+0x860>
    32ac:	81 21 00 54 	lwz     r9,84(r1)
    32b0:	89 29 00 00 	lbz     r9,0(r9)
    32b4:	28 09 00 07 	cmplwi  r9,7
    32b8:	41 81 00 30 	bgt     32e8 <vsnprintf+0x824>
    32bc:	81 21 00 54 	lwz     r9,84(r1)
    32c0:	81 49 00 08 	lwz     r10,8(r9)
    32c4:	81 21 00 54 	lwz     r9,84(r1)
    32c8:	89 29 00 00 	lbz     r9,0(r9)
    32cc:	39 09 00 01 	addi    r8,r9,1
    32d0:	55 07 06 3e 	clrlwi  r7,r8,24
    32d4:	81 01 00 54 	lwz     r8,84(r1)
    32d8:	98 e8 00 00 	stb     r7,0(r8)
    32dc:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    32e0:	7d 2a 4a 14 	add     r9,r10,r9
    32e4:	48 00 00 18 	b       32fc <vsnprintf+0x838>
    32e8:	81 21 00 54 	lwz     r9,84(r1)
    32ec:	81 29 00 04 	lwz     r9,4(r9)
    32f0:	39 09 00 04 	addi    r8,r9,4
    32f4:	81 41 00 54 	lwz     r10,84(r1)
    32f8:	91 0a 00 04 	stw     r8,4(r10)
    32fc:	81 29 00 00 	lwz     r9,0(r9)
    3300:	91 21 00 3c 	stw     r9,60(r1)
    3304:	81 41 00 18 	lwz     r10,24(r1)
    3308:	81 21 00 48 	lwz     r9,72(r1)
    330c:	7d 29 50 50 	subf    r9,r9,r10
    3310:	7d 2a 4b 78 	mr      r10,r9
    3314:	81 21 00 3c 	lwz     r9,60(r1)
    3318:	91 49 00 00 	stw     r10,0(r9)
    331c:	60 00 00 00 	nop
    3320:	48 00 04 a8 	b       37c8 <vsnprintf+0xd04>
    3324:	81 21 00 54 	lwz     r9,84(r1)
    3328:	89 29 00 00 	lbz     r9,0(r9)
    332c:	28 09 00 07 	cmplwi  r9,7
    3330:	41 81 00 30 	bgt     3360 <vsnprintf+0x89c>
    3334:	81 21 00 54 	lwz     r9,84(r1)
    3338:	81 49 00 08 	lwz     r10,8(r9)
    333c:	81 21 00 54 	lwz     r9,84(r1)
    3340:	89 29 00 00 	lbz     r9,0(r9)
    3344:	39 09 00 01 	addi    r8,r9,1
    3348:	55 07 06 3e 	clrlwi  r7,r8,24
    334c:	81 01 00 54 	lwz     r8,84(r1)
    3350:	98 e8 00 00 	stb     r7,0(r8)
    3354:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3358:	7d 2a 4a 14 	add     r9,r10,r9
    335c:	48 00 00 18 	b       3374 <vsnprintf+0x8b0>
    3360:	81 21 00 54 	lwz     r9,84(r1)
    3364:	81 29 00 04 	lwz     r9,4(r9)
    3368:	39 09 00 04 	addi    r8,r9,4
    336c:	81 41 00 54 	lwz     r10,84(r1)
    3370:	91 0a 00 04 	stw     r8,4(r10)
    3374:	81 29 00 00 	lwz     r9,0(r9)
    3378:	91 21 00 38 	stw     r9,56(r1)
    337c:	81 41 00 18 	lwz     r10,24(r1)
    3380:	81 21 00 48 	lwz     r9,72(r1)
    3384:	7d 49 50 50 	subf    r10,r9,r10
    3388:	81 21 00 38 	lwz     r9,56(r1)
    338c:	91 49 00 00 	stw     r10,0(r9)
    3390:	48 00 04 38 	b       37c8 <vsnprintf+0xd04>
    3394:	81 41 00 18 	lwz     r10,24(r1)
    3398:	81 21 00 1c 	lwz     r9,28(r1)
    339c:	7c 0a 48 40 	cmplw   r10,r9
    33a0:	40 80 00 10 	bge     33b0 <vsnprintf+0x8ec>
    33a4:	81 21 00 18 	lwz     r9,24(r1)
    33a8:	39 40 00 25 	li      r10,37
    33ac:	99 49 00 00 	stb     r10,0(r9)
    33b0:	81 21 00 18 	lwz     r9,24(r1)
    33b4:	39 29 00 01 	addi    r9,r9,1
    33b8:	91 21 00 18 	stw     r9,24(r1)
    33bc:	48 00 04 0c 	b       37c8 <vsnprintf+0xd04>
    33c0:	39 20 00 08 	li      r9,8
    33c4:	91 21 00 14 	stw     r9,20(r1)
    33c8:	48 00 00 a8 	b       3470 <vsnprintf+0x9ac>
    33cc:	81 21 00 24 	lwz     r9,36(r1)
    33d0:	61 29 00 40 	ori     r9,r9,64
    33d4:	91 21 00 24 	stw     r9,36(r1)
    33d8:	39 20 00 10 	li      r9,16
    33dc:	91 21 00 14 	stw     r9,20(r1)
    33e0:	48 00 00 90 	b       3470 <vsnprintf+0x9ac>
    33e4:	81 21 00 24 	lwz     r9,36(r1)
    33e8:	61 29 00 02 	ori     r9,r9,2
    33ec:	91 21 00 24 	stw     r9,36(r1)
    33f0:	48 00 00 7c 	b       346c <vsnprintf+0x9a8>
    33f4:	81 41 00 18 	lwz     r10,24(r1)
    33f8:	81 21 00 1c 	lwz     r9,28(r1)
    33fc:	7c 0a 48 40 	cmplw   r10,r9
    3400:	40 80 00 10 	bge     3410 <vsnprintf+0x94c>
    3404:	81 21 00 18 	lwz     r9,24(r1)
    3408:	39 40 00 25 	li      r10,37
    340c:	99 49 00 00 	stb     r10,0(r9)
    3410:	81 21 00 18 	lwz     r9,24(r1)
    3414:	39 29 00 01 	addi    r9,r9,1
    3418:	91 21 00 18 	stw     r9,24(r1)
    341c:	81 21 00 50 	lwz     r9,80(r1)
    3420:	89 29 00 00 	lbz     r9,0(r9)
    3424:	2c 09 00 00 	cmpwi   r9,0
    3428:	41 82 00 34 	beq     345c <vsnprintf+0x998>
    342c:	81 41 00 18 	lwz     r10,24(r1)
    3430:	81 21 00 1c 	lwz     r9,28(r1)
    3434:	7c 0a 48 40 	cmplw   r10,r9
    3438:	40 80 00 14 	bge     344c <vsnprintf+0x988>
    343c:	81 21 00 50 	lwz     r9,80(r1)
    3440:	89 49 00 00 	lbz     r10,0(r9)
    3444:	81 21 00 18 	lwz     r9,24(r1)
    3448:	99 49 00 00 	stb     r10,0(r9)
    344c:	81 21 00 18 	lwz     r9,24(r1)
    3450:	39 29 00 01 	addi    r9,r9,1
    3454:	91 21 00 18 	stw     r9,24(r1)
    3458:	48 00 03 70 	b       37c8 <vsnprintf+0xd04>
    345c:	81 21 00 50 	lwz     r9,80(r1)
    3460:	39 29 ff ff 	addi    r9,r9,-1
    3464:	91 21 00 50 	stw     r9,80(r1)
    3468:	48 00 03 60 	b       37c8 <vsnprintf+0xd04>
    346c:	60 00 00 00 	nop
    3470:	81 21 00 30 	lwz     r9,48(r1)
    3474:	2c 09 00 4c 	cmpwi   r9,76
    3478:	40 82 00 90 	bne     3508 <vsnprintf+0xa44>
    347c:	81 21 00 54 	lwz     r9,84(r1)
    3480:	89 29 00 00 	lbz     r9,0(r9)
    3484:	81 41 00 54 	lwz     r10,84(r1)
    3488:	89 4a 00 00 	lbz     r10,0(r10)
    348c:	55 4a 07 fe 	clrlwi  r10,r10,31
    3490:	55 4a 06 3e 	clrlwi  r10,r10,24
    3494:	7d 4a 4a 14 	add     r10,r10,r9
    3498:	55 48 06 3e 	clrlwi  r8,r10,24
    349c:	81 41 00 54 	lwz     r10,84(r1)
    34a0:	99 0a 00 00 	stb     r8,0(r10)
    34a4:	28 09 00 06 	cmplwi  r9,6
    34a8:	41 81 00 30 	bgt     34d8 <vsnprintf+0xa14>
    34ac:	81 21 00 54 	lwz     r9,84(r1)
    34b0:	81 49 00 08 	lwz     r10,8(r9)
    34b4:	81 21 00 54 	lwz     r9,84(r1)
    34b8:	89 29 00 00 	lbz     r9,0(r9)
    34bc:	39 09 00 02 	addi    r8,r9,2
    34c0:	55 07 06 3e 	clrlwi  r7,r8,24
    34c4:	81 01 00 54 	lwz     r8,84(r1)
    34c8:	98 e8 00 00 	stb     r7,0(r8)
    34cc:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    34d0:	7d 2a 4a 14 	add     r9,r10,r9
    34d4:	48 00 00 20 	b       34f4 <vsnprintf+0xa30>
    34d8:	81 21 00 54 	lwz     r9,84(r1)
    34dc:	81 29 00 04 	lwz     r9,4(r9)
    34e0:	39 29 00 07 	addi    r9,r9,7
    34e4:	55 29 00 38 	rlwinm  r9,r9,0,0,28
    34e8:	39 09 00 08 	addi    r8,r9,8
    34ec:	81 41 00 54 	lwz     r10,84(r1)
    34f0:	91 0a 00 04 	stw     r8,4(r10)
    34f4:	81 49 00 00 	lwz     r10,0(r9)
    34f8:	81 69 00 04 	lwz     r11,4(r9)
    34fc:	91 41 00 08 	stw     r10,8(r1)
    3500:	91 61 00 0c 	stw     r11,12(r1)
    3504:	48 00 02 98 	b       379c <vsnprintf+0xcd8>
    3508:	81 21 00 30 	lwz     r9,48(r1)
    350c:	2c 09 00 6c 	cmpwi   r9,108
    3510:	40 82 00 88 	bne     3598 <vsnprintf+0xad4>
    3514:	81 21 00 54 	lwz     r9,84(r1)
    3518:	89 29 00 00 	lbz     r9,0(r9)
    351c:	28 09 00 07 	cmplwi  r9,7
    3520:	41 81 00 30 	bgt     3550 <vsnprintf+0xa8c>
    3524:	81 21 00 54 	lwz     r9,84(r1)
    3528:	81 49 00 08 	lwz     r10,8(r9)
    352c:	81 21 00 54 	lwz     r9,84(r1)
    3530:	89 29 00 00 	lbz     r9,0(r9)
    3534:	39 09 00 01 	addi    r8,r9,1
    3538:	55 07 06 3e 	clrlwi  r7,r8,24
    353c:	81 01 00 54 	lwz     r8,84(r1)
    3540:	98 e8 00 00 	stb     r7,0(r8)
    3544:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3548:	7d 2a 4a 14 	add     r9,r10,r9
    354c:	48 00 00 18 	b       3564 <vsnprintf+0xaa0>
    3550:	81 21 00 54 	lwz     r9,84(r1)
    3554:	81 29 00 04 	lwz     r9,4(r9)
    3558:	39 09 00 04 	addi    r8,r9,4
    355c:	81 41 00 54 	lwz     r10,84(r1)
    3560:	91 0a 00 04 	stw     r8,4(r10)
    3564:	81 29 00 00 	lwz     r9,0(r9)
    3568:	91 21 00 0c 	stw     r9,12(r1)
    356c:	39 20 00 00 	li      r9,0
    3570:	91 21 00 08 	stw     r9,8(r1)
    3574:	81 21 00 24 	lwz     r9,36(r1)
    3578:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    357c:	2c 09 00 00 	cmpwi   r9,0
    3580:	41 82 02 1c 	beq     379c <vsnprintf+0xcd8>
    3584:	81 21 00 0c 	lwz     r9,12(r1)
    3588:	91 21 00 0c 	stw     r9,12(r1)
    358c:	7d 29 fe 70 	srawi   r9,r9,31
    3590:	91 21 00 08 	stw     r9,8(r1)
    3594:	48 00 02 08 	b       379c <vsnprintf+0xcd8>
    3598:	81 21 00 30 	lwz     r9,48(r1)
    359c:	2c 09 00 5a 	cmpwi   r9,90
    35a0:	41 82 00 10 	beq     35b0 <vsnprintf+0xaec>
    35a4:	81 21 00 30 	lwz     r9,48(r1)
    35a8:	2c 09 00 7a 	cmpwi   r9,122
    35ac:	40 82 00 68 	bne     3614 <vsnprintf+0xb50>
    35b0:	81 21 00 54 	lwz     r9,84(r1)
    35b4:	89 29 00 00 	lbz     r9,0(r9)
    35b8:	28 09 00 07 	cmplwi  r9,7
    35bc:	41 81 00 30 	bgt     35ec <vsnprintf+0xb28>
    35c0:	81 21 00 54 	lwz     r9,84(r1)
    35c4:	81 49 00 08 	lwz     r10,8(r9)
    35c8:	81 21 00 54 	lwz     r9,84(r1)
    35cc:	89 29 00 00 	lbz     r9,0(r9)
    35d0:	39 09 00 01 	addi    r8,r9,1
    35d4:	55 07 06 3e 	clrlwi  r7,r8,24
    35d8:	81 01 00 54 	lwz     r8,84(r1)
    35dc:	98 e8 00 00 	stb     r7,0(r8)
    35e0:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    35e4:	7d 2a 4a 14 	add     r9,r10,r9
    35e8:	48 00 00 18 	b       3600 <vsnprintf+0xb3c>
    35ec:	81 21 00 54 	lwz     r9,84(r1)
    35f0:	81 29 00 04 	lwz     r9,4(r9)
    35f4:	39 09 00 04 	addi    r8,r9,4
    35f8:	81 41 00 54 	lwz     r10,84(r1)
    35fc:	91 0a 00 04 	stw     r8,4(r10)
    3600:	81 29 00 00 	lwz     r9,0(r9)
    3604:	91 21 00 0c 	stw     r9,12(r1)
    3608:	39 20 00 00 	li      r9,0
    360c:	91 21 00 08 	stw     r9,8(r1)
    3610:	48 00 01 8c 	b       379c <vsnprintf+0xcd8>
    3614:	81 21 00 30 	lwz     r9,48(r1)
    3618:	2c 09 00 74 	cmpwi   r9,116
    361c:	40 82 00 68 	bne     3684 <vsnprintf+0xbc0>
    3620:	81 21 00 54 	lwz     r9,84(r1)
    3624:	89 29 00 00 	lbz     r9,0(r9)
    3628:	28 09 00 07 	cmplwi  r9,7
    362c:	41 81 00 30 	bgt     365c <vsnprintf+0xb98>
    3630:	81 21 00 54 	lwz     r9,84(r1)
    3634:	81 49 00 08 	lwz     r10,8(r9)
    3638:	81 21 00 54 	lwz     r9,84(r1)
    363c:	89 29 00 00 	lbz     r9,0(r9)
    3640:	39 09 00 01 	addi    r8,r9,1
    3644:	55 07 06 3e 	clrlwi  r7,r8,24
    3648:	81 01 00 54 	lwz     r8,84(r1)
    364c:	98 e8 00 00 	stb     r7,0(r8)
    3650:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3654:	7d 2a 4a 14 	add     r9,r10,r9
    3658:	48 00 00 18 	b       3670 <vsnprintf+0xbac>
    365c:	81 21 00 54 	lwz     r9,84(r1)
    3660:	81 29 00 04 	lwz     r9,4(r9)
    3664:	39 09 00 04 	addi    r8,r9,4
    3668:	81 41 00 54 	lwz     r10,84(r1)
    366c:	91 0a 00 04 	stw     r8,4(r10)
    3670:	81 29 00 00 	lwz     r9,0(r9)
    3674:	91 21 00 0c 	stw     r9,12(r1)
    3678:	7d 29 fe 70 	srawi   r9,r9,31
    367c:	91 21 00 08 	stw     r9,8(r1)
    3680:	48 00 01 1c 	b       379c <vsnprintf+0xcd8>
    3684:	81 21 00 30 	lwz     r9,48(r1)
    3688:	2c 09 00 68 	cmpwi   r9,104
    368c:	40 82 00 90 	bne     371c <vsnprintf+0xc58>
    3690:	81 21 00 54 	lwz     r9,84(r1)
    3694:	89 29 00 00 	lbz     r9,0(r9)
    3698:	28 09 00 07 	cmplwi  r9,7
    369c:	41 81 00 30 	bgt     36cc <vsnprintf+0xc08>
    36a0:	81 21 00 54 	lwz     r9,84(r1)
    36a4:	81 49 00 08 	lwz     r10,8(r9)
    36a8:	81 21 00 54 	lwz     r9,84(r1)
    36ac:	89 29 00 00 	lbz     r9,0(r9)
    36b0:	39 09 00 01 	addi    r8,r9,1
    36b4:	55 07 06 3e 	clrlwi  r7,r8,24
    36b8:	81 01 00 54 	lwz     r8,84(r1)
    36bc:	98 e8 00 00 	stb     r7,0(r8)
    36c0:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    36c4:	7d 2a 4a 14 	add     r9,r10,r9
    36c8:	48 00 00 18 	b       36e0 <vsnprintf+0xc1c>
    36cc:	81 21 00 54 	lwz     r9,84(r1)
    36d0:	81 29 00 04 	lwz     r9,4(r9)
    36d4:	39 09 00 04 	addi    r8,r9,4
    36d8:	81 41 00 54 	lwz     r10,84(r1)
    36dc:	91 0a 00 04 	stw     r8,4(r10)
    36e0:	81 29 00 00 	lwz     r9,0(r9)
    36e4:	55 29 04 3e 	clrlwi  r9,r9,16
    36e8:	91 21 00 0c 	stw     r9,12(r1)
    36ec:	39 20 00 00 	li      r9,0
    36f0:	91 21 00 08 	stw     r9,8(r1)
    36f4:	81 21 00 24 	lwz     r9,36(r1)
    36f8:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    36fc:	2c 09 00 00 	cmpwi   r9,0
    3700:	41 82 00 9c 	beq     379c <vsnprintf+0xcd8>
    3704:	a1 21 00 0e 	lhz     r9,14(r1)
    3708:	7d 29 07 34 	extsh   r9,r9
    370c:	91 21 00 0c 	stw     r9,12(r1)
    3710:	7d 29 fe 70 	srawi   r9,r9,31
    3714:	91 21 00 08 	stw     r9,8(r1)
    3718:	48 00 00 84 	b       379c <vsnprintf+0xcd8>
    371c:	81 21 00 54 	lwz     r9,84(r1)
    3720:	89 29 00 00 	lbz     r9,0(r9)
    3724:	28 09 00 07 	cmplwi  r9,7
    3728:	41 81 00 30 	bgt     3758 <vsnprintf+0xc94>
    372c:	81 21 00 54 	lwz     r9,84(r1)
    3730:	81 49 00 08 	lwz     r10,8(r9)
    3734:	81 21 00 54 	lwz     r9,84(r1)
    3738:	89 29 00 00 	lbz     r9,0(r9)
    373c:	39 09 00 01 	addi    r8,r9,1
    3740:	55 07 06 3e 	clrlwi  r7,r8,24
    3744:	81 01 00 54 	lwz     r8,84(r1)
    3748:	98 e8 00 00 	stb     r7,0(r8)
    374c:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3750:	7d 2a 4a 14 	add     r9,r10,r9
    3754:	48 00 00 18 	b       376c <vsnprintf+0xca8>
    3758:	81 21 00 54 	lwz     r9,84(r1)
    375c:	81 29 00 04 	lwz     r9,4(r9)
    3760:	39 09 00 04 	addi    r8,r9,4
    3764:	81 41 00 54 	lwz     r10,84(r1)
    3768:	91 0a 00 04 	stw     r8,4(r10)
    376c:	81 29 00 00 	lwz     r9,0(r9)
    3770:	91 21 00 0c 	stw     r9,12(r1)
    3774:	39 20 00 00 	li      r9,0
    3778:	91 21 00 08 	stw     r9,8(r1)
    377c:	81 21 00 24 	lwz     r9,36(r1)
    3780:	55 29 07 bc 	rlwinm  r9,r9,0,30,30
    3784:	2c 09 00 00 	cmpwi   r9,0
    3788:	41 82 00 14 	beq     379c <vsnprintf+0xcd8>
    378c:	81 21 00 0c 	lwz     r9,12(r1)
    3790:	91 21 00 0c 	stw     r9,12(r1)
    3794:	7d 29 fe 70 	srawi   r9,r9,31
    3798:	91 21 00 08 	stw     r9,8(r1)
    379c:	81 41 00 0c 	lwz     r10,12(r1)
    37a0:	81 21 00 24 	lwz     r9,36(r1)
    37a4:	81 01 00 2c 	lwz     r8,44(r1)
    37a8:	80 e1 00 28 	lwz     r7,40(r1)
    37ac:	80 c1 00 14 	lwz     r6,20(r1)
    37b0:	7d 45 53 78 	mr      r5,r10
    37b4:	80 81 00 1c 	lwz     r4,28(r1)
    37b8:	80 61 00 18 	lwz     r3,24(r1)
    37bc:	4b ff ea 09 	bl      21c4 <number>
    37c0:	7c 69 1b 78 	mr      r9,r3
    37c4:	91 21 00 18 	stw     r9,24(r1)
    37c8:	81 21 00 50 	lwz     r9,80(r1)
    37cc:	39 29 00 01 	addi    r9,r9,1
    37d0:	91 21 00 50 	stw     r9,80(r1)
    37d4:	81 21 00 50 	lwz     r9,80(r1)
    37d8:	89 29 00 00 	lbz     r9,0(r9)
    37dc:	2c 09 00 00 	cmpwi   r9,0
    37e0:	40 82 f3 58 	bne     2b38 <vsnprintf+0x74>
    37e4:	81 21 00 4c 	lwz     r9,76(r1)
    37e8:	2c 09 00 00 	cmpwi   r9,0
    37ec:	41 82 00 34 	beq     3820 <vsnprintf+0xd5c>
    37f0:	81 41 00 18 	lwz     r10,24(r1)
    37f4:	81 21 00 1c 	lwz     r9,28(r1)
    37f8:	7c 0a 48 40 	cmplw   r10,r9
    37fc:	40 80 00 14 	bge     3810 <vsnprintf+0xd4c>
    3800:	81 21 00 18 	lwz     r9,24(r1)
    3804:	39 40 00 00 	li      r10,0
    3808:	99 49 00 00 	stb     r10,0(r9)
    380c:	48 00 00 14 	b       3820 <vsnprintf+0xd5c>
    3810:	81 21 00 1c 	lwz     r9,28(r1)
    3814:	39 29 ff ff 	addi    r9,r9,-1
    3818:	39 40 00 00 	li      r10,0
    381c:	99 49 00 00 	stb     r10,0(r9)
    3820:	81 41 00 18 	lwz     r10,24(r1)
    3824:	81 21 00 48 	lwz     r9,72(r1)
    3828:	7d 29 50 50 	subf    r9,r9,r10
    382c:	7d 23 4b 78 	mr      r3,r9
    3830:	80 01 00 64 	lwz     r0,100(r1)
    3834:	7c 08 03 a6 	mtlr    r0
    3838:	38 21 00 60 	addi    r1,r1,96
    383c:	4e 80 00 20 	blr

00003840 <console_set_write_hook>:
    3840:	94 21 ff f0 	stwu    r1,-16(r1)
    3844:	90 61 00 08 	stw     r3,8(r1)
    3848:	3d 20 00 02 	lis     r9,2
    384c:	81 41 00 08 	lwz     r10,8(r1)
    3850:	91 49 e0 18 	stw     r10,-8168(r9)
    3854:	60 00 00 00 	nop
    3858:	38 21 00 10 	addi    r1,r1,16
    385c:	4e 80 00 20 	blr

00003860 <console_set_read_hook>:
    3860:	94 21 ff f0 	stwu    r1,-16(r1)
    3864:	90 61 00 08 	stw     r3,8(r1)
    3868:	90 81 00 0c 	stw     r4,12(r1)
    386c:	3d 20 00 02 	lis     r9,2
    3870:	81 41 00 08 	lwz     r10,8(r1)
    3874:	91 49 e0 1c 	stw     r10,-8164(r9)
    3878:	3d 20 00 02 	lis     r9,2
    387c:	81 41 00 0c 	lwz     r10,12(r1)
    3880:	91 49 e0 20 	stw     r10,-8160(r9)
    3884:	60 00 00 00 	nop
    3888:	38 21 00 10 	addi    r1,r1,16
    388c:	4e 80 00 20 	blr

00003890 <putchar>:
    3890:	94 21 ff f0 	stwu    r1,-16(r1)
    3894:	7c 08 02 a6 	mflr    r0
    3898:	90 01 00 14 	stw     r0,20(r1)
    389c:	90 61 00 08 	stw     r3,8(r1)
    38a0:	3d 20 00 02 	lis     r9,2
    38a4:	81 29 e0 18 	lwz     r9,-8168(r9)
    38a8:	2c 09 00 00 	cmpwi   r9,0
    38ac:	41 82 00 20 	beq     38cc <putchar+0x3c>
    38b0:	3d 20 00 02 	lis     r9,2
    38b4:	81 29 e0 18 	lwz     r9,-8168(r9)
    38b8:	81 41 00 08 	lwz     r10,8(r1)
    38bc:	55 4a 06 3e 	clrlwi  r10,r10,24
    38c0:	7d 43 53 78 	mr      r3,r10
    38c4:	7d 29 03 a6 	mtctr   r9
    38c8:	4e 80 04 21 	bctrl
    38cc:	81 21 00 08 	lwz     r9,8(r1)
    38d0:	7d 23 4b 78 	mr      r3,r9
    38d4:	80 01 00 14 	lwz     r0,20(r1)
    38d8:	7c 08 03 a6 	mtlr    r0
    38dc:	38 21 00 10 	addi    r1,r1,16
    38e0:	4e 80 00 20 	blr

000038e4 <readchar>:
    38e4:	94 21 ff f0 	stwu    r1,-16(r1)
    38e8:	7c 08 02 a6 	mflr    r0
    38ec:	90 01 00 14 	stw     r0,20(r1)
    38f0:	3d 20 00 02 	lis     r9,2
    38f4:	81 29 e0 20 	lwz     r9,-8160(r9)
    38f8:	2c 09 00 00 	cmpwi   r9,0
    38fc:	41 82 ff f4 	beq     38f0 <readchar+0xc>
    3900:	3d 20 00 02 	lis     r9,2
    3904:	81 29 e0 20 	lwz     r9,-8160(r9)
    3908:	7d 29 03 a6 	mtctr   r9
    390c:	4e 80 04 21 	bctrl
    3910:	7c 69 1b 78 	mr      r9,r3
    3914:	2c 09 00 00 	cmpwi   r9,0
    3918:	41 82 ff d8 	beq     38f0 <readchar+0xc>
    391c:	3d 20 00 02 	lis     r9,2
    3920:	81 29 e0 1c 	lwz     r9,-8164(r9)
    3924:	7d 29 03 a6 	mtctr   r9
    3928:	4e 80 04 21 	bctrl
    392c:	7c 69 1b 78 	mr      r9,r3
    3930:	7d 23 4b 78 	mr      r3,r9
    3934:	80 01 00 14 	lwz     r0,20(r1)
    3938:	7c 08 03 a6 	mtlr    r0
    393c:	38 21 00 10 	addi    r1,r1,16
    3940:	4e 80 00 20 	blr

00003944 <readchar_nonblock>:
    3944:	94 21 ff f0 	stwu    r1,-16(r1)
    3948:	7c 08 02 a6 	mflr    r0
    394c:	90 01 00 14 	stw     r0,20(r1)
    3950:	3d 20 00 02 	lis     r9,2
    3954:	81 29 e0 20 	lwz     r9,-8160(r9)
    3958:	2c 09 00 00 	cmpwi   r9,0
    395c:	41 82 00 28 	beq     3984 <readchar_nonblock+0x40>
    3960:	3d 20 00 02 	lis     r9,2
    3964:	81 29 e0 20 	lwz     r9,-8160(r9)
    3968:	7d 29 03 a6 	mtctr   r9
    396c:	4e 80 04 21 	bctrl
    3970:	7c 69 1b 78 	mr      r9,r3
    3974:	2c 09 00 00 	cmpwi   r9,0
    3978:	41 82 00 0c 	beq     3984 <readchar_nonblock+0x40>
    397c:	39 20 00 01 	li      r9,1
    3980:	48 00 00 08 	b       3988 <readchar_nonblock+0x44>
    3984:	39 20 00 00 	li      r9,0
    3988:	7d 23 4b 78 	mr      r3,r9
    398c:	80 01 00 14 	lwz     r0,20(r1)
    3990:	7c 08 03 a6 	mtlr    r0
    3994:	38 21 00 10 	addi    r1,r1,16
    3998:	4e 80 00 20 	blr

0000399c <puts>:
    399c:	94 21 ff f0 	stwu    r1,-16(r1)
    39a0:	7c 08 02 a6 	mflr    r0
    39a4:	90 01 00 14 	stw     r0,20(r1)
    39a8:	90 61 00 08 	stw     r3,8(r1)
    39ac:	80 61 00 08 	lwz     r3,8(r1)
    39b0:	48 00 00 25 	bl      39d4 <putsnonl>
    39b4:	38 60 00 0a 	li      r3,10
    39b8:	4b ff fe d9 	bl      3890 <putchar>
    39bc:	39 20 00 01 	li      r9,1
    39c0:	7d 23 4b 78 	mr      r3,r9
    39c4:	80 01 00 14 	lwz     r0,20(r1)
    39c8:	7c 08 03 a6 	mtlr    r0
    39cc:	38 21 00 10 	addi    r1,r1,16
    39d0:	4e 80 00 20 	blr

000039d4 <putsnonl>:
    39d4:	94 21 ff f0 	stwu    r1,-16(r1)
    39d8:	7c 08 02 a6 	mflr    r0
    39dc:	90 01 00 14 	stw     r0,20(r1)
    39e0:	90 61 00 08 	stw     r3,8(r1)
    39e4:	48 00 00 20 	b       3a04 <putsnonl+0x30>
    39e8:	81 21 00 08 	lwz     r9,8(r1)
    39ec:	89 29 00 00 	lbz     r9,0(r9)
    39f0:	7d 23 4b 78 	mr      r3,r9
    39f4:	4b ff fe 9d 	bl      3890 <putchar>
    39f8:	81 21 00 08 	lwz     r9,8(r1)
    39fc:	39 29 00 01 	addi    r9,r9,1
    3a00:	91 21 00 08 	stw     r9,8(r1)
    3a04:	81 21 00 08 	lwz     r9,8(r1)
    3a08:	89 29 00 00 	lbz     r9,0(r9)
    3a0c:	2c 09 00 00 	cmpwi   r9,0
    3a10:	40 82 ff d8 	bne     39e8 <putsnonl+0x14>
    3a14:	60 00 00 00 	nop
    3a18:	60 00 00 00 	nop
    3a1c:	80 01 00 14 	lwz     r0,20(r1)
    3a20:	7c 08 03 a6 	mtlr    r0
    3a24:	38 21 00 10 	addi    r1,r1,16
    3a28:	4e 80 00 20 	blr

00003a2c <vprintf>:
    3a2c:	94 21 fe e0 	stwu    r1,-288(r1)
    3a30:	7c 08 02 a6 	mflr    r0
    3a34:	90 01 01 24 	stw     r0,292(r1)
    3a38:	90 61 01 18 	stw     r3,280(r1)
    3a3c:	90 81 01 1c 	stw     r4,284(r1)
    3a40:	39 21 00 0c 	addi    r9,r1,12
    3a44:	80 c1 01 1c 	lwz     r6,284(r1)
    3a48:	80 a1 01 18 	lwz     r5,280(r1)
    3a4c:	38 80 01 00 	li      r4,256
    3a50:	7d 23 4b 78 	mr      r3,r9
    3a54:	4b ff eb f9 	bl      264c <vscnprintf>
    3a58:	7c 69 1b 78 	mr      r9,r3
    3a5c:	91 21 00 08 	stw     r9,8(r1)
    3a60:	39 41 00 0c 	addi    r10,r1,12
    3a64:	81 21 00 08 	lwz     r9,8(r1)
    3a68:	7d 2a 4a 14 	add     r9,r10,r9
    3a6c:	39 40 00 00 	li      r10,0
    3a70:	99 49 00 00 	stb     r10,0(r9)
    3a74:	39 21 00 0c 	addi    r9,r1,12
    3a78:	7d 23 4b 78 	mr      r3,r9
    3a7c:	4b ff ff 59 	bl      39d4 <putsnonl>
    3a80:	81 21 00 08 	lwz     r9,8(r1)
    3a84:	7d 23 4b 78 	mr      r3,r9
    3a88:	80 01 01 24 	lwz     r0,292(r1)
    3a8c:	7c 08 03 a6 	mtlr    r0
    3a90:	38 21 01 20 	addi    r1,r1,288
    3a94:	4e 80 00 20 	blr

00003a98 <printf>:
    3a98:	94 21 ff 80 	stwu    r1,-128(r1)
    3a9c:	7c 08 02 a6 	mflr    r0
    3aa0:	90 01 00 84 	stw     r0,132(r1)
    3aa4:	90 61 00 18 	stw     r3,24(r1)
    3aa8:	90 81 00 24 	stw     r4,36(r1)
    3aac:	90 a1 00 28 	stw     r5,40(r1)
    3ab0:	90 c1 00 2c 	stw     r6,44(r1)
    3ab4:	90 e1 00 30 	stw     r7,48(r1)
    3ab8:	91 01 00 34 	stw     r8,52(r1)
    3abc:	91 21 00 38 	stw     r9,56(r1)
    3ac0:	91 41 00 3c 	stw     r10,60(r1)
    3ac4:	40 86 00 24 	bne     cr1,3ae8 <printf+0x50>
    3ac8:	d8 21 00 40 	stfd    f1,64(r1)
    3acc:	d8 41 00 48 	stfd    f2,72(r1)
    3ad0:	d8 61 00 50 	stfd    f3,80(r1)
    3ad4:	d8 81 00 58 	stfd    f4,88(r1)
    3ad8:	d8 a1 00 60 	stfd    f5,96(r1)
    3adc:	d8 c1 00 68 	stfd    f6,104(r1)
    3ae0:	d8 e1 00 70 	stfd    f7,112(r1)
    3ae4:	d9 01 00 78 	stfd    f8,120(r1)
    3ae8:	39 20 00 01 	li      r9,1
    3aec:	99 21 00 0c 	stb     r9,12(r1)
    3af0:	39 20 00 00 	li      r9,0
    3af4:	99 21 00 0d 	stb     r9,13(r1)
    3af8:	39 21 00 88 	addi    r9,r1,136
    3afc:	91 21 00 10 	stw     r9,16(r1)
    3b00:	39 21 00 20 	addi    r9,r1,32
    3b04:	91 21 00 14 	stw     r9,20(r1)
    3b08:	39 21 00 0c 	addi    r9,r1,12
    3b0c:	7d 24 4b 78 	mr      r4,r9
    3b10:	80 61 00 18 	lwz     r3,24(r1)
    3b14:	4b ff ff 19 	bl      3a2c <vprintf>
    3b18:	7c 69 1b 78 	mr      r9,r3
    3b1c:	91 21 00 08 	stw     r9,8(r1)
    3b20:	81 21 00 08 	lwz     r9,8(r1)
    3b24:	7d 23 4b 78 	mr      r3,r9
    3b28:	80 01 00 84 	lwz     r0,132(r1)
    3b2c:	7c 08 03 a6 	mtlr    r0
    3b30:	38 21 00 80 	addi    r1,r1,128
    3b34:	4e 80 00 20 	blr

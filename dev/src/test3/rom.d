
rom:     file format elf32-powerpc


Disassembly of section .kernel:

00000000 <_start>:
   0:	48 00 04 00 	b       400 <boot_start>
   4:	48 00 0f 30 	b       f34 <tst_end>
	...

00000020 <int_020>:
  20:	48 00 0c dc 	b       cfc <int_unhandled>
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
 120:	48 00 0b dc 	b       cfc <int_unhandled>
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
 4e0:	80 20 09 04 	lwz     r1,2308(0)
 4e4:	48 00 00 20 	b       504 <boot_complete>

000004e8 <init_t123>:
 4e8:	39 40 00 00 	li      r10,0
 4ec:	65 4a 80 02 	oris    r10,r10,32770
 4f0:	61 4a b0 00 	ori     r10,r10,45056
 4f4:	7d 40 01 24 	mtmsr   r10
 4f8:	4c 00 01 2c 	isync
 4fc:	80 20 09 08 	lwz     r1,2312(0)
 500:	48 00 00 04 	b       504 <boot_complete>

00000504 <boot_complete>:
 504:	3c 60 00 00 	lis     r3,0
 508:	60 63 09 20 	ori     r3,r3,2336
 50c:	7c 69 03 a6 	mtctr   r3
 510:	7c 7e 6a a6 	mfspr   r3,446
 514:	4e 80 04 21 	bctrl
 518:	48 00 02 e4 	b       7fc <kernel_return>
	...

000007fc <kernel_return>:
 7fc:	48 00 00 00 	b       7fc <kernel_return>

00000800 <int_800>:
 800:	48 00 00 00 	b       800 <int_800>
	...

00000820 <int_820>:
 820:	48 00 00 00 	b       820 <int_820>
	...

Disassembly of section .bios:

00000910 <main-0x10>:
 910:	60 00 00 00 	nop
 914:	60 00 00 00 	nop
 918:	60 00 00 00 	nop
 91c:	60 00 00 00 	nop

00000920 <main>:
 920:	94 21 ff c0 	stwu    r1,-64(r1)
 924:	90 61 00 38 	stw     r3,56(r1)
 928:	3d 20 00 01 	lis     r9,1
 92c:	81 29 00 00 	lwz     r9,0(r9)
 930:	91 21 00 0c 	stw     r9,12(r1)
 934:	3d 20 00 00 	lis     r9,0
 938:	39 29 0d 20 	addi    r9,r9,3360
 93c:	91 21 00 10 	stw     r9,16(r1)
 940:	81 21 00 38 	lwz     r9,56(r1)
 944:	2c 09 00 00 	cmpwi   r9,0
 948:	41 82 00 0c 	beq     954 <main+0x34>
 94c:	39 20 ff ff 	li      r9,-1
 950:	48 00 01 88 	b       ad8 <main+0x1b8>
 954:	3d 20 00 00 	lis     r9,0
 958:	81 29 0d 00 	lwz     r9,3328(r9)
 95c:	91 21 00 08 	stw     r9,8(r1)
 960:	48 00 00 28 	b       988 <main+0x68>
 964:	81 21 00 0c 	lwz     r9,12(r1)
 968:	39 49 00 04 	addi    r10,r9,4
 96c:	91 41 00 0c 	stw     r10,12(r1)
 970:	81 41 00 08 	lwz     r10,8(r1)
 974:	81 4a 00 00 	lwz     r10,0(r10)
 978:	91 49 00 00 	stw     r10,0(r9)
 97c:	81 21 00 08 	lwz     r9,8(r1)
 980:	39 29 00 04 	addi    r9,r9,4
 984:	91 21 00 08 	stw     r9,8(r1)
 988:	3d 20 00 00 	lis     r9,0
 98c:	81 29 0d 00 	lwz     r9,3328(r9)
 990:	81 41 00 08 	lwz     r10,8(r1)
 994:	7c 0a 48 40 	cmplw   r10,r9
 998:	41 80 ff cc 	blt     964 <main+0x44>
 99c:	3d 20 00 01 	lis     r9,1
 9a0:	81 29 00 00 	lwz     r9,0(r9)
 9a4:	91 21 00 08 	stw     r9,8(r1)
 9a8:	48 00 00 20 	b       9c8 <main+0xa8>
 9ac:	3d 20 00 01 	lis     r9,1
 9b0:	81 29 00 00 	lwz     r9,0(r9)
 9b4:	39 40 00 00 	li      r10,0
 9b8:	91 49 00 00 	stw     r10,0(r9)
 9bc:	81 21 00 08 	lwz     r9,8(r1)
 9c0:	39 29 00 04 	addi    r9,r9,4
 9c4:	91 21 00 08 	stw     r9,8(r1)
 9c8:	3d 20 00 01 	lis     r9,1
 9cc:	81 29 00 00 	lwz     r9,0(r9)
 9d0:	81 41 00 08 	lwz     r10,8(r1)
 9d4:	7c 0a 48 40 	cmplw   r10,r9
 9d8:	41 80 ff d4 	blt     9ac <main+0x8c>
 9dc:	3d 20 03 00 	lis     r9,768
 9e0:	91 21 00 34 	stw     r9,52(r1)
 9e4:	81 21 00 34 	lwz     r9,52(r1)
 9e8:	3c 80 00 00 	lis     r4,0
 9ec:	60 84 00 09 	ori     r4,r4,9
 9f0:	7c 93 4b a6 	mtspr   307,r4
 9f4:	60 00 00 00 	nop
 9f8:	39 20 00 00 	li      r9,0
 9fc:	91 21 00 30 	stw     r9,48(r1)
 a00:	81 21 00 30 	lwz     r9,48(r1)
 a04:	3c 80 00 00 	lis     r4,0
 a08:	60 84 00 09 	ori     r4,r4,9
 a0c:	7c 96 03 a6 	mtdec   r4
 a10:	60 00 00 00 	nop
 a14:	39 20 00 00 	li      r9,0
 a18:	91 21 00 2c 	stw     r9,44(r1)
 a1c:	81 21 00 2c 	lwz     r9,44(r1)
 a20:	3c 80 00 00 	lis     r4,0
 a24:	60 84 00 09 	ori     r4,r4,9
 a28:	7c 9d 43 a6 	mttbu   r4
 a2c:	60 00 00 00 	nop
 a30:	39 20 00 00 	li      r9,0
 a34:	91 21 00 28 	stw     r9,40(r1)
 a38:	81 21 00 28 	lwz     r9,40(r1)
 a3c:	3c 80 00 00 	lis     r4,0
 a40:	60 84 00 09 	ori     r4,r4,9
 a44:	7c 9c 43 a6 	mttbl   r4
 a48:	60 00 00 00 	nop
 a4c:	3d 20 fe 00 	lis     r9,-512
 a50:	91 21 00 24 	stw     r9,36(r1)
 a54:	81 21 00 24 	lwz     r9,36(r1)
 a58:	3c 80 00 00 	lis     r4,0
 a5c:	60 84 00 09 	ori     r4,r4,9
 a60:	7c 90 53 a6 	mtspr   336,r4
 a64:	60 00 00 00 	nop
 a68:	7d 36 fa a6 	mfspr   r9,1014
 a6c:	91 21 00 20 	stw     r9,32(r1)
 a70:	81 21 00 20 	lwz     r9,32(r1)
 a74:	55 29 05 ac 	rlwinm  r9,r9,0,22,22
 a78:	91 21 00 1c 	stw     r9,28(r1)
 a7c:	81 21 00 1c 	lwz     r9,28(r1)
 a80:	3c 80 00 00 	lis     r4,0
 a84:	60 84 00 09 	ori     r4,r4,9
 a88:	7c 96 fb a6 	mtspr   1014,r4
 a8c:	60 00 00 00 	nop
 a90:	39 20 00 00 	li      r9,0
 a94:	91 21 00 18 	stw     r9,24(r1)
 a98:	81 21 00 18 	lwz     r9,24(r1)
 a9c:	3c 80 00 00 	lis     r4,0
 aa0:	60 84 00 09 	ori     r4,r4,9
 aa4:	7c 90 53 a6 	mtspr   336,r4
 aa8:	60 00 00 00 	nop
 aac:	39 20 00 00 	li      r9,0
 ab0:	91 21 00 14 	stw     r9,20(r1)
 ab4:	81 21 00 14 	lwz     r9,20(r1)
 ab8:	3c 80 00 00 	lis     r4,0
 abc:	60 84 00 09 	ori     r4,r4,9
 ac0:	7c 94 53 a6 	mtspr   340,r4
 ac4:	60 00 00 00 	nop
 ac8:	81 21 00 10 	lwz     r9,16(r1)
 acc:	7d 23 4b 78 	mr      r3,r9
 ad0:	48 00 03 70 	b       e40 <init_tst>
 ad4:	48 00 00 00 	b       ad4 <main+0x1b4>
 ad8:	7d 23 4b 78 	mr      r3,r9
 adc:	38 21 00 40 	addi    r1,r1,64
 ae0:	4e 80 00 20 	blr

00000ae4 <tst_done>:
 ae4:	94 21 ff e0 	stwu    r1,-32(r1)
 ae8:	7c 08 02 a6 	mflr    r0
 aec:	90 01 00 24 	stw     r0,36(r1)
 af0:	90 61 00 18 	stw     r3,24(r1)
 af4:	39 20 00 01 	li      r9,1
 af8:	91 21 00 08 	stw     r9,8(r1)
 afc:	39 20 00 00 	li      r9,0
 b00:	91 21 00 0c 	stw     r9,12(r1)
 b04:	81 41 00 18 	lwz     r10,24(r1)
 b08:	3d 20 08 67 	lis     r9,2151
 b0c:	61 29 53 09 	ori     r9,r9,21257
 b10:	7c 0a 48 00 	cmpw    r10,r9
 b14:	41 82 00 0c 	beq     b20 <tst_done+0x3c>
 b18:	39 20 00 00 	li      r9,0
 b1c:	91 21 00 08 	stw     r9,8(r1)
 b20:	81 21 00 08 	lwz     r9,8(r1)
 b24:	2c 09 00 00 	cmpwi   r9,0
 b28:	41 82 00 28 	beq     b50 <tst_done+0x6c>
 b2c:	3d 20 00 00 	lis     r9,0
 b30:	38 89 08 f0 	addi    r4,r9,2288
 b34:	38 60 00 20 	li      r3,32
 b38:	48 00 01 15 	bl      c4c <checkResult>
 b3c:	7c 69 1b 78 	mr      r9,r3
 b40:	2c 09 00 00 	cmpwi   r9,0
 b44:	41 82 00 0c 	beq     b50 <tst_done+0x6c>
 b48:	39 20 00 01 	li      r9,1
 b4c:	48 00 00 08 	b       b54 <tst_done+0x70>
 b50:	39 20 00 00 	li      r9,0
 b54:	91 21 00 08 	stw     r9,8(r1)
 b58:	81 21 00 08 	lwz     r9,8(r1)
 b5c:	2c 09 00 00 	cmpwi   r9,0
 b60:	41 82 00 28 	beq     b88 <tst_done+0xa4>
 b64:	3d 20 00 00 	lis     r9,0
 b68:	38 89 08 f4 	addi    r4,r9,2292
 b6c:	38 60 00 21 	li      r3,33
 b70:	48 00 00 dd 	bl      c4c <checkResult>
 b74:	7c 69 1b 78 	mr      r9,r3
 b78:	2c 09 00 00 	cmpwi   r9,0
 b7c:	41 82 00 0c 	beq     b88 <tst_done+0xa4>
 b80:	39 20 00 01 	li      r9,1
 b84:	48 00 00 08 	b       b8c <tst_done+0xa8>
 b88:	39 20 00 00 	li      r9,0
 b8c:	91 21 00 08 	stw     r9,8(r1)
 b90:	81 21 00 08 	lwz     r9,8(r1)
 b94:	2c 09 00 00 	cmpwi   r9,0
 b98:	41 82 00 28 	beq     bc0 <tst_done+0xdc>
 b9c:	3d 20 00 00 	lis     r9,0
 ba0:	38 89 08 f8 	addi    r4,r9,2296
 ba4:	38 60 00 22 	li      r3,34
 ba8:	48 00 00 a5 	bl      c4c <checkResult>
 bac:	7c 69 1b 78 	mr      r9,r3
 bb0:	2c 09 00 00 	cmpwi   r9,0
 bb4:	41 82 00 0c 	beq     bc0 <tst_done+0xdc>
 bb8:	39 20 00 01 	li      r9,1
 bbc:	48 00 00 08 	b       bc4 <tst_done+0xe0>
 bc0:	39 20 00 00 	li      r9,0
 bc4:	91 21 00 08 	stw     r9,8(r1)
 bc8:	81 21 00 08 	lwz     r9,8(r1)
 bcc:	2c 09 00 00 	cmpwi   r9,0
 bd0:	41 82 00 28 	beq     bf8 <tst_done+0x114>
 bd4:	3d 20 00 00 	lis     r9,0
 bd8:	38 89 08 fc 	addi    r4,r9,2300
 bdc:	38 60 00 23 	li      r3,35
 be0:	48 00 00 6d 	bl      c4c <checkResult>
 be4:	7c 69 1b 78 	mr      r9,r3
 be8:	2c 09 00 00 	cmpwi   r9,0
 bec:	41 82 00 0c 	beq     bf8 <tst_done+0x114>
 bf0:	39 20 00 01 	li      r9,1
 bf4:	48 00 00 08 	b       bfc <tst_done+0x118>
 bf8:	39 20 00 00 	li      r9,0
 bfc:	91 21 00 08 	stw     r9,8(r1)
 c00:	81 21 00 08 	lwz     r9,8(r1)
 c04:	2c 09 00 00 	cmpwi   r9,0
 c08:	41 82 00 28 	beq     c30 <tst_done+0x14c>
 c0c:	3d 20 00 00 	lis     r9,0
 c10:	38 89 09 00 	addi    r4,r9,2304
 c14:	38 60 00 24 	li      r3,36
 c18:	48 00 00 35 	bl      c4c <checkResult>
 c1c:	7c 69 1b 78 	mr      r9,r3
 c20:	2c 09 00 00 	cmpwi   r9,0
 c24:	41 82 00 0c 	beq     c30 <tst_done+0x14c>
 c28:	39 20 00 01 	li      r9,1
 c2c:	48 00 00 08 	b       c34 <tst_done+0x150>
 c30:	39 20 00 00 	li      r9,0
 c34:	91 21 00 08 	stw     r9,8(r1)
 c38:	60 00 00 00 	nop
 c3c:	80 01 00 24 	lwz     r0,36(r1)
 c40:	7c 08 03 a6 	mtlr    r0
 c44:	38 21 00 20 	addi    r1,r1,32
 c48:	4e 80 00 20 	blr

00000c4c <checkResult>:
 c4c:	94 21 ff e0 	stwu    r1,-32(r1)
 c50:	90 61 00 18 	stw     r3,24(r1)
 c54:	90 81 00 1c 	stw     r4,28(r1)
 c58:	39 20 00 01 	li      r9,1
 c5c:	91 21 00 08 	stw     r9,8(r1)
 c60:	81 21 00 18 	lwz     r9,24(r1)
 c64:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
 c68:	3d 20 00 00 	lis     r9,0
 c6c:	39 29 0d 20 	addi    r9,r9,3360
 c70:	7d 2a 4a 14 	add     r9,r10,r9
 c74:	81 29 00 00 	lwz     r9,0(r9)
 c78:	91 21 00 0c 	stw     r9,12(r1)
 c7c:	81 21 00 18 	lwz     r9,24(r1)
 c80:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
 c84:	3d 20 00 00 	lis     r9,0
 c88:	39 29 10 20 	addi    r9,r9,4128
 c8c:	7d 2a 4a 14 	add     r9,r10,r9
 c90:	81 29 00 00 	lwz     r9,0(r9)
 c94:	91 21 00 10 	stw     r9,16(r1)
 c98:	81 21 00 18 	lwz     r9,24(r1)
 c9c:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
 ca0:	3d 20 00 00 	lis     r9,0
 ca4:	39 29 10 c0 	addi    r9,r9,4288
 ca8:	7d 2a 4a 14 	add     r9,r10,r9
 cac:	81 29 00 00 	lwz     r9,0(r9)
 cb0:	91 21 00 14 	stw     r9,20(r1)
 cb4:	81 41 00 10 	lwz     r10,16(r1)
 cb8:	81 21 00 14 	lwz     r9,20(r1)
 cbc:	7d 49 4a 78 	xor     r9,r10,r9
 cc0:	31 49 ff ff 	addic   r10,r9,-1
 cc4:	7d 2a 49 10 	subfe   r9,r10,r9
 cc8:	55 29 06 3e 	clrlwi  r9,r9,24
 ccc:	91 21 00 08 	stw     r9,8(r1)
 cd0:	81 21 00 08 	lwz     r9,8(r1)
 cd4:	7d 23 4b 78 	mr      r3,r9
 cd8:	38 21 00 20 	addi    r1,r1,32
 cdc:	4e 80 00 20 	blr

00000ce0 <int_sc>:
 ce0:	94 21 ff f0 	stwu    r1,-16(r1)
 ce4:	90 61 00 08 	stw     r3,8(r1)
 ce8:	90 81 00 0c 	stw     r4,12(r1)
 cec:	48 00 02 48 	b       f34 <tst_end>
 cf0:	60 00 00 00 	nop
 cf4:	38 21 00 10 	addi    r1,r1,16
 cf8:	4e 80 00 20 	blr

00000cfc <int_unhandled>:
 cfc:	48 00 00 00 	b       cfc <int_unhandled>

Disassembly of section .arcitst:

00000d00 <tst_info>:
     d00:	69 6e 66 6f 	xori    r14,r11,26223
     d04:	20 74 65 78 	subfic  r3,r20,25976
     d08:	Address 0x0000000000000d08 is out of bounds.


00000d0a <tst_header>:
     d0a:	68 65 61 64 	xori    r5,r3,24932
     d0e:	65 72 20 74 	oris    r18,r11,8308
     d12:	65 78 74 00 	oris    r24,r11,29696
	...

00000d20 <tst_inits>:
     d20:	00 00 00 00 	.long 0x0

00000d24 <init_r1>:
     d24:	58 22 c9 05 	rlmi.   r2,r1,r25,4,2

00000d28 <init_r2>:
     d28:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d2c <init_r3>:
     d2c:	91 b6 d1 a3 	stw     r13,-11869(r22)

00000d30 <init_r4>:
     d30:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d34 <init_r5>:
     d34:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d38 <init_r6>:
     d38:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d3c <init_r7>:
     d3c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d40 <init_r8>:
     d40:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d44 <init_r9>:
     d44:	7e 11 ee 88 	.long 0x7e11ee88

00000d48 <init_r10>:
     d48:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d4c <init_r11>:
     d4c:	7f ff ff ff 	.long 0x7fffffff

00000d50 <init_r12>:
     d50:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d54 <init_r13>:
     d54:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d58 <init_r14>:
     d58:	8c 20 bd e6 	.long 0x8c20bde6

00000d5c <init_r15>:
     d5c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d60 <init_r16>:
     d60:	76 d0 da df 	andis.  r16,r22,56031

00000d64 <init_r17>:
     d64:	15 11 1f 42 	.long 0x15111f42

00000d68 <init_r18>:
     d68:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d6c <init_r19>:
     d6c:	36 10 8e 50 	addic.  r16,r16,-29104

00000d70 <init_r20>:
     d70:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d74 <init_r21>:
     d74:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d78 <init_r22>:
     d78:	32 8a 0c ed 	addic   r20,r10,3309

00000d7c <init_r23>:
     d7c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d80 <init_r24>:
     d80:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d84 <init_r25>:
     d84:	af 22 4c 19 	lhau    r25,19481(r2)

00000d88 <init_r26>:
     d88:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d8c <init_r27>:
     d8c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d90 <init_r28>:
     d90:	d6 24 b2 7a 	stfsu   f17,-19846(r4)

00000d94 <init_r29>:
     d94:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d98 <init_r30>:
     d98:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000d9c <init_r31>:
     d9c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000da0 <init_cr>:
     da0:	db fd 36 28 	stfd    f31,13864(r29)

00000da4 <init_xer>:
     da4:	89 f0 00 6e 	lbz     r15,110(r16)

00000da8 <init_ctr>:
     da8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000dac <init_lr>:
     dac:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000db0 <init_tar>:
     db0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00000db4 <init_msr>:
     db4:	00 00 11 04 	.long 0x1104

00000db8 <init_iar>:
     db8:	00 01 00 00 	.long 0x10000

00000dbc <save_r1>:
     dbc:	00 00 00 00 	.long 0x0

00000dc0 <codelen>:
     dc0:	00 00 00 0d 	.long 0xd

00000dc4 <ops>:
     dc4:	7c 61 cc 14 	addco   r3,r1,r25
     dc8:	7d 23 05 95 	addzeo. r9,r3
     dcc:	7a c3 73 92 	rldcr   r3,r22,r14,14
     dd0:	7e 09 4c 11 	subfco. r16,r9,r9
     dd4:	7e 1c b1 15 	adde.   r16,r28,r22
     dd8:	7a 33 88 86 	rldicr  r19,r17,49,2
     ddc:	7c 60 04 d1 	nego.   r3,r0
     de0:	7e 09 b0 38 	and     r9,r16,r22
     de4:	7c 36 05 91 	subfzeo. r1,r22
     de8:	7e 2b 00 d1 	neg.    r17,r11
     dec:	60 00 00 00 	nop
     df0:	60 00 00 00 	nop
     df4:	60 00 00 00 	nop

00000df8 <iars>:
     df8:	00 01 00 00 	.long 0x10000
     dfc:	00 01 00 04 	.long 0x10004
     e00:	00 01 00 08 	.long 0x10008
     e04:	00 01 00 0c 	.long 0x1000c
     e08:	00 01 00 10 	.long 0x10010
     e0c:	00 01 00 14 	.long 0x10014
     e10:	00 01 00 18 	.long 0x10018
     e14:	00 01 00 1c 	.long 0x1001c
     e18:	00 01 00 20 	.long 0x10020
     e1c:	00 01 00 24 	.long 0x10024
     e20:	00 01 00 28 	.long 0x10028
     e24:	00 01 00 2c 	.long 0x1002c
     e28:	00 01 00 30 	.long 0x10030
     e2c:	48 00 00 14 	b       e40 <init_tst>
     e30:	60 00 00 00 	nop
     e34:	60 00 00 00 	nop
     e38:	60 00 00 00 	nop
     e3c:	60 00 00 00 	nop

00000e40 <init_tst>:
     e40:	90 23 00 9c 	stw     r1,156(r3)

00000e44 <opcopy>:
     e44:	80 23 00 a0 	lwz     r1,160(r3)
     e48:	7c 29 03 a6 	mtctr   r1
     e4c:	38 23 00 a4 	addi    r1,r3,164
     e50:	38 43 00 d8 	addi    r2,r3,216

00000e54 <opcopy_loop>:
     e54:	80 81 00 00 	lwz     r4,0(r1)
     e58:	80 a2 00 00 	lwz     r5,0(r2)
     e5c:	90 85 00 00 	stw     r4,0(r5)
     e60:	38 21 00 04 	addi    r1,r1,4
     e64:	38 42 00 04 	addi    r2,r2,4
     e68:	42 00 ff ec 	bdnz    e54 <opcopy_loop>

00000e6c <opcopy_eot>:
     e6c:	3c 80 48 00 	lis     r4,18432
     e70:	60 84 00 06 	ori     r4,r4,6
     e74:	90 85 00 00 	stw     r4,0(r5)
     e78:	80 20 0d b4 	lwz     r1,3508(0)
     e7c:	7c 3b 03 a6 	mtsrr1  r1
     e80:	80 20 0d f8 	lwz     r1,3576(0)
     e84:	7c 3a 03 a6 	mtsrr0  r1

00000e88 <init_regs>:
     e88:	80 23 00 80 	lwz     r1,128(r3)
     e8c:	7c 2f f1 20 	mtcr    r1
     e90:	80 23 00 84 	lwz     r1,132(r3)
     e94:	7c 21 03 a6 	mtxer   r1
     e98:	80 23 00 88 	lwz     r1,136(r3)
     e9c:	7c 29 03 a6 	mtctr   r1
     ea0:	80 23 00 8c 	lwz     r1,140(r3)
     ea4:	7c 28 03 a6 	mtlr    r1
     ea8:	80 23 00 90 	lwz     r1,144(r3)
     eac:	7c 2f cb a6 	mtspr   815,r1
     eb0:	80 03 00 00 	lwz     r0,0(r3)
     eb4:	80 23 00 04 	lwz     r1,4(r3)
     eb8:	80 43 00 08 	lwz     r2,8(r3)
     ebc:	80 83 00 10 	lwz     r4,16(r3)
     ec0:	80 a3 00 14 	lwz     r5,20(r3)
     ec4:	80 c3 00 18 	lwz     r6,24(r3)
     ec8:	80 e3 00 1c 	lwz     r7,28(r3)
     ecc:	81 03 00 20 	lwz     r8,32(r3)
     ed0:	81 23 00 24 	lwz     r9,36(r3)
     ed4:	81 43 00 28 	lwz     r10,40(r3)
     ed8:	81 63 00 2c 	lwz     r11,44(r3)
     edc:	81 83 00 30 	lwz     r12,48(r3)
     ee0:	81 a3 00 34 	lwz     r13,52(r3)
     ee4:	81 c3 00 38 	lwz     r14,56(r3)
     ee8:	81 e3 00 3c 	lwz     r15,60(r3)
     eec:	82 03 00 40 	lwz     r16,64(r3)
     ef0:	82 23 00 44 	lwz     r17,68(r3)
     ef4:	82 43 00 48 	lwz     r18,72(r3)
     ef8:	82 63 00 4c 	lwz     r19,76(r3)
     efc:	82 83 00 50 	lwz     r20,80(r3)
     f00:	82 a3 00 54 	lwz     r21,84(r3)
     f04:	82 c3 00 58 	lwz     r22,88(r3)
     f08:	82 e3 00 5c 	lwz     r23,92(r3)
     f0c:	83 03 00 60 	lwz     r24,96(r3)
     f10:	83 23 00 64 	lwz     r25,100(r3)
     f14:	83 43 00 68 	lwz     r26,104(r3)
     f18:	83 63 00 6c 	lwz     r27,108(r3)
     f1c:	83 83 00 70 	lwz     r28,112(r3)
     f20:	83 a3 00 74 	lwz     r29,116(r3)
     f24:	83 c3 00 78 	lwz     r30,120(r3)
     f28:	83 e3 00 7c 	lwz     r31,124(r3)
     f2c:	80 63 00 0c 	lwz     r3,12(r3)

00000f30 <jmp2tst>:
     f30:	48 01 00 02 	ba      10000 <_ebss>

00000f34 <tst_end>:
     f34:	48 00 00 0c 	b       f40 <save_results>
     f38:	60 00 00 00 	nop
     f3c:	60 00 00 00 	nop

00000f40 <save_results>:
     f40:	7c 2f cb a6 	mtspr   815,r1
     f44:	3c 20 00 00 	lis     r1,0
     f48:	60 21 10 20 	ori     r1,r1,4128
     f4c:	90 01 00 00 	stw     r0,0(r1)
     f50:	90 41 00 08 	stw     r2,8(r1)
     f54:	90 61 00 0c 	stw     r3,12(r1)
     f58:	90 81 00 10 	stw     r4,16(r1)
     f5c:	90 a1 00 14 	stw     r5,20(r1)
     f60:	90 c1 00 18 	stw     r6,24(r1)
     f64:	90 e1 00 1c 	stw     r7,28(r1)
     f68:	91 01 00 20 	stw     r8,32(r1)
     f6c:	91 21 00 24 	stw     r9,36(r1)
     f70:	91 41 00 28 	stw     r10,40(r1)
     f74:	91 61 00 2c 	stw     r11,44(r1)
     f78:	91 81 00 30 	stw     r12,48(r1)
     f7c:	91 a1 00 34 	stw     r13,52(r1)
     f80:	91 c1 00 38 	stw     r14,56(r1)
     f84:	91 e1 00 3c 	stw     r15,60(r1)
     f88:	92 01 00 40 	stw     r16,64(r1)
     f8c:	92 21 00 44 	stw     r17,68(r1)
     f90:	92 41 00 48 	stw     r18,72(r1)
     f94:	92 61 00 4c 	stw     r19,76(r1)
     f98:	92 81 00 50 	stw     r20,80(r1)
     f9c:	92 a1 00 54 	stw     r21,84(r1)
     fa0:	92 c1 00 58 	stw     r22,88(r1)
     fa4:	92 e1 00 5c 	stw     r23,92(r1)
     fa8:	93 01 00 60 	stw     r24,96(r1)
     fac:	93 21 00 64 	stw     r25,100(r1)
     fb0:	93 41 00 68 	stw     r26,104(r1)
     fb4:	93 61 00 6c 	stw     r27,108(r1)
     fb8:	93 81 00 70 	stw     r28,112(r1)
     fbc:	93 a1 00 74 	stw     r29,116(r1)
     fc0:	93 c1 00 78 	stw     r30,120(r1)
     fc4:	93 e1 00 7c 	stw     r31,124(r1)
     fc8:	7c 4f ca a6 	mfspr   r2,815
     fcc:	90 41 00 04 	stw     r2,4(r1)
     fd0:	7c 40 00 26 	mfcr    r2
     fd4:	90 41 00 80 	stw     r2,128(r1)
     fd8:	7c 41 02 a6 	mfxer   r2
     fdc:	90 41 00 84 	stw     r2,132(r1)
     fe0:	7c 49 02 a6 	mfctr   r2
     fe4:	90 41 00 88 	stw     r2,136(r1)
     fe8:	7c 48 02 a6 	mflr    r2
     fec:	90 41 00 8c 	stw     r2,140(r1)
     ff0:	7c 4f ca a6 	mfspr   r2,815
     ff4:	90 41 00 90 	stw     r2,144(r1)

00000ff8 <tst_cleanup>:
     ff8:	3c 60 00 00 	lis     r3,0
     ffc:	60 63 0d 20 	ori     r3,r3,3360
    1000:	80 23 00 9c 	lwz     r1,156(r3)
    1004:	3c 60 08 67 	lis     r3,2151
    1008:	60 63 53 09 	ori     r3,r3,21257
    100c:	4b ff fa d8 	b       ae4 <tst_done>
    1010:	60 00 00 00 	nop
    1014:	60 00 00 00 	nop
    1018:	60 00 00 00 	nop
    101c:	60 00 00 00 	nop

00001020 <tst_results>:
    1020:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001024 <rslt_r1>:
    1024:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001028 <rslt_r2>:
    1028:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000102c <rslt_r3>:
    102c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001030 <rslt_r4>:
    1030:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001034 <rslt_r5>:
    1034:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001038 <rslt_r6>:
    1038:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000103c <rslt_r7>:
    103c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001040 <rslt_r8>:
    1040:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001044 <rslt_r9>:
    1044:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001048 <rslt_r10>:
    1048:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000104c <rslt_r11>:
    104c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001050 <rslt_r12>:
    1050:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001054 <rslt_r13>:
    1054:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001058 <rslt_r14>:
    1058:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000105c <rslt_r15>:
    105c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001060 <rslt_r16>:
    1060:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001064 <rslt_r17>:
    1064:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001068 <rslt_r18>:
    1068:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000106c <rslt_r19>:
    106c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001070 <rslt_r20>:
    1070:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001074 <rslt_r21>:
    1074:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001078 <rslt_r22>:
    1078:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000107c <rslt_r23>:
    107c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001080 <rslt_r24>:
    1080:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001084 <rslt_r25>:
    1084:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001088 <rslt_r26>:
    1088:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000108c <rslt_r27>:
    108c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001090 <rslt_r28>:
    1090:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001094 <rslt_r29>:
    1094:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001098 <rslt_r30>:
    1098:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000109c <rslt_r31>:
    109c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010a0 <rslt_cr>:
    10a0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010a4 <rslt_xer>:
    10a4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010a8 <rslt_ctr>:
    10a8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010ac <rslt_lr>:
    10ac:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010b0 <rslt_tar>:
    10b0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31
    10b4:	60 00 00 00 	nop
    10b8:	60 00 00 00 	nop
    10bc:	60 00 00 00 	nop

000010c0 <tst_expects>:
    10c0:	00 00 00 00 	.long 0x0

000010c4 <expt_r1>:
    10c4:	cd 75 f3 13 	lfdu    f11,-3309(r21)

000010c8 <expt_r2>:
    10c8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010cc <expt_r3>:
    10cc:	00 00 00 00 	.long 0x0

000010d0 <expt_r4>:
    10d0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010d4 <expt_r5>:
    10d4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010d8 <expt_r6>:
    10d8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010dc <expt_r7>:
    10dc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010e0 <expt_r8>:
    10e0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010e4 <expt_r9>:
    10e4:	00 8a 0c 68 	.long 0x8a0c68

000010e8 <expt_r10>:
    10e8:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010ec <expt_r11>:
    10ec:	7f ff ff ff 	.long 0x7fffffff

000010f0 <expt_r12>:
    10f0:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010f4 <expt_r13>:
    10f4:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

000010f8 <expt_r14>:
    10f8:	8c 20 bd e6 	.long 0x8c20bde6

000010fc <expt_r15>:
    10fc:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001100 <expt_r16>:
    1100:	08 ae bf 68 	tdlgei  r14,-16536

00001104 <expt_r17>:
    1104:	80 00 00 01 	lwz     r0,1(0)

00001108 <expt_r18>:
    1108:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000110c <expt_r19>:
    110c:	00 00 00 00 	.long 0x0

00001110 <expt_r20>:
    1110:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001114 <expt_r21>:
    1114:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001118 <expt_r22>:
    1118:	32 8a 0c ed 	addic   r20,r10,3309

0000111c <expt_r23>:
    111c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001120 <expt_r24>:
    1120:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001124 <expt_r25>:
    1124:	af 22 4c 19 	lhau    r25,19481(r2)

00001128 <expt_r26>:
    1128:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000112c <expt_r27>:
    112c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001130 <expt_r28>:
    1130:	d6 24 b2 7a 	stfsu   f17,-19846(r4)

00001134 <expt_r29>:
    1134:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001138 <expt_r30>:
    1138:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000113c <expt_r31>:
    113c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001140 <expt_cr>:
    1140:	9b fd 36 28 	stb     r31,13864(r29)

00001144 <expt_xer>:
    1144:	98 f0 00 6e 	stb     r7,110(r16)

00001148 <expt_ctr>:
    1148:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

0000114c <expt_lr>:
    114c:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001150 <expt_tar>:
    1150:	ff ff ff ff 	fnmadd. f31,f31,f31,f31

00001154 <expt_msr>:
    1154:	00 00 11 04 	.long 0x1104

00001158 <expt_iar>:
    1158:	00 01 00 38 	.long 0x10038

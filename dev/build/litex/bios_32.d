
build/cmod7_kintex/software/bios/bios.elf:     file format elf32-powerpc


Disassembly of section .text:

00000000 <_ftext>:
       0:	48 00 04 00 	b       400 <boot_start>
	...

00000020 <int_020>:
      20:	48 00 00 00 	b       20 <int_020>
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
     120:	48 00 00 00 	b       120 <int_120>
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
     408:	40 82 00 f4 	bne     4fc <init_t123>
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
     4cc:	38 20 00 01 	li      r1,1
     4d0:	7c 36 6b a6 	mtspr   438,r1
     4d4:	7c 21 08 f8 	not     r1,r1
     4d8:	7c 37 6b a6 	mtspr   439,r1
     4dc:	4c 00 01 2c 	isync
     4e0:	39 40 00 00 	li      r10,0
     4e4:	65 4a 00 02 	oris    r10,r10,2
     4e8:	61 4a b0 00 	ori     r10,r10,45056
     4ec:	7d 40 01 24 	mtmsr   r10
     4f0:	4c 00 01 2c 	isync
     4f4:	80 20 4e 58 	lwz     r1,20056(0)
     4f8:	48 00 00 20 	b       518 <boot_complete>

000004fc <init_t123>:
     4fc:	39 40 00 00 	li      r10,0
     500:	65 4a 00 02 	oris    r10,r10,2
     504:	61 4a b0 00 	ori     r10,r10,45056
     508:	7d 40 01 24 	mtmsr   r10
     50c:	4c 00 01 2c 	isync
     510:	80 20 4e 5c 	lwz     r1,20060(0)
     514:	48 00 00 04 	b       518 <boot_complete>

00000518 <boot_complete>:
     518:	3c 60 00 00 	lis     r3,0
     51c:	60 63 1f 38 	ori     r3,r3,7992
     520:	7c 69 03 a6 	mtctr   r3
     524:	7c 7e 6a a6 	mfspr   r3,446
     528:	4e 80 04 21 	bctrl
     52c:	48 00 02 d0 	b       7fc <kernel_return>

00000530 <_save32gpr_31>:
     530:	93 eb ff fc 	stw     r31,-4(r11)
     534:	4e 80 00 20 	blr

00000538 <_rest32gpr_16_x>:
     538:	82 0b ff c0 	lwz     r16,-64(r11)

0000053c <_rest32gpr_17_x>:
     53c:	82 2b ff c4 	lwz     r17,-60(r11)

00000540 <_rest32gpr_18_x>:
     540:	82 4b ff c8 	lwz     r18,-56(r11)

00000544 <_rest32gpr_19_x>:
     544:	82 6b ff cc 	lwz     r19,-52(r11)

00000548 <_rest32gpr_20_x>:
     548:	82 8b ff d0 	lwz     r20,-48(r11)

0000054c <_rest32gpr_21_x>:
     54c:	82 ab ff d4 	lwz     r21,-44(r11)

00000550 <_rest32gpr_22_x>:
     550:	82 cb ff d8 	lwz     r22,-40(r11)

00000554 <_rest32gpr_23_x>:
     554:	82 eb ff dc 	lwz     r23,-36(r11)

00000558 <_rest32gpr_24_x>:
     558:	83 0b ff e0 	lwz     r24,-32(r11)

0000055c <_rest32gpr_25_x>:
     55c:	83 2b ff e4 	lwz     r25,-28(r11)

00000560 <_rest32gpr_26_x>:
     560:	83 4b ff e8 	lwz     r26,-24(r11)

00000564 <_rest32gpr_27_x>:
     564:	83 6b ff ec 	lwz     r27,-20(r11)

00000568 <_rest32gpr_28_x>:
     568:	83 8b ff f0 	lwz     r28,-16(r11)

0000056c <_rest32gpr_29_x>:
     56c:	83 ab ff f4 	lwz     r29,-12(r11)

00000570 <_rest32gpr_30_x>:
     570:	83 cb ff f8 	lwz     r30,-8(r11)

00000574 <_rest32gpr_31_x>:
     574:	80 0b 00 04 	lwz     r0,4(r11)
     578:	83 eb ff fc 	lwz     r31,-4(r11)
     57c:	7c 08 03 a6 	mtlr    r0
     580:	7d 61 5b 78 	mr      r1,r11
     584:	4e 80 00 20 	blr
	...

000007fc <kernel_return>:
     7fc:	48 00 00 00 	b       7fc <kernel_return>

00000800 <int_800>:
     800:	48 00 00 00 	b       800 <int_800>
	...

00000820 <int_820>:
     820:	48 00 00 00 	b       820 <int_820>
	...

000008f0 <boot_helper>:
     8f0:	3c 60 00 02 	lis     r3,2
     8f4:	60 63 00 00 	ori     r3,r3,0
     8f8:	7c c9 03 a6 	mtctr   r6
     8fc:	4e 80 04 20 	bctr
     900:	94 21 ff e0 	stwu    r1,-32(r1)
     904:	7c 08 02 a6 	mflr    r0
     908:	90 01 00 24 	stw     r0,36(r1)
     90c:	90 61 00 08 	stw     r3,8(r1)
     910:	90 81 00 0c 	stw     r4,12(r1)
     914:	90 a1 00 10 	stw     r5,16(r1)
     918:	90 c1 00 14 	stw     r6,20(r1)
     91c:	38 60 00 77 	li      r3,119
     920:	54 63 40 2e 	rlwinm  r3,r3,8,0,23
     924:	60 63 00 74 	ori     r3,r3,116
     928:	54 63 40 2e 	rlwinm  r3,r3,8,0,23
     92c:	60 63 00 66 	ori     r3,r3,102
     930:	54 63 40 2e 	rlwinm  r3,r3,8,0,23
     934:	60 63 00 21 	ori     r3,r3,33
     938:	90 61 00 18 	stw     r3,24(r1)
     93c:	90 61 00 1c 	stw     r3,28(r1)
     940:	80 01 00 24 	lwz     r0,36(r1)
     944:	7c c8 03 a6 	mtlr    r6
     948:	38 21 00 20 	addi    r1,r1,32
     94c:	4e 80 00 20 	blr
     950:	48 00 00 00 	b       950 <boot_helper+0x60>

00000954 <swizzle>:
     954:	7c 69 1b 78 	mr      r9,r3
     958:	54 63 c0 3e 	rotlwi  r3,r3,24
     95c:	51 23 42 1e 	rlwimi  r3,r9,8,8,15
     960:	51 23 46 3e 	rlwimi  r3,r9,8,24,31
     964:	4e 80 00 20 	blr

00000968 <timer0_load>:
     968:	94 21 ff f0 	stwu    r1,-16(r1)
     96c:	39 20 00 00 	li      r9,0
     970:	93 e1 00 0c 	stw     r31,12(r1)
     974:	7c 08 02 a6 	mflr    r0
     978:	3f e0 ff f0 	lis     r31,-16
     97c:	90 01 00 14 	stw     r0,20(r1)
     980:	63 ff 40 08 	ori     r31,r31,16392
     984:	3d 40 ff f0 	lis     r10,-16
     988:	91 3f 00 00 	stw     r9,0(r31)
     98c:	61 4a 40 04 	ori     r10,r10,16388
     990:	91 2a 00 00 	stw     r9,0(r10)
     994:	4b ff ff c1 	bl      954 <swizzle>
     998:	3d 20 ff f0 	lis     r9,-16
     99c:	3d 40 ff f0 	lis     r10,-16
     9a0:	61 29 40 00 	ori     r9,r9,16384
     9a4:	61 4a 40 0c 	ori     r10,r10,16396
     9a8:	90 69 00 00 	stw     r3,0(r9)
     9ac:	3d 20 01 00 	lis     r9,256
     9b0:	91 3f 00 00 	stw     r9,0(r31)
     9b4:	91 2a 00 00 	stw     r9,0(r10)
     9b8:	39 61 00 10 	addi    r11,r1,16
     9bc:	4b ff fb b8 	b       574 <_rest32gpr_31_x>

000009c0 <jsmn_parse>:
     9c0:	7c 69 1b 78 	mr      r9,r3
     9c4:	80 63 00 04 	lwz     r3,4(r3)
     9c8:	94 21 ff c0 	stwu    r1,-64(r1)
     9cc:	38 00 00 01 	li      r0,1
     9d0:	be 81 00 10 	stmw    r20,16(r1)
     9d4:	7c c8 33 78 	mr      r8,r6
     9d8:	3f e0 04 00 	lis     r31,1024
     9dc:	3f 40 01 44 	lis     r26,324
     9e0:	3f 00 00 80 	lis     r24,128
     9e4:	63 ff 10 01 	ori     r31,r31,4097
     9e8:	2f 86 00 00 	cmpwi   cr7,r6,0
     9ec:	3b c0 00 04 	li      r30,4
     9f0:	39 80 00 00 	li      r12,0
     9f4:	3b a0 ff ff 	li      r29,-1
     9f8:	3b 86 00 04 	addi    r28,r6,4
     9fc:	3b 66 00 08 	addi    r27,r6,8
     a00:	63 5a 04 41 	ori     r26,r26,1089
     a04:	3b 20 00 03 	li      r25,3
     a08:	63 18 00 13 	ori     r24,r24,19
     a0c:	81 69 00 00 	lwz     r11,0(r9)
     a10:	7c 0b 28 40 	cmplw   r11,r5
     a14:	40 80 00 10 	bge     a24 <jsmn_parse+0x64>
     a18:	7d 44 58 ae 	lbzx    r10,r4,r11
     a1c:	2c 0a 00 00 	cmpwi   r10,0
     a20:	40 82 00 44 	bne     a64 <jsmn_parse+0xa4>
     a24:	2c 08 00 00 	cmpwi   r8,0
     a28:	41 82 00 30 	beq     a58 <jsmn_parse+0x98>
     a2c:	81 29 00 04 	lwz     r9,4(r9)
     a30:	38 88 00 04 	addi    r4,r8,4
     a34:	39 08 00 08 	addi    r8,r8,8
     a38:	39 49 ff ff 	addi    r10,r9,-1
     a3c:	39 29 00 01 	addi    r9,r9,1
     a40:	2c 0a ff ff 	cmpwi   r10,-1
     a44:	40 80 00 08 	bge     a4c <jsmn_parse+0x8c>
     a48:	39 20 00 01 	li      r9,1
     a4c:	2c 09 00 01 	cmpwi   r9,1
     a50:	39 29 ff ff 	addi    r9,r9,-1
     a54:	40 82 04 80 	bne     ed4 <jsmn_parse+0x514>
     a58:	ba 81 00 10 	lmw     r20,16(r1)
     a5c:	38 21 00 40 	addi    r1,r1,64
     a60:	4e 80 00 20 	blr
     a64:	28 0a 00 3a 	cmplwi  r10,58
     a68:	41 82 03 54 	beq     dbc <jsmn_parse+0x3fc>
     a6c:	41 81 00 8c 	bgt     af8 <jsmn_parse+0x138>
     a70:	28 0a 00 22 	cmplwi  r10,34
     a74:	41 82 01 d4 	beq     c48 <jsmn_parse+0x288>
     a78:	41 81 00 30 	bgt     aa8 <jsmn_parse+0xe8>
     a7c:	39 4a ff f7 	addi    r10,r10,-9
     a80:	55 4a 06 3e 	clrlwi  r10,r10,24
     a84:	28 0a 00 17 	cmplwi  r10,23
     a88:	41 81 00 28 	bgt     ab0 <jsmn_parse+0xf0>
     a8c:	7c 0a 50 30 	slw     r10,r0,r10
     a90:	7d 4a c0 39 	and.    r10,r10,r24
     a94:	41 82 00 1c 	beq     ab0 <jsmn_parse+0xf0>
     a98:	81 49 00 00 	lwz     r10,0(r9)
     a9c:	39 4a 00 01 	addi    r10,r10,1
     aa0:	91 49 00 00 	stw     r10,0(r9)
     aa4:	4b ff ff 68 	b       a0c <jsmn_parse+0x4c>
     aa8:	28 0a 00 2c 	cmplwi  r10,44
     aac:	41 82 03 20 	beq     dcc <jsmn_parse+0x40c>
     ab0:	82 c9 00 00 	lwz     r22,0(r9)
     ab4:	7c 05 b0 40 	cmplw   r5,r22
     ab8:	40 81 00 30 	ble     ae8 <jsmn_parse+0x128>
     abc:	7d 44 b0 ae 	lbzx    r10,r4,r22
     ac0:	2c 0a 00 00 	cmpwi   r10,0
     ac4:	41 82 00 24 	beq     ae8 <jsmn_parse+0x128>
     ac8:	28 0a 00 3a 	cmplwi  r10,58
     acc:	41 81 03 c8 	bgt     e94 <jsmn_parse+0x4d4>
     ad0:	28 0a 00 1f 	cmplwi  r10,31
     ad4:	41 81 03 84 	bgt     e58 <jsmn_parse+0x498>
     ad8:	28 0a 00 0a 	cmplwi  r10,10
     adc:	41 81 03 ac 	bgt     e88 <jsmn_parse+0x4c8>
     ae0:	28 0a 00 08 	cmplwi  r10,8
     ae4:	40 81 03 88 	ble     e6c <jsmn_parse+0x4ac>
     ae8:	40 9e 03 bc 	bne     cr7,ea4 <jsmn_parse+0x4e4>
     aec:	3a d6 ff ff 	addi    r22,r22,-1
     af0:	92 c9 00 00 	stw     r22,0(r9)
     af4:	48 00 01 c4 	b       cb8 <jsmn_parse+0x2f8>
     af8:	28 0a 00 7b 	cmplwi  r10,123
     afc:	41 82 00 70 	beq     b6c <jsmn_parse+0x1ac>
     b00:	41 81 00 20 	bgt     b20 <jsmn_parse+0x160>
     b04:	28 0a 00 5b 	cmplwi  r10,91
     b08:	41 82 00 64 	beq     b6c <jsmn_parse+0x1ac>
     b0c:	28 0a 00 5d 	cmplwi  r10,93
     b10:	40 82 ff a0 	bne     ab0 <jsmn_parse+0xf0>
     b14:	41 9e ff 84 	beq     cr7,a98 <jsmn_parse+0xd8>
     b18:	3a a0 00 02 	li      r21,2
     b1c:	48 00 00 14 	b       b30 <jsmn_parse+0x170>
     b20:	28 0a 00 7d 	cmplwi  r10,125
     b24:	40 82 ff 8c 	bne     ab0 <jsmn_parse+0xf0>
     b28:	41 9e ff 70 	beq     cr7,a98 <jsmn_parse+0xd8>
     b2c:	3a a0 00 01 	li      r21,1
     b30:	81 49 00 04 	lwz     r10,4(r9)
     b34:	38 ca ff ff 	addi    r6,r10,-1
     b38:	55 57 20 36 	rlwinm  r23,r10,4,0,27
     b3c:	2c 06 ff ff 	cmpwi   r6,-1
     b40:	7e e8 ba 14 	add     r23,r8,r23
     b44:	39 4a 00 01 	addi    r10,r10,1
     b48:	40 80 00 08 	bge     b50 <jsmn_parse+0x190>
     b4c:	39 40 00 01 	li      r10,1
     b50:	2c 0a 00 01 	cmpwi   r10,1
     b54:	39 4a ff ff 	addi    r10,r10,-1
     b58:	40 82 00 80 	bne     bd8 <jsmn_parse+0x218>
     b5c:	2c 06 ff ff 	cmpwi   r6,-1
     b60:	40 82 ff 38 	bne     a98 <jsmn_parse+0xd8>
     b64:	38 60 ff fe 	li      r3,-2
     b68:	4b ff fe f0 	b       a58 <jsmn_parse+0x98>
     b6c:	38 63 00 01 	addi    r3,r3,1
     b70:	41 9e ff 28 	beq     cr7,a98 <jsmn_parse+0xd8>
     b74:	80 c9 00 04 	lwz     r6,4(r9)
     b78:	7c 07 30 40 	cmplw   r7,r6
     b7c:	40 81 01 14 	ble     c90 <jsmn_parse+0x2d0>
     b80:	3a e6 00 01 	addi    r23,r6,1
     b84:	92 e9 00 04 	stw     r23,4(r9)
     b88:	82 e9 00 08 	lwz     r23,8(r9)
     b8c:	54 d4 20 36 	rlwinm  r20,r6,4,0,27
     b90:	7e c8 a2 14 	add     r22,r8,r20
     b94:	93 b6 00 08 	stw     r29,8(r22)
     b98:	91 96 00 0c 	stw     r12,12(r22)
     b9c:	2c 17 ff ff 	cmpwi   r23,-1
     ba0:	41 82 00 18 	beq     bb8 <jsmn_parse+0x1f8>
     ba4:	56 f7 20 36 	rlwinm  r23,r23,4,0,27
     ba8:	7e e8 ba 14 	add     r23,r8,r23
     bac:	82 b7 00 0c 	lwz     r21,12(r23)
     bb0:	3a b5 00 01 	addi    r21,r21,1
     bb4:	92 b7 00 0c 	stw     r21,12(r23)
     bb8:	3a e0 00 01 	li      r23,1
     bbc:	28 0a 00 7b 	cmplwi  r10,123
     bc0:	41 82 00 08 	beq     bc8 <jsmn_parse+0x208>
     bc4:	3a e0 00 02 	li      r23,2
     bc8:	7e e8 a1 2e 	stwx    r23,r8,r20
     bcc:	91 76 00 04 	stw     r11,4(r22)
     bd0:	90 c9 00 08 	stw     r6,8(r9)
     bd4:	4b ff fe c4 	b       a98 <jsmn_parse+0xd8>
     bd8:	82 97 ff f4 	lwz     r20,-12(r23)
     bdc:	3a d7 ff f0 	addi    r22,r23,-16
     be0:	2c 14 ff ff 	cmpwi   r20,-1
     be4:	41 82 00 58 	beq     c3c <jsmn_parse+0x27c>
     be8:	82 f7 ff f8 	lwz     r23,-8(r23)
     bec:	2c 17 ff ff 	cmpwi   r23,-1
     bf0:	40 82 00 4c 	bne     c3c <jsmn_parse+0x27c>
     bf4:	81 56 00 00 	lwz     r10,0(r22)
     bf8:	7c 0a a8 00 	cmpw    r10,r21
     bfc:	40 82 ff 68 	bne     b64 <jsmn_parse+0x1a4>
     c00:	92 e9 00 08 	stw     r23,8(r9)
     c04:	39 6b 00 01 	addi    r11,r11,1
     c08:	39 46 00 01 	addi    r10,r6,1
     c0c:	91 76 00 08 	stw     r11,8(r22)
     c10:	7d 49 03 a6 	mtctr   r10
     c14:	54 cb 20 36 	rlwinm  r11,r6,4,0,27
     c18:	7d 5c 58 2e 	lwzx    r10,r28,r11
     c1c:	2c 0a ff ff 	cmpwi   r10,-1
     c20:	41 82 00 10 	beq     c30 <jsmn_parse+0x270>
     c24:	7d 5b 58 2e 	lwzx    r10,r27,r11
     c28:	2c 0a ff ff 	cmpwi   r10,-1
     c2c:	41 82 ff a4 	beq     bd0 <jsmn_parse+0x210>
     c30:	38 c6 ff ff 	addi    r6,r6,-1
     c34:	42 00 ff e0 	bdnz    c14 <jsmn_parse+0x254>
     c38:	4b ff fe 60 	b       a98 <jsmn_parse+0xd8>
     c3c:	38 c6 ff ff 	addi    r6,r6,-1
     c40:	7e d7 b3 78 	mr      r23,r22
     c44:	4b ff ff 0c 	b       b50 <jsmn_parse+0x190>
     c48:	3a cb 00 01 	addi    r22,r11,1
     c4c:	92 c9 00 00 	stw     r22,0(r9)
     c50:	82 e9 00 00 	lwz     r23,0(r9)
     c54:	7c 05 b8 40 	cmplw   r5,r23
     c58:	40 81 00 10 	ble     c68 <jsmn_parse+0x2a8>
     c5c:	7d 44 b8 ae 	lbzx    r10,r4,r23
     c60:	2c 0a 00 00 	cmpwi   r10,0
     c64:	40 82 00 10 	bne     c74 <jsmn_parse+0x2b4>
     c68:	91 69 00 00 	stw     r11,0(r9)
     c6c:	38 60 ff fd 	li      r3,-3
     c70:	4b ff fd e8 	b       a58 <jsmn_parse+0x98>
     c74:	28 0a 00 22 	cmplwi  r10,34
     c78:	40 82 00 6c 	bne     ce4 <jsmn_parse+0x324>
     c7c:	41 9e 00 3c 	beq     cr7,cb8 <jsmn_parse+0x2f8>
     c80:	81 49 00 04 	lwz     r10,4(r9)
     c84:	7c 07 50 40 	cmplw   r7,r10
     c88:	41 81 00 10 	bgt     c98 <jsmn_parse+0x2d8>
     c8c:	91 69 00 00 	stw     r11,0(r9)
     c90:	38 60 ff ff 	li      r3,-1
     c94:	4b ff fd c4 	b       a58 <jsmn_parse+0x98>
     c98:	38 ca 00 01 	addi    r6,r10,1
     c9c:	55 4a 20 36 	rlwinm  r10,r10,4,0,27
     ca0:	90 c9 00 04 	stw     r6,4(r9)
     ca4:	7c c8 52 14 	add     r6,r8,r10
     ca8:	7f 28 51 2e 	stwx    r25,r8,r10
     cac:	92 c6 00 04 	stw     r22,4(r6)
     cb0:	92 e6 00 08 	stw     r23,8(r6)
     cb4:	91 86 00 0c 	stw     r12,12(r6)
     cb8:	81 49 00 08 	lwz     r10,8(r9)
     cbc:	38 63 00 01 	addi    r3,r3,1
     cc0:	2c 0a ff ff 	cmpwi   r10,-1
     cc4:	41 82 fd d4 	beq     a98 <jsmn_parse+0xd8>
     cc8:	41 9e fd d0 	beq     cr7,a98 <jsmn_parse+0xd8>
     ccc:	55 4a 20 36 	rlwinm  r10,r10,4,0,27
     cd0:	7d 48 52 14 	add     r10,r8,r10
     cd4:	80 ca 00 0c 	lwz     r6,12(r10)
     cd8:	38 c6 00 01 	addi    r6,r6,1
     cdc:	90 ca 00 0c 	stw     r6,12(r10)
     ce0:	4b ff fd b8 	b       a98 <jsmn_parse+0xd8>
     ce4:	28 0a 00 5c 	cmplwi  r10,92
     ce8:	40 82 00 38 	bne     d20 <jsmn_parse+0x360>
     cec:	39 57 00 01 	addi    r10,r23,1
     cf0:	7c 05 50 40 	cmplw   r5,r10
     cf4:	40 81 00 2c 	ble     d20 <jsmn_parse+0x360>
     cf8:	91 49 00 00 	stw     r10,0(r9)
     cfc:	7d 44 50 ae 	lbzx    r10,r4,r10
     d00:	28 0a 00 75 	cmplwi  r10,117
     d04:	41 81 00 94 	bgt     d98 <jsmn_parse+0x3d8>
     d08:	28 0a 00 5b 	cmplwi  r10,91
     d0c:	41 81 00 24 	bgt     d30 <jsmn_parse+0x370>
     d10:	28 0a 00 22 	cmplwi  r10,34
     d14:	41 82 00 0c 	beq     d20 <jsmn_parse+0x360>
     d18:	28 0a 00 2f 	cmplwi  r10,47
     d1c:	40 82 00 7c 	bne     d98 <jsmn_parse+0x3d8>
     d20:	81 49 00 00 	lwz     r10,0(r9)
     d24:	39 4a 00 01 	addi    r10,r10,1
     d28:	91 49 00 00 	stw     r10,0(r9)
     d2c:	4b ff ff 24 	b       c50 <jsmn_parse+0x290>
     d30:	39 4a ff a4 	addi    r10,r10,-92
     d34:	55 4a 06 3e 	clrlwi  r10,r10,24
     d38:	7c 0a 50 30 	slw     r10,r0,r10
     d3c:	7d 46 d0 39 	and.    r6,r10,r26
     d40:	40 82 ff e0 	bne     d20 <jsmn_parse+0x360>
     d44:	75 4a 02 00 	andis.  r10,r10,512
     d48:	41 82 00 50 	beq     d98 <jsmn_parse+0x3d8>
     d4c:	3a f7 00 02 	addi    r23,r23,2
     d50:	39 40 00 04 	li      r10,4
     d54:	92 e9 00 00 	stw     r23,0(r9)
     d58:	7d 49 03 a6 	mtctr   r10
     d5c:	80 c9 00 00 	lwz     r6,0(r9)
     d60:	7c 05 30 40 	cmplw   r5,r6
     d64:	40 81 00 48 	ble     dac <jsmn_parse+0x3ec>
     d68:	7d 44 30 ae 	lbzx    r10,r4,r6
     d6c:	2c 0a 00 00 	cmpwi   r10,0
     d70:	41 82 00 3c 	beq     dac <jsmn_parse+0x3ec>
     d74:	3a ea ff d0 	addi    r23,r10,-48
     d78:	56 f7 06 3e 	clrlwi  r23,r23,24
     d7c:	28 17 00 09 	cmplwi  r23,9
     d80:	40 81 00 20 	ble     da0 <jsmn_parse+0x3e0>
     d84:	55 4a 06 f2 	rlwinm  r10,r10,0,27,25
     d88:	39 4a ff bf 	addi    r10,r10,-65
     d8c:	55 4a 06 3e 	clrlwi  r10,r10,24
     d90:	28 0a 00 05 	cmplwi  r10,5
     d94:	40 81 00 0c 	ble     da0 <jsmn_parse+0x3e0>
     d98:	91 69 00 00 	stw     r11,0(r9)
     d9c:	4b ff fd c8 	b       b64 <jsmn_parse+0x1a4>
     da0:	38 c6 00 01 	addi    r6,r6,1
     da4:	90 c9 00 00 	stw     r6,0(r9)
     da8:	42 00 ff b4 	bdnz    d5c <jsmn_parse+0x39c>
     dac:	81 49 00 00 	lwz     r10,0(r9)
     db0:	39 4a ff ff 	addi    r10,r10,-1
     db4:	91 49 00 00 	stw     r10,0(r9)
     db8:	4b ff ff 68 	b       d20 <jsmn_parse+0x360>
     dbc:	81 49 00 04 	lwz     r10,4(r9)
     dc0:	39 4a ff ff 	addi    r10,r10,-1
     dc4:	91 49 00 08 	stw     r10,8(r9)
     dc8:	4b ff fc d0 	b       a98 <jsmn_parse+0xd8>
     dcc:	41 9e fc cc 	beq     cr7,a98 <jsmn_parse+0xd8>
     dd0:	81 49 00 08 	lwz     r10,8(r9)
     dd4:	2c 0a ff ff 	cmpwi   r10,-1
     dd8:	41 82 fc c0 	beq     a98 <jsmn_parse+0xd8>
     ddc:	55 4a 20 36 	rlwinm  r10,r10,4,0,27
     de0:	7d 48 50 2e 	lwzx    r10,r8,r10
     de4:	39 4a ff ff 	addi    r10,r10,-1
     de8:	28 0a 00 01 	cmplwi  r10,1
     dec:	40 81 fc ac 	ble     a98 <jsmn_parse+0xd8>
     df0:	81 49 00 04 	lwz     r10,4(r9)
     df4:	3a ea ff ff 	addi    r23,r10,-1
     df8:	55 4b 20 36 	rlwinm  r11,r10,4,0,27
     dfc:	2c 17 ff ff 	cmpwi   r23,-1
     e00:	7d 68 5a 14 	add     r11,r8,r11
     e04:	39 4a 00 01 	addi    r10,r10,1
     e08:	40 80 00 08 	bge     e10 <jsmn_parse+0x450>
     e0c:	39 40 00 01 	li      r10,1
     e10:	2c 0a 00 01 	cmpwi   r10,1
     e14:	39 4a ff ff 	addi    r10,r10,-1
     e18:	41 82 fc 80 	beq     a98 <jsmn_parse+0xd8>
     e1c:	80 cb ff f0 	lwz     r6,-16(r11)
     e20:	38 c6 ff ff 	addi    r6,r6,-1
     e24:	28 06 00 01 	cmplwi  r6,1
     e28:	41 81 00 24 	bgt     e4c <jsmn_parse+0x48c>
     e2c:	80 cb ff f4 	lwz     r6,-12(r11)
     e30:	2c 06 ff ff 	cmpwi   r6,-1
     e34:	41 82 00 18 	beq     e4c <jsmn_parse+0x48c>
     e38:	80 cb ff f8 	lwz     r6,-8(r11)
     e3c:	2c 06 ff ff 	cmpwi   r6,-1
     e40:	40 82 00 0c 	bne     e4c <jsmn_parse+0x48c>
     e44:	92 e9 00 08 	stw     r23,8(r9)
     e48:	4b ff fc 50 	b       a98 <jsmn_parse+0xd8>
     e4c:	3a f7 ff ff 	addi    r23,r23,-1
     e50:	39 6b ff f0 	addi    r11,r11,-16
     e54:	4b ff ff bc 	b       e10 <jsmn_parse+0x450>
     e58:	3a ea ff e0 	addi    r23,r10,-32
     e5c:	56 f7 06 3e 	clrlwi  r23,r23,24
     e60:	7c 17 b8 30 	slw     r23,r0,r23
     e64:	7e e6 f8 39 	and.    r6,r23,r31
     e68:	40 82 fc 80 	bne     ae8 <jsmn_parse+0x128>
     e6c:	3a ea ff e0 	addi    r23,r10,-32
     e70:	56 f7 06 3e 	clrlwi  r23,r23,24
     e74:	28 17 00 5e 	cmplwi  r23,94
     e78:	41 81 ff 20 	bgt     d98 <jsmn_parse+0x3d8>
     e7c:	3a d6 00 01 	addi    r22,r22,1
     e80:	92 c9 00 00 	stw     r22,0(r9)
     e84:	4b ff fc 2c 	b       ab0 <jsmn_parse+0xf0>
     e88:	28 0a 00 0d 	cmplwi  r10,13
     e8c:	40 82 ff e0 	bne     e6c <jsmn_parse+0x4ac>
     e90:	4b ff fc 58 	b       ae8 <jsmn_parse+0x128>
     e94:	71 46 00 df 	andi.   r6,r10,223
     e98:	2c 06 00 5d 	cmpwi   r6,93
     e9c:	40 82 ff d0 	bne     e6c <jsmn_parse+0x4ac>
     ea0:	4b ff fc 48 	b       ae8 <jsmn_parse+0x128>
     ea4:	82 e9 00 04 	lwz     r23,4(r9)
     ea8:	7c 07 b8 40 	cmplw   r7,r23
     eac:	40 81 fd e0 	ble     c8c <jsmn_parse+0x2cc>
     eb0:	39 57 00 01 	addi    r10,r23,1
     eb4:	56 f7 20 36 	rlwinm  r23,r23,4,0,27
     eb8:	91 49 00 04 	stw     r10,4(r9)
     ebc:	7d 48 ba 14 	add     r10,r8,r23
     ec0:	7f c8 b9 2e 	stwx    r30,r8,r23
     ec4:	91 6a 00 04 	stw     r11,4(r10)
     ec8:	92 ca 00 08 	stw     r22,8(r10)
     ecc:	91 8a 00 0c 	stw     r12,12(r10)
     ed0:	4b ff fc 1c 	b       aec <jsmn_parse+0x12c>
     ed4:	55 45 20 36 	rlwinm  r5,r10,4,0,27
     ed8:	7c e4 28 2e 	lwzx    r7,r4,r5
     edc:	2c 07 ff ff 	cmpwi   r7,-1
     ee0:	41 82 00 10 	beq     ef0 <jsmn_parse+0x530>
     ee4:	7c e8 28 2e 	lwzx    r7,r8,r5
     ee8:	2c 07 ff ff 	cmpwi   r7,-1
     eec:	41 82 fd 80 	beq     c6c <jsmn_parse+0x2ac>
     ef0:	39 4a ff ff 	addi    r10,r10,-1
     ef4:	4b ff fb 58 	b       a4c <jsmn_parse+0x8c>

00000ef8 <jsmn_init>:
     ef8:	39 20 00 00 	li      r9,0
     efc:	91 23 00 00 	stw     r9,0(r3)
     f00:	91 23 00 04 	stw     r9,4(r3)
     f04:	39 20 ff ff 	li      r9,-1
     f08:	91 23 00 08 	stw     r9,8(r3)
     f0c:	4e 80 00 20 	blr

00000f10 <boot>:
     f10:	94 21 ff e0 	stwu    r1,-32(r1)
     f14:	7c 08 02 a6 	mflr    r0
     f18:	bf 81 00 10 	stmw    r28,16(r1)
     f1c:	90 01 00 24 	stw     r0,36(r1)
     f20:	7c bc 2b 78 	mr      r28,r5
     f24:	7c df 33 78 	mr      r31,r6
     f28:	7c 7e 1b 78 	mr      r30,r3
     f2c:	7c 9d 23 78 	mr      r29,r4
     f30:	3c 60 00 00 	lis     r3,0
     f34:	7c c4 33 78 	mr      r4,r6
     f38:	38 63 4e 60 	addi    r3,r3,20064
     f3c:	4c c6 31 82 	crclr   4*cr1+eq
     f40:	48 00 23 3d 	bl      327c <printf>
     f44:	3c 60 00 00 	lis     r3,0
     f48:	38 63 4e 86 	addi    r3,r3,20102
     f4c:	4c c6 31 82 	crclr   4*cr1+eq
     f50:	48 00 23 2d 	bl      327c <printf>
     f54:	48 00 3e d1 	bl      4e24 <uart_sync>
     f58:	48 00 33 91 	bl      42e8 <flush_l2_cache>
     f5c:	7f e6 fb 78 	mr      r6,r31
     f60:	7f 85 e3 78 	mr      r5,r28
     f64:	7f a4 eb 78 	mr      r4,r29
     f68:	7f c3 f3 78 	mr      r3,r30
     f6c:	4b ff f9 85 	bl      8f0 <boot_helper>
     f70:	48 00 00 00 	b       f70 <boot+0x60>

00000f74 <serialboot>:
     f74:	94 21 fe d0 	stwu    r1,-304(r1)
     f78:	7c 08 02 a6 	mflr    r0
     f7c:	bf 41 01 18 	stmw    r26,280(r1)
     f80:	90 01 01 34 	stw     r0,308(r1)
     f84:	3c 60 00 00 	lis     r3,0
     f88:	3f e0 00 00 	lis     r31,0
     f8c:	38 63 4e ba 	addi    r3,r3,20154
     f90:	3b ff 4f 38 	addi    r31,r31,20280
     f94:	4c c6 31 82 	crclr   4*cr1+eq
     f98:	48 00 22 e5 	bl      327c <printf>
     f9c:	7f fd fb 78 	mr      r29,r31
     fa0:	3c 60 00 00 	lis     r3,0
     fa4:	38 63 4e d2 	addi    r3,r3,20178
     fa8:	4c c6 31 82 	crclr   4*cr1+eq
     fac:	48 00 22 d1 	bl      327c <printf>
     fb0:	88 7f 00 00 	lbz     r3,0(r31)
     fb4:	2c 03 00 00 	cmpwi   r3,0
     fb8:	40 82 00 44 	bne     ffc <serialboot+0x88>
     fbc:	3c 60 01 7d 	lis     r3,381
     fc0:	3f c0 ff f0 	lis     r30,-16
     fc4:	60 63 78 40 	ori     r3,r3,30784
     fc8:	3f 80 ff f0 	lis     r28,-16
     fcc:	4b ff f9 9d 	bl      968 <timer0_load>
     fd0:	3b e0 00 00 	li      r31,0
     fd4:	63 de 40 10 	ori     r30,r30,16400
     fd8:	63 9c 40 0c 	ori     r28,r28,16396
     fdc:	3f 60 01 00 	lis     r27,256
     fe0:	80 7e 00 00 	lwz     r3,0(r30)
     fe4:	4b ff f9 71 	bl      954 <swizzle>
     fe8:	2c 03 00 00 	cmpwi   r3,0
     fec:	40 82 00 1c 	bne     1008 <serialboot+0x94>
     ff0:	3c 60 00 00 	lis     r3,0
     ff4:	38 63 4f 22 	addi    r3,r3,20258
     ff8:	48 00 01 58 	b       1150 <serialboot+0x1dc>
     ffc:	48 00 3d 99 	bl      4d94 <uart_write>
    1000:	3b ff 00 01 	addi    r31,r31,1
    1004:	4b ff ff ac 	b       fb0 <serialboot+0x3c>
    1008:	48 00 3d 59 	bl      4d60 <uart_read_nonblock>
    100c:	2c 03 00 00 	cmpwi   r3,0
    1010:	41 82 00 b4 	beq     10c4 <serialboot+0x150>
    1014:	48 00 3c f9 	bl      4d0c <uart_read>
    1018:	28 03 00 51 	cmplwi  r3,81
    101c:	41 82 01 cc 	beq     11e8 <serialboot+0x274>
    1020:	28 03 00 1b 	cmplwi  r3,27
    1024:	41 82 01 c4 	beq     11e8 <serialboot+0x274>
    1028:	7d 3d fa 14 	add     r9,r29,r31
    102c:	89 29 00 10 	lbz     r9,16(r9)
    1030:	7c 09 18 00 	cmpw    r9,r3
    1034:	40 82 00 84 	bne     10b8 <serialboot+0x144>
    1038:	3b ff 00 01 	addi    r31,r31,1
    103c:	2c 1f 00 0e 	cmpwi   r31,14
    1040:	40 82 00 84 	bne     10c4 <serialboot+0x150>
    1044:	3f a0 00 5f 	lis     r29,95
    1048:	3f 80 ff f0 	lis     r28,-16
    104c:	3f 40 ff f0 	lis     r26,-16
    1050:	3b c0 00 00 	li      r30,0
    1054:	63 bd 5e 10 	ori     r29,r29,24080
    1058:	63 9c 40 0c 	ori     r28,r28,16396
    105c:	3f 60 01 00 	lis     r27,256
    1060:	63 5a 40 10 	ori     r26,r26,16400
    1064:	3b e0 00 00 	li      r31,0
    1068:	48 00 3c f9 	bl      4d60 <uart_read_nonblock>
    106c:	2c 03 00 00 	cmpwi   r3,0
    1070:	41 82 00 20 	beq     1090 <serialboot+0x11c>
    1074:	2c 1f 00 00 	cmpwi   r31,0
    1078:	40 82 00 54 	bne     10cc <serialboot+0x158>
    107c:	7f a3 eb 78 	mr      r3,r29
    1080:	4b ff f8 e9 	bl      968 <timer0_load>
    1084:	48 00 3c 89 	bl      4d0c <uart_read>
    1088:	98 61 00 08 	stb     r3,8(r1)
    108c:	3b ff 00 01 	addi    r31,r31,1
    1090:	93 7c 00 00 	stw     r27,0(r28)
    1094:	2c 1f 00 00 	cmpwi   r31,0
    1098:	41 82 ff d0 	beq     1068 <serialboot+0xf4>
    109c:	80 7a 00 00 	lwz     r3,0(r26)
    10a0:	4b ff f8 b5 	bl      954 <swizzle>
    10a4:	2c 03 00 00 	cmpwi   r3,0
    10a8:	40 82 ff c0 	bne     1068 <serialboot+0xf4>
    10ac:	38 60 00 45 	li      r3,69
    10b0:	48 00 3c e5 	bl      4d94 <uart_write>
    10b4:	4b ff ff b0 	b       1064 <serialboot+0xf0>
    10b8:	68 63 00 7a 	xori    r3,r3,122
    10bc:	7c 63 00 34 	cntlzw  r3,r3
    10c0:	54 7f d9 7e 	rlwinm  r31,r3,27,5,31
    10c4:	93 7c 00 00 	stw     r27,0(r28)
    10c8:	4b ff ff 18 	b       fe0 <serialboot+0x6c>
    10cc:	2c 1f 00 01 	cmpwi   r31,1
    10d0:	41 82 00 18 	beq     10e8 <serialboot+0x174>
    10d4:	2c 1f 00 02 	cmpwi   r31,2
    10d8:	40 82 00 1c 	bne     10f4 <serialboot+0x180>
    10dc:	48 00 3c 31 	bl      4d0c <uart_read>
    10e0:	98 61 00 0a 	stb     r3,10(r1)
    10e4:	4b ff ff a8 	b       108c <serialboot+0x118>
    10e8:	48 00 3c 25 	bl      4d0c <uart_read>
    10ec:	98 61 00 09 	stb     r3,9(r1)
    10f0:	4b ff ff 9c 	b       108c <serialboot+0x118>
    10f4:	2c 1f 00 03 	cmpwi   r31,3
    10f8:	41 82 00 64 	beq     115c <serialboot+0x1e8>
    10fc:	40 81 ff 90 	ble     108c <serialboot+0x118>
    1100:	48 00 3c 0d 	bl      4d0c <uart_read>
    1104:	88 81 00 08 	lbz     r4,8(r1)
    1108:	7d 21 fa 14 	add     r9,r1,r31
    110c:	98 69 00 08 	stb     r3,8(r9)
    1110:	39 24 00 03 	addi    r9,r4,3
    1114:	7c 09 f8 00 	cmpw    r9,r31
    1118:	40 82 ff 74 	bne     108c <serialboot+0x118>
    111c:	a3 e1 00 09 	lhz     r31,9(r1)
    1120:	38 84 00 01 	addi    r4,r4,1
    1124:	38 61 00 0b 	addi    r3,r1,11
    1128:	48 00 2f f1 	bl      4118 <crc16>
    112c:	7c 03 f8 00 	cmpw    r3,r31
    1130:	41 82 00 38 	beq     1168 <serialboot+0x1f4>
    1134:	38 60 00 43 	li      r3,67
    1138:	3b de 00 01 	addi    r30,r30,1
    113c:	48 00 3c 59 	bl      4d94 <uart_write>
    1140:	2c 1e 01 00 	cmpwi   r30,256
    1144:	40 82 ff 20 	bne     1064 <serialboot+0xf0>
    1148:	3c 60 00 00 	lis     r3,0
    114c:	38 63 4e fc 	addi    r3,r3,20220
    1150:	4c c6 31 82 	crclr   4*cr1+eq
    1154:	48 00 21 29 	bl      327c <printf>
    1158:	48 00 00 34 	b       118c <serialboot+0x218>
    115c:	48 00 3b b1 	bl      4d0c <uart_read>
    1160:	98 61 00 0b 	stb     r3,11(r1)
    1164:	4b ff ff 28 	b       108c <serialboot+0x118>
    1168:	89 21 00 0b 	lbz     r9,11(r1)
    116c:	28 09 00 01 	cmplwi  r9,1
    1170:	41 82 00 28 	beq     1198 <serialboot+0x224>
    1174:	28 09 00 02 	cmplwi  r9,2
    1178:	41 82 00 44 	beq     11bc <serialboot+0x248>
    117c:	2c 09 00 00 	cmpwi   r9,0
    1180:	40 82 00 58 	bne     11d8 <serialboot+0x264>
    1184:	38 60 00 4b 	li      r3,75
    1188:	48 00 3c 0d 	bl      4d94 <uart_write>
    118c:	38 60 00 01 	li      r3,1
    1190:	39 61 01 30 	addi    r11,r1,304
    1194:	4b ff f3 cc 	b       560 <_rest32gpr_26_x>
    1198:	88 a1 00 08 	lbz     r5,8(r1)
    119c:	80 61 00 0c 	lwz     r3,12(r1)
    11a0:	38 81 00 10 	addi    r4,r1,16
    11a4:	3b c0 00 00 	li      r30,0
    11a8:	38 a5 ff fc 	addi    r5,r5,-4
    11ac:	48 00 1e 11 	bl      2fbc <memcpy>
    11b0:	38 60 00 4b 	li      r3,75
    11b4:	48 00 3b e1 	bl      4d94 <uart_write>
    11b8:	4b ff fe ac 	b       1064 <serialboot+0xf0>
    11bc:	38 60 00 4b 	li      r3,75
    11c0:	48 00 3b d5 	bl      4d94 <uart_write>
    11c4:	80 c1 00 0c 	lwz     r6,12(r1)
    11c8:	38 a0 00 00 	li      r5,0
    11cc:	38 80 00 00 	li      r4,0
    11d0:	38 60 00 00 	li      r3,0
    11d4:	4b ff fd 3d 	bl      f10 <boot>
    11d8:	3b de 00 01 	addi    r30,r30,1
    11dc:	38 60 00 55 	li      r3,85
    11e0:	48 00 3b b5 	bl      4d94 <uart_write>
    11e4:	4b ff ff 5c 	b       1140 <serialboot+0x1cc>
    11e8:	3c 60 00 00 	lis     r3,0
    11ec:	38 63 4f 2b 	addi    r3,r3,20267
    11f0:	4c c6 31 82 	crclr   4*cr1+eq
    11f4:	48 00 20 89 	bl      327c <printf>
    11f8:	38 60 00 00 	li      r3,0
    11fc:	4b ff ff 94 	b       1190 <serialboot+0x21c>

00001200 <dump_bytes>:
    1200:	94 21 ff c0 	stwu    r1,-64(r1)
    1204:	3d 20 00 01 	lis     r9,1
    1208:	be a1 00 14 	stmw    r21,20(r1)
    120c:	7c 9e 23 78 	mr      r30,r4
    1210:	80 89 02 88 	lwz     r4,648(r9)
    1214:	7c 08 02 a6 	mflr    r0
    1218:	7c 7d 1b 78 	mr      r29,r3
    121c:	90 01 00 44 	stw     r0,68(r1)
    1220:	7c bc 2b 78 	mr      r28,r5
    1224:	3c 60 00 00 	lis     r3,0
    1228:	3f 20 00 00 	lis     r25,0
    122c:	38 63 4f 56 	addi    r3,r3,20310
    1230:	3f 00 00 00 	lis     r24,0
    1234:	3e e0 00 00 	lis     r23,0
    1238:	3e c0 00 00 	lis     r22,0
    123c:	3e a0 00 00 	lis     r21,0
    1240:	48 00 1f d1 	bl      3210 <fputs>
    1244:	3b 39 4f 63 	addi    r25,r25,20323
    1248:	3b 18 4f 6e 	addi    r24,r24,20334
    124c:	3a f7 4f 74 	addi    r23,r23,20340
    1250:	3a d6 4f 78 	addi    r22,r22,20344
    1254:	3a b5 53 27 	addi    r21,r21,21287
    1258:	2c 1e 00 00 	cmpwi   r30,0
    125c:	41 81 00 4c 	bgt     12a8 <dump_bytes+0xa8>
    1260:	80 01 00 44 	lwz     r0,68(r1)
    1264:	82 a1 00 14 	lwz     r21,20(r1)
    1268:	82 c1 00 18 	lwz     r22,24(r1)
    126c:	82 e1 00 1c 	lwz     r23,28(r1)
    1270:	83 01 00 20 	lwz     r24,32(r1)
    1274:	83 21 00 24 	lwz     r25,36(r1)
    1278:	83 41 00 28 	lwz     r26,40(r1)
    127c:	83 61 00 2c 	lwz     r27,44(r1)
    1280:	83 81 00 30 	lwz     r28,48(r1)
    1284:	83 a1 00 34 	lwz     r29,52(r1)
    1288:	83 c1 00 38 	lwz     r30,56(r1)
    128c:	83 e1 00 3c 	lwz     r31,60(r1)
    1290:	3c 60 00 00 	lis     r3,0
    1294:	7c 08 03 a6 	mtlr    r0
    1298:	38 63 4e 84 	addi    r3,r3,20100
    129c:	38 21 00 40 	addi    r1,r1,64
    12a0:	4c c6 31 82 	crclr   4*cr1+eq
    12a4:	48 00 1f d8 	b       327c <printf>
    12a8:	7f df f3 78 	mr      r31,r30
    12ac:	2c 1e 00 10 	cmpwi   r30,16
    12b0:	40 81 00 08 	ble     12b8 <dump_bytes+0xb8>
    12b4:	3b e0 00 10 	li      r31,16
    12b8:	7f 84 e3 78 	mr      r4,r28
    12bc:	7f 23 cb 78 	mr      r3,r25
    12c0:	3b 60 00 00 	li      r27,0
    12c4:	4c c6 31 82 	crclr   4*cr1+eq
    12c8:	48 00 1f b5 	bl      327c <printf>
    12cc:	7c 9d d8 ae 	lbzx    r4,r29,r27
    12d0:	7f 03 c3 78 	mr      r3,r24
    12d4:	3b 7b 00 01 	addi    r27,r27,1
    12d8:	4c c6 31 82 	crclr   4*cr1+eq
    12dc:	48 00 1f a1 	bl      327c <printf>
    12e0:	7c 1f d8 00 	cmpw    r31,r27
    12e4:	40 82 ff e8 	bne     12cc <dump_bytes+0xcc>
    12e8:	7f fb fb 78 	mr      r27,r31
    12ec:	2c 1b 00 10 	cmpwi   r27,16
    12f0:	40 82 00 64 	bne     1354 <dump_bytes+0x154>
    12f4:	3f 60 00 00 	lis     r27,0
    12f8:	3b 40 00 00 	li      r26,0
    12fc:	3b 7b 4f 76 	addi    r27,r27,20342
    1300:	7f 63 db 78 	mr      r3,r27
    1304:	4c c6 31 82 	crclr   4*cr1+eq
    1308:	48 00 1f 75 	bl      327c <printf>
    130c:	7c 9d d0 ae 	lbzx    r4,r29,r26
    1310:	39 24 ff e0 	addi    r9,r4,-32
    1314:	55 29 06 3e 	clrlwi  r9,r9,24
    1318:	28 09 00 5e 	cmplwi  r9,94
    131c:	40 81 00 4c 	ble     1368 <dump_bytes+0x168>
    1320:	7e a3 ab 78 	mr      r3,r21
    1324:	4c c6 31 82 	crclr   4*cr1+eq
    1328:	48 00 1f 55 	bl      327c <printf>
    132c:	3b 5a 00 01 	addi    r26,r26,1
    1330:	7c 1f d0 00 	cmpw    r31,r26
    1334:	40 82 ff d8 	bne     130c <dump_bytes+0x10c>
    1338:	7f fa fb 78 	mr      r26,r31
    133c:	2c 1a 00 10 	cmpwi   r26,16
    1340:	40 82 00 38 	bne     1378 <dump_bytes+0x178>
    1344:	7f bd fa 14 	add     r29,r29,r31
    1348:	7f df f0 50 	subf    r30,r31,r30
    134c:	7f 9c fa 14 	add     r28,r28,r31
    1350:	4b ff ff 08 	b       1258 <dump_bytes+0x58>
    1354:	7e e3 bb 78 	mr      r3,r23
    1358:	3b 7b 00 01 	addi    r27,r27,1
    135c:	4c c6 31 82 	crclr   4*cr1+eq
    1360:	48 00 1f 1d 	bl      327c <printf>
    1364:	4b ff ff 88 	b       12ec <dump_bytes+0xec>
    1368:	7e c3 b3 78 	mr      r3,r22
    136c:	4c c6 31 82 	crclr   4*cr1+eq
    1370:	48 00 1f 0d 	bl      327c <printf>
    1374:	4b ff ff b8 	b       132c <dump_bytes+0x12c>
    1378:	7f 63 db 78 	mr      r3,r27
    137c:	3b 5a 00 01 	addi    r26,r26,1
    1380:	4c c6 31 82 	crclr   4*cr1+eq
    1384:	48 00 1e f9 	bl      327c <printf>
    1388:	4b ff ff b4 	b       133c <dump_bytes+0x13c>

0000138c <crcbios>:
    138c:	94 21 ff f0 	stwu    r1,-16(r1)
    1390:	3d 20 00 00 	lis     r9,0
    1394:	93 e1 00 0c 	stw     r31,12(r1)
    1398:	83 e9 66 60 	lwz     r31,26208(r9)
    139c:	7c 08 02 a6 	mflr    r0
    13a0:	38 89 66 60 	addi    r4,r9,26208
    13a4:	90 01 00 14 	stw     r0,20(r1)
    13a8:	3c 60 00 00 	lis     r3,0
    13ac:	38 63 00 00 	addi    r3,r3,0
    13b0:	7c 83 20 50 	subf    r4,r3,r4
    13b4:	48 00 2d bd 	bl      4170 <crc32>
    13b8:	7c 1f 18 40 	cmplw   r31,r3
    13bc:	40 82 00 28 	bne     13e4 <crcbios+0x58>
    13c0:	80 01 00 14 	lwz     r0,20(r1)
    13c4:	7f e4 fb 78 	mr      r4,r31
    13c8:	83 e1 00 0c 	lwz     r31,12(r1)
    13cc:	3c 60 00 00 	lis     r3,0
    13d0:	38 21 00 10 	addi    r1,r1,16
    13d4:	38 63 4f 7b 	addi    r3,r3,20347
    13d8:	7c 08 03 a6 	mtlr    r0
    13dc:	4c c6 31 82 	crclr   4*cr1+eq
    13e0:	48 00 1e 9c 	b       327c <printf>
    13e4:	7c 65 1b 78 	mr      r5,r3
    13e8:	7f e4 fb 78 	mr      r4,r31
    13ec:	3c 60 00 00 	lis     r3,0
    13f0:	38 63 4f 94 	addi    r3,r3,20372
    13f4:	4c c6 31 82 	crclr   4*cr1+eq
    13f8:	48 00 1e 85 	bl      327c <printf>
    13fc:	80 01 00 14 	lwz     r0,20(r1)
    1400:	83 e1 00 0c 	lwz     r31,12(r1)
    1404:	3c 60 00 00 	lis     r3,0
    1408:	38 21 00 10 	addi    r1,r1,16
    140c:	38 63 4f c0 	addi    r3,r3,20416
    1410:	7c 08 03 a6 	mtlr    r0
    1414:	4c c6 31 82 	crclr   4*cr1+eq
    1418:	48 00 1e 64 	b       327c <printf>

0000141c <get_param>:
    141c:	39 40 00 08 	li      r10,8
    1420:	39 20 00 00 	li      r9,0
    1424:	39 00 00 00 	li      r8,0
    1428:	7d 49 03 a6 	mtctr   r10
    142c:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
    1430:	39 29 00 01 	addi    r9,r9,1
    1434:	7d 05 51 2e 	stwx    r8,r5,r10
    1438:	42 00 ff f4 	bdnz    142c <get_param+0x10>
    143c:	90 64 00 00 	stw     r3,0(r4)
    1440:	89 23 00 00 	lbz     r9,0(r3)
    1444:	28 09 00 20 	cmplwi  r9,32
    1448:	41 82 00 6c 	beq     14b4 <get_param+0x98>
    144c:	2c 09 00 00 	cmpwi   r9,0
    1450:	40 82 00 0c 	bne     145c <get_param+0x40>
    1454:	38 60 00 00 	li      r3,0
    1458:	4e 80 00 20 	blr
    145c:	38 63 00 01 	addi    r3,r3,1
    1460:	4b ff ff e0 	b       1440 <get_param+0x24>
    1464:	39 29 00 01 	addi    r9,r9,1
    1468:	48 00 00 30 	b       1498 <get_param+0x7c>
    146c:	98 e9 00 00 	stb     r7,0(r9)
    1470:	7d 03 43 78 	mr      r3,r8
    1474:	39 29 00 01 	addi    r9,r9,1
    1478:	89 49 00 00 	lbz     r10,0(r9)
    147c:	28 0a 00 20 	cmplwi  r10,32
    1480:	41 82 ff f4 	beq     1474 <get_param+0x58>
    1484:	2c 0a 00 00 	cmpwi   r10,0
    1488:	4d 82 00 20 	beqlr
    148c:	39 03 00 01 	addi    r8,r3,1
    1490:	54 63 10 3a 	rlwinm  r3,r3,2,0,29
    1494:	7d 25 19 2e 	stwx    r9,r5,r3
    1498:	89 49 00 00 	lbz     r10,0(r9)
    149c:	28 0a 00 20 	cmplwi  r10,32
    14a0:	41 82 ff cc 	beq     146c <get_param+0x50>
    14a4:	2c 0a 00 00 	cmpwi   r10,0
    14a8:	40 82 ff bc 	bne     1464 <get_param+0x48>
    14ac:	7d 03 43 78 	mr      r3,r8
    14b0:	4e 80 00 20 	blr
    14b4:	39 23 00 01 	addi    r9,r3,1
    14b8:	39 40 00 00 	li      r10,0
    14bc:	38 e0 00 00 	li      r7,0
    14c0:	99 43 00 00 	stb     r10,0(r3)
    14c4:	38 60 00 00 	li      r3,0
    14c8:	4b ff ff b0 	b       1478 <get_param+0x5c>

000014cc <command_dispatcher>:
    14cc:	94 21 ff e0 	stwu    r1,-32(r1)
    14d0:	7c 08 02 a6 	mflr    r0
    14d4:	bf 61 00 0c 	stmw    r27,12(r1)
    14d8:	90 01 00 24 	stw     r0,36(r1)
    14dc:	3f e0 00 00 	lis     r31,0
    14e0:	3f c0 00 00 	lis     r30,0
    14e4:	7c 7d 1b 78 	mr      r29,r3
    14e8:	7c 9c 23 78 	mr      r28,r4
    14ec:	7c bb 2b 78 	mr      r27,r5
    14f0:	3b ff 63 90 	addi    r31,r31,25488
    14f4:	3b de 63 d0 	addi    r30,r30,25552
    14f8:	7c 1f f0 00 	cmpw    r31,r30
    14fc:	40 82 00 0c 	bne     1508 <command_dispatcher+0x3c>
    1500:	38 60 00 00 	li      r3,0
    1504:	48 00 00 38 	b       153c <command_dispatcher+0x70>
    1508:	81 3f 00 00 	lwz     r9,0(r31)
    150c:	7f a3 eb 78 	mr      r3,r29
    1510:	80 89 00 04 	lwz     r4,4(r9)
    1514:	48 00 28 61 	bl      3d74 <strcmp>
    1518:	2c 03 00 00 	cmpwi   r3,0
    151c:	40 82 00 28 	bne     1544 <command_dispatcher+0x78>
    1520:	81 3f 00 00 	lwz     r9,0(r31)
    1524:	7f 83 e3 78 	mr      r3,r28
    1528:	7f 64 db 78 	mr      r4,r27
    152c:	81 29 00 00 	lwz     r9,0(r9)
    1530:	7d 29 03 a6 	mtctr   r9
    1534:	4e 80 04 21 	bctrl
    1538:	80 7f 00 00 	lwz     r3,0(r31)
    153c:	39 61 00 20 	addi    r11,r1,32
    1540:	4b ff f0 24 	b       564 <_rest32gpr_27_x>
    1544:	3b ff 00 04 	addi    r31,r31,4
    1548:	4b ff ff b0 	b       14f8 <command_dispatcher+0x2c>

0000154c <init_dispatcher>:
    154c:	94 21 ff f0 	stwu    r1,-16(r1)
    1550:	7c 08 02 a6 	mflr    r0
    1554:	bf c1 00 08 	stmw    r30,8(r1)
    1558:	90 01 00 14 	stw     r0,20(r1)
    155c:	3f e0 00 00 	lis     r31,0
    1560:	3f c0 00 00 	lis     r30,0
    1564:	3b ff 63 d0 	addi    r31,r31,25552
    1568:	3b de 63 d0 	addi    r30,r30,25552
    156c:	7c 1f f0 00 	cmpw    r31,r30
    1570:	40 82 00 0c 	bne     157c <init_dispatcher+0x30>
    1574:	39 61 00 10 	addi    r11,r1,16
    1578:	4b ff ef f8 	b       570 <_rest32gpr_30_x>
    157c:	81 3f 00 00 	lwz     r9,0(r31)
    1580:	3b ff 00 04 	addi    r31,r31,4
    1584:	7d 29 03 a6 	mtctr   r9
    1588:	4e 80 04 21 	bctrl
    158c:	4b ff ff e0 	b       156c <init_dispatcher+0x20>

00001590 <flush_cpu_dcache>:
    1590:	4e 80 00 20 	blr

00001594 <help_handler>:
    1594:	94 21 ff d0 	stwu    r1,-48(r1)
    1598:	7c 08 02 a6 	mflr    r0
    159c:	bf 21 00 14 	stmw    r25,20(r1)
    15a0:	90 01 00 34 	stw     r0,52(r1)
    15a4:	3c 60 00 00 	lis     r3,0
    15a8:	3f a0 00 00 	lis     r29,0
    15ac:	38 63 4f f3 	addi    r3,r3,20467
    15b0:	3f 80 00 00 	lis     r28,0
    15b4:	3f 60 00 00 	lis     r27,0
    15b8:	3f 40 00 00 	lis     r26,0
    15bc:	48 00 1d 51 	bl      330c <puts>
    15c0:	3b c0 00 00 	li      r30,0
    15c4:	3f 20 00 00 	lis     r25,0
    15c8:	3b bd 63 d0 	addi    r29,r29,25552
    15cc:	3b 9c 50 15 	addi    r28,r28,20501
    15d0:	3b 7b 4f f1 	addi    r27,r27,20465
    15d4:	3b 5a 4e 84 	addi    r26,r26,20100
    15d8:	39 20 00 00 	li      r9,0
    15dc:	3b f9 63 90 	addi    r31,r25,25488
    15e0:	48 00 00 3c 	b       161c <help_handler+0x88>
    15e4:	81 5f 00 00 	lwz     r10,0(r31)
    15e8:	81 0a 00 0c 	lwz     r8,12(r10)
    15ec:	7c 08 f0 00 	cmpw    r8,r30
    15f0:	40 82 00 28 	bne     1618 <help_handler+0x84>
    15f4:	80 aa 00 08 	lwz     r5,8(r10)
    15f8:	80 8a 00 04 	lwz     r4,4(r10)
    15fc:	2c 05 00 00 	cmpwi   r5,0
    1600:	40 82 00 08 	bne     1608 <help_handler+0x74>
    1604:	7f 65 db 78 	mr      r5,r27
    1608:	7f 83 e3 78 	mr      r3,r28
    160c:	4c c6 31 82 	crclr   4*cr1+eq
    1610:	48 00 1c 6d 	bl      327c <printf>
    1614:	39 20 00 01 	li      r9,1
    1618:	3b ff 00 04 	addi    r31,r31,4
    161c:	7c 1f e8 00 	cmpw    r31,r29
    1620:	40 82 ff c4 	bne     15e4 <help_handler+0x50>
    1624:	2c 09 00 00 	cmpwi   r9,0
    1628:	41 82 00 10 	beq     1638 <help_handler+0xa4>
    162c:	7f 43 d3 78 	mr      r3,r26
    1630:	4c c6 31 82 	crclr   4*cr1+eq
    1634:	48 00 1c 49 	bl      327c <printf>
    1638:	3b de 00 01 	addi    r30,r30,1
    163c:	2c 1e 00 09 	cmpwi   r30,9
    1640:	40 82 ff 98 	bne     15d8 <help_handler+0x44>
    1644:	39 61 00 30 	addi    r11,r1,48
    1648:	4b ff ef 14 	b       55c <_rest32gpr_25_x>

0000164c <ident_handler>:
    164c:	94 21 fe f0 	stwu    r1,-272(r1)
    1650:	7c 08 02 a6 	mflr    r0
    1654:	39 21 00 08 	addi    r9,r1,8
    1658:	3d 40 ff f0 	lis     r10,-16
    165c:	38 e0 01 00 	li      r7,256
    1660:	90 01 01 14 	stw     r0,276(r1)
    1664:	61 4a 38 00 	ori     r10,r10,14336
    1668:	7d 28 4b 78 	mr      r8,r9
    166c:	7c e9 03 a6 	mtctr   r7
    1670:	80 ea 00 00 	lwz     r7,0(r10)
    1674:	39 29 00 01 	addi    r9,r9,1
    1678:	39 4a 00 04 	addi    r10,r10,4
    167c:	98 e9 ff ff 	stb     r7,-1(r9)
    1680:	42 00 ff f0 	bdnz    1670 <ident_handler+0x24>
    1684:	89 21 00 08 	lbz     r9,8(r1)
    1688:	3c 80 00 00 	lis     r4,0
    168c:	38 84 4f f1 	addi    r4,r4,20465
    1690:	2c 09 00 00 	cmpwi   r9,0
    1694:	41 82 00 08 	beq     169c <ident_handler+0x50>
    1698:	7d 04 43 78 	mr      r4,r8
    169c:	3c 60 00 00 	lis     r3,0
    16a0:	38 63 50 21 	addi    r3,r3,20513
    16a4:	4c c6 31 82 	crclr   4*cr1+eq
    16a8:	48 00 1b d5 	bl      327c <printf>
    16ac:	80 01 01 14 	lwz     r0,276(r1)
    16b0:	38 21 01 10 	addi    r1,r1,272
    16b4:	7c 08 03 a6 	mtlr    r0
    16b8:	4e 80 00 20 	blr

000016bc <crc_handler>:
    16bc:	94 21 ff e0 	stwu    r1,-32(r1)
    16c0:	7c 08 02 a6 	mflr    r0
    16c4:	bf c1 00 18 	stmw    r30,24(r1)
    16c8:	90 01 00 24 	stw     r0,36(r1)
    16cc:	2c 03 00 01 	cmpwi   r3,1
    16d0:	41 81 00 1c 	bgt     16ec <crc_handler+0x30>
    16d4:	3c 60 00 00 	lis     r3,0
    16d8:	38 63 50 2b 	addi    r3,r3,20523
    16dc:	4c c6 31 82 	crclr   4*cr1+eq
    16e0:	48 00 1b 9d 	bl      327c <printf>
    16e4:	39 61 00 20 	addi    r11,r1,32
    16e8:	4b ff ee 88 	b       570 <_rest32gpr_30_x>
    16ec:	7c 9f 23 78 	mr      r31,r4
    16f0:	80 7f 00 00 	lwz     r3,0(r31)
    16f4:	38 a0 00 00 	li      r5,0
    16f8:	38 81 00 08 	addi    r4,r1,8
    16fc:	48 00 18 7d 	bl      2f78 <strtoul>
    1700:	81 21 00 08 	lwz     r9,8(r1)
    1704:	7c 7e 1b 78 	mr      r30,r3
    1708:	3c 60 00 00 	lis     r3,0
    170c:	38 63 50 42 	addi    r3,r3,20546
    1710:	89 29 00 00 	lbz     r9,0(r9)
    1714:	2c 09 00 00 	cmpwi   r9,0
    1718:	40 82 ff c4 	bne     16dc <crc_handler+0x20>
    171c:	80 7f 00 04 	lwz     r3,4(r31)
    1720:	38 81 00 08 	addi    r4,r1,8
    1724:	38 a0 00 00 	li      r5,0
    1728:	48 00 18 51 	bl      2f78 <strtoul>
    172c:	81 21 00 08 	lwz     r9,8(r1)
    1730:	7c 64 1b 78 	mr      r4,r3
    1734:	89 29 00 00 	lbz     r9,0(r9)
    1738:	2c 09 00 00 	cmpwi   r9,0
    173c:	41 82 00 10 	beq     174c <crc_handler+0x90>
    1740:	3c 60 00 00 	lis     r3,0
    1744:	38 63 53 6b 	addi    r3,r3,21355
    1748:	4b ff ff 94 	b       16dc <crc_handler+0x20>
    174c:	7f c3 f3 78 	mr      r3,r30
    1750:	48 00 2a 21 	bl      4170 <crc32>
    1754:	7c 64 1b 78 	mr      r4,r3
    1758:	3c 60 00 00 	lis     r3,0
    175c:	38 63 50 54 	addi    r3,r3,20564
    1760:	4c c6 31 82 	crclr   4*cr1+eq
    1764:	48 00 1b 19 	bl      327c <printf>
    1768:	4b ff ff 7c 	b       16e4 <crc_handler+0x28>

0000176c <buttons_handler>:
    176c:	3d 20 ff f0 	lis     r9,-16
    1770:	61 29 18 00 	ori     r9,r9,6144
    1774:	7c 80 4c 2c 	lwbrx   r4,0,r9
    1778:	3c 60 00 00 	lis     r3,0
    177c:	38 63 50 60 	addi    r3,r3,20576
    1780:	4c c6 31 82 	crclr   4*cr1+eq
    1784:	48 00 1a f8 	b       327c <printf>

00001788 <leds_handler>:
    1788:	94 21 ff e0 	stwu    r1,-32(r1)
    178c:	7c 08 02 a6 	mflr    r0
    1790:	93 e1 00 1c 	stw     r31,28(r1)
    1794:	90 01 00 24 	stw     r0,36(r1)
    1798:	2c 03 00 00 	cmpwi   r3,0
    179c:	41 81 00 1c 	bgt     17b8 <leds_handler+0x30>
    17a0:	3c 60 00 00 	lis     r3,0
    17a4:	38 63 50 74 	addi    r3,r3,20596
    17a8:	4c c6 31 82 	crclr   4*cr1+eq
    17ac:	48 00 1a d1 	bl      327c <printf>
    17b0:	39 61 00 20 	addi    r11,r1,32
    17b4:	4b ff ed c0 	b       574 <_rest32gpr_31_x>
    17b8:	7c 89 23 78 	mr      r9,r4
    17bc:	80 69 00 00 	lwz     r3,0(r9)
    17c0:	38 a0 00 00 	li      r5,0
    17c4:	38 81 00 08 	addi    r4,r1,8
    17c8:	48 00 17 b1 	bl      2f78 <strtoul>
    17cc:	81 21 00 08 	lwz     r9,8(r1)
    17d0:	7c 7f 1b 78 	mr      r31,r3
    17d4:	89 29 00 00 	lbz     r9,0(r9)
    17d8:	2c 09 00 00 	cmpwi   r9,0
    17dc:	41 82 00 10 	beq     17ec <leds_handler+0x64>
    17e0:	3c 60 00 00 	lis     r3,0
    17e4:	38 63 50 81 	addi    r3,r3,20609
    17e8:	4b ff ff c0 	b       17a8 <leds_handler+0x20>
    17ec:	7c 64 1b 78 	mr      r4,r3
    17f0:	3c 60 00 00 	lis     r3,0
    17f4:	38 63 50 91 	addi    r3,r3,20625
    17f8:	4c c6 31 82 	crclr   4*cr1+eq
    17fc:	48 00 1a 81 	bl      327c <printf>
    1800:	3d 20 ff f0 	lis     r9,-16
    1804:	61 29 10 00 	ori     r9,r9,4096
    1808:	7f e0 4d 2c 	stwbrx  r31,0,r9
    180c:	4b ff ff a4 	b       17b0 <leds_handler+0x28>

00001810 <mem_list_handler>:
    1810:	94 21 ff f0 	stwu    r1,-16(r1)
    1814:	7c 08 02 a6 	mflr    r0
    1818:	3c 60 00 00 	lis     r3,0
    181c:	90 01 00 14 	stw     r0,20(r1)
    1820:	38 63 51 5b 	addi    r3,r3,20827
    1824:	4c c6 31 82 	crclr   4*cr1+eq
    1828:	48 00 1a 55 	bl      327c <printf>
    182c:	80 01 00 14 	lwz     r0,20(r1)
    1830:	3c 60 00 00 	lis     r3,0
    1834:	38 21 00 10 	addi    r1,r1,16
    1838:	38 63 51 76 	addi    r3,r3,20854
    183c:	7c 08 03 a6 	mtlr    r0
    1840:	48 00 1a cc 	b       330c <puts>

00001844 <mem_write_handler>:
    1844:	94 21 ff d0 	stwu    r1,-48(r1)
    1848:	7c 08 02 a6 	mflr    r0
    184c:	bf 61 00 1c 	stmw    r27,28(r1)
    1850:	90 01 00 34 	stw     r0,52(r1)
    1854:	2c 03 00 01 	cmpwi   r3,1
    1858:	41 81 00 1c 	bgt     1874 <mem_write_handler+0x30>
    185c:	3c 60 00 00 	lis     r3,0
    1860:	38 63 51 d0 	addi    r3,r3,20944
    1864:	4c c6 31 82 	crclr   4*cr1+eq
    1868:	48 00 1a 15 	bl      327c <printf>
    186c:	39 61 00 30 	addi    r11,r1,48
    1870:	4b ff ec f4 	b       564 <_rest32gpr_27_x>
    1874:	7c 9b 23 78 	mr      r27,r4
    1878:	7c 7d 1b 78 	mr      r29,r3
    187c:	80 7b 00 00 	lwz     r3,0(r27)
    1880:	38 a0 00 00 	li      r5,0
    1884:	38 81 00 08 	addi    r4,r1,8
    1888:	48 00 16 f1 	bl      2f78 <strtoul>
    188c:	81 21 00 08 	lwz     r9,8(r1)
    1890:	7c 7f 1b 78 	mr      r31,r3
    1894:	3c 60 00 00 	lis     r3,0
    1898:	38 63 50 42 	addi    r3,r3,20546
    189c:	89 29 00 00 	lbz     r9,0(r9)
    18a0:	2c 09 00 00 	cmpwi   r9,0
    18a4:	40 82 ff c0 	bne     1864 <mem_write_handler+0x20>
    18a8:	80 7b 00 04 	lwz     r3,4(r27)
    18ac:	38 a0 00 00 	li      r5,0
    18b0:	38 81 00 08 	addi    r4,r1,8
    18b4:	48 00 16 c5 	bl      2f78 <strtoul>
    18b8:	81 21 00 08 	lwz     r9,8(r1)
    18bc:	7c 7c 1b 78 	mr      r28,r3
    18c0:	3c 60 00 00 	lis     r3,0
    18c4:	38 63 50 81 	addi    r3,r3,20609
    18c8:	89 29 00 00 	lbz     r9,0(r9)
    18cc:	2c 09 00 00 	cmpwi   r9,0
    18d0:	40 82 ff 94 	bne     1864 <mem_write_handler+0x20>
    18d4:	3b c0 00 01 	li      r30,1
    18d8:	38 60 00 04 	li      r3,4
    18dc:	2c 1d 00 02 	cmpwi   r29,2
    18e0:	41 82 00 4c 	beq     192c <mem_write_handler+0xe8>
    18e4:	80 7b 00 08 	lwz     r3,8(r27)
    18e8:	38 a0 00 00 	li      r5,0
    18ec:	38 81 00 08 	addi    r4,r1,8
    18f0:	48 00 16 89 	bl      2f78 <strtoul>
    18f4:	81 21 00 08 	lwz     r9,8(r1)
    18f8:	7c 7e 1b 78 	mr      r30,r3
    18fc:	3c 60 00 00 	lis     r3,0
    1900:	38 63 51 fb 	addi    r3,r3,20987
    1904:	89 29 00 00 	lbz     r9,0(r9)
    1908:	2c 09 00 00 	cmpwi   r9,0
    190c:	40 82 ff 58 	bne     1864 <mem_write_handler+0x20>
    1910:	38 60 00 04 	li      r3,4
    1914:	2c 1d 00 04 	cmpwi   r29,4
    1918:	40 82 00 14 	bne     192c <mem_write_handler+0xe8>
    191c:	80 7b 00 0c 	lwz     r3,12(r27)
    1920:	38 a0 00 00 	li      r5,0
    1924:	38 81 00 08 	addi    r4,r1,8
    1928:	48 00 16 51 	bl      2f78 <strtoul>
    192c:	39 3e 00 01 	addi    r9,r30,1
    1930:	7d 29 03 a6 	mtctr   r9
    1934:	42 40 ff 38 	bdz     186c <mem_write_handler+0x28>
    1938:	28 03 00 02 	cmplwi  r3,2
    193c:	41 82 00 20 	beq     195c <mem_write_handler+0x118>
    1940:	28 03 00 04 	cmplwi  r3,4
    1944:	41 82 00 24 	beq     1968 <mem_write_handler+0x124>
    1948:	28 03 00 01 	cmplwi  r3,1
    194c:	40 82 00 28 	bne     1974 <mem_write_handler+0x130>
    1950:	9b 9f 00 00 	stb     r28,0(r31)
    1954:	3b ff 00 01 	addi    r31,r31,1
    1958:	4b ff ff dc 	b       1934 <mem_write_handler+0xf0>
    195c:	b3 9f 00 00 	sth     r28,0(r31)
    1960:	3b ff 00 02 	addi    r31,r31,2
    1964:	4b ff ff d0 	b       1934 <mem_write_handler+0xf0>
    1968:	93 9f 00 00 	stw     r28,0(r31)
    196c:	3b ff 00 04 	addi    r31,r31,4
    1970:	4b ff ff c4 	b       1934 <mem_write_handler+0xf0>
    1974:	3c 60 00 00 	lis     r3,0
    1978:	38 63 52 0b 	addi    r3,r3,21003
    197c:	4b ff fe e8 	b       1864 <mem_write_handler+0x20>

00001980 <mem_copy_handler>:
    1980:	94 21 ff d0 	stwu    r1,-48(r1)
    1984:	7c 08 02 a6 	mflr    r0
    1988:	bf 81 00 20 	stmw    r28,32(r1)
    198c:	90 01 00 34 	stw     r0,52(r1)
    1990:	2c 03 00 01 	cmpwi   r3,1
    1994:	41 81 00 1c 	bgt     19b0 <mem_copy_handler+0x30>
    1998:	3c 60 00 00 	lis     r3,0
    199c:	38 63 52 1a 	addi    r3,r3,21018
    19a0:	4c c6 31 82 	crclr   4*cr1+eq
    19a4:	48 00 18 d9 	bl      327c <printf>
    19a8:	39 61 00 30 	addi    r11,r1,48
    19ac:	4b ff eb bc 	b       568 <_rest32gpr_28_x>
    19b0:	7c 9e 23 78 	mr      r30,r4
    19b4:	7c 7f 1b 78 	mr      r31,r3
    19b8:	80 7e 00 00 	lwz     r3,0(r30)
    19bc:	38 a0 00 00 	li      r5,0
    19c0:	38 81 00 08 	addi    r4,r1,8
    19c4:	48 00 15 b5 	bl      2f78 <strtoul>
    19c8:	81 21 00 08 	lwz     r9,8(r1)
    19cc:	7c 7d 1b 78 	mr      r29,r3
    19d0:	3c 60 00 00 	lis     r3,0
    19d4:	38 63 52 37 	addi    r3,r3,21047
    19d8:	89 29 00 00 	lbz     r9,0(r9)
    19dc:	2c 09 00 00 	cmpwi   r9,0
    19e0:	40 82 ff c0 	bne     19a0 <mem_copy_handler+0x20>
    19e4:	80 7e 00 04 	lwz     r3,4(r30)
    19e8:	38 a0 00 00 	li      r5,0
    19ec:	38 81 00 08 	addi    r4,r1,8
    19f0:	48 00 15 89 	bl      2f78 <strtoul>
    19f4:	81 21 00 08 	lwz     r9,8(r1)
    19f8:	7c 7c 1b 78 	mr      r28,r3
    19fc:	3c 60 00 00 	lis     r3,0
    1a00:	38 63 52 55 	addi    r3,r3,21077
    1a04:	89 29 00 00 	lbz     r9,0(r9)
    1a08:	2c 09 00 00 	cmpwi   r9,0
    1a0c:	40 82 ff 94 	bne     19a0 <mem_copy_handler+0x20>
    1a10:	38 60 00 01 	li      r3,1
    1a14:	2c 1f 00 02 	cmpwi   r31,2
    1a18:	41 82 00 30 	beq     1a48 <mem_copy_handler+0xc8>
    1a1c:	80 7e 00 08 	lwz     r3,8(r30)
    1a20:	38 a0 00 00 	li      r5,0
    1a24:	38 81 00 08 	addi    r4,r1,8
    1a28:	48 00 15 51 	bl      2f78 <strtoul>
    1a2c:	81 41 00 08 	lwz     r10,8(r1)
    1a30:	89 4a 00 00 	lbz     r10,0(r10)
    1a34:	2c 0a 00 00 	cmpwi   r10,0
    1a38:	41 82 00 10 	beq     1a48 <mem_copy_handler+0xc8>
    1a3c:	3c 60 00 00 	lis     r3,0
    1a40:	38 63 51 fb 	addi    r3,r3,20987
    1a44:	4b ff ff 5c 	b       19a0 <mem_copy_handler+0x20>
    1a48:	39 23 00 01 	addi    r9,r3,1
    1a4c:	39 40 00 00 	li      r10,0
    1a50:	7d 29 03 a6 	mtctr   r9
    1a54:	55 49 10 3a 	rlwinm  r9,r10,2,0,29
    1a58:	42 40 ff 50 	bdz     19a8 <mem_copy_handler+0x28>
    1a5c:	7d 1c 48 2e 	lwzx    r8,r28,r9
    1a60:	39 4a 00 01 	addi    r10,r10,1
    1a64:	7d 1d 49 2e 	stwx    r8,r29,r9
    1a68:	4b ff ff ec 	b       1a54 <mem_copy_handler+0xd4>

00001a6c <mem_cmp_handler>:
    1a6c:	94 21 ff d0 	stwu    r1,-48(r1)
    1a70:	7c 08 02 a6 	mflr    r0
    1a74:	bf 61 00 1c 	stmw    r27,28(r1)
    1a78:	90 01 00 34 	stw     r0,52(r1)
    1a7c:	2c 03 00 02 	cmpwi   r3,2
    1a80:	41 81 00 1c 	bgt     1a9c <mem_cmp_handler+0x30>
    1a84:	3c 60 00 00 	lis     r3,0
    1a88:	38 63 52 6e 	addi    r3,r3,21102
    1a8c:	4c c6 31 82 	crclr   4*cr1+eq
    1a90:	48 00 17 ed 	bl      327c <printf>
    1a94:	39 61 00 30 	addi    r11,r1,48
    1a98:	4b ff ea cc 	b       564 <_rest32gpr_27_x>
    1a9c:	7c 9d 23 78 	mr      r29,r4
    1aa0:	80 7d 00 00 	lwz     r3,0(r29)
    1aa4:	38 a0 00 00 	li      r5,0
    1aa8:	38 81 00 08 	addi    r4,r1,8
    1aac:	48 00 14 cd 	bl      2f78 <strtoul>
    1ab0:	81 21 00 08 	lwz     r9,8(r1)
    1ab4:	7c 7f 1b 78 	mr      r31,r3
    1ab8:	3c 60 00 00 	lis     r3,0
    1abc:	38 63 52 8e 	addi    r3,r3,21134
    1ac0:	89 29 00 00 	lbz     r9,0(r9)
    1ac4:	2c 09 00 00 	cmpwi   r9,0
    1ac8:	40 82 ff c4 	bne     1a8c <mem_cmp_handler+0x20>
    1acc:	80 7d 00 04 	lwz     r3,4(r29)
    1ad0:	38 a0 00 00 	li      r5,0
    1ad4:	38 81 00 08 	addi    r4,r1,8
    1ad8:	48 00 14 a1 	bl      2f78 <strtoul>
    1adc:	81 21 00 08 	lwz     r9,8(r1)
    1ae0:	7c 7e 1b 78 	mr      r30,r3
    1ae4:	3c 60 00 00 	lis     r3,0
    1ae8:	38 63 52 9e 	addi    r3,r3,21150
    1aec:	89 29 00 00 	lbz     r9,0(r9)
    1af0:	2c 09 00 00 	cmpwi   r9,0
    1af4:	40 82 ff 98 	bne     1a8c <mem_cmp_handler+0x20>
    1af8:	80 7d 00 08 	lwz     r3,8(r29)
    1afc:	38 a0 00 00 	li      r5,0
    1b00:	38 81 00 08 	addi    r4,r1,8
    1b04:	3f 60 00 00 	lis     r27,0
    1b08:	3b 80 00 00 	li      r28,0
    1b0c:	48 00 14 6d 	bl      2f78 <strtoul>
    1b10:	81 21 00 08 	lwz     r9,8(r1)
    1b14:	7c 7d 1b 78 	mr      r29,r3
    1b18:	3b 7b 52 ae 	addi    r27,r27,21166
    1b1c:	3c 60 00 00 	lis     r3,0
    1b20:	38 63 51 fb 	addi    r3,r3,20987
    1b24:	89 49 00 00 	lbz     r10,0(r9)
    1b28:	39 20 00 01 	li      r9,1
    1b2c:	2c 0a 00 00 	cmpwi   r10,0
    1b30:	40 82 ff 5c 	bne     1a8c <mem_cmp_handler+0x20>
    1b34:	7c 1c e8 40 	cmplw   r28,r29
    1b38:	40 82 00 20 	bne     1b58 <mem_cmp_handler+0xec>
    1b3c:	3c 60 00 00 	lis     r3,0
    1b40:	2c 09 00 00 	cmpwi   r9,0
    1b44:	38 63 53 09 	addi    r3,r3,21257
    1b48:	40 82 ff 44 	bne     1a8c <mem_cmp_handler+0x20>
    1b4c:	3c 60 00 00 	lis     r3,0
    1b50:	38 63 53 29 	addi    r3,r3,21289
    1b54:	4b ff ff 38 	b       1a8c <mem_cmp_handler+0x20>
    1b58:	80 bf 00 00 	lwz     r5,0(r31)
    1b5c:	80 fe 00 00 	lwz     r7,0(r30)
    1b60:	7c 05 38 40 	cmplw   r5,r7
    1b64:	41 82 00 1c 	beq     1b80 <mem_cmp_handler+0x114>
    1b68:	7f c6 f3 78 	mr      r6,r30
    1b6c:	7f e4 fb 78 	mr      r4,r31
    1b70:	7f 63 db 78 	mr      r3,r27
    1b74:	4c c6 31 82 	crclr   4*cr1+eq
    1b78:	48 00 17 05 	bl      327c <printf>
    1b7c:	39 20 00 00 	li      r9,0
    1b80:	3b 9c 00 01 	addi    r28,r28,1
    1b84:	3b ff 00 04 	addi    r31,r31,4
    1b88:	3b de 00 04 	addi    r30,r30,4
    1b8c:	4b ff ff a8 	b       1b34 <mem_cmp_handler+0xc8>

00001b90 <mem_read_handler>:
    1b90:	94 21 ff d0 	stwu    r1,-48(r1)
    1b94:	7c 08 02 a6 	mflr    r0
    1b98:	bf a1 00 24 	stmw    r29,36(r1)
    1b9c:	90 01 00 34 	stw     r0,52(r1)
    1ba0:	7c 7f 1b 79 	mr.     r31,r3
    1ba4:	41 81 00 1c 	bgt     1bc0 <mem_read_handler+0x30>
    1ba8:	3c 60 00 00 	lis     r3,0
    1bac:	38 63 53 4e 	addi    r3,r3,21326
    1bb0:	4c c6 31 82 	crclr   4*cr1+eq
    1bb4:	48 00 16 c9 	bl      327c <printf>
    1bb8:	39 61 00 30 	addi    r11,r1,48
    1bbc:	4b ff e9 b0 	b       56c <_rest32gpr_29_x>
    1bc0:	7c 9e 23 78 	mr      r30,r4
    1bc4:	80 7e 00 00 	lwz     r3,0(r30)
    1bc8:	38 a0 00 00 	li      r5,0
    1bcc:	38 81 00 08 	addi    r4,r1,8
    1bd0:	48 00 13 a9 	bl      2f78 <strtoul>
    1bd4:	81 21 00 08 	lwz     r9,8(r1)
    1bd8:	7c 7d 1b 78 	mr      r29,r3
    1bdc:	3c 60 00 00 	lis     r3,0
    1be0:	38 63 50 42 	addi    r3,r3,20546
    1be4:	89 29 00 00 	lbz     r9,0(r9)
    1be8:	2c 09 00 00 	cmpwi   r9,0
    1bec:	40 82 ff c4 	bne     1bb0 <mem_read_handler+0x20>
    1bf0:	2c 1f 00 01 	cmpwi   r31,1
    1bf4:	41 82 00 34 	beq     1c28 <mem_read_handler+0x98>
    1bf8:	80 7e 00 04 	lwz     r3,4(r30)
    1bfc:	38 81 00 08 	addi    r4,r1,8
    1c00:	38 a0 00 00 	li      r5,0
    1c04:	48 00 13 75 	bl      2f78 <strtoul>
    1c08:	81 21 00 08 	lwz     r9,8(r1)
    1c0c:	7c 64 1b 78 	mr      r4,r3
    1c10:	89 29 00 00 	lbz     r9,0(r9)
    1c14:	2c 09 00 00 	cmpwi   r9,0
    1c18:	41 82 00 14 	beq     1c2c <mem_read_handler+0x9c>
    1c1c:	3c 60 00 00 	lis     r3,0
    1c20:	38 63 53 6a 	addi    r3,r3,21354
    1c24:	4b ff ff 8c 	b       1bb0 <mem_read_handler+0x20>
    1c28:	38 80 00 04 	li      r4,4
    1c2c:	7f a5 eb 78 	mr      r5,r29
    1c30:	7f a3 eb 78 	mr      r3,r29
    1c34:	4b ff f5 cd 	bl      1200 <dump_bytes>
    1c38:	4b ff ff 80 	b       1bb8 <mem_read_handler+0x28>

00001c3c <mem_test_handler>:
    1c3c:	94 21 ff d0 	stwu    r1,-48(r1)
    1c40:	7c 08 02 a6 	mflr    r0
    1c44:	bf a1 00 24 	stmw    r29,36(r1)
    1c48:	90 01 00 34 	stw     r0,52(r1)
    1c4c:	7c 7f 1b 79 	mr.     r31,r3
    1c50:	41 81 00 1c 	bgt     1c6c <mem_test_handler+0x30>
    1c54:	3c 60 00 00 	lis     r3,0
    1c58:	38 63 53 7c 	addi    r3,r3,21372
    1c5c:	4c c6 31 82 	crclr   4*cr1+eq
    1c60:	48 00 16 1d 	bl      327c <printf>
    1c64:	39 61 00 30 	addi    r11,r1,48
    1c68:	4b ff e9 04 	b       56c <_rest32gpr_29_x>
    1c6c:	7c 9e 23 78 	mr      r30,r4
    1c70:	80 7e 00 00 	lwz     r3,0(r30)
    1c74:	38 a0 00 00 	li      r5,0
    1c78:	38 81 00 08 	addi    r4,r1,8
    1c7c:	48 00 12 fd 	bl      2f78 <strtoul>
    1c80:	81 21 00 08 	lwz     r9,8(r1)
    1c84:	7c 7d 1b 78 	mr      r29,r3
    1c88:	3c 60 00 00 	lis     r3,0
    1c8c:	38 63 50 42 	addi    r3,r3,20546
    1c90:	89 29 00 00 	lbz     r9,0(r9)
    1c94:	2c 09 00 00 	cmpwi   r9,0
    1c98:	40 82 ff c4 	bne     1c5c <mem_test_handler+0x20>
    1c9c:	2c 1f 00 01 	cmpwi   r31,1
    1ca0:	41 82 00 34 	beq     1cd4 <mem_test_handler+0x98>
    1ca4:	80 7e 00 04 	lwz     r3,4(r30)
    1ca8:	38 81 00 08 	addi    r4,r1,8
    1cac:	38 a0 00 00 	li      r5,0
    1cb0:	48 00 12 c9 	bl      2f78 <strtoul>
    1cb4:	81 21 00 08 	lwz     r9,8(r1)
    1cb8:	7c 64 1b 78 	mr      r4,r3
    1cbc:	89 29 00 00 	lbz     r9,0(r9)
    1cc0:	2c 09 00 00 	cmpwi   r9,0
    1cc4:	41 82 00 14 	beq     1cd8 <mem_test_handler+0x9c>
    1cc8:	3c 60 00 00 	lis     r3,0
    1ccc:	38 63 52 0b 	addi    r3,r3,21003
    1cd0:	4b ff ff 8c 	b       1c5c <mem_test_handler+0x20>
    1cd4:	38 80 ff ff 	li      r4,-1
    1cd8:	7f a3 eb 78 	mr      r3,r29
    1cdc:	48 00 2e d1 	bl      4bac <memtest>
    1ce0:	4b ff ff 84 	b       1c64 <mem_test_handler+0x28>

00001ce4 <mem_speed_handler>:
    1ce4:	94 21 ff d0 	stwu    r1,-48(r1)
    1ce8:	7c 08 02 a6 	mflr    r0
    1cec:	bf 61 00 1c 	stmw    r27,28(r1)
    1cf0:	90 01 00 34 	stw     r0,52(r1)
    1cf4:	2c 03 00 01 	cmpwi   r3,1
    1cf8:	41 81 00 1c 	bgt     1d14 <mem_speed_handler+0x30>
    1cfc:	3c 60 00 00 	lis     r3,0
    1d00:	38 63 53 98 	addi    r3,r3,21400
    1d04:	4c c6 31 82 	crclr   4*cr1+eq
    1d08:	48 00 15 75 	bl      327c <printf>
    1d0c:	39 61 00 30 	addi    r11,r1,48
    1d10:	4b ff e8 54 	b       564 <_rest32gpr_27_x>
    1d14:	7c 9e 23 78 	mr      r30,r4
    1d18:	7c 7f 1b 78 	mr      r31,r3
    1d1c:	80 7e 00 00 	lwz     r3,0(r30)
    1d20:	38 a0 00 00 	li      r5,0
    1d24:	38 81 00 08 	addi    r4,r1,8
    1d28:	48 00 12 51 	bl      2f78 <strtoul>
    1d2c:	81 21 00 08 	lwz     r9,8(r1)
    1d30:	7c 7c 1b 78 	mr      r28,r3
    1d34:	3c 60 00 00 	lis     r3,0
    1d38:	38 63 50 42 	addi    r3,r3,20546
    1d3c:	89 29 00 00 	lbz     r9,0(r9)
    1d40:	2c 09 00 00 	cmpwi   r9,0
    1d44:	40 82 ff c0 	bne     1d04 <mem_speed_handler+0x20>
    1d48:	80 7e 00 04 	lwz     r3,4(r30)
    1d4c:	38 a0 00 00 	li      r5,0
    1d50:	38 81 00 08 	addi    r4,r1,8
    1d54:	48 00 12 25 	bl      2f78 <strtoul>
    1d58:	81 21 00 08 	lwz     r9,8(r1)
    1d5c:	7c 7b 1b 78 	mr      r27,r3
    1d60:	3c 60 00 00 	lis     r3,0
    1d64:	38 63 52 0b 	addi    r3,r3,21003
    1d68:	89 29 00 00 	lbz     r9,0(r9)
    1d6c:	2c 09 00 00 	cmpwi   r9,0
    1d70:	40 82 ff 94 	bne     1d04 <mem_speed_handler+0x20>
    1d74:	3b a0 00 00 	li      r29,0
    1d78:	38 c0 00 00 	li      r6,0
    1d7c:	2c 1f 00 02 	cmpwi   r31,2
    1d80:	41 82 00 74 	beq     1df4 <mem_speed_handler+0x110>
    1d84:	80 7e 00 08 	lwz     r3,8(r30)
    1d88:	38 a0 00 00 	li      r5,0
    1d8c:	38 81 00 08 	addi    r4,r1,8
    1d90:	48 00 11 e9 	bl      2f78 <strtoul>
    1d94:	81 21 00 08 	lwz     r9,8(r1)
    1d98:	33 a3 ff ff 	addic   r29,r3,-1
    1d9c:	7f bd 19 10 	subfe   r29,r29,r3
    1da0:	3c 60 00 00 	lis     r3,0
    1da4:	38 63 53 c8 	addi    r3,r3,21448
    1da8:	89 29 00 00 	lbz     r9,0(r9)
    1dac:	2c 09 00 00 	cmpwi   r9,0
    1db0:	40 82 ff 54 	bne     1d04 <mem_speed_handler+0x20>
    1db4:	2c 1f 00 03 	cmpwi   r31,3
    1db8:	41 82 00 38 	beq     1df0 <mem_speed_handler+0x10c>
    1dbc:	80 7e 00 0c 	lwz     r3,12(r30)
    1dc0:	38 a0 00 00 	li      r5,0
    1dc4:	38 81 00 08 	addi    r4,r1,8
    1dc8:	48 00 11 b1 	bl      2f78 <strtoul>
    1dcc:	81 21 00 08 	lwz     r9,8(r1)
    1dd0:	30 c3 ff ff 	addic   r6,r3,-1
    1dd4:	7c c6 19 10 	subfe   r6,r6,r3
    1dd8:	89 29 00 00 	lbz     r9,0(r9)
    1ddc:	2c 09 00 00 	cmpwi   r9,0
    1de0:	41 82 00 14 	beq     1df4 <mem_speed_handler+0x110>
    1de4:	3c 60 00 00 	lis     r3,0
    1de8:	38 63 53 e1 	addi    r3,r3,21473
    1dec:	4b ff ff 18 	b       1d04 <mem_speed_handler+0x20>
    1df0:	38 c0 00 00 	li      r6,0
    1df4:	7f a5 eb 78 	mr      r5,r29
    1df8:	7f 64 db 78 	mr      r4,r27
    1dfc:	7f 83 e3 78 	mr      r3,r28
    1e00:	48 00 2b 25 	bl      4924 <memspeed>
    1e04:	4b ff ff 08 	b       1d0c <mem_speed_handler+0x28>

00001e08 <boot_handler>:
    1e08:	94 21 ff d0 	stwu    r1,-48(r1)
    1e0c:	7c 08 02 a6 	mflr    r0
    1e10:	bf 81 00 20 	stmw    r28,32(r1)
    1e14:	90 01 00 34 	stw     r0,52(r1)
    1e18:	7c 7e 1b 79 	mr.     r30,r3
    1e1c:	41 81 00 1c 	bgt     1e38 <boot_handler+0x30>
    1e20:	3c 60 00 00 	lis     r3,0
    1e24:	38 63 54 cc 	addi    r3,r3,21708
    1e28:	4c c6 31 82 	crclr   4*cr1+eq
    1e2c:	48 00 14 51 	bl      327c <printf>
    1e30:	39 61 00 30 	addi    r11,r1,48
    1e34:	4b ff e7 34 	b       568 <_rest32gpr_28_x>
    1e38:	7c 9f 23 78 	mr      r31,r4
    1e3c:	80 7f 00 00 	lwz     r3,0(r31)
    1e40:	38 a0 00 00 	li      r5,0
    1e44:	38 81 00 08 	addi    r4,r1,8
    1e48:	48 00 11 31 	bl      2f78 <strtoul>
    1e4c:	81 21 00 08 	lwz     r9,8(r1)
    1e50:	7c 7c 1b 78 	mr      r28,r3
    1e54:	3c 60 00 00 	lis     r3,0
    1e58:	38 63 50 42 	addi    r3,r3,20546
    1e5c:	89 29 00 00 	lbz     r9,0(r9)
    1e60:	2c 09 00 00 	cmpwi   r9,0
    1e64:	40 82 ff c4 	bne     1e28 <boot_handler+0x20>
    1e68:	3b a0 00 00 	li      r29,0
    1e6c:	38 80 00 00 	li      r4,0
    1e70:	2c 1e 00 01 	cmpwi   r30,1
    1e74:	41 82 00 a0 	beq     1f14 <boot_handler+0x10c>
    1e78:	80 7f 00 04 	lwz     r3,4(r31)
    1e7c:	38 a0 00 00 	li      r5,0
    1e80:	38 81 00 08 	addi    r4,r1,8
    1e84:	48 00 10 f5 	bl      2f78 <strtoul>
    1e88:	81 21 00 08 	lwz     r9,8(r1)
    1e8c:	7c 7d 1b 78 	mr      r29,r3
    1e90:	3c 60 00 00 	lis     r3,0
    1e94:	38 63 54 ea 	addi    r3,r3,21738
    1e98:	89 29 00 00 	lbz     r9,0(r9)
    1e9c:	2c 09 00 00 	cmpwi   r9,0
    1ea0:	40 82 ff 88 	bne     1e28 <boot_handler+0x20>
    1ea4:	2c 1e 00 02 	cmpwi   r30,2
    1ea8:	41 82 00 68 	beq     1f10 <boot_handler+0x108>
    1eac:	80 7f 00 08 	lwz     r3,8(r31)
    1eb0:	38 81 00 08 	addi    r4,r1,8
    1eb4:	38 a0 00 00 	li      r5,0
    1eb8:	48 00 10 c1 	bl      2f78 <strtoul>
    1ebc:	81 21 00 08 	lwz     r9,8(r1)
    1ec0:	7c 64 1b 78 	mr      r4,r3
    1ec4:	3c 60 00 00 	lis     r3,0
    1ec8:	38 63 54 f7 	addi    r3,r3,21751
    1ecc:	89 29 00 00 	lbz     r9,0(r9)
    1ed0:	2c 09 00 00 	cmpwi   r9,0
    1ed4:	40 82 ff 54 	bne     1e28 <boot_handler+0x20>
    1ed8:	2c 1e 00 03 	cmpwi   r30,3
    1edc:	40 81 00 38 	ble     1f14 <boot_handler+0x10c>
    1ee0:	80 7f 00 0c 	lwz     r3,12(r31)
    1ee4:	38 81 00 08 	addi    r4,r1,8
    1ee8:	38 a0 00 00 	li      r5,0
    1eec:	48 00 10 8d 	bl      2f78 <strtoul>
    1ef0:	81 21 00 08 	lwz     r9,8(r1)
    1ef4:	7c 64 1b 78 	mr      r4,r3
    1ef8:	89 29 00 00 	lbz     r9,0(r9)
    1efc:	2c 09 00 00 	cmpwi   r9,0
    1f00:	41 82 00 14 	beq     1f14 <boot_handler+0x10c>
    1f04:	3c 60 00 00 	lis     r3,0
    1f08:	38 63 55 04 	addi    r3,r3,21764
    1f0c:	4b ff ff 1c 	b       1e28 <boot_handler+0x20>
    1f10:	38 80 00 00 	li      r4,0
    1f14:	7f 86 e3 78 	mr      r6,r28
    1f18:	38 a0 00 00 	li      r5,0
    1f1c:	7f a3 eb 78 	mr      r3,r29
    1f20:	4b ff ef f1 	bl      f10 <boot>

00001f24 <reboot_handler>:
    1f24:	3d 20 ff f0 	lis     r9,-16
    1f28:	3d 40 01 00 	lis     r10,256
    1f2c:	61 29 30 00 	ori     r9,r9,12288
    1f30:	91 49 00 00 	stw     r10,0(r9)
    1f34:	4e 80 00 20 	blr

00001f38 <main>:
    1f38:	94 21 ff 70 	stwu    r1,-144(r1)
    1f3c:	7c 08 02 a6 	mflr    r0
    1f40:	bf 81 00 80 	stmw    r28,128(r1)
    1f44:	90 01 00 94 	stw     r0,148(r1)
    1f48:	3f e0 00 00 	lis     r31,0
    1f4c:	48 00 2e 99 	bl      4de4 <uart_init>
    1f50:	3b ff 4e 84 	addi    r31,r31,20100
    1f54:	7f e3 fb 78 	mr      r3,r31
    1f58:	4c c6 31 82 	crclr   4*cr1+eq
    1f5c:	48 00 13 21 	bl      327c <printf>
    1f60:	3c 60 00 00 	lis     r3,0
    1f64:	38 63 55 52 	addi    r3,r3,21842
    1f68:	4c c6 31 82 	crclr   4*cr1+eq
    1f6c:	48 00 13 11 	bl      327c <printf>
    1f70:	3c 60 00 00 	lis     r3,0
    1f74:	38 63 55 78 	addi    r3,r3,21880
    1f78:	4c c6 31 82 	crclr   4*cr1+eq
    1f7c:	48 00 13 01 	bl      327c <printf>
    1f80:	3c 60 00 00 	lis     r3,0
    1f84:	38 63 55 9e 	addi    r3,r3,21918
    1f88:	4c c6 31 82 	crclr   4*cr1+eq
    1f8c:	48 00 12 f1 	bl      327c <printf>
    1f90:	3c 60 00 00 	lis     r3,0
    1f94:	38 63 55 c2 	addi    r3,r3,21954
    1f98:	4c c6 31 82 	crclr   4*cr1+eq
    1f9c:	48 00 12 e1 	bl      327c <printf>
    1fa0:	3c 60 00 00 	lis     r3,0
    1fa4:	38 63 55 e6 	addi    r3,r3,21990
    1fa8:	4c c6 31 82 	crclr   4*cr1+eq
    1fac:	48 00 12 d1 	bl      327c <printf>
    1fb0:	7f e3 fb 78 	mr      r3,r31
    1fb4:	4c c6 31 82 	crclr   4*cr1+eq
    1fb8:	48 00 12 c5 	bl      327c <printf>
    1fbc:	3c 60 00 00 	lis     r3,0
    1fc0:	38 63 56 0f 	addi    r3,r3,22031
    1fc4:	4c c6 31 82 	crclr   4*cr1+eq
    1fc8:	48 00 12 b5 	bl      327c <printf>
    1fcc:	3c 60 00 00 	lis     r3,0
    1fd0:	38 63 56 37 	addi    r3,r3,22071
    1fd4:	4c c6 31 82 	crclr   4*cr1+eq
    1fd8:	48 00 12 a5 	bl      327c <printf>
    1fdc:	7f e3 fb 78 	mr      r3,r31
    1fe0:	4c c6 31 82 	crclr   4*cr1+eq
    1fe4:	48 00 12 99 	bl      327c <printf>
    1fe8:	3c 60 00 00 	lis     r3,0
    1fec:	38 63 56 58 	addi    r3,r3,22104
    1ff0:	4c c6 31 82 	crclr   4*cr1+eq
    1ff4:	48 00 12 89 	bl      327c <printf>
    1ff8:	4b ff f3 95 	bl      138c <crcbios>
    1ffc:	7f e3 fb 78 	mr      r3,r31
    2000:	4c c6 31 82 	crclr   4*cr1+eq
    2004:	48 00 12 79 	bl      327c <printf>
    2008:	3c 60 00 00 	lis     r3,0
    200c:	38 63 56 7d 	addi    r3,r3,22141
    2010:	4c c6 31 82 	crclr   4*cr1+eq
    2014:	48 00 12 69 	bl      327c <printf>
    2018:	7f e3 fb 78 	mr      r3,r31
    201c:	4c c6 31 82 	crclr   4*cr1+eq
    2020:	48 00 12 5d 	bl      327c <printf>
    2024:	3c 60 00 00 	lis     r3,0
    2028:	38 63 56 98 	addi    r3,r3,22168
    202c:	4c c6 31 82 	crclr   4*cr1+eq
    2030:	48 00 12 4d 	bl      327c <printf>
    2034:	38 a0 00 64 	li      r5,100
    2038:	3c 80 00 00 	lis     r4,0
    203c:	3c 60 00 00 	lis     r3,0
    2040:	38 84 56 cc 	addi    r4,r4,22220
    2044:	38 63 56 d3 	addi    r3,r3,22227
    2048:	4c c6 31 82 	crclr   4*cr1+eq
    204c:	48 00 12 31 	bl      327c <printf>
    2050:	38 c0 00 04 	li      r6,4
    2054:	38 a0 00 20 	li      r5,32
    2058:	3c 80 00 00 	lis     r4,0
    205c:	3c 60 00 00 	lis     r3,0
    2060:	38 84 56 ed 	addi    r4,r4,22253
    2064:	38 63 56 f6 	addi    r3,r3,22262
    2068:	4c c6 31 82 	crclr   4*cr1+eq
    206c:	48 00 12 11 	bl      327c <printf>
    2070:	38 80 00 20 	li      r4,32
    2074:	3c 60 00 00 	lis     r3,0
    2078:	38 63 57 17 	addi    r3,r3,22295
    207c:	4c c6 31 82 	crclr   4*cr1+eq
    2080:	48 00 11 fd 	bl      327c <printf>
    2084:	38 80 00 40 	li      r4,64
    2088:	3c 60 00 00 	lis     r3,0
    208c:	38 63 57 32 	addi    r3,r3,22322
    2090:	4c c6 31 82 	crclr   4*cr1+eq
    2094:	48 00 11 e9 	bl      327c <printf>
    2098:	38 80 02 00 	li      r4,512
    209c:	3c 60 00 00 	lis     r3,0
    20a0:	38 63 57 47 	addi    r3,r3,22343
    20a4:	4c c6 31 82 	crclr   4*cr1+eq
    20a8:	48 00 11 d5 	bl      327c <printf>
    20ac:	7f e3 fb 78 	mr      r3,r31
    20b0:	4c c6 31 82 	crclr   4*cr1+eq
    20b4:	48 00 11 c9 	bl      327c <printf>
    20b8:	7f e3 fb 78 	mr      r3,r31
    20bc:	4c c6 31 82 	crclr   4*cr1+eq
    20c0:	48 00 11 bd 	bl      327c <printf>
    20c4:	4b ff f4 89 	bl      154c <init_dispatcher>
    20c8:	3c 60 00 00 	lis     r3,0
    20cc:	38 63 57 5d 	addi    r3,r3,22365
    20d0:	4c c6 31 82 	crclr   4*cr1+eq
    20d4:	48 00 11 a9 	bl      327c <printf>
    20d8:	4b ff ee 9d 	bl      f74 <serialboot>
    20dc:	2c 03 00 00 	cmpwi   r3,0
    20e0:	41 82 00 14 	beq     20f4 <main+0x1bc>
    20e4:	3c 60 00 00 	lis     r3,0
    20e8:	38 63 57 91 	addi    r3,r3,22417
    20ec:	4c c6 31 82 	crclr   4*cr1+eq
    20f0:	48 00 11 8d 	bl      327c <printf>
    20f4:	7f e3 fb 78 	mr      r3,r31
    20f8:	3f a0 00 00 	lis     r29,0
    20fc:	4c c6 31 82 	crclr   4*cr1+eq
    2100:	48 00 11 7d 	bl      327c <printf>
    2104:	3b bd 57 db 	addi    r29,r29,22491
    2108:	3c 60 00 00 	lis     r3,0
    210c:	3f c0 00 00 	lis     r30,0
    2110:	38 63 57 a7 	addi    r3,r3,22439
    2114:	3b de 57 ee 	addi    r30,r30,22510
    2118:	4c c6 31 82 	crclr   4*cr1+eq
    211c:	48 00 11 61 	bl      327c <printf>
    2120:	3f 80 00 00 	lis     r28,0
    2124:	48 00 04 ad 	bl      25d0 <hist_init>
    2128:	3b 9c 57 f2 	addi    r28,r28,22514
    212c:	7f a4 eb 78 	mr      r4,r29
    2130:	7f c3 f3 78 	mr      r3,r30
    2134:	4c c6 31 82 	crclr   4*cr1+eq
    2138:	48 00 11 45 	bl      327c <printf>
    213c:	38 80 00 40 	li      r4,64
    2140:	38 61 00 08 	addi    r3,r1,8
    2144:	48 00 04 d1 	bl      2614 <readline>
    2148:	89 21 00 08 	lbz     r9,8(r1)
    214c:	2c 09 00 00 	cmpwi   r9,0
    2150:	41 82 00 44 	beq     2194 <main+0x25c>
    2154:	7f e3 fb 78 	mr      r3,r31
    2158:	4c c6 31 82 	crclr   4*cr1+eq
    215c:	48 00 11 21 	bl      327c <printf>
    2160:	38 a1 00 48 	addi    r5,r1,72
    2164:	38 81 00 68 	addi    r4,r1,104
    2168:	38 61 00 08 	addi    r3,r1,8
    216c:	4b ff f2 b1 	bl      141c <get_param>
    2170:	7c 64 1b 78 	mr      r4,r3
    2174:	80 61 00 68 	lwz     r3,104(r1)
    2178:	38 a1 00 48 	addi    r5,r1,72
    217c:	4b ff f3 51 	bl      14cc <command_dispatcher>
    2180:	2c 03 00 00 	cmpwi   r3,0
    2184:	40 82 00 10 	bne     2194 <main+0x25c>
    2188:	7f 83 e3 78 	mr      r3,r28
    218c:	4c c6 31 82 	crclr   4*cr1+eq
    2190:	48 00 10 ed 	bl      327c <printf>
    2194:	7f a4 eb 78 	mr      r4,r29
    2198:	7f c3 f3 78 	mr      r3,r30
    219c:	4c c6 31 82 	crclr   4*cr1+eq
    21a0:	48 00 10 dd 	bl      327c <printf>
    21a4:	4b ff ff 98 	b       213c <main+0x204>

000021a8 <complete>:
    21a8:	94 21 ff c0 	stwu    r1,-64(r1)
    21ac:	7c 08 02 a6 	mflr    r0
    21b0:	be 81 00 10 	stmw    r20,16(r1)
    21b4:	39 40 00 0a 	li      r10,10
    21b8:	3f e0 00 01 	lis     r31,1
    21bc:	90 01 00 44 	stw     r0,68(r1)
    21c0:	7c 7d 1b 78 	mr      r29,r3
    21c4:	7c 9a 23 78 	mr      r26,r4
    21c8:	39 20 00 00 	li      r9,0
    21cc:	3b ff 05 6c 	addi    r31,r31,1388
    21d0:	39 00 00 00 	li      r8,0
    21d4:	7d 49 03 a6 	mtctr   r10
    21d8:	55 2a 30 32 	rlwinm  r10,r9,6,0,25
    21dc:	39 29 00 01 	addi    r9,r9,1
    21e0:	7d 1f 51 ae 	stbx    r8,r31,r10
    21e4:	42 00 ff f4 	bdnz    21d8 <complete+0x30>
    21e8:	3f c0 00 00 	lis     r30,0
    21ec:	3f 80 00 00 	lis     r28,0
    21f0:	3b de 63 90 	addi    r30,r30,25488
    21f4:	3b 9c 63 d0 	addi    r28,r28,25552
    21f8:	7c 1e e0 00 	cmpw    r30,r28
    21fc:	40 82 00 48 	bne     2244 <complete+0x9c>
    2200:	7f a3 eb 78 	mr      r3,r29
    2204:	48 00 0e 59 	bl      305c <strlen>
    2208:	3d 20 00 00 	lis     r9,0
    220c:	39 40 00 0a 	li      r10,10
    2210:	39 29 4e 85 	addi    r9,r9,20101
    2214:	7d 49 03 a6 	mtctr   r10
    2218:	91 3a 00 00 	stw     r9,0(r26)
    221c:	39 20 00 00 	li      r9,0
    2220:	55 2a 30 32 	rlwinm  r10,r9,6,0,25
    2224:	7d 5f 50 ae 	lbzx    r10,r31,r10
    2228:	2c 0a 00 00 	cmpwi   r10,0
    222c:	40 82 01 fc 	bne     2428 <complete+0x280>
    2230:	39 29 00 01 	addi    r9,r9,1
    2234:	42 00 ff ec 	bdnz    2220 <complete+0x78>
    2238:	38 60 00 00 	li      r3,0
    223c:	39 61 00 40 	addi    r11,r1,64
    2240:	4b ff e3 08 	b       548 <_rest32gpr_20_x>
    2244:	81 3e 00 00 	lwz     r9,0(r30)
    2248:	7f a3 eb 78 	mr      r3,r29
    224c:	83 69 00 04 	lwz     r27,4(r9)
    2250:	48 00 0e 0d 	bl      305c <strlen>
    2254:	7c 65 1b 78 	mr      r5,r3
    2258:	7f a3 eb 78 	mr      r3,r29
    225c:	7f 64 db 78 	mr      r4,r27
    2260:	48 00 0e 1d 	bl      307c <strncmp>
    2264:	7c 69 1b 79 	mr.     r9,r3
    2268:	40 82 00 30 	bne     2298 <complete+0xf0>
    226c:	39 40 00 0a 	li      r10,10
    2270:	7d 49 03 a6 	mtctr   r10
    2274:	55 23 30 32 	rlwinm  r3,r9,6,0,25
    2278:	7d 5f 18 ae 	lbzx    r10,r31,r3
    227c:	2c 0a 00 00 	cmpwi   r10,0
    2280:	40 82 00 20 	bne     22a0 <complete+0xf8>
    2284:	81 3e 00 00 	lwz     r9,0(r30)
    2288:	38 a0 00 40 	li      r5,64
    228c:	7c 7f 1a 14 	add     r3,r31,r3
    2290:	80 89 00 04 	lwz     r4,4(r9)
    2294:	48 00 0e 29 	bl      30bc <strncpy>
    2298:	3b de 00 04 	addi    r30,r30,4
    229c:	4b ff ff 5c 	b       21f8 <complete+0x50>
    22a0:	39 29 00 01 	addi    r9,r9,1
    22a4:	42 00 ff d0 	bdnz    2274 <complete+0xcc>
    22a8:	4b ff ff f0 	b       2298 <complete+0xf0>
    22ac:	39 4a 00 01 	addi    r10,r10,1
    22b0:	42 00 01 90 	bdnz    2440 <complete+0x298>
    22b4:	39 20 00 00 	li      r9,0
    22b8:	48 00 01 9c 	b       2454 <complete+0x2ac>
    22bc:	39 40 00 0a 	li      r10,10
    22c0:	39 20 00 00 	li      r9,0
    22c4:	3b c0 00 00 	li      r30,0
    22c8:	7d 49 03 a6 	mtctr   r10
    22cc:	57 ca 30 32 	rlwinm  r10,r30,6,0,25
    22d0:	7d 5f 50 ae 	lbzx    r10,r31,r10
    22d4:	2c 0a 00 00 	cmpwi   r10,0
    22d8:	41 82 00 08 	beq     22e0 <complete+0x138>
    22dc:	39 29 00 01 	addi    r9,r9,1
    22e0:	3b de 00 01 	addi    r30,r30,1
    22e4:	42 00 ff e8 	bdnz    22cc <complete+0x124>
    22e8:	38 60 00 00 	li      r3,0
    22ec:	2c 09 00 01 	cmpwi   r9,1
    22f0:	3e c0 00 01 	lis     r22,1
    22f4:	41 82 00 70 	beq     2364 <complete+0x1bc>
    22f8:	2c 1b 00 00 	cmpwi   r27,0
    22fc:	40 82 00 68 	bne     2364 <complete+0x1bc>
    2300:	80 76 02 98 	lwz     r3,664(r22)
    2304:	2c 03 00 00 	cmpwi   r3,0
    2308:	41 82 00 5c 	beq     2364 <complete+0x1bc>
    230c:	3e e0 00 00 	lis     r23,0
    2310:	3b 00 00 00 	li      r24,0
    2314:	3a f7 4e 84 	addi    r23,r23,20100
    2318:	3b 80 00 00 	li      r28,0
    231c:	7e e3 bb 78 	mr      r3,r23
    2320:	4c c6 31 82 	crclr   4*cr1+eq
    2324:	48 00 0f 59 	bl      327c <printf>
    2328:	7d 3f e0 ae 	lbzx    r9,r31,r28
    232c:	2c 09 00 00 	cmpwi   r9,0
    2330:	41 82 00 1c 	beq     234c <complete+0x1a4>
    2334:	7c 7f e2 14 	add     r3,r31,r28
    2338:	48 00 0d 25 	bl      305c <strlen>
    233c:	38 63 00 04 	addi    r3,r3,4
    2340:	7c 18 18 00 	cmpw    r24,r3
    2344:	40 80 00 08 	bge     234c <complete+0x1a4>
    2348:	7c 78 1b 78 	mr      r24,r3
    234c:	3b 9c 00 40 	addi    r28,r28,64
    2350:	28 1c 02 80 	cmplwi  r28,640
    2354:	40 82 ff d4 	bne     2328 <complete+0x180>
    2358:	2c 18 00 00 	cmpwi   r24,0
    235c:	40 82 00 30 	bne     238c <complete+0x1e4>
    2360:	38 60 00 01 	li      r3,1
    2364:	39 3d 05 2c 	addi    r9,r29,1324
    2368:	39 40 00 00 	li      r10,0
    236c:	7d 49 d9 ae 	stbx    r10,r9,r27
    2370:	91 3a 00 00 	stw     r9,0(r26)
    2374:	89 3d 05 2c 	lbz     r9,1324(r29)
    2378:	2c 09 00 00 	cmpwi   r9,0
    237c:	40 82 00 a4 	bne     2420 <complete+0x278>
    2380:	39 20 00 01 	li      r9,1
    2384:	91 36 02 98 	stw     r9,664(r22)
    2388:	4b ff fe b4 	b       223c <complete+0x94>
    238c:	39 38 00 01 	addi    r9,r24,1
    2390:	3b 80 00 50 	li      r28,80
    2394:	7f 9c 4b d6 	divw    r28,r28,r9
    2398:	3e a0 00 00 	lis     r21,0
    239c:	3e 80 00 00 	lis     r20,0
    23a0:	3b 20 00 00 	li      r25,0
    23a4:	3a b5 58 04 	addi    r21,r21,22532
    23a8:	3a 94 50 1d 	addi    r20,r20,20509
    23ac:	7d 3f c8 ae 	lbzx    r9,r31,r25
    23b0:	2c 09 00 00 	cmpwi   r9,0
    23b4:	41 82 00 2c 	beq     23e0 <complete+0x238>
    23b8:	3b de 00 01 	addi    r30,r30,1
    23bc:	7c bf ca 14 	add     r5,r31,r25
    23c0:	7d 3e e3 d6 	divw    r9,r30,r28
    23c4:	7d 29 e1 d6 	mullw   r9,r9,r28
    23c8:	7c 1e 48 00 	cmpw    r30,r9
    23cc:	40 82 00 40 	bne     240c <complete+0x264>
    23d0:	7c a4 2b 78 	mr      r4,r5
    23d4:	7e 83 a3 78 	mr      r3,r20
    23d8:	4c c6 31 82 	crclr   4*cr1+eq
    23dc:	48 00 0e a1 	bl      327c <printf>
    23e0:	3b 39 00 40 	addi    r25,r25,64
    23e4:	28 19 02 80 	cmplwi  r25,640
    23e8:	40 82 ff c4 	bne     23ac <complete+0x204>
    23ec:	7d 3e e3 d6 	divw    r9,r30,r28
    23f0:	7f 89 e1 d6 	mullw   r28,r9,r28
    23f4:	7c 1e e0 00 	cmpw    r30,r28
    23f8:	41 82 ff 68 	beq     2360 <complete+0x1b8>
    23fc:	7e e3 bb 78 	mr      r3,r23
    2400:	4c c6 31 82 	crclr   4*cr1+eq
    2404:	48 00 0e 79 	bl      327c <printf>
    2408:	4b ff ff 58 	b       2360 <complete+0x1b8>
    240c:	7f 04 c3 78 	mr      r4,r24
    2410:	7e a3 ab 78 	mr      r3,r21
    2414:	4c c6 31 82 	crclr   4*cr1+eq
    2418:	48 00 0e 65 	bl      327c <printf>
    241c:	4b ff ff c4 	b       23e0 <complete+0x238>
    2420:	39 20 00 00 	li      r9,0
    2424:	4b ff ff 60 	b       2384 <complete+0x1dc>
    2428:	39 20 00 00 	li      r9,0
    242c:	3f a0 00 01 	lis     r29,1
    2430:	39 40 00 00 	li      r10,0
    2434:	99 3d 05 2c 	stb     r9,1324(r29)
    2438:	39 20 00 0a 	li      r9,10
    243c:	7d 29 03 a6 	mtctr   r9
    2440:	55 49 30 32 	rlwinm  r9,r10,6,0,25
    2444:	7d 1f 48 ae 	lbzx    r8,r31,r9
    2448:	2c 08 00 00 	cmpwi   r8,0
    244c:	41 82 fe 60 	beq     22ac <complete+0x104>
    2450:	7d 3f 4a 14 	add     r9,r31,r9
    2454:	3b 60 00 00 	li      r27,0
    2458:	38 dd 05 2c 	addi    r6,r29,1324
    245c:	7c e9 18 ae 	lbzx    r7,r9,r3
    2460:	2c 07 00 00 	cmpwi   r7,0
    2464:	41 82 fe 58 	beq     22bc <complete+0x114>
    2468:	39 00 00 0a 	li      r8,10
    246c:	7f ea fb 78 	mr      r10,r31
    2470:	7d 09 03 a6 	mtctr   r8
    2474:	89 0a 00 00 	lbz     r8,0(r10)
    2478:	2c 08 00 00 	cmpwi   r8,0
    247c:	41 82 00 18 	beq     2494 <complete+0x2ec>
    2480:	7d 0a 18 ae 	lbzx    r8,r10,r3
    2484:	2c 08 00 00 	cmpwi   r8,0
    2488:	41 82 00 14 	beq     249c <complete+0x2f4>
    248c:	7c 08 38 40 	cmplw   r8,r7
    2490:	40 82 fe 2c 	bne     22bc <complete+0x114>
    2494:	39 4a 00 40 	addi    r10,r10,64
    2498:	42 00 ff dc 	bdnz    2474 <complete+0x2cc>
    249c:	7c e6 d9 ae 	stbx    r7,r6,r27
    24a0:	38 63 00 01 	addi    r3,r3,1
    24a4:	3b 7b 00 01 	addi    r27,r27,1
    24a8:	4b ff ff b4 	b       245c <complete+0x2b4>

000024ac <cread_add_char>:
    24ac:	94 21 ff e0 	stwu    r1,-32(r1)
    24b0:	7c 08 02 a6 	mflr    r0
    24b4:	bf 81 00 10 	stmw    r28,16(r1)
    24b8:	90 01 00 24 	stw     r0,36(r1)
    24bc:	83 e6 00 00 	lwz     r31,0(r6)
    24c0:	7c 7c 1b 78 	mr      r28,r3
    24c4:	7c be 2b 78 	mr      r30,r5
    24c8:	7c fd 3b 78 	mr      r29,r7
    24cc:	2f 84 00 00 	cmpwi   cr7,r4,0
    24d0:	40 9e 00 10 	bne     cr7,24e0 <cread_add_char+0x34>
    24d4:	81 25 00 00 	lwz     r9,0(r5)
    24d8:	7c 09 f8 00 	cmpw    r9,r31
    24dc:	40 82 00 c0 	bne     259c <cread_add_char+0xf0>
    24e0:	39 08 ff ff 	addi    r8,r8,-1
    24e4:	7c 08 f8 40 	cmplw   r8,r31
    24e8:	40 80 00 30 	bge     2518 <cread_add_char+0x6c>
    24ec:	80 01 00 24 	lwz     r0,36(r1)
    24f0:	83 81 00 10 	lwz     r28,16(r1)
    24f4:	83 a1 00 14 	lwz     r29,20(r1)
    24f8:	83 c1 00 18 	lwz     r30,24(r1)
    24fc:	83 e1 00 1c 	lwz     r31,28(r1)
    2500:	3d 20 00 01 	lis     r9,1
    2504:	80 89 02 88 	lwz     r4,648(r9)
    2508:	38 60 00 07 	li      r3,7
    250c:	7c 08 03 a6 	mtlr    r0
    2510:	38 21 00 20 	addi    r1,r1,32
    2514:	48 00 0c b4 	b       31c8 <fputc>
    2518:	3b ff 00 01 	addi    r31,r31,1
    251c:	93 e6 00 00 	stw     r31,0(r6)
    2520:	41 9e 00 7c 	beq     cr7,259c <cread_add_char+0xf0>
    2524:	80 9e 00 00 	lwz     r4,0(r30)
    2528:	7f e4 f8 50 	subf    r31,r4,r31
    252c:	28 1f 00 01 	cmplwi  r31,1
    2530:	40 81 00 18 	ble     2548 <cread_add_char+0x9c>
    2534:	38 64 00 01 	addi    r3,r4,1
    2538:	38 bf ff ff 	addi    r5,r31,-1
    253c:	7c 9d 22 14 	add     r4,r29,r4
    2540:	7c 7d 1a 14 	add     r3,r29,r3
    2544:	48 00 0a 9d 	bl      2fe0 <memmove>
    2548:	81 3e 00 00 	lwz     r9,0(r30)
    254c:	7f e4 fb 78 	mr      r4,r31
    2550:	3c 60 00 00 	lis     r3,0
    2554:	38 63 58 09 	addi    r3,r3,22537
    2558:	7f 9d 49 ae 	stbx    r28,r29,r9
    255c:	80 be 00 00 	lwz     r5,0(r30)
    2560:	7c bd 2a 14 	add     r5,r29,r5
    2564:	4c c6 31 82 	crclr   4*cr1+eq
    2568:	48 00 0d 15 	bl      327c <printf>
    256c:	81 3e 00 00 	lwz     r9,0(r30)
    2570:	39 29 00 01 	addi    r9,r9,1
    2574:	91 3e 00 00 	stw     r9,0(r30)
    2578:	3f c0 00 01 	lis     r30,1
    257c:	37 ff ff ff 	addic.  r31,r31,-1
    2580:	40 82 00 0c 	bne     258c <cread_add_char+0xe0>
    2584:	39 61 00 20 	addi    r11,r1,32
    2588:	4b ff df e0 	b       568 <_rest32gpr_28_x>
    258c:	80 9e 02 88 	lwz     r4,648(r30)
    2590:	38 60 00 08 	li      r3,8
    2594:	48 00 0c 35 	bl      31c8 <fputc>
    2598:	4b ff ff e4 	b       257c <cread_add_char+0xd0>
    259c:	81 3e 00 00 	lwz     r9,0(r30)
    25a0:	38 80 00 01 	li      r4,1
    25a4:	3c 60 00 00 	lis     r3,0
    25a8:	38 63 58 09 	addi    r3,r3,22537
    25ac:	7f 9d 49 ae 	stbx    r28,r29,r9
    25b0:	80 be 00 00 	lwz     r5,0(r30)
    25b4:	7c bd 2a 14 	add     r5,r29,r5
    25b8:	4c c6 31 82 	crclr   4*cr1+eq
    25bc:	48 00 0c c1 	bl      327c <printf>
    25c0:	81 3e 00 00 	lwz     r9,0(r30)
    25c4:	39 29 00 01 	addi    r9,r9,1
    25c8:	91 3e 00 00 	stw     r9,0(r30)
    25cc:	4b ff ff b8 	b       2584 <cread_add_char+0xd8>

000025d0 <hist_init>:
    25d0:	3d 00 00 01 	lis     r8,1
    25d4:	39 40 00 00 	li      r10,0
    25d8:	39 28 02 9c 	addi    r9,r8,668
    25dc:	91 48 02 9c 	stw     r10,668(r8)
    25e0:	91 49 00 04 	stw     r10,4(r9)
    25e4:	39 00 ff ff 	li      r8,-1
    25e8:	91 49 00 0c 	stw     r10,12(r9)
    25ec:	91 09 00 08 	stw     r8,8(r9)
    25f0:	38 e0 00 00 	li      r7,0
    25f4:	39 00 00 0a 	li      r8,10
    25f8:	39 29 00 10 	addi    r9,r9,16
    25fc:	7d 09 03 a6 	mtctr   r8
    2600:	55 48 30 32 	rlwinm  r8,r10,6,0,25
    2604:	39 4a 00 01 	addi    r10,r10,1
    2608:	7c e8 49 ae 	stbx    r7,r8,r9
    260c:	42 00 ff f4 	bdnz    2600 <hist_init+0x30>
    2610:	4e 80 00 20 	blr

00002614 <readline>:
    2614:	94 21 ff a0 	stwu    r1,-96(r1)
    2618:	39 20 00 00 	li      r9,0
    261c:	be 41 00 28 	stmw    r18,40(r1)
    2620:	91 21 00 18 	stw     r9,24(r1)
    2624:	91 21 00 14 	stw     r9,20(r1)
    2628:	3d 20 00 01 	lis     r9,1
    262c:	83 49 02 80 	lwz     r26,640(r9)
    2630:	7c 08 02 a6 	mflr    r0
    2634:	3f 00 00 00 	lis     r24,0
    2638:	3e e0 00 00 	lis     r23,0
    263c:	3f 80 00 00 	lis     r28,0
    2640:	3f c0 00 01 	lis     r30,1
    2644:	3e c0 00 00 	lis     r22,0
    2648:	3b de 02 9c 	addi    r30,r30,668
    264c:	90 01 00 64 	stw     r0,100(r1)
    2650:	7c 7f 1b 78 	mr      r31,r3
    2654:	7c 99 23 78 	mr      r25,r4
    2658:	3b 60 00 01 	li      r27,1
    265c:	3b 18 59 41 	addi    r24,r24,22849
    2660:	3a f7 58 b0 	addi    r23,r23,22704
    2664:	3b 9c 58 09 	addi    r28,r28,22537
    2668:	3a d6 4e 85 	addi    r22,r22,20101
    266c:	3a be 00 10 	addi    r21,r30,16
    2670:	7f 43 d3 78 	mr      r3,r26
    2674:	48 00 0a c9 	bl      313c <fgetc>
    2678:	54 6a 06 3e 	clrlwi  r10,r3,24
    267c:	54 69 06 3e 	clrlwi  r9,r3,24
    2680:	2c 0a 00 1b 	cmpwi   r10,27
    2684:	40 82 00 5c 	bne     26e0 <readline+0xcc>
    2688:	7f 43 d3 78 	mr      r3,r26
    268c:	48 00 0a b1 	bl      313c <fgetc>
    2690:	98 61 00 08 	stb     r3,8(r1)
    2694:	7f 43 d3 78 	mr      r3,r26
    2698:	48 00 0a a5 	bl      313c <fgetc>
    269c:	98 61 00 09 	stb     r3,9(r1)
    26a0:	54 63 06 3e 	clrlwi  r3,r3,24
    26a4:	7d 23 c0 ae 	lbzx    r9,r3,r24
    26a8:	3b a0 00 02 	li      r29,2
    26ac:	3a 61 00 08 	addi    r19,r1,8
    26b0:	71 29 00 04 	andi.   r9,r9,4
    26b4:	41 82 00 7c 	beq     2730 <readline+0x11c>
    26b8:	7f 43 d3 78 	mr      r3,r26
    26bc:	48 00 0a 81 	bl      313c <fgetc>
    26c0:	54 63 06 3e 	clrlwi  r3,r3,24
    26c4:	7c 73 e9 ae 	stbx    r3,r19,r29
    26c8:	28 03 00 7e 	cmplwi  r3,126
    26cc:	3b bd 00 01 	addi    r29,r29,1
    26d0:	41 82 00 60 	beq     2730 <readline+0x11c>
    26d4:	2c 1d 00 05 	cmpwi   r29,5
    26d8:	40 82 ff e0 	bne     26b8 <readline+0xa4>
    26dc:	39 20 ff ff 	li      r9,-1
    26e0:	55 23 06 3e 	clrlwi  r3,r9,24
    26e4:	28 03 00 0a 	cmplwi  r3,10
    26e8:	41 82 06 24 	beq     2d0c <readline+0x6f8>
    26ec:	28 03 00 0d 	cmplwi  r3,13
    26f0:	41 82 06 1c 	beq     2d0c <readline+0x6f8>
    26f4:	55 2a 06 3e 	clrlwi  r10,r9,24
    26f8:	2c 0a 00 18 	cmpwi   r10,24
    26fc:	41 81 00 cc 	bgt     27c8 <readline+0x1b4>
    2700:	2c 0a 00 00 	cmpwi   r10,0
    2704:	41 82 00 e0 	beq     27e4 <readline+0x1d0>
    2708:	38 ea ff ff 	addi    r7,r10,-1
    270c:	28 07 00 17 	cmplwi  r7,23
    2710:	41 81 00 d4 	bgt     27e4 <readline+0x1d0>
    2714:	3d 00 00 00 	lis     r8,0
    2718:	54 e7 10 3a 	rlwinm  r7,r7,2,0,29
    271c:	39 08 58 50 	addi    r8,r8,22608
    2720:	7c e8 38 2e 	lwzx    r7,r8,r7
    2724:	7d 07 42 14 	add     r8,r7,r8
    2728:	7d 09 03 a6 	mtctr   r8
    272c:	4e 80 04 20 	bctr
    2730:	7f a1 ea 14 	add     r29,r1,r29
    2734:	39 20 00 00 	li      r9,0
    2738:	99 3d 00 08 	stb     r9,8(r29)
    273c:	3b a0 00 00 	li      r29,0
    2740:	57 b4 18 38 	rlwinm  r20,r29,3,0,28
    2744:	7c 97 a0 2e 	lwzx    r4,r23,r20
    2748:	7e 63 9b 78 	mr      r3,r19
    274c:	48 00 16 29 	bl      3d74 <strcmp>
    2750:	2c 03 00 00 	cmpwi   r3,0
    2754:	40 82 00 10 	bne     2764 <readline+0x150>
    2758:	7e 97 a2 14 	add     r20,r23,r20
    275c:	89 34 00 04 	lbz     r9,4(r20)
    2760:	4b ff ff 80 	b       26e0 <readline+0xcc>
    2764:	3b bd 00 01 	addi    r29,r29,1
    2768:	2c 1d 00 12 	cmpwi   r29,18
    276c:	40 82 ff d4 	bne     2740 <readline+0x12c>
    2770:	4b ff ff 6c 	b       26dc <readline+0xc8>
    2774:	3f a0 00 01 	lis     r29,1
    2778:	81 21 00 18 	lwz     r9,24(r1)
    277c:	2c 09 00 00 	cmpwi   r9,0
    2780:	40 82 03 64 	bne     2ae4 <readline+0x4d0>
    2784:	81 21 00 14 	lwz     r9,20(r1)
    2788:	2c 09 00 00 	cmpwi   r9,0
    278c:	41 82 fe e4 	beq     2670 <readline+0x5c>
    2790:	3a 80 00 00 	li      r20,0
    2794:	3e 60 00 01 	lis     r19,1
    2798:	48 00 03 78 	b       2b10 <readline+0x4fc>
    279c:	3f a0 00 01 	lis     r29,1
    27a0:	81 21 00 18 	lwz     r9,24(r1)
    27a4:	2c 09 00 00 	cmpwi   r9,0
    27a8:	41 82 fe c8 	beq     2670 <readline+0x5c>
    27ac:	80 9d 02 88 	lwz     r4,648(r29)
    27b0:	38 60 00 08 	li      r3,8
    27b4:	48 00 0a 15 	bl      31c8 <fputc>
    27b8:	81 21 00 18 	lwz     r9,24(r1)
    27bc:	39 29 ff ff 	addi    r9,r9,-1
    27c0:	91 21 00 18 	stw     r9,24(r1)
    27c4:	4b ff ff dc 	b       27a0 <readline+0x18c>
    27c8:	2c 0a 00 89 	cmpwi   r10,137
    27cc:	41 82 03 78 	beq     2b44 <readline+0x530>
    27d0:	41 81 00 44 	bgt     2814 <readline+0x200>
    27d4:	2c 0a 00 7f 	cmpwi   r10,127
    27d8:	41 82 00 44 	beq     281c <readline+0x208>
    27dc:	2c 0a 00 85 	cmpwi   r10,133
    27e0:	41 82 02 d0 	beq     2ab0 <readline+0x49c>
    27e4:	71 29 00 80 	andi.   r9,r9,128
    27e8:	40 82 fe 88 	bne     2670 <readline+0x5c>
    27ec:	7d 2a c0 ae 	lbzx    r9,r10,r24
    27f0:	71 29 00 97 	andi.   r9,r9,151
    27f4:	41 82 fe 7c 	beq     2670 <readline+0x5c>
    27f8:	7f 28 cb 78 	mr      r8,r25
    27fc:	7f e7 fb 78 	mr      r7,r31
    2800:	38 c1 00 14 	addi    r6,r1,20
    2804:	38 a1 00 18 	addi    r5,r1,24
    2808:	7f 64 db 78 	mr      r4,r27
    280c:	4b ff fc a1 	bl      24ac <cread_add_char>
    2810:	4b ff fe 60 	b       2670 <readline+0x5c>
    2814:	2c 0a 00 ff 	cmpwi   r10,255
    2818:	40 82 ff cc 	bne     27e4 <readline+0x1d0>
    281c:	80 81 00 18 	lwz     r4,24(r1)
    2820:	2c 04 00 00 	cmpwi   r4,0
    2824:	41 82 fe 4c 	beq     2670 <readline+0x5c>
    2828:	83 a1 00 14 	lwz     r29,20(r1)
    282c:	38 64 ff ff 	addi    r3,r4,-1
    2830:	90 61 00 18 	stw     r3,24(r1)
    2834:	7c 7f 1a 14 	add     r3,r31,r3
    2838:	7f a4 e8 50 	subf    r29,r4,r29
    283c:	7c 9f 22 14 	add     r4,r31,r4
    2840:	7f a5 eb 78 	mr      r5,r29
    2844:	48 00 07 9d 	bl      2fe0 <memmove>
    2848:	3d 20 00 01 	lis     r9,1
    284c:	82 89 02 88 	lwz     r20,648(r9)
    2850:	38 60 00 08 	li      r3,8
    2854:	7e 84 a3 78 	mr      r4,r20
    2858:	48 00 09 71 	bl      31c8 <fputc>
    285c:	80 a1 00 18 	lwz     r5,24(r1)
    2860:	7f a4 eb 78 	mr      r4,r29
    2864:	7f 83 e3 78 	mr      r3,r28
    2868:	7c bf 2a 14 	add     r5,r31,r5
    286c:	4c c6 31 82 	crclr   4*cr1+eq
    2870:	48 00 0a 0d 	bl      327c <printf>
    2874:	7e 84 a3 78 	mr      r4,r20
    2878:	38 60 00 20 	li      r3,32
    287c:	48 00 09 4d 	bl      31c8 <fputc>
    2880:	7e 84 a3 78 	mr      r4,r20
    2884:	38 60 00 08 	li      r3,8
    2888:	3b bd ff ff 	addi    r29,r29,-1
    288c:	48 00 09 3d 	bl      31c8 <fputc>
    2890:	2c 1d ff ff 	cmpwi   r29,-1
    2894:	40 82 ff ec 	bne     2880 <readline+0x26c>
    2898:	48 00 01 a8 	b       2a40 <readline+0x42c>
    289c:	81 21 00 14 	lwz     r9,20(r1)
    28a0:	39 40 00 00 	li      r10,0
    28a4:	38 81 00 10 	addi    r4,r1,16
    28a8:	7f e3 fb 78 	mr      r3,r31
    28ac:	7d 5f 49 ae 	stbx    r10,r31,r9
    28b0:	81 21 00 18 	lwz     r9,24(r1)
    28b4:	7f bf 48 ae 	lbzx    r29,r31,r9
    28b8:	7d 5f 49 ae 	stbx    r10,r31,r9
    28bc:	4b ff f8 ed 	bl      21a8 <complete>
    28c0:	81 21 00 18 	lwz     r9,24(r1)
    28c4:	2c 03 00 00 	cmpwi   r3,0
    28c8:	7f bf 49 ae 	stbx    r29,r31,r9
    28cc:	40 82 00 38 	bne     2904 <readline+0x2f0>
    28d0:	3b a0 00 00 	li      r29,0
    28d4:	81 21 00 10 	lwz     r9,16(r1)
    28d8:	7c 69 e8 ae 	lbzx    r3,r9,r29
    28dc:	2c 03 00 00 	cmpwi   r3,0
    28e0:	41 82 fd 90 	beq     2670 <readline+0x5c>
    28e4:	3b bd 00 01 	addi    r29,r29,1
    28e8:	7f 28 cb 78 	mr      r8,r25
    28ec:	7f e7 fb 78 	mr      r7,r31
    28f0:	38 c1 00 14 	addi    r6,r1,20
    28f4:	38 a1 00 18 	addi    r5,r1,24
    28f8:	7f 64 db 78 	mr      r4,r27
    28fc:	4b ff fb b1 	bl      24ac <cread_add_char>
    2900:	4b ff ff d4 	b       28d4 <readline+0x2c0>
    2904:	7f e5 fb 78 	mr      r5,r31
    2908:	3c 80 00 00 	lis     r4,0
    290c:	3c 60 00 00 	lis     r3,0
    2910:	38 84 57 db 	addi    r4,r4,22491
    2914:	38 63 58 0e 	addi    r3,r3,22542
    2918:	4c c6 31 82 	crclr   4*cr1+eq
    291c:	48 00 09 61 	bl      327c <printf>
    2920:	2c 1d 00 00 	cmpwi   r29,0
    2924:	41 82 ff ac 	beq     28d0 <readline+0x2bc>
    2928:	3b a0 00 00 	li      r29,0
    292c:	3e 80 00 01 	lis     r20,1
    2930:	48 00 00 14 	b       2944 <readline+0x330>
    2934:	80 94 02 88 	lwz     r4,648(r20)
    2938:	38 60 00 08 	li      r3,8
    293c:	3b bd 00 01 	addi    r29,r29,1
    2940:	48 00 08 89 	bl      31c8 <fputc>
    2944:	81 41 00 14 	lwz     r10,20(r1)
    2948:	81 21 00 18 	lwz     r9,24(r1)
    294c:	7d 29 50 50 	subf    r9,r9,r10
    2950:	7c 09 e8 40 	cmplw   r9,r29
    2954:	41 81 ff e0 	bgt     2934 <readline+0x320>
    2958:	4b ff ff 78 	b       28d0 <readline+0x2bc>
    295c:	39 20 00 00 	li      r9,0
    2960:	3b 80 ff ff 	li      r28,-1
    2964:	99 3f 00 00 	stb     r9,0(r31)
    2968:	7f 83 e3 78 	mr      r3,r28
    296c:	39 61 00 60 	addi    r11,r1,96
    2970:	4b ff db d0 	b       540 <_rest32gpr_18_x>
    2974:	81 41 00 18 	lwz     r10,24(r1)
    2978:	81 21 00 14 	lwz     r9,20(r1)
    297c:	7c 0a 48 40 	cmplw   r10,r9
    2980:	40 80 fc f0 	bge     2670 <readline+0x5c>
    2984:	3d 20 00 01 	lis     r9,1
    2988:	7c 7f 50 ae 	lbzx    r3,r31,r10
    298c:	80 89 02 88 	lwz     r4,648(r9)
    2990:	48 00 08 39 	bl      31c8 <fputc>
    2994:	81 21 00 18 	lwz     r9,24(r1)
    2998:	39 29 00 01 	addi    r9,r9,1
    299c:	91 21 00 18 	stw     r9,24(r1)
    29a0:	4b ff fc d0 	b       2670 <readline+0x5c>
    29a4:	81 21 00 18 	lwz     r9,24(r1)
    29a8:	2c 09 00 00 	cmpwi   r9,0
    29ac:	41 82 fc c4 	beq     2670 <readline+0x5c>
    29b0:	3d 20 00 01 	lis     r9,1
    29b4:	80 89 02 88 	lwz     r4,648(r9)
    29b8:	38 60 00 08 	li      r3,8
    29bc:	48 00 08 0d 	bl      31c8 <fputc>
    29c0:	81 21 00 18 	lwz     r9,24(r1)
    29c4:	39 29 ff ff 	addi    r9,r9,-1
    29c8:	4b ff ff d4 	b       299c <readline+0x388>
    29cc:	80 81 00 18 	lwz     r4,24(r1)
    29d0:	83 a1 00 14 	lwz     r29,20(r1)
    29d4:	7c 04 e8 40 	cmplw   r4,r29
    29d8:	40 80 fc 98 	bge     2670 <readline+0x5c>
    29dc:	3b bd ff ff 	addi    r29,r29,-1
    29e0:	7f a4 e8 51 	subf.   r29,r4,r29
    29e4:	41 82 00 30 	beq     2a14 <readline+0x400>
    29e8:	7d 3f 22 14 	add     r9,r31,r4
    29ec:	7f a5 eb 78 	mr      r5,r29
    29f0:	38 84 00 01 	addi    r4,r4,1
    29f4:	7d 23 4b 78 	mr      r3,r9
    29f8:	7c 9f 22 14 	add     r4,r31,r4
    29fc:	48 00 05 e5 	bl      2fe0 <memmove>
    2a00:	7f a4 eb 78 	mr      r4,r29
    2a04:	7c 65 1b 78 	mr      r5,r3
    2a08:	7f 83 e3 78 	mr      r3,r28
    2a0c:	4c c6 31 82 	crclr   4*cr1+eq
    2a10:	48 00 08 6d 	bl      327c <printf>
    2a14:	3d 20 00 01 	lis     r9,1
    2a18:	82 89 02 88 	lwz     r20,648(r9)
    2a1c:	38 60 00 20 	li      r3,32
    2a20:	7e 84 a3 78 	mr      r4,r20
    2a24:	48 00 07 a5 	bl      31c8 <fputc>
    2a28:	7e 84 a3 78 	mr      r4,r20
    2a2c:	38 60 00 08 	li      r3,8
    2a30:	3b bd ff ff 	addi    r29,r29,-1
    2a34:	48 00 07 95 	bl      31c8 <fputc>
    2a38:	2c 1d ff ff 	cmpwi   r29,-1
    2a3c:	40 82 ff ec 	bne     2a28 <readline+0x414>
    2a40:	81 21 00 14 	lwz     r9,20(r1)
    2a44:	39 29 ff ff 	addi    r9,r9,-1
    2a48:	48 00 00 38 	b       2a80 <readline+0x46c>
    2a4c:	83 a1 00 18 	lwz     r29,24(r1)
    2a50:	81 21 00 14 	lwz     r9,20(r1)
    2a54:	3e 60 00 01 	lis     r19,1
    2a58:	7c 1d 48 40 	cmplw   r29,r9
    2a5c:	40 80 fc 14 	bge     2670 <readline+0x5c>
    2a60:	81 21 00 14 	lwz     r9,20(r1)
    2a64:	7f b4 eb 78 	mr      r20,r29
    2a68:	7c 09 e8 40 	cmplw   r9,r29
    2a6c:	41 81 00 1c 	bgt     2a88 <readline+0x474>
    2a70:	3f a0 00 01 	lis     r29,1
    2a74:	81 21 00 18 	lwz     r9,24(r1)
    2a78:	7c 09 a0 40 	cmplw   r9,r20
    2a7c:	41 80 00 20 	blt     2a9c <readline+0x488>
    2a80:	91 21 00 14 	stw     r9,20(r1)
    2a84:	4b ff fb ec 	b       2670 <readline+0x5c>
    2a88:	80 93 02 88 	lwz     r4,648(r19)
    2a8c:	38 60 00 20 	li      r3,32
    2a90:	3b bd 00 01 	addi    r29,r29,1
    2a94:	48 00 07 35 	bl      31c8 <fputc>
    2a98:	4b ff ff c8 	b       2a60 <readline+0x44c>
    2a9c:	80 9d 02 88 	lwz     r4,648(r29)
    2aa0:	38 60 00 08 	li      r3,8
    2aa4:	3a 94 ff ff 	addi    r20,r20,-1
    2aa8:	48 00 07 21 	bl      31c8 <fputc>
    2aac:	4b ff ff c8 	b       2a74 <readline+0x460>
    2ab0:	81 21 00 18 	lwz     r9,24(r1)
    2ab4:	80 81 00 14 	lwz     r4,20(r1)
    2ab8:	7c 09 20 40 	cmplw   r9,r4
    2abc:	40 80 fb b4 	bge     2670 <readline+0x5c>
    2ac0:	7c bf 4a 14 	add     r5,r31,r9
    2ac4:	7c 89 20 50 	subf    r4,r9,r4
    2ac8:	7f 83 e3 78 	mr      r3,r28
    2acc:	4c c6 31 82 	crclr   4*cr1+eq
    2ad0:	48 00 07 ad 	bl      327c <printf>
    2ad4:	81 21 00 14 	lwz     r9,20(r1)
    2ad8:	4b ff fe c4 	b       299c <readline+0x388>
    2adc:	6b 7b 00 01 	xori    r27,r27,1
    2ae0:	4b ff fb 90 	b       2670 <readline+0x5c>
    2ae4:	80 9d 02 88 	lwz     r4,648(r29)
    2ae8:	38 60 00 08 	li      r3,8
    2aec:	48 00 06 dd 	bl      31c8 <fputc>
    2af0:	81 21 00 18 	lwz     r9,24(r1)
    2af4:	39 29 ff ff 	addi    r9,r9,-1
    2af8:	91 21 00 18 	stw     r9,24(r1)
    2afc:	4b ff fc 7c 	b       2778 <readline+0x164>
    2b00:	80 93 02 88 	lwz     r4,648(r19)
    2b04:	38 60 00 20 	li      r3,32
    2b08:	3a 94 00 01 	addi    r20,r20,1
    2b0c:	48 00 06 bd 	bl      31c8 <fputc>
    2b10:	81 21 00 14 	lwz     r9,20(r1)
    2b14:	7e 9d a3 78 	mr      r29,r20
    2b18:	7c 09 a0 40 	cmplw   r9,r20
    2b1c:	41 81 ff e4 	bgt     2b00 <readline+0x4ec>
    2b20:	3e 80 00 01 	lis     r20,1
    2b24:	81 21 00 18 	lwz     r9,24(r1)
    2b28:	7c 09 e8 40 	cmplw   r9,r29
    2b2c:	40 80 ff 54 	bge     2a80 <readline+0x46c>
    2b30:	80 94 02 88 	lwz     r4,648(r20)
    2b34:	38 60 00 08 	li      r3,8
    2b38:	3b bd ff ff 	addi    r29,r29,-1
    2b3c:	48 00 06 8d 	bl      31c8 <fputc>
    2b40:	4b ff ff e4 	b       2b24 <readline+0x510>
    2b44:	80 81 00 18 	lwz     r4,24(r1)
    2b48:	83 a1 00 14 	lwz     r29,20(r1)
    2b4c:	7c 04 e8 40 	cmplw   r4,r29
    2b50:	40 80 fb 20 	bge     2670 <readline+0x5c>
    2b54:	7d 3f 22 14 	add     r9,r31,r4
    2b58:	7f a4 e8 50 	subf    r29,r4,r29
    2b5c:	7d 23 4b 78 	mr      r3,r9
    2b60:	7f a5 eb 78 	mr      r5,r29
    2b64:	38 84 00 01 	addi    r4,r4,1
    2b68:	7c 9f 22 14 	add     r4,r31,r4
    2b6c:	48 00 04 75 	bl      2fe0 <memmove>
    2b70:	38 9d ff ff 	addi    r4,r29,-1
    2b74:	7c 65 1b 78 	mr      r5,r3
    2b78:	7f 83 e3 78 	mr      r3,r28
    2b7c:	4c c6 31 82 	crclr   4*cr1+eq
    2b80:	48 00 06 fd 	bl      327c <printf>
    2b84:	3d 20 00 01 	lis     r9,1
    2b88:	82 89 02 88 	lwz     r20,648(r9)
    2b8c:	38 60 00 20 	li      r3,32
    2b90:	7e 84 a3 78 	mr      r4,r20
    2b94:	48 00 06 35 	bl      31c8 <fputc>
    2b98:	7e 84 a3 78 	mr      r4,r20
    2b9c:	38 60 00 08 	li      r3,8
    2ba0:	48 00 06 29 	bl      31c8 <fputc>
    2ba4:	37 bd ff ff 	addic.  r29,r29,-1
    2ba8:	40 82 ff f0 	bne     2b98 <readline+0x584>
    2bac:	4b ff fe 94 	b       2a40 <readline+0x42c>
    2bb0:	81 3e 00 08 	lwz     r9,8(r30)
    2bb4:	2b 83 00 10 	cmplwi  cr7,r3,16
    2bb8:	2c 09 00 00 	cmpwi   r9,0
    2bbc:	40 9e 00 50 	bne     cr7,2c0c <readline+0x5f8>
    2bc0:	41 80 00 38 	blt     2bf8 <readline+0x5e4>
    2bc4:	39 49 ff ff 	addi    r10,r9,-1
    2bc8:	91 5e 00 08 	stw     r10,8(r30)
    2bcc:	2c 0a ff ff 	cmpwi   r10,-1
    2bd0:	40 82 00 0c 	bne     2bdc <readline+0x5c8>
    2bd4:	81 5e 00 00 	lwz     r10,0(r30)
    2bd8:	91 5e 00 08 	stw     r10,8(r30)
    2bdc:	81 5e 00 08 	lwz     r10,8(r30)
    2be0:	81 1e 00 04 	lwz     r8,4(r30)
    2be4:	55 5d 30 32 	rlwinm  r29,r10,6,0,25
    2be8:	7c 0a 40 00 	cmpw    r10,r8
    2bec:	7f b5 ea 14 	add     r29,r21,r29
    2bf0:	40 82 00 60 	bne     2c50 <readline+0x63c>
    2bf4:	91 3e 00 08 	stw     r9,8(r30)
    2bf8:	3d 20 00 01 	lis     r9,1
    2bfc:	80 89 02 88 	lwz     r4,648(r9)
    2c00:	38 60 00 07 	li      r3,7
    2c04:	48 00 05 c5 	bl      31c8 <fputc>
    2c08:	4b ff fa 68 	b       2670 <readline+0x5c>
    2c0c:	41 80 ff ec 	blt     2bf8 <readline+0x5e4>
    2c10:	81 5e 00 04 	lwz     r10,4(r30)
    2c14:	7c 0a 48 00 	cmpw    r10,r9
    2c18:	41 82 ff e0 	beq     2bf8 <readline+0x5e4>
    2c1c:	81 1e 00 00 	lwz     r8,0(r30)
    2c20:	39 29 00 01 	addi    r9,r9,1
    2c24:	91 3e 00 08 	stw     r9,8(r30)
    2c28:	7c 09 40 00 	cmpw    r9,r8
    2c2c:	40 81 00 0c 	ble     2c38 <readline+0x624>
    2c30:	39 20 00 00 	li      r9,0
    2c34:	91 3e 00 08 	stw     r9,8(r30)
    2c38:	81 3e 00 08 	lwz     r9,8(r30)
    2c3c:	7e dd b3 78 	mr      r29,r22
    2c40:	7c 0a 48 00 	cmpw    r10,r9
    2c44:	41 82 00 0c 	beq     2c50 <readline+0x63c>
    2c48:	55 3d 30 32 	rlwinm  r29,r9,6,0,25
    2c4c:	7f b5 ea 14 	add     r29,r21,r29
    2c50:	3e 80 00 01 	lis     r20,1
    2c54:	48 00 00 1c 	b       2c70 <readline+0x65c>
    2c58:	80 94 02 88 	lwz     r4,648(r20)
    2c5c:	38 60 00 08 	li      r3,8
    2c60:	48 00 05 69 	bl      31c8 <fputc>
    2c64:	81 21 00 18 	lwz     r9,24(r1)
    2c68:	39 29 ff ff 	addi    r9,r9,-1
    2c6c:	91 21 00 18 	stw     r9,24(r1)
    2c70:	81 21 00 18 	lwz     r9,24(r1)
    2c74:	2c 09 00 00 	cmpwi   r9,0
    2c78:	40 82 ff e0 	bne     2c58 <readline+0x644>
    2c7c:	81 21 00 14 	lwz     r9,20(r1)
    2c80:	2c 09 00 00 	cmpwi   r9,0
    2c84:	41 82 00 44 	beq     2cc8 <readline+0x6b4>
    2c88:	3a 60 00 00 	li      r19,0
    2c8c:	3e 40 00 01 	lis     r18,1
    2c90:	48 00 00 14 	b       2ca4 <readline+0x690>
    2c94:	80 92 02 88 	lwz     r4,648(r18)
    2c98:	38 60 00 20 	li      r3,32
    2c9c:	3a 73 00 01 	addi    r19,r19,1
    2ca0:	48 00 05 29 	bl      31c8 <fputc>
    2ca4:	81 21 00 14 	lwz     r9,20(r1)
    2ca8:	7e 74 9b 78 	mr      r20,r19
    2cac:	7c 09 98 40 	cmplw   r9,r19
    2cb0:	41 81 ff e4 	bgt     2c94 <readline+0x680>
    2cb4:	3e 60 00 01 	lis     r19,1
    2cb8:	81 21 00 18 	lwz     r9,24(r1)
    2cbc:	7c 09 a0 40 	cmplw   r9,r20
    2cc0:	41 80 00 38 	blt     2cf8 <readline+0x6e4>
    2cc4:	91 21 00 14 	stw     r9,20(r1)
    2cc8:	7f a4 eb 78 	mr      r4,r29
    2ccc:	7f e3 fb 78 	mr      r3,r31
    2cd0:	48 00 03 71 	bl      3040 <strcpy>
    2cd4:	7f e3 fb 78 	mr      r3,r31
    2cd8:	48 00 03 85 	bl      305c <strlen>
    2cdc:	80 81 00 18 	lwz     r4,24(r1)
    2ce0:	90 61 00 14 	stw     r3,20(r1)
    2ce4:	7c 04 18 40 	cmplw   r4,r3
    2ce8:	40 80 f9 88 	bge     2670 <readline+0x5c>
    2cec:	7c bf 22 14 	add     r5,r31,r4
    2cf0:	7c 84 18 50 	subf    r4,r4,r3
    2cf4:	4b ff fd d4 	b       2ac8 <readline+0x4b4>
    2cf8:	80 93 02 88 	lwz     r4,648(r19)
    2cfc:	38 60 00 08 	li      r3,8
    2d00:	3a 94 ff ff 	addi    r20,r20,-1
    2d04:	48 00 04 c5 	bl      31c8 <fputc>
    2d08:	4b ff ff b0 	b       2cb8 <readline+0x6a4>
    2d0c:	83 81 00 14 	lwz     r28,20(r1)
    2d10:	39 20 00 00 	li      r9,0
    2d14:	3f 60 00 01 	lis     r27,1
    2d18:	3b db 02 9c 	addi    r30,r27,668
    2d1c:	7d 3f e1 ae 	stbx    r9,r31,r28
    2d20:	89 3f 00 00 	lbz     r9,0(r31)
    2d24:	2c 09 00 00 	cmpwi   r9,0
    2d28:	41 82 00 54 	beq     2d7c <readline+0x768>
    2d2c:	28 09 00 21 	cmplwi  r9,33
    2d30:	41 82 00 4c 	beq     2d7c <readline+0x768>
    2d34:	83 be 00 04 	lwz     r29,4(r30)
    2d38:	38 7e 00 10 	addi    r3,r30,16
    2d3c:	7f e4 fb 78 	mr      r4,r31
    2d40:	57 a9 30 32 	rlwinm  r9,r29,6,0,25
    2d44:	3b bd 00 01 	addi    r29,r29,1
    2d48:	7c 63 4a 14 	add     r3,r3,r9
    2d4c:	48 00 02 f5 	bl      3040 <strcpy>
    2d50:	2c 1d 00 09 	cmpwi   r29,9
    2d54:	41 81 00 34 	bgt     2d88 <readline+0x774>
    2d58:	93 be 00 04 	stw     r29,4(r30)
    2d5c:	81 5e 00 04 	lwz     r10,4(r30)
    2d60:	81 3b 02 9c 	lwz     r9,668(r27)
    2d64:	7c 0a 48 00 	cmpw    r10,r9
    2d68:	40 81 00 08 	ble     2d70 <readline+0x75c>
    2d6c:	91 5b 02 9c 	stw     r10,668(r27)
    2d70:	81 3e 00 0c 	lwz     r9,12(r30)
    2d74:	39 29 00 01 	addi    r9,r9,1
    2d78:	91 3e 00 0c 	stw     r9,12(r30)
    2d7c:	81 3e 00 04 	lwz     r9,4(r30)
    2d80:	91 3e 00 08 	stw     r9,8(r30)
    2d84:	4b ff fb e4 	b       2968 <readline+0x354>
    2d88:	39 20 00 00 	li      r9,0
    2d8c:	91 3e 00 04 	stw     r9,4(r30)
    2d90:	4b ff ff cc 	b       2d5c <readline+0x748>

00002d94 <__ascii_mbtowc>:
    2d94:	7c 69 1b 79 	mr.     r9,r3
    2d98:	40 82 00 40 	bne     2dd8 <__ascii_mbtowc+0x44>
    2d9c:	94 21 ff e0 	stwu    r1,-32(r1)
    2da0:	38 60 00 00 	li      r3,0
    2da4:	39 21 00 08 	addi    r9,r1,8
    2da8:	2c 04 00 00 	cmpwi   r4,0
    2dac:	41 82 00 24 	beq     2dd0 <__ascii_mbtowc+0x3c>
    2db0:	38 60 ff fe 	li      r3,-2
    2db4:	2c 05 00 00 	cmpwi   r5,0
    2db8:	41 82 00 18 	beq     2dd0 <__ascii_mbtowc+0x3c>
    2dbc:	89 44 00 00 	lbz     r10,0(r4)
    2dc0:	91 49 00 00 	stw     r10,0(r9)
    2dc4:	89 24 00 00 	lbz     r9,0(r4)
    2dc8:	30 69 ff ff 	addic   r3,r9,-1
    2dcc:	7c 63 49 10 	subfe   r3,r3,r9
    2dd0:	38 21 00 20 	addi    r1,r1,32
    2dd4:	4e 80 00 20 	blr
    2dd8:	2c 04 00 00 	cmpwi   r4,0
    2ddc:	38 60 00 00 	li      r3,0
    2de0:	4d 82 00 20 	beqlr
    2de4:	2c 05 00 00 	cmpwi   r5,0
    2de8:	38 60 ff fe 	li      r3,-2
    2dec:	4d 82 00 20 	beqlr
    2df0:	89 44 00 00 	lbz     r10,0(r4)
    2df4:	91 49 00 00 	stw     r10,0(r9)
    2df8:	89 24 00 00 	lbz     r9,0(r4)
    2dfc:	30 69 ff ff 	addic   r3,r9,-1
    2e00:	7c 63 49 10 	subfe   r3,r3,r9
    2e04:	4e 80 00 20 	blr

00002e08 <strtoul_l>:
    2e08:	3c e0 00 00 	lis     r7,0
    2e0c:	7c 6b 1b 78 	mr      r11,r3
    2e10:	7c 6a 1b 78 	mr      r10,r3
    2e14:	38 e7 59 41 	addi    r7,r7,22849
    2e18:	7d 46 53 78 	mr      r6,r10
    2e1c:	89 2a 00 00 	lbz     r9,0(r10)
    2e20:	39 4a 00 01 	addi    r10,r10,1
    2e24:	7d 09 38 ae 	lbzx    r8,r9,r7
    2e28:	71 08 00 08 	andi.   r8,r8,8
    2e2c:	40 82 ff ec 	bne     2e18 <strtoul_l+0x10>
    2e30:	28 09 00 2d 	cmplwi  r9,45
    2e34:	40 82 00 c8 	bne     2efc <strtoul_l+0xf4>
    2e38:	89 2a 00 00 	lbz     r9,0(r10)
    2e3c:	39 46 00 02 	addi    r10,r6,2
    2e40:	38 c0 00 01 	li      r6,1
    2e44:	2f 85 00 00 	cmpwi   cr7,r5,0
    2e48:	41 9e 01 20 	beq     cr7,2f68 <strtoul_l+0x160>
    2e4c:	2c 05 00 10 	cmpwi   r5,16
    2e50:	40 82 00 28 	bne     2e78 <strtoul_l+0x70>
    2e54:	2c 09 00 30 	cmpwi   r9,48
    2e58:	40 82 00 20 	bne     2e78 <strtoul_l+0x70>
    2e5c:	89 2a 00 00 	lbz     r9,0(r10)
    2e60:	71 29 00 df 	andi.   r9,r9,223
    2e64:	2c 09 00 58 	cmpwi   r9,88
    2e68:	40 82 00 f0 	bne     2f58 <strtoul_l+0x150>
    2e6c:	89 2a 00 01 	lbz     r9,1(r10)
    2e70:	38 a0 00 10 	li      r5,16
    2e74:	39 4a 00 02 	addi    r10,r10,2
    2e78:	38 00 ff ff 	li      r0,-1
    2e7c:	7c 00 2b 96 	divwu   r0,r0,r5
    2e80:	39 00 00 00 	li      r8,0
    2e84:	38 60 00 00 	li      r3,0
    2e88:	7d 80 29 d6 	mullw   r12,r0,r5
    2e8c:	7d 8c 60 f8 	not     r12,r12
    2e90:	38 e9 ff d0 	addi    r7,r9,-48
    2e94:	2c 08 00 00 	cmpwi   r8,0
    2e98:	2b 87 00 09 	cmplwi  cr7,r7,9
    2e9c:	40 9d 00 24 	ble     cr7,2ec0 <strtoul_l+0xb8>
    2ea0:	39 09 ff bf 	addi    r8,r9,-65
    2ea4:	38 e9 ff c9 	addi    r7,r9,-55
    2ea8:	2b 88 00 19 	cmplwi  cr7,r8,25
    2eac:	40 9d 00 14 	ble     cr7,2ec0 <strtoul_l+0xb8>
    2eb0:	39 09 ff 9f 	addi    r8,r9,-97
    2eb4:	2b 88 00 19 	cmplwi  cr7,r8,25
    2eb8:	41 9d 00 60 	bgt     cr7,2f18 <strtoul_l+0x110>
    2ebc:	38 e9 ff a9 	addi    r7,r9,-87
    2ec0:	7f 85 38 00 	cmpw    cr7,r5,r7
    2ec4:	40 9d 00 54 	ble     cr7,2f18 <strtoul_l+0x110>
    2ec8:	39 00 ff ff 	li      r8,-1
    2ecc:	41 80 00 24 	blt     2ef0 <strtoul_l+0xe8>
    2ed0:	7c 03 00 40 	cmplw   r3,r0
    2ed4:	41 81 00 1c 	bgt     2ef0 <strtoul_l+0xe8>
    2ed8:	40 82 00 0c 	bne     2ee4 <strtoul_l+0xdc>
    2edc:	7c 07 60 00 	cmpw    r7,r12
    2ee0:	41 81 00 10 	bgt     2ef0 <strtoul_l+0xe8>
    2ee4:	7c 65 19 d6 	mullw   r3,r5,r3
    2ee8:	7c 67 1a 14 	add     r3,r7,r3
    2eec:	39 00 00 01 	li      r8,1
    2ef0:	39 4a 00 01 	addi    r10,r10,1
    2ef4:	89 2a ff ff 	lbz     r9,-1(r10)
    2ef8:	4b ff ff 98 	b       2e90 <strtoul_l+0x88>
    2efc:	28 09 00 2b 	cmplwi  r9,43
    2f00:	41 82 00 0c 	beq     2f0c <strtoul_l+0x104>
    2f04:	38 c0 00 00 	li      r6,0
    2f08:	4b ff ff 3c 	b       2e44 <strtoul_l+0x3c>
    2f0c:	89 2a 00 00 	lbz     r9,0(r10)
    2f10:	39 46 00 02 	addi    r10,r6,2
    2f14:	4b ff ff f0 	b       2f04 <strtoul_l+0xfc>
    2f18:	2f 84 00 00 	cmpwi   cr7,r4,0
    2f1c:	40 80 00 20 	bge     2f3c <strtoul_l+0x134>
    2f20:	3d 20 00 01 	lis     r9,1
    2f24:	39 00 00 22 	li      r8,34
    2f28:	38 60 ff ff 	li      r3,-1
    2f2c:	91 09 02 90 	stw     r8,656(r9)
    2f30:	4d 9e 00 20 	beqlr   cr7
    2f34:	39 6a ff ff 	addi    r11,r10,-1
    2f38:	48 00 00 18 	b       2f50 <strtoul_l+0x148>
    2f3c:	2e 86 00 00 	cmpwi   cr5,r6,0
    2f40:	41 96 00 08 	beq     cr5,2f48 <strtoul_l+0x140>
    2f44:	7c 63 00 d0 	neg     r3,r3
    2f48:	4d 9e 00 20 	beqlr   cr7
    2f4c:	40 82 ff e8 	bne     2f34 <strtoul_l+0x12c>
    2f50:	91 64 00 00 	stw     r11,0(r4)
    2f54:	4e 80 00 20 	blr
    2f58:	39 20 00 30 	li      r9,48
    2f5c:	40 9e ff 1c 	bne     cr7,2e78 <strtoul_l+0x70>
    2f60:	38 a0 00 08 	li      r5,8
    2f64:	4b ff ff 14 	b       2e78 <strtoul_l+0x70>
    2f68:	2c 09 00 30 	cmpwi   r9,48
    2f6c:	41 82 fe f0 	beq     2e5c <strtoul_l+0x54>
    2f70:	38 a0 00 0a 	li      r5,10
    2f74:	4b ff ff 04 	b       2e78 <strtoul_l+0x70>

00002f78 <strtoul>:
    2f78:	3d 20 00 01 	lis     r9,1
    2f7c:	80 c9 02 7c 	lwz     r6,636(r9)
    2f80:	4b ff fe 88 	b       2e08 <strtoul_l>

00002f84 <__ascii_wctomb>:
    2f84:	2c 03 00 00 	cmpwi   r3,0
    2f88:	41 82 00 2c 	beq     2fb4 <__ascii_wctomb+0x30>
    2f8c:	28 04 00 ff 	cmplwi  r4,255
    2f90:	40 81 00 18 	ble     2fa8 <__ascii_wctomb+0x24>
    2f94:	3d 20 00 01 	lis     r9,1
    2f98:	39 40 00 8a 	li      r10,138
    2f9c:	38 60 ff ff 	li      r3,-1
    2fa0:	91 49 02 90 	stw     r10,656(r9)
    2fa4:	4e 80 00 20 	blr
    2fa8:	98 83 00 00 	stb     r4,0(r3)
    2fac:	38 60 00 01 	li      r3,1
    2fb0:	4e 80 00 20 	blr
    2fb4:	38 60 00 00 	li      r3,0
    2fb8:	4e 80 00 20 	blr

00002fbc <memcpy>:
    2fbc:	39 45 00 01 	addi    r10,r5,1
    2fc0:	39 20 00 00 	li      r9,0
    2fc4:	7d 49 03 a6 	mtctr   r10
    2fc8:	42 00 00 08 	bdnz    2fd0 <memcpy+0x14>
    2fcc:	4e 80 00 20 	blr
    2fd0:	7d 44 48 ae 	lbzx    r10,r4,r9
    2fd4:	7d 43 49 ae 	stbx    r10,r3,r9
    2fd8:	39 29 00 01 	addi    r9,r9,1
    2fdc:	4b ff ff ec 	b       2fc8 <memcpy+0xc>

00002fe0 <memmove>:
    2fe0:	7c 03 20 40 	cmplw   r3,r4
    2fe4:	40 81 00 4c 	ble     3030 <memmove+0x50>
    2fe8:	7d 44 2a 14 	add     r10,r4,r5
    2fec:	7c 0a 18 40 	cmplw   r10,r3
    2ff0:	40 81 00 40 	ble     3030 <memmove+0x50>
    2ff4:	38 e5 00 01 	addi    r7,r5,1
    2ff8:	7d 03 2a 14 	add     r8,r3,r5
    2ffc:	39 20 00 00 	li      r9,0
    3000:	7c e9 03 a6 	mtctr   r7
    3004:	39 29 ff ff 	addi    r9,r9,-1
    3008:	42 00 00 08 	bdnz    3010 <memmove+0x30>
    300c:	4e 80 00 20 	blr
    3010:	7c ea 48 ae 	lbzx    r7,r10,r9
    3014:	7c e8 49 ae 	stbx    r7,r8,r9
    3018:	4b ff ff ec 	b       3004 <memmove+0x24>
    301c:	7d 44 48 ae 	lbzx    r10,r4,r9
    3020:	7d 43 49 ae 	stbx    r10,r3,r9
    3024:	39 29 00 01 	addi    r9,r9,1
    3028:	42 00 ff f4 	bdnz    301c <memmove+0x3c>
    302c:	4e 80 00 20 	blr
    3030:	39 45 00 01 	addi    r10,r5,1
    3034:	39 20 00 00 	li      r9,0
    3038:	7d 49 03 a6 	mtctr   r10
    303c:	4b ff ff ec 	b       3028 <memmove+0x48>

00003040 <strcpy>:
    3040:	39 40 00 00 	li      r10,0
    3044:	7d 24 50 ae 	lbzx    r9,r4,r10
    3048:	7d 23 51 ae 	stbx    r9,r3,r10
    304c:	2c 09 00 00 	cmpwi   r9,0
    3050:	39 4a 00 01 	addi    r10,r10,1
    3054:	40 82 ff f0 	bne     3044 <strcpy+0x4>
    3058:	4e 80 00 20 	blr

0000305c <strlen>:
    305c:	7c 69 1b 78 	mr      r9,r3
    3060:	89 49 00 00 	lbz     r10,0(r9)
    3064:	2c 0a 00 00 	cmpwi   r10,0
    3068:	40 82 00 0c 	bne     3074 <strlen+0x18>
    306c:	7c 63 48 50 	subf    r3,r3,r9
    3070:	4e 80 00 20 	blr
    3074:	39 29 00 01 	addi    r9,r9,1
    3078:	4b ff ff e8 	b       3060 <strlen+0x4>

0000307c <strncmp>:
    307c:	2c 05 00 00 	cmpwi   r5,0
    3080:	41 82 00 34 	beq     30b4 <strncmp+0x38>
    3084:	39 40 00 00 	li      r10,0
    3088:	7c a9 03 a6 	mtctr   r5
    308c:	7d 03 50 ae 	lbzx    r8,r3,r10
    3090:	7d 24 50 ae 	lbzx    r9,r4,r10
    3094:	7c 08 48 40 	cmplw   r8,r9
    3098:	40 82 00 14 	bne     30ac <strncmp+0x30>
    309c:	42 40 00 10 	bdz     30ac <strncmp+0x30>
    30a0:	39 4a 00 01 	addi    r10,r10,1
    30a4:	2c 08 00 00 	cmpwi   r8,0
    30a8:	40 82 ff e4 	bne     308c <strncmp+0x10>
    30ac:	7c 69 40 50 	subf    r3,r9,r8
    30b0:	4e 80 00 20 	blr
    30b4:	38 60 00 00 	li      r3,0
    30b8:	4e 80 00 20 	blr

000030bc <strncpy>:
    30bc:	39 45 00 01 	addi    r10,r5,1
    30c0:	7c 69 1b 78 	mr      r9,r3
    30c4:	7d 49 03 a6 	mtctr   r10
    30c8:	42 00 00 08 	bdnz    30d0 <strncpy+0x14>
    30cc:	4e 80 00 20 	blr
    30d0:	89 44 00 00 	lbz     r10,0(r4)
    30d4:	38 84 00 01 	addi    r4,r4,1
    30d8:	39 29 00 01 	addi    r9,r9,1
    30dc:	38 a5 ff ff 	addi    r5,r5,-1
    30e0:	2c 0a 00 00 	cmpwi   r10,0
    30e4:	99 49 ff ff 	stb     r10,-1(r9)
    30e8:	40 82 ff e0 	bne     30c8 <strncpy+0xc>
    30ec:	38 e5 00 01 	addi    r7,r5,1
    30f0:	39 40 00 00 	li      r10,0
    30f4:	39 00 00 00 	li      r8,0
    30f8:	7c e9 03 a6 	mtctr   r7
    30fc:	48 00 00 0c 	b       3108 <strncpy+0x4c>
    3100:	7d 09 51 ae 	stbx    r8,r9,r10
    3104:	39 4a 00 01 	addi    r10,r10,1
    3108:	42 00 ff f8 	bdnz    3100 <strncpy+0x44>
    310c:	4e 80 00 20 	blr

00003110 <strnlen>:
    3110:	39 44 00 01 	addi    r10,r4,1
    3114:	7c 69 1b 78 	mr      r9,r3
    3118:	7d 49 03 a6 	mtctr   r10
    311c:	42 00 00 0c 	bdnz    3128 <strnlen+0x18>
    3120:	7c 63 48 50 	subf    r3,r3,r9
    3124:	4e 80 00 20 	blr
    3128:	89 49 00 00 	lbz     r10,0(r9)
    312c:	2c 0a 00 00 	cmpwi   r10,0
    3130:	41 82 ff f0 	beq     3120 <strnlen+0x10>
    3134:	39 29 00 01 	addi    r9,r9,1
    3138:	4b ff ff e4 	b       311c <strnlen+0xc>

0000313c <fgetc>:
    313c:	89 23 00 02 	lbz     r9,2(r3)
    3140:	71 29 00 01 	andi.   r9,r9,1
    3144:	41 82 00 7c 	beq     31c0 <fgetc+0x84>
    3148:	94 21 ff f0 	stwu    r1,-16(r1)
    314c:	7c 08 02 a6 	mflr    r0
    3150:	90 01 00 14 	stw     r0,20(r1)
    3154:	a1 23 00 00 	lhz     r9,0(r3)
    3158:	93 e1 00 0c 	stw     r31,12(r1)
    315c:	39 40 00 00 	li      r10,0
    3160:	7c 7f 1b 78 	mr      r31,r3
    3164:	b1 43 00 00 	sth     r10,0(r3)
    3168:	2c 09 00 00 	cmpwi   r9,0
    316c:	41 82 00 10 	beq     317c <fgetc+0x40>
    3170:	55 23 06 3e 	clrlwi  r3,r9,24
    3174:	39 61 00 10 	addi    r11,r1,16
    3178:	4b ff d3 fc 	b       574 <_rest32gpr_31_x>
    317c:	81 23 00 08 	lwz     r9,8(r3)
    3180:	7d 29 03 a6 	mtctr   r9
    3184:	4e 80 04 21 	bctrl
    3188:	7c 69 1b 78 	mr      r9,r3
    318c:	54 63 06 3e 	clrlwi  r3,r3,24
    3190:	2c 09 00 00 	cmpwi   r9,0
    3194:	40 80 ff e0 	bge     3174 <fgetc+0x38>
    3198:	89 5f 00 02 	lbz     r10,2(r31)
    319c:	39 00 00 04 	li      r8,4
    31a0:	2c 09 ff ff 	cmpwi   r9,-1
    31a4:	7d 4a 07 74 	extsb   r10,r10
    31a8:	41 82 00 08 	beq     31b0 <fgetc+0x74>
    31ac:	39 00 00 08 	li      r8,8
    31b0:	7d 4a 43 78 	or      r10,r10,r8
    31b4:	38 60 ff ff 	li      r3,-1
    31b8:	99 5f 00 02 	stb     r10,2(r31)
    31bc:	4b ff ff b8 	b       3174 <fgetc+0x38>
    31c0:	38 60 ff ff 	li      r3,-1
    31c4:	4e 80 00 20 	blr

000031c8 <fputc>:
    31c8:	89 44 00 02 	lbz     r10,2(r4)
    31cc:	94 21 ff f0 	stwu    r1,-16(r1)
    31d0:	7c 08 02 a6 	mflr    r0
    31d4:	93 e1 00 0c 	stw     r31,12(r1)
    31d8:	90 01 00 14 	stw     r0,20(r1)
    31dc:	71 4a 00 02 	andi.   r10,r10,2
    31e0:	41 82 00 20 	beq     3200 <fputc+0x38>
    31e4:	81 24 00 04 	lwz     r9,4(r4)
    31e8:	7c 7f 1b 78 	mr      r31,r3
    31ec:	54 63 06 3e 	clrlwi  r3,r3,24
    31f0:	7d 29 03 a6 	mtctr   r9
    31f4:	4e 80 04 21 	bctrl
    31f8:	2c 03 00 00 	cmpwi   r3,0
    31fc:	40 80 00 08 	bge     3204 <fputc+0x3c>
    3200:	3b e0 ff ff 	li      r31,-1
    3204:	7f e3 fb 78 	mr      r3,r31
    3208:	39 61 00 10 	addi    r11,r1,16
    320c:	4b ff d3 68 	b       574 <_rest32gpr_31_x>

00003210 <fputs>:
    3210:	94 21 ff e0 	stwu    r1,-32(r1)
    3214:	7c 08 02 a6 	mflr    r0
    3218:	bf a1 00 14 	stmw    r29,20(r1)
    321c:	90 01 00 24 	stw     r0,36(r1)
    3220:	89 24 00 02 	lbz     r9,2(r4)
    3224:	71 29 00 02 	andi.   r9,r9,2
    3228:	41 82 00 4c 	beq     3274 <fputs+0x64>
    322c:	7c 7f 1b 78 	mr      r31,r3
    3230:	7c 9e 23 78 	mr      r30,r4
    3234:	3b a0 00 00 	li      r29,0
    3238:	88 7f 00 00 	lbz     r3,0(r31)
    323c:	3b ff 00 01 	addi    r31,r31,1
    3240:	2c 03 00 00 	cmpwi   r3,0
    3244:	40 82 00 10 	bne     3254 <fputs+0x44>
    3248:	7f a3 eb 78 	mr      r3,r29
    324c:	39 61 00 20 	addi    r11,r1,32
    3250:	4b ff d3 1c 	b       56c <_rest32gpr_29_x>
    3254:	81 3e 00 04 	lwz     r9,4(r30)
    3258:	7f c4 f3 78 	mr      r4,r30
    325c:	7d 29 03 a6 	mtctr   r9
    3260:	4e 80 04 21 	bctrl
    3264:	2c 03 00 00 	cmpwi   r3,0
    3268:	41 82 ff d0 	beq     3238 <fputs+0x28>
    326c:	3b a0 ff ff 	li      r29,-1
    3270:	4b ff ff c8 	b       3238 <fputs+0x28>
    3274:	3b a0 ff ff 	li      r29,-1
    3278:	4b ff ff d0 	b       3248 <fputs+0x38>

0000327c <printf>:
    327c:	94 21 ff 80 	stwu    r1,-128(r1)
    3280:	7c 08 02 a6 	mflr    r0
    3284:	90 81 00 1c 	stw     r4,28(r1)
    3288:	90 01 00 84 	stw     r0,132(r1)
    328c:	90 a1 00 20 	stw     r5,32(r1)
    3290:	90 c1 00 24 	stw     r6,36(r1)
    3294:	90 e1 00 28 	stw     r7,40(r1)
    3298:	91 01 00 2c 	stw     r8,44(r1)
    329c:	91 21 00 30 	stw     r9,48(r1)
    32a0:	91 41 00 34 	stw     r10,52(r1)
    32a4:	40 86 00 24 	bne     cr1,32c8 <printf+0x4c>
    32a8:	d8 21 00 38 	stfd    f1,56(r1)
    32ac:	d8 41 00 40 	stfd    f2,64(r1)
    32b0:	d8 61 00 48 	stfd    f3,72(r1)
    32b4:	d8 81 00 50 	stfd    f4,80(r1)
    32b8:	d8 a1 00 58 	stfd    f5,88(r1)
    32bc:	d8 c1 00 60 	stfd    f6,96(r1)
    32c0:	d8 e1 00 68 	stfd    f7,104(r1)
    32c4:	d9 01 00 70 	stfd    f8,112(r1)
    32c8:	39 20 00 01 	li      r9,1
    32cc:	7c 64 1b 78 	mr      r4,r3
    32d0:	99 21 00 08 	stb     r9,8(r1)
    32d4:	39 20 00 00 	li      r9,0
    32d8:	99 21 00 09 	stb     r9,9(r1)
    32dc:	39 21 00 88 	addi    r9,r1,136
    32e0:	91 21 00 0c 	stw     r9,12(r1)
    32e4:	39 21 00 18 	addi    r9,r1,24
    32e8:	91 21 00 10 	stw     r9,16(r1)
    32ec:	3d 20 00 01 	lis     r9,1
    32f0:	80 69 02 88 	lwz     r3,648(r9)
    32f4:	38 a1 00 08 	addi    r5,r1,8
    32f8:	48 00 02 31 	bl      3528 <__i_vfprintf>
    32fc:	80 01 00 84 	lwz     r0,132(r1)
    3300:	38 21 00 80 	addi    r1,r1,128
    3304:	7c 08 03 a6 	mtlr    r0
    3308:	4e 80 00 20 	blr

0000330c <puts>:
    330c:	94 21 ff e0 	stwu    r1,-32(r1)
    3310:	3d 20 00 01 	lis     r9,1
    3314:	bf a1 00 14 	stmw    r29,20(r1)
    3318:	83 c9 02 88 	lwz     r30,648(r9)
    331c:	7c 08 02 a6 	mflr    r0
    3320:	90 01 00 24 	stw     r0,36(r1)
    3324:	7c 7f 1b 78 	mr      r31,r3
    3328:	3b a0 00 00 	li      r29,0
    332c:	89 3e 00 02 	lbz     r9,2(r30)
    3330:	71 29 00 02 	andi.   r9,r9,2
    3334:	40 82 00 24 	bne     3358 <puts+0x4c>
    3338:	3b a0 ff ff 	li      r29,-1
    333c:	7f a3 eb 78 	mr      r3,r29
    3340:	39 61 00 20 	addi    r11,r1,32
    3344:	4b ff d2 28 	b       56c <_rest32gpr_29_x>
    3348:	4e 80 04 21 	bctrl
    334c:	2c 03 00 00 	cmpwi   r3,0
    3350:	41 82 00 08 	beq     3358 <puts+0x4c>
    3354:	3b a0 ff ff 	li      r29,-1
    3358:	81 3e 00 04 	lwz     r9,4(r30)
    335c:	88 7f 00 00 	lbz     r3,0(r31)
    3360:	3b ff 00 01 	addi    r31,r31,1
    3364:	7f c4 f3 78 	mr      r4,r30
    3368:	7d 29 03 a6 	mtctr   r9
    336c:	2c 03 00 00 	cmpwi   r3,0
    3370:	40 82 ff d8 	bne     3348 <puts+0x3c>
    3374:	38 60 00 0a 	li      r3,10
    3378:	4e 80 04 21 	bctrl
    337c:	2c 03 00 00 	cmpwi   r3,0
    3380:	41 82 ff bc 	beq     333c <puts+0x30>
    3384:	4b ff ff b4 	b       3338 <puts+0x2c>

00003388 <__ultoa_invert>:
    3388:	7c 6a 1b 78 	mr      r10,r3
    338c:	39 60 00 27 	li      r11,39
    3390:	7c a3 2b 78 	mr      r3,r5
    3394:	70 c9 02 00 	andi.   r9,r6,512
    3398:	41 82 00 0c 	beq     33a4 <__ultoa_invert+0x1c>
    339c:	54 c6 05 ea 	rlwinm  r6,r6,0,23,21
    33a0:	39 60 00 07 	li      r11,7
    33a4:	2e 86 00 08 	cmpwi   cr5,r6,8
    33a8:	2f 86 00 10 	cmpwi   cr7,r6,16
    33ac:	38 e0 00 00 	li      r7,0
    33b0:	38 a0 00 33 	li      r5,51
    33b4:	41 96 01 40 	beq     cr5,34f4 <__ultoa_invert+0x16c>
    33b8:	41 9e 01 50 	beq     cr7,3508 <__ultoa_invert+0x180>
    33bc:	38 00 00 00 	li      r0,0
    33c0:	34 84 00 01 	addic.  r4,r4,1
    33c4:	40 82 00 0c 	bne     33d0 <__ultoa_invert+0x48>
    33c8:	31 4a 00 01 	addic   r10,r10,1
    33cc:	7c 04 01 94 	addze   r0,r4
    33d0:	1d 24 00 33 	mulli   r9,r4,51
    33d4:	1c 00 00 33 	mulli   r0,r0,51
    33d8:	7c 84 28 16 	mulhwu  r4,r4,r5
    33dc:	1d 0a 00 33 	mulli   r8,r10,51
    33e0:	7d 45 50 16 	mulhwu  r10,r5,r10
    33e4:	7d 08 20 14 	addc    r8,r8,r4
    33e8:	7d 80 51 14 	adde    r12,r0,r10
    33ec:	7d 29 38 14 	addc    r9,r9,r7
    33f0:	55 8a 06 3e 	clrlwi  r10,r12,24
    33f4:	7d 08 01 94 	addze   r8,r8
    33f8:	55 24 c2 3e 	rlwinm  r4,r9,24,8,31
    33fc:	55 00 c2 3e 	rlwinm  r0,r8,24,8,31
    3400:	51 04 c0 0e 	rlwimi  r4,r8,24,0,7
    3404:	51 80 c0 0e 	rlwimi  r0,r12,24,0,7
    3408:	7d 24 48 14 	addc    r9,r4,r9
    340c:	7d 00 41 14 	adde    r8,r0,r8
    3410:	7c 00 40 40 	cmplw   r0,r8
    3414:	41 81 00 10 	bgt     3424 <__ultoa_invert+0x9c>
    3418:	40 82 00 14 	bne     342c <__ultoa_invert+0xa4>
    341c:	7c 04 48 40 	cmplw   r4,r9
    3420:	40 81 00 0c 	ble     342c <__ultoa_invert+0xa4>
    3424:	39 4a 00 01 	addi    r10,r10,1
    3428:	55 4a 06 3e 	clrlwi  r10,r10,24
    342c:	55 24 84 3e 	rlwinm  r4,r9,16,16,31
    3430:	55 00 84 3e 	rlwinm  r0,r8,16,16,31
    3434:	51 04 80 1e 	rlwimi  r4,r8,16,0,15
    3438:	51 40 80 1e 	rlwimi  r0,r10,16,0,15
    343c:	7d 29 20 14 	addc    r9,r9,r4
    3440:	7d 08 01 14 	adde    r8,r8,r0
    3444:	7c 00 40 40 	cmplw   r0,r8
    3448:	41 81 00 10 	bgt     3458 <__ultoa_invert+0xd0>
    344c:	40 82 00 14 	bne     3460 <__ultoa_invert+0xd8>
    3450:	7c 04 48 40 	cmplw   r4,r9
    3454:	40 81 00 0c 	ble     3460 <__ultoa_invert+0xd8>
    3458:	39 4a 00 01 	addi    r10,r10,1
    345c:	55 4a 06 3e 	clrlwi  r10,r10,24
    3460:	7d 29 40 14 	addc    r9,r9,r8
    3464:	7c 88 51 14 	adde    r4,r8,r10
    3468:	7c 0a 20 40 	cmplw   r10,r4
    346c:	41 81 00 10 	bgt     347c <__ultoa_invert+0xf4>
    3470:	40 82 00 14 	bne     3484 <__ultoa_invert+0xfc>
    3474:	7c 08 48 40 	cmplw   r8,r9
    3478:	40 81 00 0c 	ble     3484 <__ultoa_invert+0xfc>
    347c:	39 4a 00 01 	addi    r10,r10,1
    3480:	55 4a 06 3e 	clrlwi  r10,r10,24
    3484:	7d 29 50 14 	addc    r9,r9,r10
    3488:	7c 84 01 94 	addze   r4,r4
    348c:	7c 07 20 40 	cmplw   r7,r4
    3490:	40 82 00 14 	bne     34a4 <__ultoa_invert+0x11c>
    3494:	7c 0a 48 40 	cmplw   r10,r9
    3498:	40 81 00 0c 	ble     34a4 <__ultoa_invert+0x11c>
    349c:	39 4a 00 01 	addi    r10,r10,1
    34a0:	55 4a 06 3e 	clrlwi  r10,r10,24
    34a4:	55 29 f8 7e 	rlwinm  r9,r9,31,1,31
    34a8:	50 89 f8 00 	rlwimi  r9,r4,31,0,0
    34ac:	54 84 f8 7e 	rlwinm  r4,r4,31,1,31
    34b0:	55 28 c2 3e 	rlwinm  r8,r9,24,8,31
    34b4:	7c 86 23 78 	mr      r6,r4
    34b8:	50 88 c0 0e 	rlwimi  r8,r4,24,0,7
    34bc:	55 24 06 3e 	clrlwi  r4,r9,24
    34c0:	1c 84 00 0a 	mulli   r4,r4,10
    34c4:	51 46 f8 00 	rlwimi  r6,r10,31,0,0
    34c8:	54 84 c2 3e 	rlwinm  r4,r4,24,8,31
    34cc:	55 4a b8 4e 	rlwinm  r10,r10,23,1,7
    34d0:	54 c6 c2 3e 	rlwinm  r6,r6,24,8,31
    34d4:	7d 4a 33 78 	or      r10,r10,r6
    34d8:	7d 49 43 79 	or.     r9,r10,r8
    34dc:	38 63 00 01 	addi    r3,r3,1
    34e0:	38 84 00 30 	addi    r4,r4,48
    34e4:	98 83 ff ff 	stb     r4,-1(r3)
    34e8:	4d 82 00 20 	beqlr
    34ec:	7d 04 43 78 	mr      r4,r8
    34f0:	4b ff fe c4 	b       33b4 <__ultoa_invert+0x2c>
    34f4:	54 88 e8 fe 	rlwinm  r8,r4,29,3,31
    34f8:	54 84 07 7e 	clrlwi  r4,r4,29
    34fc:	51 48 e8 04 	rlwimi  r8,r10,29,0,2
    3500:	55 4a e8 fe 	rlwinm  r10,r10,29,3,31
    3504:	4b ff ff d4 	b       34d8 <__ultoa_invert+0x150>
    3508:	54 88 e1 3e 	rlwinm  r8,r4,28,4,31
    350c:	54 84 07 3e 	clrlwi  r4,r4,28
    3510:	51 48 e0 06 	rlwimi  r8,r10,28,0,3
    3514:	28 04 00 09 	cmplwi  r4,9
    3518:	55 4a e1 3e 	rlwinm  r10,r10,28,4,31
    351c:	40 81 ff bc 	ble     34d8 <__ultoa_invert+0x150>
    3520:	7c 8b 22 14 	add     r4,r11,r4
    3524:	4b ff ff b4 	b       34d8 <__ultoa_invert+0x150>

00003528 <__i_vfprintf>:
    3528:	94 21 ff a0 	stwu    r1,-96(r1)
    352c:	7c 08 02 a6 	mflr    r0
    3530:	be 61 00 2c 	stmw    r19,44(r1)
    3534:	90 01 00 64 	stw     r0,100(r1)
    3538:	89 23 00 02 	lbz     r9,2(r3)
    353c:	71 29 00 02 	andi.   r9,r9,2
    3540:	41 82 08 24 	beq     3d64 <__i_vfprintf+0x83c>
    3544:	3e c0 00 00 	lis     r22,0
    3548:	3e a0 00 00 	lis     r21,0
    354c:	7c 79 1b 78 	mr      r25,r3
    3550:	7c be 2b 78 	mr      r30,r5
    3554:	3b 60 00 00 	li      r27,0
    3558:	3a d6 5a 4e 	addi    r22,r22,23118
    355c:	3b 01 00 08 	addi    r24,r1,8
    3560:	3a b5 5a 47 	addi    r21,r21,23111
    3564:	8b a4 00 00 	lbz     r29,0(r4)
    3568:	2c 1d 00 00 	cmpwi   r29,0
    356c:	41 82 07 fc 	beq     3d68 <__i_vfprintf+0x840>
    3570:	3a e4 00 01 	addi    r23,r4,1
    3574:	28 1d 00 25 	cmplwi  r29,37
    3578:	40 82 00 14 	bne     358c <__i_vfprintf+0x64>
    357c:	8b a4 00 01 	lbz     r29,1(r4)
    3580:	3a e4 00 02 	addi    r23,r4,2
    3584:	28 1d 00 25 	cmplwi  r29,37
    3588:	40 82 00 18 	bne     35a0 <__i_vfprintf+0x78>
    358c:	3b 7b 00 01 	addi    r27,r27,1
    3590:	7f 24 cb 78 	mr      r4,r25
    3594:	7f a3 eb 78 	mr      r3,r29
    3598:	4b ff fc 31 	bl      31c8 <fputc>
    359c:	48 00 03 48 	b       38e4 <__i_vfprintf+0x3bc>
    35a0:	3b 40 00 00 	li      r26,0
    35a4:	3b 80 00 00 	li      r28,0
    35a8:	3b e0 00 00 	li      r31,0
    35ac:	28 1f 00 1f 	cmplwi  r31,31
    35b0:	41 81 00 88 	bgt     3638 <__i_vfprintf+0x110>
    35b4:	28 1d 00 2b 	cmplwi  r29,43
    35b8:	41 82 00 64 	beq     361c <__i_vfprintf+0xf4>
    35bc:	41 81 00 38 	bgt     35f4 <__i_vfprintf+0xcc>
    35c0:	28 1d 00 20 	cmplwi  r29,32
    35c4:	41 82 00 5c 	beq     3620 <__i_vfprintf+0xf8>
    35c8:	28 1d 00 23 	cmplwi  r29,35
    35cc:	41 82 00 64 	beq     3630 <__i_vfprintf+0x108>
    35d0:	39 3d ff d0 	addi    r9,r29,-48
    35d4:	55 29 06 3e 	clrlwi  r9,r9,24
    35d8:	28 09 00 09 	cmplwi  r9,9
    35dc:	41 81 00 90 	bgt     366c <__i_vfprintf+0x144>
    35e0:	73 ea 00 40 	andi.   r10,r31,64
    35e4:	41 82 00 78 	beq     365c <__i_vfprintf+0x134>
    35e8:	1f 5a 00 0a 	mulli   r26,r26,10
    35ec:	7f 5a 4a 14 	add     r26,r26,r9
    35f0:	48 00 00 18 	b       3608 <__i_vfprintf+0xe0>
    35f4:	28 1d 00 2d 	cmplwi  r29,45
    35f8:	41 82 00 30 	beq     3628 <__i_vfprintf+0x100>
    35fc:	28 1d 00 30 	cmplwi  r29,48
    3600:	40 82 ff d0 	bne     35d0 <__i_vfprintf+0xa8>
    3604:	63 ff 00 01 	ori     r31,r31,1
    3608:	8b b7 00 00 	lbz     r29,0(r23)
    360c:	3a f7 00 01 	addi    r23,r23,1
    3610:	2c 1d 00 00 	cmpwi   r29,0
    3614:	40 82 ff 98 	bne     35ac <__i_vfprintf+0x84>
    3618:	48 00 01 34 	b       374c <__i_vfprintf+0x224>
    361c:	63 ff 00 02 	ori     r31,r31,2
    3620:	63 ff 00 04 	ori     r31,r31,4
    3624:	4b ff ff e4 	b       3608 <__i_vfprintf+0xe0>
    3628:	63 ff 00 08 	ori     r31,r31,8
    362c:	4b ff ff dc 	b       3608 <__i_vfprintf+0xe0>
    3630:	63 ff 00 10 	ori     r31,r31,16
    3634:	4b ff ff d4 	b       3608 <__i_vfprintf+0xe0>
    3638:	28 1f 00 7f 	cmplwi  r31,127
    363c:	40 81 ff 94 	ble     35d0 <__i_vfprintf+0xa8>
    3640:	28 1d 00 6c 	cmplwi  r29,108
    3644:	40 82 00 cc 	bne     3710 <__i_vfprintf+0x1e8>
    3648:	73 e9 00 80 	andi.   r9,r31,128
    364c:	41 82 00 08 	beq     3654 <__i_vfprintf+0x12c>
    3650:	63 ff 02 00 	ori     r31,r31,512
    3654:	63 ff 00 80 	ori     r31,r31,128
    3658:	4b ff ff b0 	b       3608 <__i_vfprintf+0xe0>
    365c:	1f 9c 00 0a 	mulli   r28,r28,10
    3660:	7f 9c 4a 14 	add     r28,r28,r9
    3664:	63 ff 00 20 	ori     r31,r31,32
    3668:	4b ff ff a0 	b       3608 <__i_vfprintf+0xe0>
    366c:	28 1d 00 2a 	cmplwi  r29,42
    3670:	40 82 00 88 	bne     36f8 <__i_vfprintf+0x1d0>
    3674:	89 3e 00 00 	lbz     r9,0(r30)
    3678:	73 ea 00 40 	andi.   r10,r31,64
    367c:	41 82 00 38 	beq     36b4 <__i_vfprintf+0x18c>
    3680:	28 09 00 07 	cmplwi  r9,7
    3684:	41 81 00 20 	bgt     36a4 <__i_vfprintf+0x17c>
    3688:	81 5e 00 08 	lwz     r10,8(r30)
    368c:	39 09 00 01 	addi    r8,r9,1
    3690:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3694:	99 1e 00 00 	stb     r8,0(r30)
    3698:	7d 2a 4a 14 	add     r9,r10,r9
    369c:	83 49 00 00 	lwz     r26,0(r9)
    36a0:	4b ff ff 68 	b       3608 <__i_vfprintf+0xe0>
    36a4:	81 3e 00 04 	lwz     r9,4(r30)
    36a8:	39 49 00 04 	addi    r10,r9,4
    36ac:	91 5e 00 04 	stw     r10,4(r30)
    36b0:	4b ff ff ec 	b       369c <__i_vfprintf+0x174>
    36b4:	28 09 00 07 	cmplwi  r9,7
    36b8:	41 81 00 30 	bgt     36e8 <__i_vfprintf+0x1c0>
    36bc:	81 5e 00 08 	lwz     r10,8(r30)
    36c0:	39 09 00 01 	addi    r8,r9,1
    36c4:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    36c8:	99 1e 00 00 	stb     r8,0(r30)
    36cc:	7d 2a 4a 14 	add     r9,r10,r9
    36d0:	83 89 00 00 	lwz     r28,0(r9)
    36d4:	2c 1c 00 00 	cmpwi   r28,0
    36d8:	40 80 ff 8c 	bge     3664 <__i_vfprintf+0x13c>
    36dc:	7f 9c 00 d0 	neg     r28,r28
    36e0:	63 ff 00 28 	ori     r31,r31,40
    36e4:	4b ff ff 24 	b       3608 <__i_vfprintf+0xe0>
    36e8:	81 3e 00 04 	lwz     r9,4(r30)
    36ec:	39 49 00 04 	addi    r10,r9,4
    36f0:	91 5e 00 04 	stw     r10,4(r30)
    36f4:	4b ff ff dc 	b       36d0 <__i_vfprintf+0x1a8>
    36f8:	28 1d 00 2e 	cmplwi  r29,46
    36fc:	40 82 ff 44 	bne     3640 <__i_vfprintf+0x118>
    3700:	73 e9 00 40 	andi.   r9,r31,64
    3704:	40 82 06 64 	bne     3d68 <__i_vfprintf+0x840>
    3708:	63 ff 00 40 	ori     r31,r31,64
    370c:	4b ff fe fc 	b       3608 <__i_vfprintf+0xe0>
    3710:	28 1d 00 68 	cmplwi  r29,104
    3714:	40 82 00 18 	bne     372c <__i_vfprintf+0x204>
    3718:	73 e9 01 00 	andi.   r9,r31,256
    371c:	41 82 00 08 	beq     3724 <__i_vfprintf+0x1fc>
    3720:	63 ff 02 00 	ori     r31,r31,512
    3724:	63 ff 01 00 	ori     r31,r31,256
    3728:	4b ff fe e0 	b       3608 <__i_vfprintf+0xe0>
    372c:	28 1d 00 6a 	cmplwi  r29,106
    3730:	40 82 00 0c 	bne     373c <__i_vfprintf+0x214>
    3734:	63 ff 02 80 	ori     r31,r31,640
    3738:	4b ff fe d0 	b       3608 <__i_vfprintf+0xe0>
    373c:	28 1d 00 7a 	cmplwi  r29,122
    3740:	41 82 fe c8 	beq     3608 <__i_vfprintf+0xe0>
    3744:	28 1d 00 74 	cmplwi  r29,116
    3748:	41 82 fe c0 	beq     3608 <__i_vfprintf+0xe0>
    374c:	2c 1a 00 00 	cmpwi   r26,0
    3750:	40 80 00 0c 	bge     375c <__i_vfprintf+0x234>
    3754:	73 ff ff bf 	andi.   r31,r31,65471
    3758:	3b 40 00 00 	li      r26,0
    375c:	63 a9 00 20 	ori     r9,r29,32
    3760:	39 49 ff 9b 	addi    r10,r9,-101
    3764:	55 4a 06 3e 	clrlwi  r10,r10,24
    3768:	28 0a 00 02 	cmplwi  r10,2
    376c:	40 81 00 0c 	ble     3778 <__i_vfprintf+0x250>
    3770:	28 09 00 61 	cmplwi  r9,97
    3774:	40 82 00 48 	bne     37bc <__i_vfprintf+0x294>
    3778:	89 3e 00 01 	lbz     r9,1(r30)
    377c:	28 09 00 07 	cmplwi  r9,7
    3780:	41 81 00 24 	bgt     37a4 <__i_vfprintf+0x27c>
    3784:	39 29 00 01 	addi    r9,r9,1
    3788:	99 3e 00 01 	stb     r9,1(r30)
    378c:	3b 40 00 07 	li      r26,7
    3790:	7e d4 b3 78 	mr      r20,r22
    3794:	73 e9 00 08 	andi.   r9,r31,8
    3798:	40 82 01 1c 	bne     38b4 <__i_vfprintf+0x38c>
    379c:	7f 9f e3 78 	mr      r31,r28
    37a0:	48 00 00 e0 	b       3880 <__i_vfprintf+0x358>
    37a4:	81 3e 00 04 	lwz     r9,4(r30)
    37a8:	39 29 00 07 	addi    r9,r9,7
    37ac:	55 29 00 38 	rlwinm  r9,r9,0,0,28
    37b0:	39 29 00 08 	addi    r9,r9,8
    37b4:	91 3e 00 04 	stw     r9,4(r30)
    37b8:	4b ff ff d4 	b       378c <__i_vfprintf+0x264>
    37bc:	28 1d 00 63 	cmplwi  r29,99
    37c0:	40 82 00 48 	bne     3808 <__i_vfprintf+0x2e0>
    37c4:	89 5e 00 00 	lbz     r10,0(r30)
    37c8:	28 0a 00 07 	cmplwi  r10,7
    37cc:	41 81 00 2c 	bgt     37f8 <__i_vfprintf+0x2d0>
    37d0:	81 3e 00 08 	lwz     r9,8(r30)
    37d4:	39 0a 00 01 	addi    r8,r10,1
    37d8:	55 4a 10 3a 	rlwinm  r10,r10,2,0,29
    37dc:	99 1e 00 00 	stb     r8,0(r30)
    37e0:	7d 29 52 14 	add     r9,r9,r10
    37e4:	81 29 00 00 	lwz     r9,0(r9)
    37e8:	3b 40 00 01 	li      r26,1
    37ec:	7f 14 c3 78 	mr      r20,r24
    37f0:	99 21 00 08 	stb     r9,8(r1)
    37f4:	4b ff ff a0 	b       3794 <__i_vfprintf+0x26c>
    37f8:	81 3e 00 04 	lwz     r9,4(r30)
    37fc:	39 49 00 04 	addi    r10,r9,4
    3800:	91 5e 00 04 	stw     r10,4(r30)
    3804:	4b ff ff e0 	b       37e4 <__i_vfprintf+0x2bc>
    3808:	28 1d 00 73 	cmplwi  r29,115
    380c:	40 82 00 f4 	bne     3900 <__i_vfprintf+0x3d8>
    3810:	89 5e 00 00 	lbz     r10,0(r30)
    3814:	28 0a 00 07 	cmplwi  r10,7
    3818:	41 81 00 48 	bgt     3860 <__i_vfprintf+0x338>
    381c:	81 3e 00 08 	lwz     r9,8(r30)
    3820:	39 0a 00 01 	addi    r8,r10,1
    3824:	55 4a 10 3a 	rlwinm  r10,r10,2,0,29
    3828:	99 1e 00 00 	stb     r8,0(r30)
    382c:	7d 29 52 14 	add     r9,r9,r10
    3830:	82 89 00 00 	lwz     r20,0(r9)
    3834:	2c 14 00 00 	cmpwi   r20,0
    3838:	40 82 00 08 	bne     3840 <__i_vfprintf+0x318>
    383c:	7e b4 ab 78 	mr      r20,r21
    3840:	38 80 ff ff 	li      r4,-1
    3844:	73 e9 00 40 	andi.   r9,r31,64
    3848:	41 82 00 08 	beq     3850 <__i_vfprintf+0x328>
    384c:	7f 44 d3 78 	mr      r4,r26
    3850:	7e 83 a3 78 	mr      r3,r20
    3854:	4b ff f8 bd 	bl      3110 <strnlen>
    3858:	7c 7a 1b 78 	mr      r26,r3
    385c:	4b ff ff 38 	b       3794 <__i_vfprintf+0x26c>
    3860:	81 3e 00 04 	lwz     r9,4(r30)
    3864:	39 49 00 04 	addi    r10,r9,4
    3868:	91 5e 00 04 	stw     r10,4(r30)
    386c:	4b ff ff c4 	b       3830 <__i_vfprintf+0x308>
    3870:	7f 24 cb 78 	mr      r4,r25
    3874:	38 60 00 20 	li      r3,32
    3878:	3b ff ff ff 	addi    r31,r31,-1
    387c:	4b ff f9 4d 	bl      31c8 <fputc>
    3880:	7c 1a f8 40 	cmplw   r26,r31
    3884:	41 80 ff ec 	blt     3870 <__i_vfprintf+0x348>
    3888:	7d 5a e0 50 	subf    r10,r26,r28
    388c:	39 20 00 00 	li      r9,0
    3890:	7c 1a e0 40 	cmplw   r26,r28
    3894:	41 81 00 08 	bgt     389c <__i_vfprintf+0x374>
    3898:	7d 49 53 78 	mr      r9,r10
    389c:	7f 7b 4a 14 	add     r27,r27,r9
    38a0:	7c 1a e0 40 	cmplw   r26,r28
    38a4:	39 20 00 00 	li      r9,0
    38a8:	41 81 00 08 	bgt     38b0 <__i_vfprintf+0x388>
    38ac:	7d 2a 00 d0 	neg     r9,r10
    38b0:	7f 9c 4a 14 	add     r28,r28,r9
    38b4:	7f ba e0 50 	subf    r29,r26,r28
    38b8:	3b e0 00 00 	li      r31,0
    38bc:	7c 1f d0 40 	cmplw   r31,r26
    38c0:	40 82 00 2c 	bne     38ec <__i_vfprintf+0x3c4>
    38c4:	7f ff da 14 	add     r31,r31,r27
    38c8:	7f bc eb 78 	mr      r28,r29
    38cc:	2c 1c 00 00 	cmpwi   r28,0
    38d0:	41 81 04 80 	bgt     3d50 <__i_vfprintf+0x828>
    38d4:	7f bb eb 79 	mr.     r27,r29
    38d8:	40 80 00 08 	bge     38e0 <__i_vfprintf+0x3b8>
    38dc:	3b 60 00 00 	li      r27,0
    38e0:	7f 7b fa 14 	add     r27,r27,r31
    38e4:	7e e4 bb 78 	mr      r4,r23
    38e8:	4b ff fc 7c 	b       3564 <__i_vfprintf+0x3c>
    38ec:	7c 74 f8 ae 	lbzx    r3,r20,r31
    38f0:	7f 24 cb 78 	mr      r4,r25
    38f4:	3b ff 00 01 	addi    r31,r31,1
    38f8:	4b ff f8 d1 	bl      31c8 <fputc>
    38fc:	4b ff ff c0 	b       38bc <__i_vfprintf+0x394>
    3900:	28 1d 00 64 	cmplwi  r29,100
    3904:	41 82 00 0c 	beq     3910 <__i_vfprintf+0x3e8>
    3908:	28 1d 00 69 	cmplwi  r29,105
    390c:	40 82 01 34 	bne     3a40 <__i_vfprintf+0x518>
    3910:	89 3e 00 00 	lbz     r9,0(r30)
    3914:	73 ea 00 80 	andi.   r10,r31,128
    3918:	41 82 00 d4 	beq     39ec <__i_vfprintf+0x4c4>
    391c:	73 ea 02 00 	andi.   r10,r31,512
    3920:	41 82 00 94 	beq     39b4 <__i_vfprintf+0x48c>
    3924:	39 49 00 01 	addi    r10,r9,1
    3928:	28 09 00 06 	cmplwi  r9,6
    392c:	55 4a 06 3c 	rlwinm  r10,r10,0,24,30
    3930:	99 5e 00 00 	stb     r10,0(r30)
    3934:	41 81 00 68 	bgt     399c <__i_vfprintf+0x474>
    3938:	81 3e 00 08 	lwz     r9,8(r30)
    393c:	39 0a 00 02 	addi    r8,r10,2
    3940:	55 4a 10 3a 	rlwinm  r10,r10,2,0,29
    3944:	99 1e 00 00 	stb     r8,0(r30)
    3948:	7d 29 52 14 	add     r9,r9,r10
    394c:	80 69 00 00 	lwz     r3,0(r9)
    3950:	80 89 00 04 	lwz     r4,4(r9)
    3954:	2c 03 00 00 	cmpwi   r3,0
    3958:	40 80 00 10 	bge     3968 <__i_vfprintf+0x440>
    395c:	20 84 00 00 	subfic  r4,r4,0
    3960:	63 ff 04 00 	ori     r31,r31,1024
    3964:	7c 63 01 90 	subfze  r3,r3
    3968:	73 f4 ff ef 	andi.   r20,r31,65519
    396c:	73 e9 00 40 	andi.   r9,r31,64
    3970:	41 82 00 18 	beq     3988 <__i_vfprintf+0x460>
    3974:	2c 1a 00 00 	cmpwi   r26,0
    3978:	40 82 00 10 	bne     3988 <__i_vfprintf+0x460>
    397c:	3b e0 00 00 	li      r31,0
    3980:	7c 69 23 79 	or.     r9,r3,r4
    3984:	41 82 01 34 	beq     3ab8 <__i_vfprintf+0x590>
    3988:	38 c0 00 0a 	li      r6,10
    398c:	7f 05 c3 78 	mr      r5,r24
    3990:	4b ff f9 f9 	bl      3388 <__ultoa_invert>
    3994:	7f f8 18 50 	subf    r31,r24,r3
    3998:	48 00 01 20 	b       3ab8 <__i_vfprintf+0x590>
    399c:	81 3e 00 04 	lwz     r9,4(r30)
    39a0:	39 29 00 07 	addi    r9,r9,7
    39a4:	55 29 00 38 	rlwinm  r9,r9,0,0,28
    39a8:	39 49 00 08 	addi    r10,r9,8
    39ac:	91 5e 00 04 	stw     r10,4(r30)
    39b0:	4b ff ff 9c 	b       394c <__i_vfprintf+0x424>
    39b4:	28 09 00 07 	cmplwi  r9,7
    39b8:	41 81 00 24 	bgt     39dc <__i_vfprintf+0x4b4>
    39bc:	81 5e 00 08 	lwz     r10,8(r30)
    39c0:	39 09 00 01 	addi    r8,r9,1
    39c4:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    39c8:	99 1e 00 00 	stb     r8,0(r30)
    39cc:	7d 2a 4a 14 	add     r9,r10,r9
    39d0:	80 89 00 00 	lwz     r4,0(r9)
    39d4:	7c 83 fe 70 	srawi   r3,r4,31
    39d8:	4b ff ff 7c 	b       3954 <__i_vfprintf+0x42c>
    39dc:	81 3e 00 04 	lwz     r9,4(r30)
    39e0:	39 49 00 04 	addi    r10,r9,4
    39e4:	91 5e 00 04 	stw     r10,4(r30)
    39e8:	4b ff ff e8 	b       39d0 <__i_vfprintf+0x4a8>
    39ec:	28 09 00 07 	cmplwi  r9,7
    39f0:	41 81 00 40 	bgt     3a30 <__i_vfprintf+0x508>
    39f4:	81 5e 00 08 	lwz     r10,8(r30)
    39f8:	39 09 00 01 	addi    r8,r9,1
    39fc:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3a00:	99 1e 00 00 	stb     r8,0(r30)
    3a04:	7d 2a 4a 14 	add     r9,r10,r9
    3a08:	81 29 00 00 	lwz     r9,0(r9)
    3a0c:	73 ea 01 00 	andi.   r10,r31,256
    3a10:	7d 24 4b 78 	mr      r4,r9
    3a14:	41 82 ff c0 	beq     39d4 <__i_vfprintf+0x4ac>
    3a18:	7d 24 07 34 	extsh   r4,r9
    3a1c:	73 ea 02 00 	andi.   r10,r31,512
    3a20:	7c 83 fe 70 	srawi   r3,r4,31
    3a24:	41 82 ff 30 	beq     3954 <__i_vfprintf+0x42c>
    3a28:	7d 24 07 74 	extsb   r4,r9
    3a2c:	4b ff ff a8 	b       39d4 <__i_vfprintf+0x4ac>
    3a30:	81 3e 00 04 	lwz     r9,4(r30)
    3a34:	39 49 00 04 	addi    r10,r9,4
    3a38:	91 5e 00 04 	stw     r10,4(r30)
    3a3c:	4b ff ff cc 	b       3a08 <__i_vfprintf+0x4e0>
    3a40:	28 1d 00 75 	cmplwi  r29,117
    3a44:	40 82 01 48 	bne     3b8c <__i_vfprintf+0x664>
    3a48:	73 ff ff ef 	andi.   r31,r31,65519
    3a4c:	38 c0 00 0a 	li      r6,10
    3a50:	89 3e 00 00 	lbz     r9,0(r30)
    3a54:	73 ea 00 80 	andi.   r10,r31,128
    3a58:	41 82 01 e0 	beq     3c38 <__i_vfprintf+0x710>
    3a5c:	73 ea 02 00 	andi.   r10,r31,512
    3a60:	41 82 01 a0 	beq     3c00 <__i_vfprintf+0x6d8>
    3a64:	39 49 00 01 	addi    r10,r9,1
    3a68:	28 09 00 06 	cmplwi  r9,6
    3a6c:	55 4a 06 3c 	rlwinm  r10,r10,0,24,30
    3a70:	99 5e 00 00 	stb     r10,0(r30)
    3a74:	41 81 01 74 	bgt     3be8 <__i_vfprintf+0x6c0>
    3a78:	81 3e 00 08 	lwz     r9,8(r30)
    3a7c:	39 0a 00 02 	addi    r8,r10,2
    3a80:	55 4a 10 3a 	rlwinm  r10,r10,2,0,29
    3a84:	99 1e 00 00 	stb     r8,0(r30)
    3a88:	7d 29 52 14 	add     r9,r9,r10
    3a8c:	80 69 00 00 	lwz     r3,0(r9)
    3a90:	80 89 00 04 	lwz     r4,4(r9)
    3a94:	73 f4 ff f9 	andi.   r20,r31,65529
    3a98:	73 e9 00 40 	andi.   r9,r31,64
    3a9c:	41 82 fe f0 	beq     398c <__i_vfprintf+0x464>
    3aa0:	2c 1a 00 00 	cmpwi   r26,0
    3aa4:	40 82 fe e8 	bne     398c <__i_vfprintf+0x464>
    3aa8:	7c 69 23 79 	or.     r9,r3,r4
    3aac:	40 82 fe e0 	bne     398c <__i_vfprintf+0x464>
    3ab0:	73 f4 ff e9 	andi.   r20,r31,65513
    3ab4:	3b e0 00 00 	li      r31,0
    3ab8:	7f fd fb 78 	mr      r29,r31
    3abc:	7e 93 a3 78 	mr      r19,r20
    3ac0:	72 89 00 40 	andi.   r9,r20,64
    3ac4:	41 82 00 20 	beq     3ae4 <__i_vfprintf+0x5bc>
    3ac8:	56 93 04 3c 	rlwinm  r19,r20,0,16,30
    3acc:	7c 1a f8 00 	cmpw    r26,r31
    3ad0:	40 81 00 14 	ble     3ae4 <__i_vfprintf+0x5bc>
    3ad4:	7f 5d d3 78 	mr      r29,r26
    3ad8:	72 89 10 00 	andi.   r9,r20,4096
    3adc:	40 82 00 08 	bne     3ae4 <__i_vfprintf+0x5bc>
    3ae0:	72 93 ff ee 	andi.   r19,r20,65518
    3ae4:	72 69 00 10 	andi.   r9,r19,16
    3ae8:	41 82 01 c0 	beq     3ca8 <__i_vfprintf+0x780>
    3aec:	7d 38 fa 14 	add     r9,r24,r31
    3af0:	89 29 ff ff 	lbz     r9,-1(r9)
    3af4:	2f 89 00 30 	cmpwi   cr7,r9,48
    3af8:	40 9e 01 98 	bne     cr7,3c90 <__i_vfprintf+0x768>
    3afc:	72 73 ff ef 	andi.   r19,r19,65519
    3b00:	72 69 00 08 	andi.   r9,r19,8
    3b04:	40 82 00 24 	bne     3b28 <__i_vfprintf+0x600>
    3b08:	72 69 00 01 	andi.   r9,r19,1
    3b0c:	41 82 01 dc 	beq     3ce8 <__i_vfprintf+0x7c0>
    3b10:	7f fa fb 78 	mr      r26,r31
    3b14:	7c 1c e8 00 	cmpw    r28,r29
    3b18:	40 81 00 10 	ble     3b28 <__i_vfprintf+0x600>
    3b1c:	7f bd e0 50 	subf    r29,r29,r28
    3b20:	7f 5d fa 14 	add     r26,r29,r31
    3b24:	7f 9d e3 78 	mr      r29,r28
    3b28:	7f bd e0 50 	subf    r29,r29,r28
    3b2c:	72 69 00 10 	andi.   r9,r19,16
    3b30:	41 82 01 e0 	beq     3d10 <__i_vfprintf+0x7e8>
    3b34:	7f 24 cb 78 	mr      r4,r25
    3b38:	38 60 00 30 	li      r3,48
    3b3c:	4b ff f6 8d 	bl      31c8 <fputc>
    3b40:	72 69 10 00 	andi.   r9,r19,4096
    3b44:	40 82 01 ac 	bne     3cf0 <__i_vfprintf+0x7c8>
    3b48:	3b 7b 00 01 	addi    r27,r27,1
    3b4c:	7f 5c d3 78 	mr      r28,r26
    3b50:	7c 1f e0 00 	cmpw    r31,r28
    3b54:	41 80 01 e8 	blt     3d3c <__i_vfprintf+0x814>
    3b58:	38 60 00 00 	li      r3,0
    3b5c:	7c 1f d0 00 	cmpw    r31,r26
    3b60:	41 81 00 08 	bgt     3b68 <__i_vfprintf+0x640>
    3b64:	7c 7f d0 50 	subf    r3,r31,r26
    3b68:	7f 63 da 14 	add     r27,r3,r27
    3b6c:	7f fc fb 78 	mr      r28,r31
    3b70:	2c 1c 00 00 	cmpwi   r28,0
    3b74:	41 82 fd 50 	beq     38c4 <__i_vfprintf+0x39c>
    3b78:	3b 9c ff ff 	addi    r28,r28,-1
    3b7c:	7c 78 e0 ae 	lbzx    r3,r24,r28
    3b80:	7f 24 cb 78 	mr      r4,r25
    3b84:	4b ff f6 45 	bl      31c8 <fputc>
    3b88:	4b ff ff e8 	b       3b70 <__i_vfprintf+0x648>
    3b8c:	28 1d 00 6f 	cmplwi  r29,111
    3b90:	41 82 00 50 	beq     3be0 <__i_vfprintf+0x6b8>
    3b94:	28 1d 00 70 	cmplwi  r29,112
    3b98:	40 82 00 10 	bne     3ba8 <__i_vfprintf+0x680>
    3b9c:	63 ff 10 10 	ori     r31,r31,4112
    3ba0:	38 c0 00 10 	li      r6,16
    3ba4:	4b ff fe ac 	b       3a50 <__i_vfprintf+0x528>
    3ba8:	28 09 00 78 	cmplwi  r9,120
    3bac:	40 82 00 20 	bne     3bcc <__i_vfprintf+0x6a4>
    3bb0:	28 1d 00 58 	cmplwi  r29,88
    3bb4:	41 82 00 0c 	beq     3bc0 <__i_vfprintf+0x698>
    3bb8:	63 ff 10 00 	ori     r31,r31,4096
    3bbc:	4b ff ff e4 	b       3ba0 <__i_vfprintf+0x678>
    3bc0:	63 ff 18 00 	ori     r31,r31,6144
    3bc4:	38 c0 02 10 	li      r6,528
    3bc8:	4b ff fe 88 	b       3a50 <__i_vfprintf+0x528>
    3bcc:	7f 24 cb 78 	mr      r4,r25
    3bd0:	38 60 00 25 	li      r3,37
    3bd4:	3b 7b 00 02 	addi    r27,r27,2
    3bd8:	4b ff f5 f1 	bl      31c8 <fputc>
    3bdc:	4b ff f9 b4 	b       3590 <__i_vfprintf+0x68>
    3be0:	38 c0 00 08 	li      r6,8
    3be4:	4b ff fe 6c 	b       3a50 <__i_vfprintf+0x528>
    3be8:	81 3e 00 04 	lwz     r9,4(r30)
    3bec:	39 29 00 07 	addi    r9,r9,7
    3bf0:	55 29 00 38 	rlwinm  r9,r9,0,0,28
    3bf4:	39 49 00 08 	addi    r10,r9,8
    3bf8:	91 5e 00 04 	stw     r10,4(r30)
    3bfc:	4b ff fe 90 	b       3a8c <__i_vfprintf+0x564>
    3c00:	28 09 00 07 	cmplwi  r9,7
    3c04:	41 81 00 24 	bgt     3c28 <__i_vfprintf+0x700>
    3c08:	81 5e 00 08 	lwz     r10,8(r30)
    3c0c:	39 09 00 01 	addi    r8,r9,1
    3c10:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3c14:	99 1e 00 00 	stb     r8,0(r30)
    3c18:	7d 2a 4a 14 	add     r9,r10,r9
    3c1c:	80 89 00 00 	lwz     r4,0(r9)
    3c20:	38 60 00 00 	li      r3,0
    3c24:	4b ff fe 70 	b       3a94 <__i_vfprintf+0x56c>
    3c28:	81 3e 00 04 	lwz     r9,4(r30)
    3c2c:	39 49 00 04 	addi    r10,r9,4
    3c30:	91 5e 00 04 	stw     r10,4(r30)
    3c34:	4b ff ff e8 	b       3c1c <__i_vfprintf+0x6f4>
    3c38:	28 09 00 07 	cmplwi  r9,7
    3c3c:	41 81 00 2c 	bgt     3c68 <__i_vfprintf+0x740>
    3c40:	81 5e 00 08 	lwz     r10,8(r30)
    3c44:	39 09 00 01 	addi    r8,r9,1
    3c48:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    3c4c:	99 1e 00 00 	stb     r8,0(r30)
    3c50:	7d 2a 4a 14 	add     r9,r10,r9
    3c54:	81 29 00 00 	lwz     r9,0(r9)
    3c58:	73 ea 01 00 	andi.   r10,r31,256
    3c5c:	40 82 00 1c 	bne     3c78 <__i_vfprintf+0x750>
    3c60:	7d 24 4b 78 	mr      r4,r9
    3c64:	4b ff ff bc 	b       3c20 <__i_vfprintf+0x6f8>
    3c68:	81 3e 00 04 	lwz     r9,4(r30)
    3c6c:	39 49 00 04 	addi    r10,r9,4
    3c70:	91 5e 00 04 	stw     r10,4(r30)
    3c74:	4b ff ff e0 	b       3c54 <__i_vfprintf+0x72c>
    3c78:	55 24 04 3e 	clrlwi  r4,r9,16
    3c7c:	38 60 00 00 	li      r3,0
    3c80:	73 ea 02 00 	andi.   r10,r31,512
    3c84:	41 82 fe 10 	beq     3a94 <__i_vfprintf+0x56c>
    3c88:	55 24 06 3e 	clrlwi  r4,r9,24
    3c8c:	4b ff fe 08 	b       3a94 <__i_vfprintf+0x56c>
    3c90:	72 69 10 00 	andi.   r9,r19,4096
    3c94:	40 82 00 0c 	bne     3ca0 <__i_vfprintf+0x778>
    3c98:	3b bd 00 01 	addi    r29,r29,1
    3c9c:	4b ff fe 64 	b       3b00 <__i_vfprintf+0x5d8>
    3ca0:	3b bd 00 02 	addi    r29,r29,2
    3ca4:	4b ff fe 5c 	b       3b00 <__i_vfprintf+0x5d8>
    3ca8:	72 69 04 06 	andi.   r9,r19,1030
    3cac:	41 82 fe 54 	beq     3b00 <__i_vfprintf+0x5d8>
    3cb0:	4b ff ff e8 	b       3c98 <__i_vfprintf+0x770>
    3cb4:	7f 24 cb 78 	mr      r4,r25
    3cb8:	38 60 00 20 	li      r3,32
    3cbc:	3a 94 00 01 	addi    r20,r20,1
    3cc0:	4b ff f5 09 	bl      31c8 <fputc>
    3cc4:	7c 1c a0 00 	cmpw    r28,r20
    3cc8:	41 81 ff ec 	bgt     3cb4 <__i_vfprintf+0x78c>
    3ccc:	39 20 00 00 	li      r9,0
    3cd0:	7c 1c e8 00 	cmpw    r28,r29
    3cd4:	41 80 00 08 	blt     3cdc <__i_vfprintf+0x7b4>
    3cd8:	7d 3d e0 50 	subf    r9,r29,r28
    3cdc:	7f 7b 4a 14 	add     r27,r27,r9
    3ce0:	7f bd 4a 14 	add     r29,r29,r9
    3ce4:	4b ff fe 44 	b       3b28 <__i_vfprintf+0x600>
    3ce8:	7f b4 eb 78 	mr      r20,r29
    3cec:	4b ff ff d8 	b       3cc4 <__i_vfprintf+0x79c>
    3cf0:	3b 7b 00 02 	addi    r27,r27,2
    3cf4:	38 60 00 58 	li      r3,88
    3cf8:	72 69 08 00 	andi.   r9,r19,2048
    3cfc:	40 82 00 08 	bne     3d04 <__i_vfprintf+0x7dc>
    3d00:	38 60 00 78 	li      r3,120
    3d04:	7f 24 cb 78 	mr      r4,r25
    3d08:	4b ff f4 c1 	bl      31c8 <fputc>
    3d0c:	4b ff fe 40 	b       3b4c <__i_vfprintf+0x624>
    3d10:	72 69 04 06 	andi.   r9,r19,1030
    3d14:	41 82 fe 38 	beq     3b4c <__i_vfprintf+0x624>
    3d18:	38 60 00 20 	li      r3,32
    3d1c:	72 69 00 02 	andi.   r9,r19,2
    3d20:	41 82 00 08 	beq     3d28 <__i_vfprintf+0x800>
    3d24:	38 60 00 2b 	li      r3,43
    3d28:	72 69 04 00 	andi.   r9,r19,1024
    3d2c:	41 82 00 08 	beq     3d34 <__i_vfprintf+0x80c>
    3d30:	38 60 00 2d 	li      r3,45
    3d34:	3b 7b 00 01 	addi    r27,r27,1
    3d38:	4b ff ff cc 	b       3d04 <__i_vfprintf+0x7dc>
    3d3c:	7f 24 cb 78 	mr      r4,r25
    3d40:	38 60 00 30 	li      r3,48
    3d44:	3b 9c ff ff 	addi    r28,r28,-1
    3d48:	4b ff f4 81 	bl      31c8 <fputc>
    3d4c:	4b ff fe 04 	b       3b50 <__i_vfprintf+0x628>
    3d50:	7f 24 cb 78 	mr      r4,r25
    3d54:	38 60 00 20 	li      r3,32
    3d58:	3b 9c ff ff 	addi    r28,r28,-1
    3d5c:	4b ff f4 6d 	bl      31c8 <fputc>
    3d60:	4b ff fb 6c 	b       38cc <__i_vfprintf+0x3a4>
    3d64:	3b 60 ff ff 	li      r27,-1
    3d68:	7f 63 db 78 	mr      r3,r27
    3d6c:	39 61 00 60 	addi    r11,r1,96
    3d70:	4b ff c7 d4 	b       544 <_rest32gpr_19_x>

00003d74 <strcmp>:
    3d74:	7c 69 23 78 	or      r9,r3,r4
    3d78:	71 29 00 03 	andi.   r9,r9,3
    3d7c:	40 82 00 1c 	bne     3d98 <strcmp+0x24>
    3d80:	81 43 00 00 	lwz     r10,0(r3)
    3d84:	81 24 00 00 	lwz     r9,0(r4)
    3d88:	3d 00 80 80 	lis     r8,-32640
    3d8c:	61 08 80 80 	ori     r8,r8,32896
    3d90:	7c 0a 48 00 	cmpw    r10,r9
    3d94:	41 82 00 58 	beq     3dec <strcmp+0x78>
    3d98:	89 03 00 00 	lbz     r8,0(r3)
    3d9c:	89 44 00 00 	lbz     r10,0(r4)
    3da0:	39 20 00 01 	li      r9,1
    3da4:	38 84 ff ff 	addi    r4,r4,-1
    3da8:	2c 08 00 00 	cmpwi   r8,0
    3dac:	40 82 00 1c 	bne     3dc8 <strcmp+0x54>
    3db0:	48 00 00 24 	b       3dd4 <strcmp+0x60>
    3db4:	7d 03 48 ae 	lbzx    r8,r3,r9
    3db8:	39 29 00 01 	addi    r9,r9,1
    3dbc:	7d 44 48 ae 	lbzx    r10,r4,r9
    3dc0:	2c 08 00 00 	cmpwi   r8,0
    3dc4:	41 82 00 4c 	beq     3e10 <strcmp+0x9c>
    3dc8:	7d 44 48 ae 	lbzx    r10,r4,r9
    3dcc:	7c 0a 40 40 	cmplw   r10,r8
    3dd0:	41 82 ff e4 	beq     3db4 <strcmp+0x40>
    3dd4:	7c 6a 40 50 	subf    r3,r10,r8
    3dd8:	4e 80 00 20 	blr
    3ddc:	81 43 00 00 	lwz     r10,0(r3)
    3de0:	81 24 00 00 	lwz     r9,0(r4)
    3de4:	7c 0a 48 00 	cmpw    r10,r9
    3de8:	40 82 ff b0 	bne     3d98 <strcmp+0x24>
    3dec:	3d 2a fe ff 	addis   r9,r10,-257
    3df0:	38 63 00 04 	addi    r3,r3,4
    3df4:	39 29 fe ff 	addi    r9,r9,-257
    3df8:	38 84 00 04 	addi    r4,r4,4
    3dfc:	7d 29 50 78 	andc    r9,r9,r10
    3e00:	7d 29 40 39 	and.    r9,r9,r8
    3e04:	41 82 ff d8 	beq     3ddc <strcmp+0x68>
    3e08:	38 60 00 00 	li      r3,0
    3e0c:	4e 80 00 20 	blr
    3e10:	39 00 00 00 	li      r8,0
    3e14:	7c 6a 40 50 	subf    r3,r10,r8
    3e18:	4e 80 00 20 	blr

00003e1c <litex_getc>:
    3e1c:	94 21 ff f0 	stwu    r1,-16(r1)
    3e20:	7c 08 02 a6 	mflr    r0
    3e24:	90 01 00 14 	stw     r0,20(r1)
    3e28:	48 00 0f 39 	bl      4d60 <uart_read_nonblock>
    3e2c:	2c 03 00 00 	cmpwi   r3,0
    3e30:	41 82 ff f8 	beq     3e28 <litex_getc+0xc>
    3e34:	48 00 0e d9 	bl      4d0c <uart_read>
    3e38:	80 01 00 14 	lwz     r0,20(r1)
    3e3c:	38 21 00 10 	addi    r1,r1,16
    3e40:	7c 08 03 a6 	mtlr    r0
    3e44:	4e 80 00 20 	blr

00003e48 <litex_putc>:
    3e48:	94 21 ff f0 	stwu    r1,-16(r1)
    3e4c:	7c 08 02 a6 	mflr    r0
    3e50:	93 e1 00 0c 	stw     r31,12(r1)
    3e54:	90 01 00 14 	stw     r0,20(r1)
    3e58:	7c 7f 1b 78 	mr      r31,r3
    3e5c:	48 00 0f 39 	bl      4d94 <uart_write>
    3e60:	28 1f 00 0a 	cmplwi  r31,10
    3e64:	40 82 00 10 	bne     3e74 <litex_putc+0x2c>
    3e68:	38 80 00 00 	li      r4,0
    3e6c:	38 60 00 0d 	li      r3,13
    3e70:	4b ff ff d9 	bl      3e48 <litex_putc>
    3e74:	7f e3 fb 78 	mr      r3,r31
    3e78:	39 61 00 10 	addi    r11,r1,16
    3e7c:	4b ff c6 f8 	b       574 <_rest32gpr_31_x>

00003e80 <__udivmoddi4>:
    3e80:	94 21 ff f0 	stwu    r1,-16(r1)
    3e84:	2f 83 00 00 	cmpwi   cr7,r3,0
    3e88:	bf c1 00 08 	stmw    r30,8(r1)
    3e8c:	7c be 2b 79 	mr.     r30,r5
    3e90:	40 9e 00 4c 	bne     cr7,3edc <__udivmoddi4+0x5c>
    3e94:	2f 87 00 00 	cmpwi   cr7,r7,0
    3e98:	40 82 00 30 	bne     3ec8 <__udivmoddi4+0x48>
    3e9c:	7d 24 33 96 	divwu   r9,r4,r6
    3ea0:	41 9e 00 14 	beq     cr7,3eb4 <__udivmoddi4+0x34>
    3ea4:	7c c9 31 d6 	mullw   r6,r9,r6
    3ea8:	7c c6 20 50 	subf    r6,r6,r4
    3eac:	93 c7 00 00 	stw     r30,0(r7)
    3eb0:	90 c7 00 04 	stw     r6,4(r7)
    3eb4:	7d 24 4b 78 	mr      r4,r9
    3eb8:	38 60 00 00 	li      r3,0
    3ebc:	bb c1 00 08 	lmw     r30,8(r1)
    3ec0:	38 21 00 10 	addi    r1,r1,16
    3ec4:	4e 80 00 20 	blr
    3ec8:	41 9e 00 0c 	beq     cr7,3ed4 <__udivmoddi4+0x54>
    3ecc:	90 67 00 00 	stw     r3,0(r7)
    3ed0:	90 87 00 04 	stw     r4,4(r7)
    3ed4:	38 80 00 00 	li      r4,0
    3ed8:	4b ff ff e4 	b       3ebc <__udivmoddi4+0x3c>
    3edc:	2f 86 00 00 	cmpwi   cr7,r6,0
    3ee0:	40 9e 01 40 	bne     cr7,4020 <__udivmoddi4+0x1a0>
    3ee4:	40 82 00 08 	bne     3eec <__udivmoddi4+0x6c>
    3ee8:	7f e0 00 08 	trap
    3eec:	2c 04 00 00 	cmpwi   r4,0
    3ef0:	40 82 00 28 	bne     3f18 <__udivmoddi4+0x98>
    3ef4:	7d 43 f3 96 	divwu   r10,r3,r30
    3ef8:	2c 07 00 00 	cmpwi   r7,0
    3efc:	41 82 00 14 	beq     3f10 <__udivmoddi4+0x90>
    3f00:	7f ca f1 d6 	mullw   r30,r10,r30
    3f04:	7c 7e 18 50 	subf    r3,r30,r3
    3f08:	90 87 00 04 	stw     r4,4(r7)
    3f0c:	90 67 00 00 	stw     r3,0(r7)
    3f10:	7d 44 53 78 	mr      r4,r10
    3f14:	4b ff ff a4 	b       3eb8 <__udivmoddi4+0x38>
    3f18:	39 3e ff ff 	addi    r9,r30,-1
    3f1c:	7d 2a f0 39 	and.    r10,r9,r30
    3f20:	40 82 00 30 	bne     3f50 <__udivmoddi4+0xd0>
    3f24:	2c 07 00 00 	cmpwi   r7,0
    3f28:	41 82 00 10 	beq     3f38 <__udivmoddi4+0xb8>
    3f2c:	7d 29 18 38 	and     r9,r9,r3
    3f30:	90 87 00 04 	stw     r4,4(r7)
    3f34:	91 27 00 00 	stw     r9,0(r7)
    3f38:	7c 9e 00 d0 	neg     r4,r30
    3f3c:	7f c4 20 38 	and     r4,r30,r4
    3f40:	7c 84 00 34 	cntlzw  r4,r4
    3f44:	20 84 00 1f 	subfic  r4,r4,31
    3f48:	7c 64 24 30 	srw     r4,r3,r4
    3f4c:	4b ff ff 6c 	b       3eb8 <__udivmoddi4+0x38>
    3f50:	7f ca 00 34 	cntlzw  r10,r30
    3f54:	7c 60 00 34 	cntlzw  r0,r3
    3f58:	7d 40 50 50 	subf    r10,r0,r10
    3f5c:	28 0a 00 1e 	cmplwi  r10,30
    3f60:	40 81 00 1c 	ble     3f7c <__udivmoddi4+0xfc>
    3f64:	2c 07 00 00 	cmpwi   r7,0
    3f68:	41 82 00 0c 	beq     3f74 <__udivmoddi4+0xf4>
    3f6c:	90 67 00 00 	stw     r3,0(r7)
    3f70:	90 87 00 04 	stw     r4,4(r7)
    3f74:	38 60 00 00 	li      r3,0
    3f78:	4b ff ff 5c 	b       3ed4 <__udivmoddi4+0x54>
    3f7c:	38 0a 00 01 	addi    r0,r10,1
    3f80:	3b e0 00 00 	li      r31,0
    3f84:	21 4a 00 1f 	subfic  r10,r10,31
    3f88:	7c 65 04 30 	srw     r5,r3,r0
    3f8c:	7c 8c 50 30 	slw     r12,r4,r10
    3f90:	7c 6a 50 30 	slw     r10,r3,r10
    3f94:	7c 84 04 30 	srw     r4,r4,r0
    3f98:	7d 49 23 78 	or      r9,r10,r4
    3f9c:	38 80 00 00 	li      r4,0
    3fa0:	7c 09 03 a6 	mtctr   r0
    3fa4:	55 2a 0f fe 	rlwinm  r10,r9,1,31,31
    3fa8:	50 aa 08 3c 	rlwimi  r10,r5,1,0,30
    3fac:	7d 45 53 78 	mr      r5,r10
    3fb0:	55 8a 0f fe 	rlwinm  r10,r12,1,31,31
    3fb4:	51 2a 08 3c 	rlwimi  r10,r9,1,0,30
    3fb8:	7d 49 53 78 	mr      r9,r10
    3fbc:	57 ea 0f fe 	rlwinm  r10,r31,1,31,31
    3fc0:	57 ff 08 3c 	rlwinm  r31,r31,1,0,30
    3fc4:	51 8a 08 3c 	rlwimi  r10,r12,1,0,30
    3fc8:	7f ff 23 78 	or      r31,r31,r4
    3fcc:	7d 4c 53 78 	mr      r12,r10
    3fd0:	7d 2a 48 f8 	not     r10,r9
    3fd4:	7d 4a 30 14 	addc    r10,r10,r6
    3fd8:	7c 85 f1 10 	subfe   r4,r5,r30
    3fdc:	7c 83 fe 70 	srawi   r3,r4,31
    3fe0:	54 84 0f fe 	rlwinm  r4,r4,1,31,31
    3fe4:	7c 6a f0 38 	and     r10,r3,r30
    3fe8:	7c 63 30 38 	and     r3,r3,r6
    3fec:	7d 23 48 10 	subfc   r9,r3,r9
    3ff0:	7c aa 29 10 	subfe   r5,r10,r5
    3ff4:	42 00 ff b0 	bdnz    3fa4 <__udivmoddi4+0x124>
    3ff8:	57 ea 0f fe 	rlwinm  r10,r31,1,31,31
    3ffc:	2c 07 00 00 	cmpwi   r7,0
    4000:	51 8a 08 3c 	rlwimi  r10,r12,1,0,30
    4004:	57 ff 08 3c 	rlwinm  r31,r31,1,0,30
    4008:	7d 43 53 78 	mr      r3,r10
    400c:	7f e4 23 78 	or      r4,r31,r4
    4010:	41 82 fe ac 	beq     3ebc <__udivmoddi4+0x3c>
    4014:	90 a7 00 00 	stw     r5,0(r7)
    4018:	91 27 00 04 	stw     r9,4(r7)
    401c:	4b ff fe a0 	b       3ebc <__udivmoddi4+0x3c>
    4020:	40 82 00 a0 	bne     40c0 <__udivmoddi4+0x240>
    4024:	39 26 ff ff 	addi    r9,r6,-1
    4028:	7d 2a 30 39 	and.    r10,r9,r6
    402c:	40 82 00 48 	bne     4074 <__udivmoddi4+0x1f4>
    4030:	2c 07 00 00 	cmpwi   r7,0
    4034:	41 82 00 10 	beq     4044 <__udivmoddi4+0x1c4>
    4038:	7d 29 20 38 	and     r9,r9,r4
    403c:	91 47 00 00 	stw     r10,0(r7)
    4040:	91 27 00 04 	stw     r9,4(r7)
    4044:	28 06 00 01 	cmplwi  r6,1
    4048:	41 82 fe 74 	beq     3ebc <__udivmoddi4+0x3c>
    404c:	7d 26 00 d0 	neg     r9,r6
    4050:	7c c6 48 38 	and     r6,r6,r9
    4054:	7c c6 00 34 	cntlzw  r6,r6
    4058:	21 26 00 1f 	subfic  r9,r6,31
    405c:	38 c6 00 01 	addi    r6,r6,1
    4060:	7c 84 4c 30 	srw     r4,r4,r9
    4064:	7c 66 30 30 	slw     r6,r3,r6
    4068:	7c 63 4c 30 	srw     r3,r3,r9
    406c:	7c c4 23 78 	or      r4,r6,r4
    4070:	4b ff fe 4c 	b       3ebc <__udivmoddi4+0x3c>
    4074:	7c 60 00 34 	cntlzw  r0,r3
    4078:	7c ca 00 34 	cntlzw  r10,r6
    407c:	3b e0 00 00 	li      r31,0
    4080:	7d 40 50 50 	subf    r10,r0,r10
    4084:	38 0a 00 21 	addi    r0,r10,33
    4088:	2c 0a ff ff 	cmpwi   r10,-1
    408c:	41 82 00 58 	beq     40e4 <__udivmoddi4+0x264>
    4090:	3b e0 00 00 	li      r31,0
    4094:	28 00 00 1f 	cmplwi  r0,31
    4098:	40 81 00 5c 	ble     40f4 <__udivmoddi4+0x274>
    409c:	21 80 00 40 	subfic  r12,r0,64
    40a0:	39 4a 00 01 	addi    r10,r10,1
    40a4:	7c 9f 60 30 	slw     r31,r4,r12
    40a8:	38 a0 00 00 	li      r5,0
    40ac:	7c 6c 60 30 	slw     r12,r3,r12
    40b0:	7c 84 54 30 	srw     r4,r4,r10
    40b4:	7c 69 54 30 	srw     r9,r3,r10
    40b8:	7d 8c 23 78 	or      r12,r12,r4
    40bc:	4b ff fe e0 	b       3f9c <__udivmoddi4+0x11c>
    40c0:	7f c9 00 34 	cntlzw  r9,r30
    40c4:	7c 6a 00 34 	cntlzw  r10,r3
    40c8:	7d 2a 48 50 	subf    r9,r10,r9
    40cc:	28 09 00 1f 	cmplwi  r9,31
    40d0:	41 81 fe 94 	bgt     3f64 <__udivmoddi4+0xe4>
    40d4:	38 09 00 01 	addi    r0,r9,1
    40d8:	3b e0 00 00 	li      r31,0
    40dc:	2c 09 00 1f 	cmpwi   r9,31
    40e0:	40 82 00 14 	bne     40f4 <__udivmoddi4+0x274>
    40e4:	7c 8c 23 78 	mr      r12,r4
    40e8:	38 a0 00 00 	li      r5,0
    40ec:	7c 69 1b 78 	mr      r9,r3
    40f0:	4b ff fe ac 	b       3f9c <__udivmoddi4+0x11c>
    40f4:	21 20 00 20 	subfic  r9,r0,32
    40f8:	7c 65 04 30 	srw     r5,r3,r0
    40fc:	7c 8c 48 30 	slw     r12,r4,r9
    4100:	7c 69 48 30 	slw     r9,r3,r9
    4104:	7c 84 04 30 	srw     r4,r4,r0
    4108:	7d 29 23 78 	or      r9,r9,r4
    410c:	4b ff fe 90 	b       3f9c <__udivmoddi4+0x11c>

00004110 <__udivdi3>:
    4110:	38 e0 00 00 	li      r7,0
    4114:	4b ff fd 6c 	b       3e80 <__udivmoddi4>

00004118 <crc16>:
    4118:	7c 67 1b 78 	mr      r7,r3
    411c:	3c c0 00 00 	lis     r6,0
    4120:	39 00 00 00 	li      r8,0
    4124:	38 60 00 00 	li      r3,0
    4128:	38 c6 5a 58 	addi    r6,r6,23128
    412c:	39 44 00 01 	addi    r10,r4,1
    4130:	2c 04 00 00 	cmpwi   r4,0
    4134:	40 80 00 08 	bge     413c <crc16+0x24>
    4138:	39 40 00 01 	li      r10,1
    413c:	2c 0a 00 01 	cmpwi   r10,1
    4140:	39 4a ff ff 	addi    r10,r10,-1
    4144:	4d 82 00 20 	beqlr
    4148:	7c a7 40 ae 	lbzx    r5,r7,r8
    414c:	54 69 c2 3e 	rlwinm  r9,r3,24,8,31
    4150:	39 08 00 01 	addi    r8,r8,1
    4154:	54 63 44 2e 	rlwinm  r3,r3,8,16,23
    4158:	7d 29 2a 78 	xor     r9,r9,r5
    415c:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
    4160:	7c a6 48 2e 	lwzx    r5,r6,r9
    4164:	54 a5 04 3e 	clrlwi  r5,r5,16
    4168:	7c a3 1a 78 	xor     r3,r5,r3
    416c:	4b ff ff d0 	b       413c <crc16+0x24>

00004170 <crc32>:
    4170:	3c e0 00 00 	lis     r7,0
    4174:	54 8a e8 fe 	rlwinm  r10,r4,29,3,31
    4178:	7c 68 1b 78 	mr      r8,r3
    417c:	39 4a 00 01 	addi    r10,r10,1
    4180:	39 20 ff ff 	li      r9,-1
    4184:	38 e7 5e 58 	addi    r7,r7,24152
    4188:	7d 49 03 a6 	mtctr   r10
    418c:	42 00 00 54 	bdnz    41e0 <crc32+0x70>
    4190:	54 8a e8 fe 	rlwinm  r10,r4,29,3,31
    4194:	1d 4a ff f8 	mulli   r10,r10,-8
    4198:	54 88 00 38 	rlwinm  r8,r4,0,0,28
    419c:	7d 4a 22 15 	add.    r10,r10,r4
    41a0:	7c 63 42 14 	add     r3,r3,r8
    41a4:	41 82 00 34 	beq     41d8 <crc32+0x68>
    41a8:	3c e0 00 00 	lis     r7,0
    41ac:	39 00 00 00 	li      r8,0
    41b0:	38 e7 5e 58 	addi    r7,r7,24152
    41b4:	7d 49 03 a6 	mtctr   r10
    41b8:	7d 43 40 ae 	lbzx    r10,r3,r8
    41bc:	39 08 00 01 	addi    r8,r8,1
    41c0:	7d 4a 4a 78 	xor     r10,r10,r9
    41c4:	55 4a 15 ba 	rlwinm  r10,r10,2,22,29
    41c8:	7d 47 50 2e 	lwzx    r10,r7,r10
    41cc:	55 29 c2 3e 	rlwinm  r9,r9,24,8,31
    41d0:	7d 49 4a 78 	xor     r9,r10,r9
    41d4:	42 00 ff e4 	bdnz    41b8 <crc32+0x48>
    41d8:	7d 23 48 f8 	not     r3,r9
    41dc:	4e 80 00 20 	blr
    41e0:	89 48 00 00 	lbz     r10,0(r8)
    41e4:	39 08 00 08 	addi    r8,r8,8
    41e8:	7d 4a 4a 78 	xor     r10,r10,r9
    41ec:	55 4a 15 ba 	rlwinm  r10,r10,2,22,29
    41f0:	7d 47 50 2e 	lwzx    r10,r7,r10
    41f4:	55 29 c2 3e 	rlwinm  r9,r9,24,8,31
    41f8:	7d 49 4a 78 	xor     r9,r10,r9
    41fc:	89 48 ff f9 	lbz     r10,-7(r8)
    4200:	7d 4a 4a 78 	xor     r10,r10,r9
    4204:	55 4a 15 ba 	rlwinm  r10,r10,2,22,29
    4208:	7d 47 50 2e 	lwzx    r10,r7,r10
    420c:	55 29 c2 3e 	rlwinm  r9,r9,24,8,31
    4210:	7d 49 4a 78 	xor     r9,r10,r9
    4214:	89 48 ff fa 	lbz     r10,-6(r8)
    4218:	7d 4a 4a 78 	xor     r10,r10,r9
    421c:	55 4a 15 ba 	rlwinm  r10,r10,2,22,29
    4220:	7d 47 50 2e 	lwzx    r10,r7,r10
    4224:	55 29 c2 3e 	rlwinm  r9,r9,24,8,31
    4228:	7d 4a 4a 78 	xor     r10,r10,r9
    422c:	89 28 ff fb 	lbz     r9,-5(r8)
    4230:	7d 29 52 78 	xor     r9,r9,r10
    4234:	55 29 15 ba 	rlwinm  r9,r9,2,22,29
    4238:	7d 27 48 2e 	lwzx    r9,r7,r9
    423c:	55 4a c2 3e 	rlwinm  r10,r10,24,8,31
    4240:	7d 29 52 78 	xor     r9,r9,r10
    4244:	89 48 ff fc 	lbz     r10,-4(r8)
    4248:	7d 4a 4a 78 	xor     r10,r10,r9
    424c:	55 4a 15 ba 	rlwinm  r10,r10,2,22,29
    4250:	7d 47 50 2e 	lwzx    r10,r7,r10
    4254:	55 29 c2 3e 	rlwinm  r9,r9,24,8,31
    4258:	7d 4a 4a 78 	xor     r10,r10,r9
    425c:	89 28 ff fd 	lbz     r9,-3(r8)
    4260:	7d 29 52 78 	xor     r9,r9,r10
    4264:	55 29 15 ba 	rlwinm  r9,r9,2,22,29
    4268:	7d 27 48 2e 	lwzx    r9,r7,r9
    426c:	55 4a c2 3e 	rlwinm  r10,r10,24,8,31
    4270:	7d 29 52 78 	xor     r9,r9,r10
    4274:	89 48 ff fe 	lbz     r10,-2(r8)
    4278:	7d 4a 4a 78 	xor     r10,r10,r9
    427c:	55 4a 15 ba 	rlwinm  r10,r10,2,22,29
    4280:	7d 47 50 2e 	lwzx    r10,r7,r10
    4284:	55 29 c2 3e 	rlwinm  r9,r9,24,8,31
    4288:	7d 4a 4a 78 	xor     r10,r10,r9
    428c:	89 28 ff ff 	lbz     r9,-1(r8)
    4290:	7d 29 52 78 	xor     r9,r9,r10
    4294:	55 29 15 ba 	rlwinm  r9,r9,2,22,29
    4298:	7d 27 48 2e 	lwzx    r9,r7,r9
    429c:	55 4a c2 3e 	rlwinm  r10,r10,24,8,31
    42a0:	7d 29 52 78 	xor     r9,r9,r10
    42a4:	4b ff fe e8 	b       418c <crc32+0x1c>

000042a8 <swizzle>:
    42a8:	7c 69 1b 78 	mr      r9,r3
    42ac:	54 63 c0 3e 	rotlwi  r3,r3,24
    42b0:	51 23 42 1e 	rlwimi  r3,r9,8,8,15
    42b4:	51 23 46 3e 	rlwimi  r3,r9,8,24,31
    42b8:	4e 80 00 20 	blr

000042bc <timer0_en_write>:
    42bc:	94 21 ff f0 	stwu    r1,-16(r1)
    42c0:	7c 08 02 a6 	mflr    r0
    42c4:	90 01 00 14 	stw     r0,20(r1)
    42c8:	4b ff ff e1 	bl      42a8 <swizzle>
    42cc:	80 01 00 14 	lwz     r0,20(r1)
    42d0:	3d 20 ff f0 	lis     r9,-16
    42d4:	61 29 40 08 	ori     r9,r9,16392
    42d8:	90 69 00 00 	stw     r3,0(r9)
    42dc:	38 21 00 10 	addi    r1,r1,16
    42e0:	7c 08 03 a6 	mtlr    r0
    42e4:	4e 80 00 20 	blr

000042e8 <flush_l2_cache>:
    42e8:	4e 80 00 20 	blr

000042ec <busy_wait>:
    42ec:	94 21 ff e0 	stwu    r1,-32(r1)
    42f0:	7c 08 02 a6 	mflr    r0
    42f4:	bf a1 00 14 	stmw    r29,20(r1)
    42f8:	90 01 00 24 	stw     r0,36(r1)
    42fc:	7c 7f 1b 78 	mr      r31,r3
    4300:	38 60 00 00 	li      r3,0
    4304:	4b ff ff b9 	bl      42bc <timer0_en_write>
    4308:	3c 60 00 01 	lis     r3,1
    430c:	60 63 86 a0 	ori     r3,r3,34464
    4310:	7c 7f 19 d6 	mullw   r3,r31,r3
    4314:	39 40 00 00 	li      r10,0
    4318:	3d 20 ff f0 	lis     r9,-16
    431c:	3f e0 ff f0 	lis     r31,-16
    4320:	61 29 40 04 	ori     r9,r9,16388
    4324:	63 ff 40 0c 	ori     r31,r31,16396
    4328:	91 49 00 00 	stw     r10,0(r9)
    432c:	3f c0 ff f0 	lis     r30,-16
    4330:	4b ff ff 79 	bl      42a8 <swizzle>
    4334:	63 de 40 10 	ori     r30,r30,16400
    4338:	3d 20 ff f0 	lis     r9,-16
    433c:	3f a0 01 00 	lis     r29,256
    4340:	61 29 40 00 	ori     r9,r9,16384
    4344:	90 69 00 00 	stw     r3,0(r9)
    4348:	38 60 00 01 	li      r3,1
    434c:	4b ff ff 71 	bl      42bc <timer0_en_write>
    4350:	3d 40 01 00 	lis     r10,256
    4354:	91 5f 00 00 	stw     r10,0(r31)
    4358:	80 7e 00 00 	lwz     r3,0(r30)
    435c:	4b ff ff 4d 	bl      42a8 <swizzle>
    4360:	2c 03 00 00 	cmpwi   r3,0
    4364:	40 82 00 0c 	bne     4370 <busy_wait+0x84>
    4368:	39 61 00 20 	addi    r11,r1,32
    436c:	4b ff c2 00 	b       56c <_rest32gpr_29_x>
    4370:	93 bf 00 00 	stw     r29,0(r31)
    4374:	4b ff ff e4 	b       4358 <busy_wait+0x6c>

00004378 <busy_wait_us>:
    4378:	94 21 ff e0 	stwu    r1,-32(r1)
    437c:	7c 08 02 a6 	mflr    r0
    4380:	bf a1 00 14 	stmw    r29,20(r1)
    4384:	90 01 00 24 	stw     r0,36(r1)
    4388:	7c 7f 1b 78 	mr      r31,r3
    438c:	38 60 00 00 	li      r3,0
    4390:	4b ff ff 2d 	bl      42bc <timer0_en_write>
    4394:	1c 7f 00 64 	mulli   r3,r31,100
    4398:	39 40 00 00 	li      r10,0
    439c:	3d 20 ff f0 	lis     r9,-16
    43a0:	3f e0 ff f0 	lis     r31,-16
    43a4:	61 29 40 04 	ori     r9,r9,16388
    43a8:	63 ff 40 0c 	ori     r31,r31,16396
    43ac:	91 49 00 00 	stw     r10,0(r9)
    43b0:	3f c0 ff f0 	lis     r30,-16
    43b4:	4b ff fe f5 	bl      42a8 <swizzle>
    43b8:	63 de 40 10 	ori     r30,r30,16400
    43bc:	3d 20 ff f0 	lis     r9,-16
    43c0:	3f a0 01 00 	lis     r29,256
    43c4:	61 29 40 00 	ori     r9,r9,16384
    43c8:	90 69 00 00 	stw     r3,0(r9)
    43cc:	38 60 00 01 	li      r3,1
    43d0:	4b ff fe ed 	bl      42bc <timer0_en_write>
    43d4:	3d 40 01 00 	lis     r10,256
    43d8:	91 5f 00 00 	stw     r10,0(r31)
    43dc:	80 7e 00 00 	lwz     r3,0(r30)
    43e0:	4b ff fe c9 	bl      42a8 <swizzle>
    43e4:	2c 03 00 00 	cmpwi   r3,0
    43e8:	40 82 00 0c 	bne     43f4 <busy_wait_us+0x7c>
    43ec:	39 61 00 20 	addi    r11,r1,32
    43f0:	4b ff c1 7c 	b       56c <_rest32gpr_29_x>
    43f4:	93 bf 00 00 	stw     r29,0(r31)
    43f8:	4b ff ff e4 	b       43dc <busy_wait_us+0x64>

000043fc <swizzle>:
    43fc:	7c 69 1b 78 	mr      r9,r3
    4400:	54 63 c0 3e 	rotlwi  r3,r3,24
    4404:	51 23 42 1e 	rlwimi  r3,r9,8,8,15
    4408:	51 23 46 3e 	rlwimi  r3,r9,8,24,31
    440c:	4e 80 00 20 	blr

00004410 <timer0_value_read>:
    4410:	3d 20 ff f0 	lis     r9,-16
    4414:	61 29 40 10 	ori     r9,r9,16400
    4418:	80 69 00 00 	lwz     r3,0(r9)
    441c:	4b ff ff e0 	b       43fc <swizzle>

00004420 <print_size>:
    4420:	28 03 03 ff 	cmplwi  r3,1023
    4424:	41 81 00 18 	bgt     443c <print_size+0x1c>
    4428:	7c 64 1b 78 	mr      r4,r3
    442c:	3c 60 00 00 	lis     r3,0
    4430:	38 63 62 58 	addi    r3,r3,25176
    4434:	4c c6 31 82 	crclr   4*cr1+eq
    4438:	4b ff ee 44 	b       327c <printf>
    443c:	3d 20 00 10 	lis     r9,16
    4440:	7c 03 48 40 	cmplw   r3,r9
    4444:	40 80 00 24 	bge     4468 <print_size+0x48>
    4448:	54 65 05 be 	clrlwi  r5,r3,22
    444c:	39 20 00 66 	li      r9,102
    4450:	7c a5 4b 96 	divwu   r5,r5,r9
    4454:	54 64 b2 be 	rlwinm  r4,r3,22,10,31
    4458:	3c 60 00 00 	lis     r3,0
    445c:	38 63 62 5d 	addi    r3,r3,25181
    4460:	4c c6 31 82 	crclr   4*cr1+eq
    4464:	4b ff ee 18 	b       327c <printf>
    4468:	3d 20 40 00 	lis     r9,16384
    446c:	54 64 65 3e 	rlwinm  r4,r3,12,20,31
    4470:	7c 03 48 40 	cmplw   r3,r9
    4474:	40 80 00 24 	bge     4498 <print_size+0x78>
    4478:	54 85 50 2a 	rlwinm  r5,r4,10,0,21
    447c:	54 63 b2 be 	rlwinm  r3,r3,22,10,31
    4480:	7c 65 18 50 	subf    r3,r5,r3
    4484:	38 a0 00 66 	li      r5,102
    4488:	7c a3 2b 96 	divwu   r5,r3,r5
    448c:	3c 60 00 00 	lis     r3,0
    4490:	38 63 62 68 	addi    r3,r3,25192
    4494:	4b ff ff cc 	b       4460 <print_size+0x40>
    4498:	54 65 65 2a 	rlwinm  r5,r3,12,20,21
    449c:	39 20 00 66 	li      r9,102
    44a0:	7c a5 20 50 	subf    r5,r5,r4
    44a4:	54 64 17 be 	rlwinm  r4,r3,2,30,31
    44a8:	7c a5 4b 96 	divwu   r5,r5,r9
    44ac:	3c 60 00 00 	lis     r3,0
    44b0:	38 63 62 73 	addi    r3,r3,25203
    44b4:	4b ff ff ac 	b       4460 <print_size+0x40>

000044b8 <print_progress>:
    44b8:	94 21 ff f0 	stwu    r1,-16(r1)
    44bc:	7c 08 02 a6 	mflr    r0
    44c0:	93 e1 00 0c 	stw     r31,12(r1)
    44c4:	90 01 00 14 	stw     r0,20(r1)
    44c8:	7c c4 2a 14 	add     r6,r4,r5
    44cc:	7c bf 2b 78 	mr      r31,r5
    44d0:	7c 85 23 78 	mr      r5,r4
    44d4:	7c 64 1b 78 	mr      r4,r3
    44d8:	3c 60 00 00 	lis     r3,0
    44dc:	38 63 62 7e 	addi    r3,r3,25214
    44e0:	4c c6 31 82 	crclr   4*cr1+eq
    44e4:	4b ff ed 99 	bl      327c <printf>
    44e8:	7f e3 fb 78 	mr      r3,r31
    44ec:	4b ff ff 35 	bl      4420 <print_size>
    44f0:	80 01 00 14 	lwz     r0,20(r1)
    44f4:	83 e1 00 0c 	lwz     r31,12(r1)
    44f8:	3c 60 00 00 	lis     r3,0
    44fc:	38 21 00 10 	addi    r1,r1,16
    4500:	38 63 62 8c 	addi    r3,r3,25228
    4504:	7c 08 03 a6 	mtlr    r0
    4508:	4c c6 31 82 	crclr   4*cr1+eq
    450c:	4b ff ed 70 	b       327c <printf>

00004510 <memtest_access>:
    4510:	94 21 ff e0 	stwu    r1,-32(r1)
    4514:	7c 08 02 a6 	mflr    r0
    4518:	bf a1 00 14 	stmw    r29,20(r1)
    451c:	90 01 00 24 	stw     r0,36(r1)
    4520:	7c 7f 1b 78 	mr      r31,r3
    4524:	3f a0 ff f0 	lis     r29,-16
    4528:	63 bd 30 08 	ori     r29,r29,12296
    452c:	80 7d 00 00 	lwz     r3,0(r29)
    4530:	4b ff fe cd 	bl      43fc <swizzle>
    4534:	3d 20 aa aa 	lis     r9,-21846
    4538:	61 29 aa aa 	ori     r9,r9,43690
    453c:	91 3f 00 00 	stw     r9,0(r31)
    4540:	81 3f 00 00 	lwz     r9,0(r31)
    4544:	7c 7e 1b 78 	mr      r30,r3
    4548:	91 3f 00 04 	stw     r9,4(r31)
    454c:	3d 20 55 55 	lis     r9,21845
    4550:	61 29 55 55 	ori     r9,r9,21845
    4554:	91 3f 00 00 	stw     r9,0(r31)
    4558:	81 3f 00 00 	lwz     r9,0(r31)
    455c:	91 3f 00 04 	stw     r9,4(r31)
    4560:	80 7d 00 00 	lwz     r3,0(r29)
    4564:	4b ff fe 99 	bl      43fc <swizzle>
    4568:	7c 1e 18 00 	cmpw    r30,r3
    456c:	41 82 00 24 	beq     4590 <memtest_access+0x80>
    4570:	7f e4 fb 78 	mr      r4,r31
    4574:	3c 60 00 00 	lis     r3,0
    4578:	38 63 62 91 	addi    r3,r3,25233
    457c:	4c c6 31 82 	crclr   4*cr1+eq
    4580:	4b ff ec fd 	bl      327c <printf>
    4584:	38 60 00 01 	li      r3,1
    4588:	39 61 00 20 	addi    r11,r1,32
    458c:	4b ff bf e0 	b       56c <_rest32gpr_29_x>
    4590:	38 60 00 00 	li      r3,0
    4594:	4b ff ff f4 	b       4588 <memtest_access+0x78>

00004598 <memtest_bus>:
    4598:	94 21 ff e0 	stwu    r1,-32(r1)
    459c:	7c 08 02 a6 	mflr    r0
    45a0:	bf a1 00 14 	stmw    r29,20(r1)
    45a4:	3d 40 aa aa 	lis     r10,-21846
    45a8:	54 9f f0 be 	rlwinm  r31,r4,30,2,31
    45ac:	90 01 00 24 	stw     r0,36(r1)
    45b0:	39 1f 00 01 	addi    r8,r31,1
    45b4:	7c 7e 1b 78 	mr      r30,r3
    45b8:	39 20 00 00 	li      r9,0
    45bc:	61 4a aa aa 	ori     r10,r10,43690
    45c0:	7d 09 03 a6 	mtctr   r8
    45c4:	42 00 00 64 	bdnz    4628 <memtest_bus+0x90>
    45c8:	4b ff fd 21 	bl      42e8 <flush_l2_cache>
    45cc:	3b a0 00 00 	li      r29,0
    45d0:	3d 00 aa aa 	lis     r8,-21846
    45d4:	39 5f 00 01 	addi    r10,r31,1
    45d8:	39 20 00 00 	li      r9,0
    45dc:	61 08 aa aa 	ori     r8,r8,43690
    45e0:	7d 49 03 a6 	mtctr   r10
    45e4:	42 00 00 54 	bdnz    4638 <memtest_bus+0xa0>
    45e8:	3d 40 55 55 	lis     r10,21845
    45ec:	39 1f 00 01 	addi    r8,r31,1
    45f0:	39 20 00 00 	li      r9,0
    45f4:	61 4a 55 55 	ori     r10,r10,21845
    45f8:	7d 09 03 a6 	mtctr   r8
    45fc:	42 00 00 58 	bdnz    4654 <memtest_bus+0xbc>
    4600:	4b ff fc e9 	bl      42e8 <flush_l2_cache>
    4604:	3d 00 55 55 	lis     r8,21845
    4608:	39 5f 00 01 	addi    r10,r31,1
    460c:	39 20 00 00 	li      r9,0
    4610:	61 08 55 55 	ori     r8,r8,21845
    4614:	7d 49 03 a6 	mtctr   r10
    4618:	42 00 00 4c 	bdnz    4664 <memtest_bus+0xcc>
    461c:	7f a3 eb 78 	mr      r3,r29
    4620:	39 61 00 20 	addi    r11,r1,32
    4624:	4b ff bf 48 	b       56c <_rest32gpr_29_x>
    4628:	55 28 10 3a 	rlwinm  r8,r9,2,0,29
    462c:	39 29 00 01 	addi    r9,r9,1
    4630:	7d 5e 41 2e 	stwx    r10,r30,r8
    4634:	4b ff ff 90 	b       45c4 <memtest_bus+0x2c>
    4638:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
    463c:	7d 5e 50 2e 	lwzx    r10,r30,r10
    4640:	7c 0a 40 00 	cmpw    r10,r8
    4644:	41 82 00 08 	beq     464c <memtest_bus+0xb4>
    4648:	3b bd 00 01 	addi    r29,r29,1
    464c:	39 29 00 01 	addi    r9,r9,1
    4650:	4b ff ff 94 	b       45e4 <memtest_bus+0x4c>
    4654:	55 28 10 3a 	rlwinm  r8,r9,2,0,29
    4658:	39 29 00 01 	addi    r9,r9,1
    465c:	7d 5e 41 2e 	stwx    r10,r30,r8
    4660:	4b ff ff 9c 	b       45fc <memtest_bus+0x64>
    4664:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
    4668:	7d 5e 50 2e 	lwzx    r10,r30,r10
    466c:	7c 0a 40 00 	cmpw    r10,r8
    4670:	41 82 00 08 	beq     4678 <memtest_bus+0xe0>
    4674:	3b bd 00 01 	addi    r29,r29,1
    4678:	39 29 00 01 	addi    r9,r9,1
    467c:	4b ff ff 9c 	b       4618 <memtest_bus+0x80>

00004680 <memtest_addr>:
    4680:	28 04 ff ff 	cmplwi  r4,65535
    4684:	40 81 00 d8 	ble     475c <memtest_addr+0xdc>
    4688:	7d 80 00 26 	mfcr    r12
    468c:	94 21 ff e0 	stwu    r1,-32(r1)
    4690:	7c 08 02 a6 	mflr    r0
    4694:	bf c1 00 18 	stmw    r30,24(r1)
    4698:	91 81 00 14 	stw     r12,20(r1)
    469c:	54 9f f0 be 	rlwinm  r31,r4,30,2,31
    46a0:	90 01 00 24 	stw     r0,36(r1)
    46a4:	39 1f 00 01 	addi    r8,r31,1
    46a8:	7c 7e 1b 78 	mr      r30,r3
    46ac:	39 20 00 01 	li      r9,1
    46b0:	39 40 00 00 	li      r10,0
    46b4:	2e 05 00 00 	cmpwi   cr4,r5,0
    46b8:	7d 09 03 a6 	mtctr   r8
    46bc:	42 00 00 60 	bdnz    471c <memtest_addr+0x9c>
    46c0:	4b ff fc 29 	bl      42e8 <flush_l2_cache>
    46c4:	38 60 00 00 	li      r3,0
    46c8:	39 00 00 00 	li      r8,0
    46cc:	39 20 00 01 	li      r9,1
    46d0:	7f e9 03 a6 	mtctr   r31
    46d4:	41 92 00 7c 	beq     cr4,4750 <memtest_addr+0xd0>
    46d8:	55 2a f8 7e 	rlwinm  r10,r9,31,1,31
    46dc:	55 29 07 fe 	clrlwi  r9,r9,31
    46e0:	7d 29 00 d0 	neg     r9,r9
    46e4:	71 29 d0 08 	andi.   r9,r9,53256
    46e8:	7d 29 52 78 	xor     r9,r9,r10
    46ec:	55 2a 10 3a 	rlwinm  r10,r9,2,0,29
    46f0:	7d 5e 50 2e 	lwzx    r10,r30,r10
    46f4:	55 4a 04 3e 	clrlwi  r10,r10,16
    46f8:	7c 0a 40 00 	cmpw    r10,r8
    46fc:	41 82 00 08 	beq     4704 <memtest_addr+0x84>
    4700:	38 63 00 01 	addi    r3,r3,1
    4704:	39 08 00 01 	addi    r8,r8,1
    4708:	42 00 ff cc 	bdnz    46d4 <memtest_addr+0x54>
    470c:	81 81 00 14 	lwz     r12,20(r1)
    4710:	39 61 00 20 	addi    r11,r1,32
    4714:	7d 90 81 20 	mtocrf  8,r12
    4718:	4b ff be 58 	b       570 <_rest32gpr_30_x>
    471c:	41 92 00 28 	beq     cr4,4744 <memtest_addr+0xc4>
    4720:	55 28 f8 7e 	rlwinm  r8,r9,31,1,31
    4724:	55 29 07 fe 	clrlwi  r9,r9,31
    4728:	7d 29 00 d0 	neg     r9,r9
    472c:	71 29 d0 08 	andi.   r9,r9,53256
    4730:	7d 29 42 78 	xor     r9,r9,r8
    4734:	55 28 10 3a 	rlwinm  r8,r9,2,0,29
    4738:	7d 5e 41 2e 	stwx    r10,r30,r8
    473c:	39 4a 00 01 	addi    r10,r10,1
    4740:	4b ff ff 7c 	b       46bc <memtest_addr+0x3c>
    4744:	39 29 00 01 	addi    r9,r9,1
    4748:	55 29 04 3e 	clrlwi  r9,r9,16
    474c:	4b ff ff e8 	b       4734 <memtest_addr+0xb4>
    4750:	39 29 00 01 	addi    r9,r9,1
    4754:	55 29 04 3e 	clrlwi  r9,r9,16
    4758:	4b ff ff 94 	b       46ec <memtest_addr+0x6c>
    475c:	38 60 00 00 	li      r3,0
    4760:	4e 80 00 20 	blr

00004764 <memtest_data>:
    4764:	7d 80 00 26 	mfcr    r12
    4768:	94 21 ff c0 	stwu    r1,-64(r1)
    476c:	7c 08 02 a6 	mflr    r0
    4770:	be c1 00 18 	stmw    r22,24(r1)
    4774:	91 81 00 14 	stw     r12,20(r1)
    4778:	90 01 00 44 	stw     r0,68(r1)
    477c:	7c 7e 1b 78 	mr      r30,r3
    4780:	7c bd 2b 78 	mr      r29,r5
    4784:	7c d9 33 78 	mr      r25,r6
    4788:	2e 06 00 00 	cmpwi   cr4,r6,0
    478c:	54 9a f0 be 	rlwinm  r26,r4,30,2,31
    4790:	41 92 00 ac 	beq     cr4,483c <memtest_data+0xd8>
    4794:	81 26 00 04 	lwz     r9,4(r6)
    4798:	83 66 00 00 	lwz     r27,0(r6)
    479c:	2c 09 00 00 	cmpwi   r9,0
    47a0:	40 82 00 44 	bne     47e4 <memtest_data+0x80>
    47a4:	3f 00 00 00 	lis     r24,0
    47a8:	3b e0 00 01 	li      r31,1
    47ac:	3b 80 00 00 	li      r28,0
    47b0:	2d 9d 00 00 	cmpwi   cr3,r29,0
    47b4:	3b 18 62 be 	addi    r24,r24,25278
    47b8:	7c 1c d0 00 	cmpw    r28,r26
    47bc:	57 85 10 3a 	rlwinm  r5,r28,2,0,29
    47c0:	40 82 00 84 	bne     4844 <memtest_data+0xe0>
    47c4:	7f c4 f3 78 	mr      r4,r30
    47c8:	3c 60 00 00 	lis     r3,0
    47cc:	38 63 62 be 	addi    r3,r3,25278
    47d0:	4b ff fc e9 	bl      44b8 <print_progress>
    47d4:	3c 60 00 00 	lis     r3,0
    47d8:	38 63 4e 84 	addi    r3,r3,20100
    47dc:	4c c6 31 82 	crclr   4*cr1+eq
    47e0:	4b ff ea 9d 	bl      327c <printf>
    47e4:	3e c0 00 00 	lis     r22,0
    47e8:	4b ff fb 01 	bl      42e8 <flush_l2_cache>
    47ec:	3b e0 00 01 	li      r31,1
    47f0:	3b 00 00 00 	li      r24,0
    47f4:	3b 80 00 00 	li      r28,0
    47f8:	2d 9d 00 00 	cmpwi   cr3,r29,0
    47fc:	2d 1b 00 00 	cmpwi   cr2,r27,0
    4800:	3a d6 62 c7 	addi    r22,r22,25287
    4804:	7c 1a e0 00 	cmpw    r26,r28
    4808:	40 82 00 80 	bne     4888 <memtest_data+0x124>
    480c:	2c 1b 00 00 	cmpwi   r27,0
    4810:	41 82 01 00 	beq     4910 <memtest_data+0x1ac>
    4814:	57 45 10 3a 	rlwinm  r5,r26,2,0,29
    4818:	7f c4 f3 78 	mr      r4,r30
    481c:	3c 60 00 00 	lis     r3,0
    4820:	38 63 62 c7 	addi    r3,r3,25287
    4824:	4b ff fc 95 	bl      44b8 <print_progress>
    4828:	3c 60 00 00 	lis     r3,0
    482c:	38 63 4e 84 	addi    r3,r3,20100
    4830:	4c c6 31 82 	crclr   4*cr1+eq
    4834:	4b ff ea 49 	bl      327c <printf>
    4838:	48 00 00 d8 	b       4910 <memtest_data+0x1ac>
    483c:	3b 60 00 01 	li      r27,1
    4840:	4b ff ff 64 	b       47a4 <memtest_data+0x40>
    4844:	41 8e 00 3c 	beq     cr3,4880 <memtest_data+0x11c>
    4848:	57 e9 f8 7e 	rlwinm  r9,r31,31,1,31
    484c:	57 ff 07 fe 	clrlwi  r31,r31,31
    4850:	7f ff 00 d0 	neg     r31,r31
    4854:	57 ff 07 94 	rlwinm  r31,r31,0,30,10
    4858:	57 ff 02 80 	rlwinm  r31,r31,0,10,0
    485c:	7f ff 4a 78 	xor     r31,r31,r9
    4860:	7f fe 29 2e 	stwx    r31,r30,r5
    4864:	73 89 7f ff 	andi.   r9,r28,32767
    4868:	40 82 00 10 	bne     4878 <memtest_data+0x114>
    486c:	7f c4 f3 78 	mr      r4,r30
    4870:	7f 03 c3 78 	mr      r3,r24
    4874:	4b ff fc 45 	bl      44b8 <print_progress>
    4878:	3b 9c 00 01 	addi    r28,r28,1
    487c:	4b ff ff 3c 	b       47b8 <memtest_data+0x54>
    4880:	3b ff 00 01 	addi    r31,r31,1
    4884:	4b ff ff dc 	b       4860 <memtest_data+0xfc>
    4888:	41 8e 00 54 	beq     cr3,48dc <memtest_data+0x178>
    488c:	57 e9 f8 7e 	rlwinm  r9,r31,31,1,31
    4890:	57 ff 07 fe 	clrlwi  r31,r31,31
    4894:	7f ff 00 d0 	neg     r31,r31
    4898:	57 ff 07 94 	rlwinm  r31,r31,0,30,10
    489c:	57 ff 02 80 	rlwinm  r31,r31,0,10,0
    48a0:	7f ff 4a 78 	xor     r31,r31,r9
    48a4:	57 97 10 3a 	rlwinm  r23,r28,2,0,29
    48a8:	7c 97 f0 2e 	lwzx    r4,r23,r30
    48ac:	7c 77 f2 14 	add     r3,r23,r30
    48b0:	7c 04 f8 40 	cmplw   r4,r31
    48b4:	40 82 00 30 	bne     48e4 <memtest_data+0x180>
    48b8:	73 89 7f ff 	andi.   r9,r28,32767
    48bc:	40 82 00 18 	bne     48d4 <memtest_data+0x170>
    48c0:	41 8a 00 14 	beq     cr2,48d4 <memtest_data+0x170>
    48c4:	7e e5 bb 78 	mr      r5,r23
    48c8:	7f c4 f3 78 	mr      r4,r30
    48cc:	7e c3 b3 78 	mr      r3,r22
    48d0:	4b ff fb e9 	bl      44b8 <print_progress>
    48d4:	3b 9c 00 01 	addi    r28,r28,1
    48d8:	4b ff ff 2c 	b       4804 <memtest_data+0xa0>
    48dc:	3b ff 00 01 	addi    r31,r31,1
    48e0:	4b ff ff c4 	b       48a4 <memtest_data+0x140>
    48e4:	3b 18 00 01 	addi    r24,r24,1
    48e8:	41 92 ff d0 	beq     cr4,48b8 <memtest_data+0x154>
    48ec:	81 39 00 08 	lwz     r9,8(r25)
    48f0:	2c 09 00 00 	cmpwi   r9,0
    48f4:	41 82 ff c4 	beq     48b8 <memtest_data+0x154>
    48f8:	80 d9 00 0c 	lwz     r6,12(r25)
    48fc:	7f e5 fb 78 	mr      r5,r31
    4900:	7d 29 03 a6 	mtctr   r9
    4904:	4e 80 04 21 	bctrl
    4908:	2c 03 00 00 	cmpwi   r3,0
    490c:	41 82 ff ac 	beq     48b8 <memtest_data+0x154>
    4910:	81 81 00 14 	lwz     r12,20(r1)
    4914:	7f 03 c3 78 	mr      r3,r24
    4918:	39 61 00 40 	addi    r11,r1,64
    491c:	7d 83 81 20 	mtcrf   56,r12
    4920:	4b ff bc 30 	b       550 <_rest32gpr_22_x>

00004924 <memspeed>:
    4924:	7d 80 00 26 	mfcr    r12
    4928:	94 21 ff e0 	stwu    r1,-32(r1)
    492c:	7c 08 02 a6 	mflr    r0
    4930:	bf 61 00 0c 	stmw    r27,12(r1)
    4934:	91 81 00 08 	stw     r12,8(r1)
    4938:	7c dd 33 78 	mr      r29,r6
    493c:	3b 64 ff f0 	addi    r27,r4,-16
    4940:	90 01 00 24 	stw     r0,36(r1)
    4944:	7c 7f 1b 78 	mr      r31,r3
    4948:	7c 9e 23 78 	mr      r30,r4
    494c:	7c bc 2b 78 	mr      r28,r5
    4950:	7c 64 1b 78 	mr      r4,r3
    4954:	7f 63 da 14 	add     r27,r3,r27
    4958:	2e 1d 00 00 	cmpwi   cr4,r29,0
    495c:	3c 60 00 00 	lis     r3,0
    4960:	38 63 62 d0 	addi    r3,r3,25296
    4964:	4c c6 31 82 	crclr   4*cr1+eq
    4968:	4b ff e9 15 	bl      327c <printf>
    496c:	3c 60 00 00 	lis     r3,0
    4970:	38 63 62 e1 	addi    r3,r3,25313
    4974:	40 92 00 0c 	bne     cr4,4980 <memspeed+0x5c>
    4978:	3c 60 00 00 	lis     r3,0
    497c:	38 63 62 ea 	addi    r3,r3,25322
    4980:	4c c6 31 82 	crclr   4*cr1+eq
    4984:	4b ff e8 f9 	bl      327c <printf>
    4988:	7f c3 f3 78 	mr      r3,r30
    498c:	4b ff fa 95 	bl      4420 <print_size>
    4990:	3c 60 00 00 	lis     r3,0
    4994:	38 63 62 f7 	addi    r3,r3,25335
    4998:	4c c6 31 82 	crclr   4*cr1+eq
    499c:	4b ff e8 e1 	bl      327c <printf>
    49a0:	39 20 00 00 	li      r9,0
    49a4:	3d 40 ff f0 	lis     r10,-16
    49a8:	3d 00 ff f0 	lis     r8,-16
    49ac:	61 4a 40 08 	ori     r10,r10,16392
    49b0:	61 08 40 04 	ori     r8,r8,16388
    49b4:	91 2a 00 00 	stw     r9,0(r10)
    49b8:	2c 1c 00 00 	cmpwi   r28,0
    49bc:	91 28 00 00 	stw     r9,0(r8)
    49c0:	3d 20 ff f0 	lis     r9,-16
    49c4:	39 00 ff ff 	li      r8,-1
    49c8:	61 29 40 00 	ori     r9,r9,16384
    49cc:	91 09 00 00 	stw     r8,0(r9)
    49d0:	3d 20 01 00 	lis     r9,256
    49d4:	91 2a 00 00 	stw     r9,0(r10)
    49d8:	40 82 00 a0 	bne     4a78 <memspeed+0x154>
    49dc:	91 2a 00 04 	stw     r9,4(r10)
    49e0:	4b ff fa 31 	bl      4410 <timer0_value_read>
    49e4:	7f e9 fb 78 	mr      r9,r31
    49e8:	7c 7c 1b 78 	mr      r28,r3
    49ec:	39 40 ff ff 	li      r10,-1
    49f0:	91 49 00 00 	stw     r10,0(r9)
    49f4:	91 49 00 04 	stw     r10,4(r9)
    49f8:	91 49 00 08 	stw     r10,8(r9)
    49fc:	91 49 00 0c 	stw     r10,12(r9)
    4a00:	39 29 00 10 	addi    r9,r9,16
    4a04:	7c 1b 48 40 	cmplw   r27,r9
    4a08:	40 80 ff e8 	bge     49f0 <memspeed+0xcc>
    4a0c:	3d 40 01 00 	lis     r10,256
    4a10:	3d 20 ff f0 	lis     r9,-16
    4a14:	61 29 40 0c 	ori     r9,r9,16396
    4a18:	91 49 00 00 	stw     r10,0(r9)
    4a1c:	4b ff f9 f5 	bl      4410 <timer0_value_read>
    4a20:	7c 7d 1b 78 	mr      r29,r3
    4a24:	3c 60 00 00 	lis     r3,0
    4a28:	38 63 62 fd 	addi    r3,r3,25341
    4a2c:	4c c6 31 82 	crclr   4*cr1+eq
    4a30:	4b ff e8 4d 	bl      327c <printf>
    4a34:	3c 80 05 f5 	lis     r4,1525
    4a38:	60 84 e1 00 	ori     r4,r4,57600
    4a3c:	7c 7e 20 16 	mulhwu  r3,r30,r4
    4a40:	7c 9e 21 d6 	mullw   r4,r30,r4
    4a44:	7c dd e0 10 	subfc   r6,r29,r28
    4a48:	7c a5 29 10 	subfe   r5,r5,r5
    4a4c:	4b ff f6 c5 	bl      4110 <__udivdi3>
    4a50:	7c 83 23 78 	mr      r3,r4
    4a54:	4b ff f9 cd 	bl      4420 <print_size>
    4a58:	3c 60 00 00 	lis     r3,0
    4a5c:	38 63 63 0d 	addi    r3,r3,25357
    4a60:	4c c6 31 82 	crclr   4*cr1+eq
    4a64:	4b ff e8 19 	bl      327c <printf>
    4a68:	3c 60 00 00 	lis     r3,0
    4a6c:	38 63 4e 84 	addi    r3,r3,20100
    4a70:	4c c6 31 82 	crclr   4*cr1+eq
    4a74:	4b ff e8 09 	bl      327c <printf>
    4a78:	4b ff f8 71 	bl      42e8 <flush_l2_cache>
    4a7c:	3d 20 01 00 	lis     r9,256
    4a80:	3d 40 ff f0 	lis     r10,-16
    4a84:	61 4a 40 08 	ori     r10,r10,16392
    4a88:	91 2a 00 00 	stw     r9,0(r10)
    4a8c:	91 2a 00 04 	stw     r9,4(r10)
    4a90:	4b ff f9 81 	bl      4410 <timer0_value_read>
    4a94:	7c 7d 1b 78 	mr      r29,r3
    4a98:	41 92 00 f4 	beq     cr4,4b8c <memspeed+0x268>
    4a9c:	57 c8 f0 be 	rlwinm  r8,r30,30,2,31
    4aa0:	39 20 00 00 	li      r9,0
    4aa4:	39 48 00 01 	addi    r10,r8,1
    4aa8:	38 e0 00 00 	li      r7,0
    4aac:	7d 49 03 a6 	mtctr   r10
    4ab0:	42 00 00 98 	bdnz    4b48 <memspeed+0x224>
    4ab4:	3d 40 01 00 	lis     r10,256
    4ab8:	3d 20 ff f0 	lis     r9,-16
    4abc:	61 29 40 0c 	ori     r9,r9,16396
    4ac0:	91 49 00 00 	stw     r10,0(r9)
    4ac4:	4b ff f9 4d 	bl      4410 <timer0_value_read>
    4ac8:	7c 7f 1b 78 	mr      r31,r3
    4acc:	3c 60 00 00 	lis     r3,0
    4ad0:	38 63 63 10 	addi    r3,r3,25360
    4ad4:	4c c6 31 82 	crclr   4*cr1+eq
    4ad8:	4b ff e7 a5 	bl      327c <printf>
    4adc:	3c 80 05 f5 	lis     r4,1525
    4ae0:	60 84 e1 00 	ori     r4,r4,57600
    4ae4:	7c 7e 20 16 	mulhwu  r3,r30,r4
    4ae8:	7c 9e 21 d6 	mullw   r4,r30,r4
    4aec:	7c df e8 10 	subfc   r6,r31,r29
    4af0:	7c a5 29 10 	subfe   r5,r5,r5
    4af4:	4b ff f6 1d 	bl      4110 <__udivdi3>
    4af8:	7c 83 23 78 	mr      r3,r4
    4afc:	4b ff f9 25 	bl      4420 <print_size>
    4b00:	3c 60 00 00 	lis     r3,0
    4b04:	38 63 63 0d 	addi    r3,r3,25357
    4b08:	4c c6 31 82 	crclr   4*cr1+eq
    4b0c:	4b ff e7 71 	bl      327c <printf>
    4b10:	80 01 00 24 	lwz     r0,36(r1)
    4b14:	81 81 00 08 	lwz     r12,8(r1)
    4b18:	83 61 00 0c 	lwz     r27,12(r1)
    4b1c:	83 81 00 10 	lwz     r28,16(r1)
    4b20:	83 a1 00 14 	lwz     r29,20(r1)
    4b24:	83 c1 00 18 	lwz     r30,24(r1)
    4b28:	83 e1 00 1c 	lwz     r31,28(r1)
    4b2c:	3c 60 00 00 	lis     r3,0
    4b30:	7c 08 03 a6 	mtlr    r0
    4b34:	38 63 4e 84 	addi    r3,r3,20100
    4b38:	7d 90 81 20 	mtocrf  8,r12
    4b3c:	38 21 00 20 	addi    r1,r1,32
    4b40:	4c c6 31 82 	crclr   4*cr1+eq
    4b44:	4b ff e7 38 	b       327c <printf>
    4b48:	2c 07 00 00 	cmpwi   r7,0
    4b4c:	41 82 00 38 	beq     4b84 <memspeed+0x260>
    4b50:	55 2a f8 7e 	rlwinm  r10,r9,31,1,31
    4b54:	55 29 07 fe 	clrlwi  r9,r9,31
    4b58:	7d 29 00 d0 	neg     r9,r9
    4b5c:	55 29 07 94 	rlwinm  r9,r9,0,30,10
    4b60:	55 29 02 80 	rlwinm  r9,r9,0,10,0
    4b64:	7d 29 52 78 	xor     r9,r9,r10
    4b68:	7d 49 43 96 	divwu   r10,r9,r8
    4b6c:	38 e7 00 01 	addi    r7,r7,1
    4b70:	7d 4a 41 d6 	mullw   r10,r10,r8
    4b74:	7d 4a 48 50 	subf    r10,r10,r9
    4b78:	55 4a 10 3a 	rlwinm  r10,r10,2,0,29
    4b7c:	7d 5f 50 2e 	lwzx    r10,r31,r10
    4b80:	4b ff ff 30 	b       4ab0 <memspeed+0x18c>
    4b84:	39 29 00 01 	addi    r9,r9,1
    4b88:	4b ff ff e0 	b       4b68 <memspeed+0x244>
    4b8c:	81 3f 00 00 	lwz     r9,0(r31)
    4b90:	81 3f 00 04 	lwz     r9,4(r31)
    4b94:	81 3f 00 08 	lwz     r9,8(r31)
    4b98:	81 3f 00 0c 	lwz     r9,12(r31)
    4b9c:	3b ff 00 10 	addi    r31,r31,16
    4ba0:	7c 1b f8 40 	cmplw   r27,r31
    4ba4:	40 80 ff e8 	bge     4b8c <memspeed+0x268>
    4ba8:	4b ff ff 0c 	b       4ab4 <memspeed+0x190>

00004bac <memtest>:
    4bac:	94 21 ff d0 	stwu    r1,-48(r1)
    4bb0:	7c 08 02 a6 	mflr    r0
    4bb4:	bf 21 00 14 	stmw    r25,20(r1)
    4bb8:	90 01 00 34 	stw     r0,52(r1)
    4bbc:	7c 7e 1b 78 	mr      r30,r3
    4bc0:	7c 9f 23 78 	mr      r31,r4
    4bc4:	7c 64 1b 78 	mr      r4,r3
    4bc8:	3c 60 00 00 	lis     r3,0
    4bcc:	38 63 63 20 	addi    r3,r3,25376
    4bd0:	4c c6 31 82 	crclr   4*cr1+eq
    4bd4:	4b ff e6 a9 	bl      327c <printf>
    4bd8:	7f e3 fb 78 	mr      r3,r31
    4bdc:	4b ff f8 45 	bl      4420 <print_size>
    4be0:	3c 60 00 00 	lis     r3,0
    4be4:	38 63 62 f7 	addi    r3,r3,25335
    4be8:	4c c6 31 82 	crclr   4*cr1+eq
    4bec:	4b ff e6 91 	bl      327c <printf>
    4bf0:	7f c3 f3 78 	mr      r3,r30
    4bf4:	4b ff f9 1d 	bl      4510 <memtest_access>
    4bf8:	7c 7d 1b 79 	mr.     r29,r3
    4bfc:	40 82 00 f0 	bne     4cec <memtest+0x140>
    4c00:	7f f9 fb 78 	mr      r25,r31
    4c04:	28 1f 02 00 	cmplwi  r31,512
    4c08:	40 81 00 08 	ble     4c10 <memtest+0x64>
    4c0c:	3b 20 02 00 	li      r25,512
    4c10:	7f fa fb 78 	mr      r26,r31
    4c14:	28 1f 80 00 	cmplwi  r31,32768
    4c18:	40 81 00 0c 	ble     4c24 <memtest+0x78>
    4c1c:	3b 40 00 00 	li      r26,0
    4c20:	63 5a 80 00 	ori     r26,r26,32768
    4c24:	7f 24 cb 78 	mr      r4,r25
    4c28:	7f c3 f3 78 	mr      r3,r30
    4c2c:	4b ff f9 6d 	bl      4598 <memtest_bus>
    4c30:	38 a0 00 00 	li      r5,0
    4c34:	7c 7b 1b 78 	mr      r27,r3
    4c38:	7f 44 d3 78 	mr      r4,r26
    4c3c:	7f c3 f3 78 	mr      r3,r30
    4c40:	4b ff fa 41 	bl      4680 <memtest_addr>
    4c44:	38 c0 00 00 	li      r6,0
    4c48:	7c 7c 1b 78 	mr      r28,r3
    4c4c:	38 a0 00 01 	li      r5,1
    4c50:	7f c3 f3 78 	mr      r3,r30
    4c54:	7f e4 fb 78 	mr      r4,r31
    4c58:	4b ff fb 0d 	bl      4764 <memtest_data>
    4c5c:	7d 3b e2 14 	add     r9,r27,r28
    4c60:	7c 7e 1b 78 	mr      r30,r3
    4c64:	7d 29 1a 14 	add     r9,r9,r3
    4c68:	2c 09 00 00 	cmpwi   r9,0
    4c6c:	41 82 00 68 	beq     4cd4 <memtest+0x128>
    4c70:	57 25 f8 be 	rlwinm  r5,r25,31,2,31
    4c74:	7f 64 db 78 	mr      r4,r27
    4c78:	3c 60 00 00 	lis     r3,0
    4c7c:	38 63 63 30 	addi    r3,r3,25392
    4c80:	4c c6 31 82 	crclr   4*cr1+eq
    4c84:	4b ff e5 f9 	bl      327c <printf>
    4c88:	57 45 f0 be 	rlwinm  r5,r26,30,2,31
    4c8c:	7f 84 e3 78 	mr      r4,r28
    4c90:	3c 60 00 00 	lis     r3,0
    4c94:	38 63 63 47 	addi    r3,r3,25415
    4c98:	4c c6 31 82 	crclr   4*cr1+eq
    4c9c:	4b ff e5 e1 	bl      327c <printf>
    4ca0:	57 e5 f0 be 	rlwinm  r5,r31,30,2,31
    4ca4:	7f c4 f3 78 	mr      r4,r30
    4ca8:	3c 60 00 00 	lis     r3,0
    4cac:	38 63 63 5e 	addi    r3,r3,25438
    4cb0:	4c c6 31 82 	crclr   4*cr1+eq
    4cb4:	4b ff e5 c9 	bl      327c <printf>
    4cb8:	3c 60 00 00 	lis     r3,0
    4cbc:	38 63 63 75 	addi    r3,r3,25461
    4cc0:	4c c6 31 82 	crclr   4*cr1+eq
    4cc4:	4b ff e5 b9 	bl      327c <printf>
    4cc8:	7f a3 eb 78 	mr      r3,r29
    4ccc:	39 61 00 30 	addi    r11,r1,48
    4cd0:	4b ff b8 8c 	b       55c <_rest32gpr_25_x>
    4cd4:	3c 60 00 00 	lis     r3,0
    4cd8:	3b a0 00 01 	li      r29,1
    4cdc:	38 63 63 81 	addi    r3,r3,25473
    4ce0:	4c c6 31 82 	crclr   4*cr1+eq
    4ce4:	4b ff e5 99 	bl      327c <printf>
    4ce8:	4b ff ff e0 	b       4cc8 <memtest+0x11c>
    4cec:	3b a0 00 00 	li      r29,0
    4cf0:	4b ff ff d8 	b       4cc8 <memtest+0x11c>

00004cf4 <swizzle>:
    4cf4:	7c 69 1b 78 	mr      r9,r3
    4cf8:	54 63 c0 3e 	rotlwi  r3,r3,24
    4cfc:	51 23 42 1e 	rlwimi  r3,r9,8,8,15
    4d00:	51 23 46 3e 	rlwimi  r3,r9,8,24,31
    4d04:	4e 80 00 20 	blr

00004d08 <uart_isr>:
    4d08:	4e 80 00 20 	blr

00004d0c <uart_read>:
    4d0c:	94 21 ff f0 	stwu    r1,-16(r1)
    4d10:	7c 08 02 a6 	mflr    r0
    4d14:	93 e1 00 0c 	stw     r31,12(r1)
    4d18:	90 01 00 14 	stw     r0,20(r1)
    4d1c:	3f e0 ff f0 	lis     r31,-16
    4d20:	63 ff 48 08 	ori     r31,r31,18440
    4d24:	80 7f 00 00 	lwz     r3,0(r31)
    4d28:	4b ff ff cd 	bl      4cf4 <swizzle>
    4d2c:	2c 03 00 00 	cmpwi   r3,0
    4d30:	40 82 ff f4 	bne     4d24 <uart_read+0x18>
    4d34:	3d 20 ff f0 	lis     r9,-16
    4d38:	61 29 48 00 	ori     r9,r9,18432
    4d3c:	80 69 00 00 	lwz     r3,0(r9)
    4d40:	4b ff ff b5 	bl      4cf4 <swizzle>
    4d44:	3d 20 ff f0 	lis     r9,-16
    4d48:	3d 40 02 00 	lis     r10,512
    4d4c:	61 29 48 10 	ori     r9,r9,18448
    4d50:	54 63 06 3e 	clrlwi  r3,r3,24
    4d54:	91 49 00 00 	stw     r10,0(r9)
    4d58:	39 61 00 10 	addi    r11,r1,16
    4d5c:	4b ff b8 18 	b       574 <_rest32gpr_31_x>

00004d60 <uart_read_nonblock>:
    4d60:	94 21 ff f0 	stwu    r1,-16(r1)
    4d64:	7c 08 02 a6 	mflr    r0
    4d68:	3d 20 ff f0 	lis     r9,-16
    4d6c:	90 01 00 14 	stw     r0,20(r1)
    4d70:	61 29 48 08 	ori     r9,r9,18440
    4d74:	80 69 00 00 	lwz     r3,0(r9)
    4d78:	4b ff ff 7d 	bl      4cf4 <swizzle>
    4d7c:	80 01 00 14 	lwz     r0,20(r1)
    4d80:	7c 63 00 34 	cntlzw  r3,r3
    4d84:	38 21 00 10 	addi    r1,r1,16
    4d88:	54 63 d9 7e 	rlwinm  r3,r3,27,5,31
    4d8c:	7c 08 03 a6 	mtlr    r0
    4d90:	4e 80 00 20 	blr

00004d94 <uart_write>:
    4d94:	94 21 ff f0 	stwu    r1,-16(r1)
    4d98:	7c 08 02 a6 	mflr    r0
    4d9c:	bf c1 00 08 	stmw    r30,8(r1)
    4da0:	90 01 00 14 	stw     r0,20(r1)
    4da4:	3f c0 ff f0 	lis     r30,-16
    4da8:	7c 7f 1b 78 	mr      r31,r3
    4dac:	63 de 48 04 	ori     r30,r30,18436
    4db0:	80 7e 00 00 	lwz     r3,0(r30)
    4db4:	4b ff ff 41 	bl      4cf4 <swizzle>
    4db8:	2c 03 00 00 	cmpwi   r3,0
    4dbc:	40 82 ff f4 	bne     4db0 <uart_write+0x1c>
    4dc0:	7f e3 fb 78 	mr      r3,r31
    4dc4:	4b ff ff 31 	bl      4cf4 <swizzle>
    4dc8:	3d 20 ff f0 	lis     r9,-16
    4dcc:	3d 40 01 00 	lis     r10,256
    4dd0:	61 29 48 00 	ori     r9,r9,18432
    4dd4:	90 69 00 00 	stw     r3,0(r9)
    4dd8:	91 49 00 10 	stw     r10,16(r9)
    4ddc:	39 61 00 10 	addi    r11,r1,16
    4de0:	4b ff b7 90 	b       570 <_rest32gpr_30_x>

00004de4 <uart_init>:
    4de4:	94 21 ff f0 	stwu    r1,-16(r1)
    4de8:	7c 08 02 a6 	mflr    r0
    4dec:	93 e1 00 0c 	stw     r31,12(r1)
    4df0:	90 01 00 14 	stw     r0,20(r1)
    4df4:	3f e0 ff f0 	lis     r31,-16
    4df8:	63 ff 48 10 	ori     r31,r31,18448
    4dfc:	80 7f 00 00 	lwz     r3,0(r31)
    4e00:	4b ff fe f5 	bl      4cf4 <swizzle>
    4e04:	4b ff fe f1 	bl      4cf4 <swizzle>
    4e08:	3d 20 ff f0 	lis     r9,-16
    4e0c:	90 7f 00 00 	stw     r3,0(r31)
    4e10:	61 29 48 14 	ori     r9,r9,18452
    4e14:	3d 40 03 00 	lis     r10,768
    4e18:	91 49 00 00 	stw     r10,0(r9)
    4e1c:	39 61 00 10 	addi    r11,r1,16
    4e20:	4b ff b7 54 	b       574 <_rest32gpr_31_x>

00004e24 <uart_sync>:
    4e24:	94 21 ff f0 	stwu    r1,-16(r1)
    4e28:	7c 08 02 a6 	mflr    r0
    4e2c:	93 e1 00 0c 	stw     r31,12(r1)
    4e30:	90 01 00 14 	stw     r0,20(r1)
    4e34:	3f e0 ff f0 	lis     r31,-16
    4e38:	63 ff 48 04 	ori     r31,r31,18436
    4e3c:	80 7f 00 00 	lwz     r3,0(r31)
    4e40:	4b ff fe b5 	bl      4cf4 <swizzle>
    4e44:	2c 03 00 00 	cmpwi   r3,0
    4e48:	40 82 ff f4 	bne     4e3c <uart_sync+0x18>
    4e4c:	39 61 00 10 	addi    r11,r1,16
    4e50:	4b ff b7 24 	b       574 <_rest32gpr_31_x>

# © IBM Corp. 2020
# Licensed under and subject to the terms of the CC-BY 4.0
# license (https://creativecommons.org/licenses/by/4.0/legalcode).
# Additional rights, including the right to physically implement a softcore
# that is compliant with the required sections of the Power ISA
# Specification, will be available at no cost via the OpenPOWER Foundation.
# This README will be updated with additional information when OpenPOWER's
# license is available.

#-----------------------------------------
# Defines
#-----------------------------------------

# Regs

.set    r0,  0
.set    r1,  1
.set    r2,  2
.set    r3,  3
.set    r4,  4
.set    r5,  5
.set    r6,  6
.set    r7,  7
.set    r8,  8
.set    r9,  9
.set    r10,10
.set    r11,11
.set    r12,12
.set    r13,13
.set    r14,14
.set    r15,15
.set    r16,16
.set    r17,17
.set    r18,18
.set    r19,19
.set    r20,20
.set    r21,21
.set    r22,22
.set    r23,23
.set    r24,24
.set    r25,25
.set    r26,26
.set    r27,27
.set    r28,28
.set    r29,29
.set    r30,30
.set    r31,31

.set    f0,  0
.set    f1,  1
.set    f2,  2
.set    f3,  3
.set    f4,  4
.set    f5,  5
.set    f6,  6
.set    f7,  7
.set    f8,  8
.set    f9,  9
.set    f10,10
.set    f11,11
.set    f12,12
.set    f13,13
.set    f14,14
.set    f15,15
.set    f16,16
.set    f17,17
.set    f18,18
.set    f19,19
.set    f20,20
.set    f21,21
.set    f22,22
.set    f23,23
.set    f24,24
.set    f25,25
.set    f26,26
.set    f27,27
.set    f28,28
.set    f29,29
.set    f30,30
.set    f31,31

.set    cr0, 0
.set    cr1, 1
.set    cr2, 2
.set    cr3, 3
.set    cr4, 4
.set    cr5, 5
.set    cr6, 6
.set    cr7, 7

# SPR numbers

.set    srr0, 26
.set    srr1, 27
.set    dar, 19
.set    dsisr, 18
.set    epcr, 307
.set    tar, 815

.set    dbsr, 304
.set    dbcr0, 308
.set    dbcr1, 309
.set    dbcr2, 310
.set    dbcr3, 848

.set    ivpr, 63

.set    iucr0, 1011
.set    iucr1, 883
.set    iucr2, 884

.set    iudbg0, 888
.set    iudbg1, 889
.set    iudbg2, 890
.set    iulfsr, 891
.set    iullcr, 892

.set    mmucr0, 1020
.set    mmucr1, 1021
.set    mmucr2, 1022
.set    mmucr3, 1023

.set    tb, 268
.set    tbl, 284
.set    tbh, 285

.set    dec, 22
.set    udec, 550
.set    tsr, 336
.set    tcr, 340

.set    xucr0, 1014
.set    xucr1, 851
.set    xucr2, 1016
.set    xucr3, 852
.set    xucr4, 853

.set    tens, 438
.set    tenc, 439
.set    tensr, 437

.set    pid, 48
.set    pir, 286
.set    pvr, 287
.set    tir, 446

#.set    sprg0,
#.set    sprg1,
#.set    sprg2,
.set    sprg3, 259

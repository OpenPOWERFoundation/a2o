* OPV
* Testname: fx_alucmpbr.tst

* --------------------------------------------------------------------------------
TEST 1001
INITIALIZATIONS: DATA MEMORY
D 0000000008F00850 0001FFFFFF000007D400000068877812 * PTE Match EPN=0x000000000001 VPN=0x0001FFFFFF000001 RPN=0x000000006887 WIMG=0x2 I TA=0
D 0000000053E6FD70 2000000008F10B02                 * Root Table Descriptor , Partition Table Primary Entry for LPID = 0xFD7: HTABORG = 0x0800_0000_023C, HTABSIZE = 0x02, PS = 0x0, Entry Address = 0x0000_0000_53E6_FD70 WIMG=0x2
D 0000000053E6FD78 000618E1E5836C87                 * Segmentation On HPT, Process Table Descriptor, Partition Table Secondary Entry for LPID = 0xFD7: PRTB = 0x00_030C_70F2, PTS = 0x07, NUT = 0x0, PTPS = 0x4 WIMG=0x2
D 00000000F0D2D3F0 400AC1CD9CEF56376DF7C045D17603CB * Guest Root Table Descriptor, Process Table Entry for LPID = 0x000 STABORGU = 0x000A_C1CD_9CEF_5637 STABORGL = 0x6 STABSIZE = 0xC B = 0x1 STPS = 0x5
INITIALIZATIONS: INSTRUCTION MEMORY
LEVEL 4 CHIP 0
LEVEL 3 CORE 0
INITIALIZATIONS: REGISTERS
LEVEL 2 PARTITION 0
INITIALIZATIONS: REGISTERS
LEVEL 1 THREAD 0
INITIALIZATIONS: REGISTERS
R CR             DBFD3628               * LT:1 GT:1 EQ:0 SO:1 FX:1 FEX:0 VX:1 
*                                         OX:1 CR2:F CR3:D CR4:3 CR5:6 CR6:2 
*                                         CR7:8 
R DAR            96A22826D573F45F       
R DSISR          48068CFB               * TS:0 PF:1 ATT:0 Rsrv35:0 Prot:1 CI:0 
*                                         Store:0 Rsrv39_40:0 DAWR:0 VPCK:0 
*                                         SMF:0 RADIX:0 RC:1 Guest_Tbl:1 
*                                         Rsrv47_61:233E CIX:1 EAO:1 
R DEC            0000000005792645       
R XER            00002E2289F0006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:0 
*                                         OC:0 LT:1 GT:0 EQ:0 IC:1 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:0 
*                                         Rsrv46_56:000 Rsrv44_56:0000 len:6E 
R G0             CC7B4BBA00000000       
R G1             F99E00E65822C905       
R G3             48577A9C91B6D1A3       
R G9             6872DEB47E11EE88       
R G11            415D35187FFFFFFF       
R G14            BCF163168C20BDE6       
R G16            CE83BAA576D0DADF       
R G17            06C01CAE15111F42       
R G19            4283519E36108E50       
R G22            4FA8B87B328A0CED       
R G25            9138C732AF224C19       
R G28            2F4816B9D624B27A       
R IAR            0000000000010000       
R MSR            0000000000001104       * SF:0 TA:0 Rsrv2_old_ISF:0 HV:0 
*                                         Rsrv4:0 SLE:0 Rsrv6_28:000000 TS:0 
*                                         TM:0 Rsrv32_37:00 VMX:0 Rsrv39:0 
*                                         VSX:0 S:0 Rsrv42_47:00 EE:0 PR:0 FP:0 
*                                         ME:1 FE0:0 SE:0 BE:0 FE1:1 US:0 
*                                         Rsrv57_old_IP:0 IR:0 DR:0 
*                                         Rsrv60_old_SO:0 PMM:1 RI:0 LE:0 

PHASE 0    INSTRUCTIONS
I 0000000068870000 7C61CC14 * EA=0000000000010000 WIMG=2 addco G3,G1,G25            INum:1 PartId:0 ThreadId:0 Phase:0 CoreId:0 

TRACE READS 
R G1             F99E00E65822C905       
R G25            9138C732AF224C19       
D 0000000053E6FD70 2000000008F10B02                 * RADIX
D 0000000053E6FD78 000618E1E5836C87                 * RADIX
D 0000000008F00850 0001FFFFFF000007                 * PTE
D 0000000008F00858 0000000000000000                 M 0000000000000000 * PTE
TRACE WRITES 
R G3             8AD6C8190745151E       
R XER            00002E22A9F4006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:1 
*                                         OC:0 LT:1 GT:0 EQ:0 IC:1 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:1 
*                                         Rsrv46_56:000 Rsrv44_56:0800 len:6E 
R IAR            0000000000010004       
D 0000000008F00858 D400000068877912                 * PTE
I 0000000068870004 7D230595 * EA=0000000000010004 WIMG=2 addzeo. G9,G3              INum:2 PartId:0 ThreadId:0 Phase:0 CoreId:0 

TRACE READS 
R G3             8AD6C8190745151E       
R XER            00002E22A9F4006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:1 
*                                         OC:0 LT:1 GT:0 EQ:0 IC:1 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:1 
*                                         Rsrv46_56:000 Rsrv44_56:0800 len:6E 
D 0000000053E6FD70 2000000008F10B02                 * RADIX
D 0000000053E6FD78 000618E1E5836C87                 * RADIX
D 0000000008F00850 0001FFFFFF000007                 * PTE
D 0000000008F00858 D400000068877912                 * PTE
TRACE WRITES 
R G9             8AD6C8190745151F       
R XER            00002E2284F0006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:0 
*                                         OC:0 LT:0 GT:1 EQ:0 IC:0 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:0 
*                                         Rsrv46_56:000 Rsrv44_56:0000 len:6E 
R CR             5BFD3628               * LT:0 GT:1 EQ:0 SO:1 FX:1 FEX:0 VX:1 
*                                         OX:1 CR2:F CR3:D CR4:3 CR5:6 CR6:2 
*                                         CR7:8 
R IAR            0000000000010008       
I 0000000068870008 7AC37392 * EA=0000000000010008 WIMG=2 rldcr G3,G22,G14,0x0E      INum:3 PartId:0 ThreadId:0 Phase:0 CoreId:0 

TRACE READS 
R G14            BCF163168C20BDE6       
R G22            4FA8B87B328A0CED       
D 0000000053E6FD70 2000000008F10B02                 * RADIX
D 0000000053E6FD78 000618E1E5836C87                 * RADIX
D 0000000008F00850 0001FFFFFF000007                 * PTE
D 0000000008F00858 D400000068877912                 * PTE
TRACE WRITES 
R G3             A282000000000000       
R IAR            000000000001000C       
I 000000006887000C 7E094C11 * EA=000000000001000C WIMG=2 subfco. G16,G9,G9          INum:4 PartId:0 ThreadId:0 Phase:0 CoreId:0 

TRACE READS 
R G9             8AD6C8190745151F       
R XER            00002E2284F0006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:0 
*                                         OC:0 LT:0 GT:1 EQ:0 IC:0 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:0 
*                                         Rsrv46_56:000 Rsrv44_56:0000 len:6E 
D 0000000053E6FD70 2000000008F10B02                 * RADIX
D 0000000053E6FD78 000618E1E5836C87                 * RADIX
D 0000000008F00850 0001FFFFFF000007                 * PTE
D 0000000008F00858 D400000068877912                 * PTE
TRACE WRITES 
R G16            0000000000000000       
R XER            00002E22B2F4006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:1 
*                                         OC:1 LT:0 GT:0 EQ:1 IC:0 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:1 
*                                         Rsrv46_56:000 Rsrv44_56:0800 len:6E 
R CR             3BFD3628               * LT:0 GT:0 EQ:1 SO:1 FX:1 FEX:0 VX:1 
*                                         OX:1 CR2:F CR3:D CR4:3 CR5:6 CR6:2 
*                                         CR7:8 
R IAR            0000000000010010       
I 0000000068870010 7E1CB115 * EA=0000000000010010 WIMG=2 adde. G16,G28,G22          INum:5 PartId:0 ThreadId:0 Phase:0 CoreId:0 

TRACE READS 
R G28            2F4816B9D624B27A       
R G22            4FA8B87B328A0CED       
R XER            00002E22B2F4006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:1 
*                                         OC:1 LT:0 GT:0 EQ:1 IC:0 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:1 
*                                         Rsrv46_56:000 Rsrv44_56:0800 len:6E 
D 0000000053E6FD70 2000000008F10B02                 * RADIX
D 0000000053E6FD78 000618E1E5836C87                 * RADIX
D 0000000008F00850 0001FFFFFF000007                 * PTE
D 0000000008F00858 D400000068877912                 * PTE
TRACE WRITES 
R G16            7EF0CF3508AEBF68       
R XER            00002E22B4F4006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:1 
*                                         OC:1 LT:0 GT:1 EQ:0 IC:0 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:1 
*                                         Rsrv46_56:000 Rsrv44_56:0800 len:6E 
R CR             5BFD3628               * LT:0 GT:1 EQ:0 SO:1 FX:1 FEX:0 VX:1 
*                                         OX:1 CR2:F CR3:D CR4:3 CR5:6 CR6:2 
*                                         CR7:8 
R IAR            0000000000010014       
I 0000000068870014 7A338886 * EA=0000000000010014 WIMG=2 rldicr G19,G17,0x31,0x02     INum:6 PartId:0 ThreadId:0 Phase:0 CoreId:0 

TRACE READS 
R G17            06C01CAE15111F42       
D 0000000053E6FD70 2000000008F10B02                 * RADIX
D 0000000053E6FD78 000618E1E5836C87                 * RADIX
D 0000000008F00850 0001FFFFFF000007                 * PTE
D 0000000008F00858 D400000068877912                 * PTE
TRACE WRITES 
R G19            2000000000000000       
R IAR            0000000000010018       
I 0000000068870018 7C6004D1 * EA=0000000000010018 WIMG=2 nego. G3,G0                INum:7 PartId:0 ThreadId:0 Phase:0 CoreId:0 

TRACE READS 
R G0             CC7B4BBA00000000       
R XER            00002E22B4F4006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:1 
*                                         OC:1 LT:0 GT:1 EQ:0 IC:0 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:1 
*                                         Rsrv46_56:000 Rsrv44_56:0800 len:6E 
D 0000000053E6FD70 2000000008F10B02                 * RADIX
D 0000000053E6FD78 000618E1E5836C87                 * RADIX
D 0000000008F00850 0001FFFFFF000007                 * PTE
D 0000000008F00858 D400000068877912                 * PTE
TRACE WRITES 
R G3             3384B44600000000       
R XER            00002E22B2F4006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:1 
*                                         OC:1 LT:0 GT:0 EQ:1 IC:0 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:1 
*                                         Rsrv46_56:000 Rsrv44_56:0800 len:6E 
R CR             3BFD3628               * LT:0 GT:0 EQ:1 SO:1 FX:1 FEX:0 VX:1 
*                                         OX:1 CR2:F CR3:D CR4:3 CR5:6 CR6:2 
*                                         CR7:8 
R IAR            000000000001001C       
I 000000006887001C 7E09B038 * EA=000000000001001C WIMG=2 and G9,G16,G22             INum:8 PartId:0 ThreadId:0 Phase:0 CoreId:0 

TRACE READS 
R G16            7EF0CF3508AEBF68       
R G22            4FA8B87B328A0CED       
D 0000000053E6FD70 2000000008F10B02                 * RADIX
D 0000000053E6FD78 000618E1E5836C87                 * RADIX
D 0000000008F00850 0001FFFFFF000007                 * PTE
D 0000000008F00858 D400000068877912                 * PTE
TRACE WRITES 
R G9             4EA08831008A0C68       
R IAR            0000000000010020       
I 0000000068870020 7C360591 * EA=0000000000010020 WIMG=2 subfzeo. G1,G22            INum:9 PartId:0 ThreadId:0 Phase:0 CoreId:0 

TRACE READS 
R G22            4FA8B87B328A0CED       
R XER            00002E22B2F4006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:1 
*                                         OC:1 LT:0 GT:0 EQ:1 IC:0 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:1 
*                                         Rsrv46_56:000 Rsrv44_56:0800 len:6E 
D 0000000053E6FD70 2000000008F10B02                 * RADIX
D 0000000053E6FD78 000618E1E5836C87                 * RADIX
D 0000000008F00850 0001FFFFFF000007                 * PTE
D 0000000008F00858 D400000068877912                 * PTE
TRACE WRITES 
R G1             B0574784CD75F313       
R XER            00002E2298F0006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:0 
*                                         OC:1 LT:1 GT:0 EQ:0 IC:0 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:0 
*                                         Rsrv46_56:000 Rsrv44_56:0000 len:6E 
R CR             9BFD3628               * LT:1 GT:0 EQ:0 SO:1 FX:1 FEX:0 VX:1 
*                                         OX:1 CR2:F CR3:D CR4:3 CR5:6 CR6:2 
*                                         CR7:8 
R IAR            0000000000010024       
I 0000000068870024 7E2B00D1 * EA=0000000000010024 WIMG=2 neg. G17,G11               INum:10 PartId:0 ThreadId:0 Phase:0 CoreId:0 

TRACE READS 
R G11            415D35187FFFFFFF       
R XER            00002E2298F0006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:0 
*                                         OC:1 LT:1 GT:0 EQ:0 IC:0 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:0 
*                                         Rsrv46_56:000 Rsrv44_56:0000 len:6E 
D 0000000053E6FD70 2000000008F10B02                 * RADIX
D 0000000053E6FD78 000618E1E5836C87                 * RADIX
D 0000000008F00850 0001FFFFFF000007                 * PTE
D 0000000008F00858 D400000068877912                 * PTE
TRACE WRITES 
R G17            BEA2CAE780000001       
R XER            00002E2298F0006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:0 
*                                         OC:1 LT:1 GT:0 EQ:0 IC:0 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:0 
*                                         Rsrv46_56:000 Rsrv44_56:0000 len:6E 
R CR             9BFD3628               * LT:1 GT:0 EQ:0 SO:1 FX:1 FEX:0 VX:1 
*                                         OX:1 CR2:F CR3:D CR4:3 CR5:6 CR6:2 
*                                         CR7:8 
* FALSE PHASE 0.0    INSTRUCTIONS 
R IAR            0000000000010028       

EPILOGUE
* Begin macro Epilogue_Sequence 
* TRUE 
* TRUE 
I 0000000068870028 60000000 * EA=0000000000010028 WIMG=2 nop                        INum:11 PartId:0 ThreadId:0 Phase:0 CoreId:0 

TRACE READS 
D 0000000053E6FD70 2000000008F10B02                 * RADIX
D 0000000053E6FD78 000618E1E5836C87                 * RADIX
D 0000000008F00850 0001FFFFFF000007                 * PTE
D 0000000008F00858 D400000068877912                 * PTE
TRACE WRITES 
R IAR            000000000001002C       
I 000000006887002C 60000000 * EA=000000000001002C WIMG=2 nop_Epilogue               INum:12 PartId:0 ThreadId:0 Phase:0 CoreId:0 

TRACE READS 
D 0000000053E6FD70 2000000008F10B02                 * RADIX
D 0000000053E6FD78 000618E1E5836C87                 * RADIX
D 0000000008F00850 0001FFFFFF000007                 * PTE
D 0000000008F00858 D400000068877912                 * PTE
TRACE WRITES 
R IAR            0000000000010030       
I 0000000068870030 60000000 * EA=0000000000010030 WIMG=2 nop_Epilogue               INum:13 PartId:0 ThreadId:0 Phase:0 CoreId:0 

TRACE READS 
D 0000000053E6FD70 2000000008F10B02                 * RADIX
D 0000000053E6FD78 000618E1E5836C87                 * RADIX
D 0000000008F00850 0001FFFFFF000007                 * PTE
D 0000000008F00858 D400000068877912                 * PTE
TRACE WRITES 
R IAR            0000000000010034       
I 0000000068870034 24000000 * EA=0000000000010034 WIMG=2 notrace                    INum:14 PartId:0 ThreadId:0 Phase:0 CoreId:0 
* End of macro Epilogue_Sequence
RESULTS: REGISTERS
R CR             9BFD3628               * LT:1 GT:0 EQ:0 SO:1 FX:1 FEX:0 VX:1 
*                                         OX:1 CR2:F CR3:D CR4:3 CR5:6 CR6:2 
*                                         CR7:8 
R DAR            96A22826D573F45F       
R DSISR          48068CFB               * TS:0 PF:1 ATT:0 Rsrv35:0 Prot:1 CI:0 
*                                         Store:0 Rsrv39_40:0 DAWR:0 VPCK:0 
*                                         SMF:0 RADIX:0 RC:1 Guest_Tbl:1 
*                                         Rsrv47_61:233E CIX:1 EAO:1 
R DEC            0000000005792645       
R XER            00002E2298F0006E       * Rsrv0_15:0000 DC:2E22 SO:1 OV:0 CA:0 
*                                         OC:1 LT:1 GT:0 EQ:0 IC:0 DS:1 TAG0:1 
*                                         TAG1:1 TAG:1 OV32:0 CA32:0 
*                                         Rsrv46_56:000 Rsrv44_56:0000 len:6E 
R G0             CC7B4BBA00000000       
R G1             B0574784CD75F313       
R G3             3384B44600000000       
R G9             4EA08831008A0C68       
R G11            415D35187FFFFFFF       
R G14            BCF163168C20BDE6       
R G16            7EF0CF3508AEBF68       
R G17            BEA2CAE780000001       
R G19            2000000000000000       
R G22            4FA8B87B328A0CED       
R G25            9138C732AF224C19       
R G28            2F4816B9D624B27A       
R IAR            0000000000010038       
R MSR            0000000000001104       * SF:0 TA:0 Rsrv2_old_ISF:0 HV:0 
*                                         Rsrv4:0 SLE:0 Rsrv6_28:000000 TS:0 
*                                         TM:0 Rsrv32_37:00 VMX:0 Rsrv39:0 
*                                         VSX:0 S:0 Rsrv42_47:00 EE:0 PR:0 FP:0 
*                                         ME:1 FE0:0 SE:0 BE:0 FE1:1 US:0 
*                                         Rsrv57_old_IP:0 IR:0 DR:0 
*                                         Rsrv60_old_SO:0 PMM:1 RI:0 LE:0 
END_OF_LEVEL 1 THREAD 0
RESULTS: REGISTERS
END_OF_LEVEL 2 PARTITION 0
RESULTS: REGISTERS
END_OF_LEVEL 3 CORE 0
END_OF_LEVEL 4 CHIP 0
RESULTS: DATA MEMORY
D 0000000008F00850 0001FFFFFF000007D400000068877912 * PTE
D 0000000053E6FD70 2000000008F10B02                 
D 0000000053E6FD78 000618E1E5836C87                 
D 00000000F0D2D3F0 400AC1CD9CEF56376DF7C045D17603CB 
END_OF_TEST

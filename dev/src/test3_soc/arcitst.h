# asmtst.tpl
# powerpc-linux-gnu-as -c arcitst.s

.include "defines.s"

# -------------------------------------------------------------------------------------------------
# c-accessible

.global init_tst
.global tst_start
.global tst_end
.global tst_inits
.global tst_results
.global tst_expects

# -------------------------------------------------------------------------------------------------
tst_misc:

tst_info:      .asciz "info text"
tst_header:    .asciz "header text"

.set SAVESPR,sprg3
.set MAGIC,0x8675309

# -------------------------------------------------------------------------------------------------
.align 5
tst_inits:

init_r0:       .int 0x5EA9536C
init_r1:       .int 0x07EC9BA7
init_r2:       .int 0xFFFFFFFF
init_r3:       .int 0x18FAD811
init_r4:       .int 0xFFFFFFFF
init_r5:       .int 0xFFFFFFFF
init_r6:       .int 0xFFFFFFFF
init_r7:       .int 0xFFFFFFFF
init_r8:       .int 0xFFFFFFFF
init_r9:       .int 0xFFFFFFFF
init_r10:      .int 0xB186394A
init_r11:      .int 0x07EC9BA7
init_r12:      .int 0xFFFFFFFF
init_r13:      .int 0xFC9D07CE
init_r14:      .int 0x7305868F
init_r15:      .int 0xFFFFFFFF
init_r16:      .int 0xFFFFFFFF
init_r17:      .int 0x6E078D56
init_r18:      .int 0xFFFFFFFF
init_r19:      .int 0xFFFFFFFF
init_r20:      .int 0x0F8F2BB1
init_r21:      .int 0xFFFFFFFF
init_r22:      .int 0xFFFFFFFF
init_r23:      .int 0x9E47F6C0
init_r24:      .int 0x46B0FC81
init_r25:      .int 0xFFFFFFFF
init_r26:      .int 0xFFFFFFFF
init_r27:      .int 0x48026438
init_r28:      .int 0xEFB046E4
init_r29:      .int 0x4B5CBE25
init_r30:      .int 0xFFFFFFFF
init_r31:      .int 0xFFFFFFFF

init_cr:       .int 0xB0215BC8
init_xer:      .int 0xBFC0004B
init_ctr:      .int 0xF7DA2C8A
init_lr:       .int 0x8BC7C22B
init_tar:      .int 0xFFFFFFFF
init_msr:      .int 0x00001081

init_iar:      .int 0x00010000

save_r1:       .int 0

codelen:       .int 13
ops:           .int 0x36E86A7F,0x10748A7F,0x71AE9D7E,0x1C865B55,0xF45EAA7D,0x2000154D,0x50E01B7C,0x4933037B,0x00082B7D,0x36B8317C,0x00000060,0x00000060,0x00000060
iars:          .int 0x00010000,0x00010004,0x00010008,0x0001000C,0x00010010,0x00010014,0x00010018,0x0001001C,0x00010020,0x00010024,0x00010028,0x0001002C,0x00010030

# -------------------------------------------------------------------------------------------------
# r3=@tst_inits
.align 5
init_tst:

# save c stuff
   stw         r1,(save_r1-tst_inits)(r3)

# copy ops
opcopy:
   lwz         r1,(codelen-tst_inits)(r3)
   mtctr       r1
opcopy_loop:
   la          r1,(cops-tst_inits)(r3)
   la          r2,(iars-tst_inits)(r3)
   stw         r1,0(r2)
   addi        r2,r2,4
   bdnz        opcopy_loop

# init test regs
init_regs:
   lwz         r1,(init_cr-tst_inits)(r3)
   mtcr        r1
   lwz      r1,(init_xer-tst_inits)(r3)
   mtxer       r1
   lwz      r1,(init_ctr-tst_inits)(r3)
   mtctr       r1
   lwz      r1,(init_lr-tst_inits)(r3)
   mtlr        r1
   lwz      r1,(init_tar-tst_inits)(r3)
   mtspr       tar,r1

   lwz         r0,(init_r0-tst_inits)(r3)
   lwz         r1,(init_r1-tst_inits)(r3)
   lwz         r2,(init_r2-tst_inits)(r3)
   lwz         r4,(init_r4-tst_inits)(r3)
   lwz         r5,(init_r5-tst_inits)(r3)
   lwz         r6,(init_r6-tst_inits)(r3)
   lwz         r7,(init_r7-tst_inits)(r3)
   lwz         r8,(init_r8-tst_inits)(r3)
   lwz         r9,(init_r9-tst_inits)(r3)
   lwz         r10,(init_r10-tst_inits)(r3)
   lwz         r11,(init_r11-tst_inits)(r3)
   lwz         r12,(init_r12-tst_inits)(r3)
   lwz         r13,(init_r13-tst_inits)(r3)
   lwz         r14,(init_r14-tst_inits)(r3)
   lwz         r15,(init_r15-tst_inits)(r3)
   lwz         r16,(init_r16-tst_inits)(r3)
   lwz         r17,(init_r17-tst_inits)(r3)
   lwz         r18,(init_r18-tst_inits)(r3)
   lwz         r19,(init_r19-tst_inits)(r3)
   lwz         r20,(init_r20-tst_inits)(r3)
   lwz         r21,(init_r21-tst_inits)(r3)
   lwz         r22,(init_r22-tst_inits)(r3)
   lwz         r23,(init_r23-tst_inits)(r3)
   lwz         r24,(init_r24-tst_inits)(r3)
   lwz         r25,(init_r25-tst_inits)(r3)
   lwz         r26,(init_r26-tst_inits)(r3)
   lwz         r27,(init_r27-tst_inits)(r3)
   lwz         r28,(init_r28-tst_inits)(r3)
   lwz         r29,(init_r29-tst_inits)(r3)
   lwz         r30,(init_r30-tst_inits)(r3)
   lwz         r31,(init_r31-tst_inits)(r3)
   lwz         r3,(init_r3-tst_inits)(r3)

jmp2tst:       rfi

# needs to be inserted into epilogue of tst!
#tst_end:
#   b           save_results

# -------------------------------------------------------------------------------------------------
.align 5
save_results:
# use a designated spr to save (sprgx, ...)
   mtspr       SAVESPR,r1
   lis         r1,tst_results@h
   ori         r1,r1,tst_results@l
   stw         r0,(rslt_r0-tst_results)(r1)
   stw         r2,(rslt_r2-tst_results)(r1)
   stw         r3,(rslt_r3-tst_results)(r1)
   stw         r4,(rslt_r4-tst_results)(r1)
   stw         r5,(rslt_r5-tst_results)(r1)
   stw         r6,(rslt_r6-tst_results)(r1)
   stw         r7,(rslt_r7-tst_results)(r1)
   stw         r8,(rslt_r8-tst_results)(r1)
   stw         r9,(rslt_r9-tst_results)(r1)
   stw         r10,(rslt_r10-tst_results)(r1)
   stw         r11,(rslt_r11-tst_results)(r1)
   stw         r12,(rslt_r12-tst_results)(r1)
   stw         r13,(rslt_r13-tst_results)(r1)
   stw         r14,(rslt_r14-tst_results)(r1)
   stw         r15,(rslt_r15-tst_results)(r1)
   stw         r16,(rslt_r16-tst_results)(r1)
   stw         r17,(rslt_r17-tst_results)(r1)
   stw         r18,(rslt_r18-tst_results)(r1)
   stw         r19,(rslt_r19-tst_results)(r1)
   stw         r20,(rslt_r20-tst_results)(r1)
   stw         r21,(rslt_r21-tst_results)(r1)
   stw         r22,(rslt_r22-tst_results)(r1)
   stw         r23,(rslt_r23-tst_results)(r1)
   stw         r24,(rslt_r24-tst_results)(r1)
   stw         r25,(rslt_r25-tst_results)(r1)
   stw         r26,(rslt_r26-tst_results)(r1)
   stw         r27,(rslt_r27-tst_results)(r1)
   stw         r28,(rslt_r28-tst_results)(r1)
   stw         r29,(rslt_r29-tst_results)(r1)
   stw         r30,(rslt_r30-tst_results)(r1)
   stw         r31,(rslt_r31-tst_results)(r1)
   mfspr       r2,SAVESPR
   stw         r2,(rslt_r1-tst_results)(r1)
   mfcr        r2
   stw         r2,(rslt_cr-tst_results)(r1)
   mfxer       r2
   stw         r2,(rslt_xer-tst_results)(r1)
   mfctr       r2
   stw         r2,(rslt_ctr-tst_results)(r1)
   mflr        r2
   stw         r2,(rslt_lr-tst_results)(r1)
   mfspr       r2,tar
   stw         r2,(rslt_tar-tst_results)(r1)

tst_cleanup:
# restore c stuff
   lis         r3,tst_inits@h
   ori         r3,r3,tst_inits@l
   lwz         r1,(save_r1-tst_inits)(r3)
   lis         r3,MAGIC@h
   ori         r3,r3,MAGIC@l

   b           tst_done

# -------------------------------------------------------------------------------------------------
.align 5
tst_results:

rslt_r0:       .int 0xFFFFFFFF
rslt_r1:       .int 0xFFFFFFFF
rslt_r2:       .int 0xFFFFFFFF
rslt_r3:       .int 0xFFFFFFFF
rslt_r4:       .int 0xFFFFFFFF
rslt_r5:       .int 0xFFFFFFFF
rslt_r6:       .int 0xFFFFFFFF
rslt_r7:       .int 0xFFFFFFFF
rslt_r8:       .int 0xFFFFFFFF
rslt_r9:       .int 0xFFFFFFFF
rslt_r10:      .int 0xFFFFFFFF
rslt_r11:      .int 0xFFFFFFFF
rslt_r12:      .int 0xFFFFFFFF
rslt_r13:      .int 0xFFFFFFFF
rslt_r14:      .int 0xFFFFFFFF
rslt_r15:      .int 0xFFFFFFFF
rslt_r16:      .int 0xFFFFFFFF
rslt_r17:      .int 0xFFFFFFFF
rslt_r18:      .int 0xFFFFFFFF
rslt_r19:      .int 0xFFFFFFFF
rslt_r20:      .int 0xFFFFFFFF
rslt_r21:      .int 0xFFFFFFFF
rslt_r22:      .int 0xFFFFFFFF
rslt_r23:      .int 0xFFFFFFFF
rslt_r24:      .int 0xFFFFFFFF
rslt_r25:      .int 0xFFFFFFFF
rslt_r26:      .int 0xFFFFFFFF
rslt_r27:      .int 0xFFFFFFFF
rslt_r28:      .int 0xFFFFFFFF
rslt_r29:      .int 0xFFFFFFFF
rslt_r30:      .int 0xFFFFFFFF
rslt_r31:      .int 0xFFFFFFFF

rslt_cr:       .int 0xFFFFFFFF
rslt_xer:      .int 0xFFFFFFFF
rslt_ctr:      .int 0xFFFFFFFF
rslt_lr:       .int 0xFFFFFFFF
rslt_tar:      .int 0xFFFFFFFF

# -------------------------------------------------------------------------------------------------
.align 5
tst_expects:

expt_r0:       .int 0x7305868F
expt_r1:       .int 0x07EC9BA7
expt_r2:       .int 0xFFFFFFFF
expt_r3:       .int 0xAC3F2040
expt_r4:       .int 0xFFFFFFFF
expt_r5:       .int 0xFFFFFFFF
expt_r6:       .int 0xFFFFFFFF
expt_r7:       .int 0xFFFFFFFF
expt_r8:       .int 0xFFFFFFFF
expt_r9:       .int 0xFFFFFFFF
expt_r10:      .int 0xE83E7000
expt_r11:      .int 0x07EC9BA7
expt_r12:      .int 0xFFFFFFFF
expt_r13:      .int 0xFC9D07CE
expt_r14:      .int 0x7305868F
expt_r15:      .int 0xFFFFFFFF
expt_r16:      .int 0xFFFFFFFF
expt_r17:      .int 0x00000000
expt_r18:      .int 0xFFFFFFFF
expt_r19:      .int 0xFFFFFFFF
expt_r20:      .int 0x0F8F2BB1
expt_r21:      .int 0xFFFFFFFF
expt_r22:      .int 0xFFFFFFFF
expt_r23:      .int 0x9E47F6C0
expt_r24:      .int 0x46B0FC81
expt_r25:      .int 0xFFFFFFFF
expt_r26:      .int 0xFFFFFFFF
expt_r27:      .int 0x00000000
expt_r28:      .int 0x7305868F
expt_r29:      .int 0x0000007C
expt_r30:      .int 0xFFFFFFFF
expt_r31:      .int 0xFFFFFFFF

expt_cr:       .int 0x90315BC8
expt_xer:      .int 0x82C0004B
expt_ctr:      .int 0xF7DA2C89
expt_lr:       .int 0x8BC7C22B
expt_tar:      .int 0xFFFFFFFF
expt_msr:      .int 0x00001081

expt_iar:      .int 0x00010038


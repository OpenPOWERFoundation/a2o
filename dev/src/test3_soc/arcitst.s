# asmtst.tpl

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

.set SAVESPR,tar
.set MAGIC,0x8675309

# -------------------------------------------------------------------------------------------------
.align 5
tst_inits:

init_r0:       .int 0x00000000
init_r1:       .int 0x5822C905
init_r2:       .int 0xFFFFFFFF
init_r3:       .int 0x91B6D1A3
init_r4:       .int 0xFFFFFFFF
init_r5:       .int 0xFFFFFFFF
init_r6:       .int 0xFFFFFFFF
init_r7:       .int 0xFFFFFFFF
init_r8:       .int 0xFFFFFFFF
init_r9:       .int 0x7E11EE88
init_r10:      .int 0xFFFFFFFF
init_r11:      .int 0x7FFFFFFF
init_r12:      .int 0xFFFFFFFF
init_r13:      .int 0xFFFFFFFF
init_r14:      .int 0x8C20BDE6
init_r15:      .int 0xFFFFFFFF
init_r16:      .int 0x76D0DADF
init_r17:      .int 0x15111F42
init_r18:      .int 0xFFFFFFFF
init_r19:      .int 0x36108E50
init_r20:      .int 0xFFFFFFFF
init_r21:      .int 0xFFFFFFFF
init_r22:      .int 0x328A0CED
init_r23:      .int 0xFFFFFFFF
init_r24:      .int 0xFFFFFFFF
init_r25:      .int 0xAF224C19
init_r26:      .int 0xFFFFFFFF
init_r27:      .int 0xFFFFFFFF
init_r28:      .int 0xD624B27A
init_r29:      .int 0xFFFFFFFF
init_r30:      .int 0xFFFFFFFF
init_r31:      .int 0xFFFFFFFF

init_cr:       .int 0xDBFD3628
init_xer:      .int 0x89F0006E
init_ctr:      .int 0xFFFFFFFF
init_lr:       .int 0xFFFFFFFF
init_tar:      .int 0xFFFFFFFF
init_msr:      .int 0x00001104

init_iar:      .int 0x00010000

save_r1:       .int 0

codelen:       .int 13
ops:           .int 0x7C61CC14,0x7D230595,0x7AC37392,0x7E094C11,0x7E1CB115,0x7A338886,0x7C6004D1,0x7E09B038,0x7C360591,0x7E2B00D1,0x60000000,0x60000000,0x60000000
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
   la          r1,(ops-tst_inits)(r3)              # @ ops list
   la          r2,(iars-tst_inits)(r3)             # @ iars list
opcopy_loop:
   lwz         r4,0(r1)                            # next op
   lwz         r5,0(r2)                            # next iar
   stw         r4,0(r5)                            # store it
   addi        r1,r1,4                             # inc to next
   addi        r2,r2,4
   bdnz        opcopy_loop

# add end of test op - could be done here or by builder
# ways to end:
#   ba <fixed_loc>      - avoid reloc, target op can then branch to tst_end
#   trap,sc,scv         - branch to tst_end in handler
#   attn, priv op, etc. -  "
# overwrite the last epilogue op to avoid any crossing
opcopy_eot:
   lis         r4,0x4800
   ori         r4,r4,0x0006         # ba 0x0004
   stw         r4,0(r5)

# get tst start
   lwz         r1,(init_msr-tst_inits)(r3)
   mtsrr1      r1
   lwz         r1,(init_iar-tst_inits)(r3)
   mtsrr0      r1

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

jmp2tst:
   rfi
   #rfid
   #ba 0x10000

tst_end:
   b           save_results

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

   bla         tst_done

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

expt_r0:       .int 0x00000000
expt_r1:       .int 0xCD75F313
expt_r2:       .int 0xFFFFFFFF
expt_r3:       .int 0x00000000
expt_r4:       .int 0xFFFFFFFF
expt_r5:       .int 0xFFFFFFFF
expt_r6:       .int 0xFFFFFFFF
expt_r7:       .int 0xFFFFFFFF
expt_r8:       .int 0xFFFFFFFF
expt_r9:       .int 0x008A0C68
expt_r10:      .int 0xFFFFFFFF
expt_r11:      .int 0x7FFFFFFF
expt_r12:      .int 0xFFFFFFFF
expt_r13:      .int 0xFFFFFFFF
expt_r14:      .int 0x8C20BDE6
expt_r15:      .int 0xFFFFFFFF
expt_r16:      .int 0x08AEBF68
expt_r17:      .int 0x80000001
expt_r18:      .int 0xFFFFFFFF
expt_r19:      .int 0x00000000
expt_r20:      .int 0xFFFFFFFF
expt_r21:      .int 0xFFFFFFFF
expt_r22:      .int 0x328A0CED
expt_r23:      .int 0xFFFFFFFF
expt_r24:      .int 0xFFFFFFFF
expt_r25:      .int 0xAF224C19
expt_r26:      .int 0xFFFFFFFF
expt_r27:      .int 0xFFFFFFFF
expt_r28:      .int 0xD624B27A
expt_r29:      .int 0xFFFFFFFF
expt_r30:      .int 0xFFFFFFFF
expt_r31:      .int 0xFFFFFFFF

expt_cr:       .int 0x9BFD3628
expt_xer:      .int 0x98F0006E
expt_ctr:      .int 0xFFFFFFFF
expt_lr:       .int 0xFFFFFFFF
expt_tar:      .int 0xFFFFFFFF
expt_msr:      .int 0x00001104

expt_iar:      .int 0x00010038


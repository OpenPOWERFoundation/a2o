# debug code for mem
#.set TEST_MEM,1

# boot code for rom integration with litex terminal code
# requires 64K ROM
# got rid of int handlers for now to shrink this code

# cmod7 - skip ddr stuff

# set for sim bypass version
#.set SIM,1                 # this skips uart, ram check, etc.
#.set DELAY,0x00000005

# general delay (leds)
# should probs put this in a mem loc so it can be easily changed w/o compile
.set DELAY,0x01000000       # hardware (~1 secs)
#.set DELAY,0x00000100

# csr.csv
# need to set up CONFIG:
#csr_base,dna,0xfff00000,,
#csr_base,xadc,0xfff00800,,
#csr_base,leds,0xfff01000,,
#csr_base,buttons,0xfff01800,,
#csr_base,i2c,0xfff02000,,
#csr_base,motor_0,0xfff02800,,
#csr_base,ctrl,0xfff03000,,
#csr_base,identifier_mem,0xfff03800,,
#csr_base,timer0,0xfff04000,,
#csr_base,uart,0xfff04800,,

#
#memory_region,rom,0x00000000,65536,cached
#memory_region,ram,0x00010000,4096,cached
#memory_region,sram,0x80000000,4096,cached
#memory_region,csr,0xfff00000,65536,io

.include "defines.s"

#.section .hwinit # @00000000
# change to use litex linker.ld
.section .text

.global _start

# reset
_start:
      b         boot_start

.set REGSAVE,0x04
regsave:
               .long 0
               .long 0
               .long 0
               .long 0
               .long 0
               .long 0
               .long 0
               .long 0


# ddr setup delay (intracommand)
.ifdef SIM
.set DDR_DELAY,0x00000010  # sim
.else
.set DDR_DELAY,0x00020000
.endif

.align 6
.set CONFIG,0x40

#.set SRAM_BASE, 0x00010000  # get from _fdata
#.set STACK, 0x0001FFF8 # first save of r0 is 4 past this! #get from _fstack

.set MAGIC, 0x08675309

rom_lo:         .long 0
rom_hi:         .long 0xFFFF
sram_lo:        .long 0                # get from link syms; does chk for -1 to skip test
sram_hi:        .long 0
ddr_lo:         .long 0xFFFFFFFF       # -1: no gots
ddr_hi:         .long 0xF7FFFFFF

ctrl:           .long 0xFFF03000
cpu:            .long 0xFFFFFFFF       # -1: no gots
uart:           .long 0xFFF04800       # -1: no gots
leds:           .long 0xFFF01000       # -1: no gots
switches:       .long 0xFFFFFFFF       # -1: no gots
buttons:        .long 0xFFF01800       # -1: no gots
sdram:          .long 0xFFFFFFFF
eob_data:       .long MAGIC

# offsets for uart functions
.set UART_RXTX, 0x00
.set UART_TXFULL, 0x04
.set UART_RXEMPTY, 0x08
.set UART_EV_STATUS, 0x0C
.set UART_EV_PENDING, 0x10
.set UART_EV_ENABLE, 0x14
.set UART_TXEMPTY, 0x18
.set UART_RXFULL, 0x1C
.set UARTX_RXTX, 0x20
.set UARTX_TXFULL, 0x24
.set UARTX_RXEMPTY, 0x28
.set UARTX_EV_STATUS, 0x2C
.set UARTX_EV_PENDING, 0x30
.set UARTX_EV_ENABLE, 0x34
.set UARTX_TXEMPTY, 0x38
.set UARTX_RXFULL, 0x3C

.align 7
.set CONFIG_DDR,0x80

#wtf can litex be forced to put these at specific offsets from csr_base???
sdram_dfii:    .long 0xFFF06000        # csr_register,sdram_dfii_control,0xfff05000,1,rw
ddr_cmd_delay: .long DDR_DELAY
ddr_chk_loops: .long 1  # 0=infinite
ddr_mrs0:      .long 0  # wtf eventually set these up as config vals

# offsets from sdram_dfii base
.set DFII_CONTROL, 0x00
.set DFII_PI0_COMMAND, 0x04
.set DFII_PI0_COMMAND_ISSUE, 0x08
.set DFII_PI0_ADDRESS, 0x0C
.set DFII_PI0_BADDRESS, 0x10
.set DFII_PI0_WRDATA, 0x14
.set DFII_PI0_RDDATA, 0x18
.set DFII_PI1_COMMAND, 0x1C
.set DFII_PI1_COMMAND_ISSUE, 0x20
.set DFII_PI1_ADDRESS, 0x24
.set DFII_PI1_BADDRESS, 0x28
.set DFII_PI1_WRDATA, 0x2C
.set DFII_PI1_RDDATA, 0x30

# bits
.set CONTROL_SEL, 0x01
.set CONTROL_CKE, 0x02
.set CONTROL_ODT, 0x04        #wtf does this exist for ddr2??
.set CONTROL_RESET_N, 0x08
.set COMMAND_CS, 0x01
.set COMMAND_WE, 0x02
.set COMMAND_CAS, 0x04
.set COMMAND_RAS, 0x08
.set COMMAND_WRDATA, 0x10
.set COMMAND_RDDATA, 0x20
.set DDR_PARM_DELAY, 0x00020000

#
.align 8
int_100:
      b         .

# mck
.align 8
int_200:
      b         .

# dsi
.align 8
int_300:
      b         .

# dseg
.align 7
int_380:
      b         .

# isi
.align 8
int_400:
      b         .

# iseg
.align 7
int_480:
      b         .

# external
.align 8
int_500:
      b         .

# alignment
.align 8
int_600:
      b         .

# program
.align 8
int_700:
      b         .

# fp unavailable
.align 8
int_800:
      b         .

# dec
.align 8
int_900:
      b         .

# dec hyp
.align 7
int_980:
      b         .

# doorbell
.align 8# offsets from sdram_dfii base
.set DFII_CONTROL, 0x00
.set DFII_PI0_COMMAND, 0x04
.set DFII_PI0_COMMAND_ISSUE, 0x08
.set DFII_PI0_ADDRESS, 0x0C
.set DFII_PI0_BADDRESS, 0x10
.set DFII_PI0_WRDATA, 0x14
.set DFII_PI0_RDDATA, 0x18
.set DFII_PI1_COMMAND, 0x1C
.set DFII_PI1_COMMAND_ISSUE, 0x20
.set DFII_PI1_ADDRESS, 0x24
.set DFII_PI1_BADDRESS, 0x28
.set DFII_PI1_WRDATA, 0x2C
.set DFII_PI1_RDDATA, 0x30

# bits
.set CONTROL_SEL, 0x01
.set CONTROL_CKE, 0x02
.set CONTROL_ODT, 0x04        #wtf does this exist for ddr2??
.set CONTROL_RESET_N, 0x08
.set COMMAND_CS, 0x01
.set COMMAND_WE, 0x02
.set COMMAND_CAS, 0x04
.set COMMAND_RAS, 0x08
.set COMMAND_WRDATA, 0x10
.set COMMAND_RDDATA, 0x20
.set DDR_PARM_DELAY, 0x00020000
int_C00:
      b         .

# trace
.align 8
int_D00:
      b         .

# dsi hyp
.align 8
int_E00:
      b         .

# isi hyp
.align 5
int_E20:
      b         .

# emulation hyp
.align 5
int_E40:
      b         .

# maintenance hyp
.align 5
int_E60:
      b         .

# doorbell hyp
.align 5
int_E80:
      b         .

# virtualization hyp
.align 5
int_EA0:
      b         .

# reserved
.align 5
int_EC0:
      b         .

# reserved
.align 5
int_EE0:
      b         .

# perfmon
.align 5
int_F00:
      b         .

# vector unavailable
.align 5
int_F20:
      b         .

# vsx unavailable
.align 5
int_F40:
      b         .

# facility unavailable
.align 5
int_F60:
      b         .

# facility unavailable hyp
.align 5
int_F80:
      b         .

# ------------------------------------------------------------------------------------------------------------------------------
# init facilities and memories before blastoff
#

.macro load32  rx,v
      li       \rx,0
      oris     \rx,\rx,\v>>16
      ori      \rx,\rx,\v&0x0000FFFF
.endm

.macro load16swiz rx,v
      li       \rx,0
      ori      \rx,\rx,(\v<<8)&0xFF00
      ori      \rx,\rx,(\v>>8)&0x00FF
.endm

.macro delayr  rx
      mtctr    \rx
      bdnz     .
.endm

.macro delay   rx,v
      li       \rx,0
      oris     \rx,\rx,\v>>16
      ori      \rx,\rx,\v&0x0000FFFF
      mtctr    \rx
      bdnz     .
.endm

.org 0x1000
boot_start:

########################################################################################################################################
# sim only - go quickly to main() w/no console output

.ifdef SIM
      li         r3,0x01
      bl         set_leds_b0
      bl         uart_init
      li         r3,0x02
      bl         set_leds_b0
      b          jump2main
.endif

########################################################################################################################################
# clear and init core facilities

      li         r3,0x01
      bl         core_init
      bl         set_leds_b0        # 01; core init'd
      delay      r10,DELAY

########################################################################################################################################
# console

console:

      li         r3,0x02            # 02; console init
      bl         set_leds_b0
      bl         uart_init
      delay      r10,DELAY

      li         r3,0x03            # 03; console init done
      bl         set_leds_b0
      delay      r10,DELAY

      li         r3,DATA+MSG_HELLO
      bl         console_println

########################################################################################################################################
# check on-board sram

.ifdef TEST_MEM
      b          test_mem
.endif

sram_chk:
      lwz        r10,sram_lo(r0)
      cmpwi      r10,-1
      beq        ddr_chk
      # use syms
      lis        r10,_fdata@h
      ori        r10,r10,_fdata@l
      #lwz        r11,sram_hi(r0)
      # use stack top; else have to add sym to linker.ld
      lis        r11,_fstack@h
      ori        r11,r11,_fstack@l
      addi       r11,r11,3

      subf       r11,r10,r11
      addi       r11,r11,1
      srwi       r11,r11,4          # num word reads
      mtctr      r11

      li         r12,0
      oris       r12,r12,0x0867
      ori        r12,r12,0x5309     # data

sram_writes:
      stw        r12,0(r10)
      addi       r10,r10,4
      bdnz       sram_writes
      # use syms
      #lwz        r10,sram_lo(r0)
      lis        r10,_fdata@h
      ori        r10,r10,_fdata@l
      mtctr      r11

sram_reads:
      lwz        r13,0(r10)
      cmpw       r13,r12
      bne        fail
      addi       r10,r10,4
      bdnz       sram_reads

      li         r3,0x07            # 07; sram checked
      bl         set_leds_b0
      delay      r10,DELAY

      li         r3,DATA+MSG_SRAM
      bl         console_println

# sram test someday
########################################################################################################################################
# check ddr, n loops

#wtf is there a way to disable/enable l2????

ddr_chk:
      lwz        r10,ddr_lo(r0)
      cmpwi      r10,-1
      beq        rominit

      li         r3,0x0F            # 0F; dram checking
      bl         set_leds_b0
      li         r3,DATA+MSG_DDR_0
      bl         console_println

      li         r8,0               # loop counter
      lwz        r9,ddr_chk_loops(r0)

      li         r12,0              # data
      oris       r12,r12,0x6708
      ori        r12,r12,0x0953

ddr_start:
      addi       r8,r8,1
      mr         r3,r8
      bl         set_leds_b1        # running pass

      lwz        r10,ddr_lo(r0)
      lwz        r11,ddr_hi(r0)
      addi       r11,r11,1
      subf       r11,r10,r11
      srwi       r11,r11,2          # word r/w
      mtctr      r11

ddr_writes:
      stw        r12,0(r10)
      addi       r10,r10,4
      bdnz       ddr_writes

      lwz        r10,ddr_lo(r0)
      mtctr      r11

ddr_reads:
      lwz        r13,0(r10)
      cmpw       r13,r12
      bne        ddr_fail_save
      addi       r10,r10,4
      bdnz       ddr_reads

# loop done

      addi       r12,r12,7            # change pattern
      cmpwi      r9,0
      beq        ddr_start
      cmpw       r8,r9
      bne        ddr_start

      li         r3,0x0E             # 0E; dram OK
      bl         set_leds_b0
      li         r3,0x00
      bl         set_leds_b1
      li         r3,DATA+MSG_DDR_1
      bl         console_println
      delay      r10,DELAY

########################################################################################################################################

rominit:

      li         r3,DATA+MSG_ROM_INIT
      bl         console_println

########################################################################################################################################
# VMA/LMA: copy .data, clear .bss

      # get the linker script symbols needed...
      #lis        r1,(.TOC.-0)@h
      #lis         r1,.toc.@h
      #lis        r6,.got.@h
      #lwz        r1,_fdata_rom@got(r6)

      lis        r1,_fdata_rom@h
      ori        r1,r1,_fdata_rom@l
      lis        r2,_fdata@h
      ori        r2,r2,_fdata@l
      lis        r3,_edata_rom@h
      ori        r3,r3,_edata_rom@l
      lis        r4,_fbss@h
      ori        r4,r4,_fbss@l
      lis        r5,_ebss@h
      ori        r5,r5,_ebss@l

      subf       r9,r1,r3
      srwi.      r9,r9,2
      beq        romcopy_done
      mtctr      r9
      addi       r1,r1,-4
      addi       r2,r2,-4

romcopy:
      lwzu       r9,4(r1)
      stwu       r9,4(r2)
      bdnz       romcopy

romcopy_done:
      subf       r9,r4,r5
      srwi.      r9,r9,2
      beq        romclear_done

      mtctr      r9
      addi       r4,r4,-4
      li         r9,0

romclear:
      stwu       r9,4(r4)
      bdnz       romclear

romclear_done:

########################################################################################################################################

########################################################################################################################################

process_start:

      li         r3,DATA+MSG_BANNER
      bl         console_println

jump2main:
      lis        r1,_fstack@h
      ori        r1,r1,_fstack@l
      li         r3, 0            # parm 1
      b          main

########################################################################################################################################

.ifdef TEST_MEM

.macro asciib  rt,rs
      andi.    \rt,\rs,0x0F
      cmpwi    \rt,10
      blt      +8
      addi     \rt,\rt,0x11-10
      addi     \rt,\rt,0x30
.endm

.macro println_reg  rt
      rotlwi     \rt,\rt,4
      asciib     r3,\rt
      bl         uart_write
      rotlwi     \rt,\rt,4
      asciib     r3,\rt
      bl         uart_write
      rotlwi     \rt,\rt,4
      asciib     r3,\rt
      bl         uart_write
      rotlwi     \rt,\rt,4
      asciib     r3,\rt
      bl         uart_write
      rotlwi     \rt,\rt,4
      asciib     r3,\rt
      bl         uart_write
      rotlwi     \rt,\rt,4
      asciib     r3,\rt
      bl         uart_write
      rotlwi     \rt,\rt,4
      asciib     r3,\rt
      bl         uart_write
      rotlwi     \rt,\rt,4
      asciib     r3,\rt
      bl         uart_write
      li         r3,0x0D
      bl         uart_write
      li         r3,0x0A
      bl         uart_write
.endm

# running out of space
print_r6:
      mflr       r0
      println_reg r6
      mtlr       r0
      blr

test_mem:
      lis        r5,1            # start@-
      ori        r10,r5,0x40     # end@

      load32     r6,0x0a0b0c0d
      li         r3,'W'
      bl         uart_write
      bl print_r6

      #stw        r6,0(r5)
      #load32     r6,0
      #stw        r6,4(r5)
      #stw        r6,8(r5)
      #stw        r6,12(r5)
      stb        r6,0(r5)
      srwi       r6,r6,8
      stb        r6,5(r5)
      srwi       r6,r6,8
      stb        r6,10(r5)
      srwi       r6,r6,8
      stb        r6,15(r5)
      lbz         r6,0(r5)
      bl print_r6
      lbz         r6,1(r5)
      bl print_r6
      lbz         r6,2(r5)
      bl print_r6
      lbz         r6,3(r5)
      bl print_r6
      lbz         r6,4(r5)
      bl print_r6
      nop
      nop
      nop
      nop
test_mem_read:
      lwz        r7,0(r5)
      li         r3,'R'
      bl         uart_write
      println_reg  r7
      addi       r5,r5,4
      cmpw       r5,r10
      blt        test_mem_read
      #b      .
      b          sram_chk

.endif

########################################################################################################################################
# rom: just check high address - could be a crc check

test_rom:
      lwz        r20,rom_hi(r0)
      li         r21,-4
      and        r21,r20,r21
      lwz        r21,0(r21)
      lwz        r22,eob_data(r0)
      cmpw       r21,r22
      li         r3,1
      bne        fail
      bl         set_leds

      b          pass

# put data in sram so it can be read from uart
ddr_fail_save:

      lis        r1,_fdata@h
      ori        r1,r1,_fdata@l

      stw        r0,0(1)
      #stw        r1,4(1)
      stw        r2,8(1)
      stw        r3,12(1)       # loops
      stw        r4,16(1)
      stw        r5,20(1)
      stw        r6,24(1)
      stw        r7,28(1)
      stw        r8,32(1)
      stw        r9,36(1)
      stw        r10,40(1)      # addr
      stw        r11,44(1)
      stw        r12,48(1)      # exp
      stw        r13,52(1)      # act
      stw        r14,56(1)
      stw        r15,60(1)
      stw        r16,64(1)
      stw        r17,68(1)
      stw        r18,72(1)
      stw        r19,76(1)
      stw        r20,80(1)
      stw        r21,84(1)
      stw        r22,88(1)
      stw        r23,92(1)
      stw        r24,96(1)
      stw        r25,100(1)
      stw        r26,104(1)
      stw        r27,108(1)
      stw        r28,112(1)
      stw        r29,116(1)
      stw        r30,120(1)
      stw        r31,124(1)

      mfcr       r31
      stw        r31,128(1)      # cr
      mfctr      r31
      stw        r31,132(1)      # ctr
      mflr       r31
      stw        r31,136(1)      # lr
      mfspr      r31,tar
      stw        r31,140(1)      # tar
      li         r31,-1
      stw        r31,144(1)      # error code

      b          fail

console_echo:

      mflr       r0

      lwz        r5,sram_lo(r0)              # buffer start
      mr         r6,r5                       # buffer ptr

console_echo_1:
      bl         uart_read_nonblock          # this could just be uart_read() unless want to do something else while waiting
      cmpwi      r3, 0
      beq        console_echo_1
      bl         uart_read

      cmpwi      r3,0x0A                     # lf
      beq        console_echo_2
      cmpwi      r3,0x0D                     # cr
      beq        console_echo_2
      stb        r3,0(6)
      addi       r6,r6,1
      bl         uart_write
      b          console_echo_1

console_echo_2:
# print back the whole line surrounded by <>
      subf       r3,r5,r6
      mtctr      r3
      li         r3,0x0D                     # cr
      bl         uart_write
      li         r3,0x0A                     # lf
      bl         uart_write
      li         r3,0x3C                     # <
      bl         uart_write
      mr         r6,r5                       # start of buffer

console_echo_3:
      lbz        r3,0(6)
      bl         uart_write
      addi       r6,r6,1
      bdnz       console_echo_3

      li         r3,0x3E                     # >
      bl         uart_write
      li         r3,0x0D                     # cr
      bl         uart_write
      li         r3,0x0A                     # lf
      bl         uart_write
      mr         r6,r5                       # start of buffer
      b          console_echo_1

      mtlr       r0
      blr

console_print:

      mflr       r0
      mr         r5,r3                       # buffer ptr

console_print_1:
      lbz        r3,0(5)
      cmpwi      r3,0
      beq        console_print_2
      bl         uart_write
      addi       r5,r5,1
      bdnz       console_print_1

console_print_2:
      mtlr       r0
      blr

console_println:
      mflr       r0
      mr         r5,r3                       # buffer ptr

console_println_1:
      lbz        r3,0(5)
      cmpwi      r3,0
      beq        console_println_2
      bl         uart_write
      addi       r5,r5,1
      bdnz       console_println_1

console_println_2:
      li         r3,0x0D                     # cr
      bl         uart_write
      li         r3,0x0A                     # lf
      bl         uart_write

      mtlr       r0
      blr

.org 0x1800

pass:
      mflr       r0
      li         r3,0x01C0
      bl         set_leds
      b          .

.align 6
# fail w/generic code, or specify
fail:
      li         r3,0x6666
fail_rc:
      mflr       r0
      bl         set_leds
fail_no_rc:
      b          .

.align 6
# set up everything that isn't reset; not really needed for fpga
core_init:
      blr

# leds 15:0
get_leds:
      lwz        r1,leds(r0)
      lhz        r3,0(1)
      blr

set_leds:
      lwz        r1,leds(r0)
      sth        r3,0(1)
      blr

# litex csr don't obey sel!?!?!
set_leds_b0:
      lwz        r1,leds(r0)
      #stb        r3,0(1)
      lhz        r2,0(1)               # 0011
      andi.      r2,r2,0x00FF
      slwi       r3,r3,8
      or         r2,r2,r3
      sth        r2,0(1)               # 0011
      blr

set_leds_b1:
      lwz        r1,leds(r0)
      lhz        r2,0(1)               # 0011
      andi.      r2,r2,0xFF00
      andi.      r3,r3,0x00FF
      or         r2,r2,r3
      sth        r2,0(1)               # 0011
      blr

.align 6

.set UART_EV_TX, 0x1
.set UART_EV_RX, 0x2

uart_init:
      lwz        r2, uart(r0)
      lbz        r1, UART_EV_PENDING(r2)
      stb        r1, UART_EV_PENDING(r2)
      li         r1, UART_EV_TX | UART_EV_RX
      stb        r1, UART_EV_ENABLE(r2)
      blr


uart_read:
      lwz        r2, uart(r0)
      lbz        r1, UART_RXEMPTY(r2)
      cmpwi      r1,0
      bne        uart_read
      lbz        r3, UART_RXTX(r2)
      li         r1, UART_EV_RX
      stb        r1, UART_EV_PENDING(r2)
      blr

uart_read_nonblock:
      lwz        r2, uart(r0)
      li         r3,0
      lbz        r1, UART_RXEMPTY(r2)
      cmpw       r1,r3
      bne        uart_read_nonblock_1
      li         r3,1
uart_read_nonblock_1:
      blr

uart_write:
      lwz        r2, uart(r0)
      lbz        r1, UART_TXFULL(r2)
      cmpwi      r1,0
      bne        uart_write
      stb        r3, UART_RXTX(r2)
      li         r1, UART_EV_TX
      stb        r1, UART_EV_PENDING(r2)
      blr

uart_sync:
      lwz        r2, uart(r0)
      lbz        r1, UART_TXFULL(r2)
      cmpwi      r1,0
      bne        uart_sync
      blr

.org 0x1C00
.set DATA, 0x1C00

msg_hello:
                .byte 0x0D
                .byte 0x0A
                .ascii "A2P POWAflight"
                .byte 0x0D
                .byte 0x0A
                .asciz ""

.align 5
msg_sram:
                .ascii "SRAM OK."
                .asciz ""


.align 5
msg_ddr_0:
                .ascii "SDRAM TEST..."
                .asciz ""

.align 5
.msg_ddr_1:
                .ascii "SDRAM OK "
                .ascii "@10000000:"
                .asciz "17FFFFFF"

.align 5
.msg_rom:
                .ascii "Copying"
                .ascii " ROM to"
                .asciz " RAM..."

.align 5
.msg_banner:
#.include "banner.s"
                .ascii "Jumping to"
                .asciz " main()..."

.set MSG_HELLO, 0
.set MSG_SRAM, MSG_HELLO+32
.set MSG_DDR_0, MSG_SRAM+32
.set MSG_DDR_1, MSG_DDR_0+32
.set MSG_ROM_INIT, MSG_DDR_1+32
.set MSG_BANNER, MSG_ROM_INIT+32


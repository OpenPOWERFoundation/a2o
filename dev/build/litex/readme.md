# Build Targets

## Litex

### Try 32BE and 64LE software builds

#### 64LE

```
a2o.py --csr-csv csr.csv
# completes OK and build/cmod7_kintex/software is created
```

#### 32BE

```
a2o_32.py --csr-csv csr.csv

Running test binary command: /data/projects/a2o/dev/build/litex/build/cmod7_kintex/software/libc/meson-private/sanitycheckc.exe
C compiler for the build machine: ccache cc (gcc 9.4.0 "cc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0")
C linker for the build machine: cc ld.bfd 2.34
Build machine cpu family: x86_64
Build machine cpu: x86_64
Host machine cpu family: ppc
Host machine cpu: a2o
Target machine cpu family: ppc
Target machine cpu: a2o

../../../../../../../../../../home/wtf/.local/lib/python3.8/site-packages/pythondata_software_picolibc/data/meson.build:99:2: ERROR: Problem encountered:

Unsupported architecture: "ppc"
```

* change core.py cpu_family="powerpc"; warning only :)

```
a2o_32.py --csr-csv csr.csv

...
WARNING: Unknown CPU family powerpc, please report this at https://github.com/mesonbuild/meson/issues/new
...

[15/795] Compiling C object newlib/libc.a.p/libc_machine_powerpc_setjmp.S.o
FAILED: newlib/libc.a.p/libc_machine_powerpc_setjmp.S.o
powerpc-linux-gnu-gcc -Inewlib/libc.a.p -Inewlib -I../../../../../../../../../../home/wtf/.local/lib/python3.8/site-packages/pythondata_software_picolibc/data/newlib -Inewlib/libm/common -I../../../../../../../../../../home/wtf/.local/lib/python3.8/site-packages/pythondata_software_picolibc/data/newlib/libm/common -Inewlib/libc/machine/powerpc -I../../../../../../../../../../home/wtf/.local/lib/python3.8/site-packages/pythondata_software_picolibc/data/newlib/libc/machine/powerpc -Inewlib/libc/tinystdio -I../../../../../../../../../../home/wtf/.local/lib/python3.8/site-packages/pythondata_software_picolibc/data/newlib/libc/tinystdio -I. -I../../../../../../../../../../home/wtf/.local/lib/python3.8/site-packages/pythondata_software_picolibc/data -Inewlib/libc/include -I../../../../../../../../../../home/wtf/.local/lib/python3.8/site-packages/pythondata_software_picolibc/data/newlib/libc/include -I/home/wtf/.local/lib/python3.8/site-packages/pythondata_software_picolibc/data/newlib/libc/tinystdio -I/home/wtf/.local/lib/python3.8/site-packages/pythondata_software_picolibc/data/newlib/libc/include -I/data/projects/litex/litex/soc/software/libbase -I/data/projects/litex/litex/soc/software/include -I/data/projects/litex/litex/soc/software -I/data/projects/a2o/dev/build/litex/build/cmod7_kintex/software/include -I/data/projects/a2o/dev/build/litex/build/cmod7_kintex/software/include/../libc -I/data/projects/a2o/dev/build/litex/a2o -fdiagnostics-color=always -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -std=c18 -Os -g -ffunction-sections -Os -mcpu=a2 -m32 -mbig-endian -fomit-frame-pointer -fno-builtin -fno-stack-protector -fexceptions -D__a2o__ -g3 -fomit-frame-pointer -Wall -fno-builtin -fno-stack-protector -fexceptions -Wpragmas -include /data/projects/a2o/dev/build/litex/build/cmod7_kintex/software/libc/picolibc.h -fno-stack-protector -U_FORTIFY_SOURCE -fno-common -frounding-math -DFORMAT_DEFAULT_INTEGER -Werror=implicit-function-declaration -Werror=vla -Warray-bounds -Wold-style-definition -Wno-missing-braces -Wno-implicit-int -Wno-return-type -D_COMPILING_NEWLIB -MD -MQ newlib/libc.a.p/libc_machine_powerpc_setjmp.S.o -MF newlib/libc.a.p/libc_machine_powerpc_setjmp.S.o.d -o newlib/libc.a.p/libc_machine_powerpc_setjmp.S.o -c ../../../../../../../../../../home/wtf/.local/lib/python3.8/site-packages/pythondata_software_picolibc/data/newlib/libc/machine/powerpc/setjmp.S
../../../../../../../../../../home/wtf/.local/lib/python3.8/site-packages/pythondata_software_picolibc/data/newlib/libc/machine/powerpc/setjmp.S:30:2: error: #error 32-bit
   30 | #error 32-bit

```

* get rid of forced error in data/newlib/libc/machine/powerpc/setjmp.S

```
cd pythondata-software-picolibc$
#  //#error 32-bit
pip3 install .
```

```
a2o_32.py --csr-csv csr.csv

../../../../../../../../../../home/wtf/.local/lib/python3.8/site-packages/pythondata_software_picolibc/data/newlib/libc/include/machine/endian.h:74:30: error: expected statement before ‘)’ token
   74 | #define ntohl(_x) __ntohl(_x))
      |                              ^
../../../../../../../../../../home/wtf/.local/lib/python3.8/site-packages/pythondata_software_picolibc/data/newlib/libc/xdr/xdr_rec.c:827:12: note: in expansion of macro ‘ntohl’
  827 |   header = ntohl (header);
      |            ^~~~~
[438/795] Compiling C object newlib/libc.a.p/libc_time_strftime.c.o
ninja: build stopped: subcommand failed.
```

* fix syntax in data/newlib/libc/include/machine/endian.h

```
cd pythondata-software-picolibc$
#  #define	htonl(_x)	__htonl(_x)
#  #define	htons(_x)	__htons(_x)
#  #define	ntohl(_x)	__ntohl(_x)
#  #define	ntohs(_x)	__ntohs(_x)
pip3 install .
```

* add crt0savres.s for missing 32b functions
* now compiles and builds
* seems semi-copacetic so far

```
powerpc-linux-gnu-objdump -d build/cmod7_kintex/software/bios/bios.elf > bios_32.d
```

### Try Litex compile with Verilator

```
a2o_32.py --csr-csv csr.csv
powerpc-linux-gnu-objdump -d build/cmod7_kintex/software/bios/bios.elf > bios_32.d
../../src/bin/bin2init build/cmod7_kintex/software/bios/bios.bin
cp build/cmod7_kintex/software/bios/bios.bin.hex ../../sim/verilator/cmod7_kintex_rom.init
```
* run

```
00000918 C0: CP 0:000520 1:000524 0000000000000520
00000919 C0: CP 0:000528 0000000000000528                               branch to bios!
00001000 ...tick...
00001033 C0: CP 0:001F38 1:001F3C 0000000000001F38                      <main>
00001081 C0: CP 0:001F40 1:207280 0000000000001F40                      1F40 is stmw r28 - whoa, are the 2xxxxx microcode????  seems so and completes...
00001086 C0: CP 0:207288 1:20728C 0000000000001F40
00001089 C0: CP 0:22F688 1:22F68C 0000000000001F40
00001090 C0: CP 0:21FA88 1:21FA8C 0000000000001F40
00001091 C0: CP 0:207E90 0000000000001F40
00001256 C0: CP 0:0001C0 00000000000001C0                               1F44 is stw (lr) at orig stack + 4 - did it cross 64k? yeah 1F44/20004
00001262 C0: CP 0:0001C0 00000000000001C0
00001267 C0: CP 0:0001C0 00000000000001C0
00001272 C0: CP 0:0001C0 00000000000001C0
00001277 C0: CP 0:0001C0 00000000000001C0
00001280 C0: CP 0:0001C0 00000000000001C0
00001294 C0: CP 0:0001C0 00000000000001C0
00001308 C0: CP 0:0001C0 00000000000001C0
00001322 C0: CP 0:0001C0 00000000000001C0
00001336 C0: CP 0:0001C0 00000000000001C0
00001350 C0: CP 0:0001C0 00000000000001C0
*** Loop detected for 10 iterations ***
Quiescing...
00001366 C0: CP 0:0001C0 00000000000001C0
00001369 C0: CP 0:0001C0 00000000000001C0


tb_litex_soc

Cycles run=1376

You are worthless and weak.
```

* set top o stack to _fstack-8; now makes it through 4DF8 (in uart_init)...doh, need to add the derat entry for csr (memory_region,csr,0xfff00000,65536,io)




### Core and wishbone wrapper with extra stuff for Litex integration

* create a2o/core.py and a2o.py (SOC) from a2p
* makes it through vivado compile
* cleaned up some various minor rtl warnings
* added parm to cmod7 platform to allow replacing the target fpga device; trying arty-200 to see if it fits as-is - no, but can override?

```
ERROR: [DRC UTLZ-1] Resource utilization: Slice LUTs over-utilized in Top Level Design (This design requires more Slice LUTs cells than are available in the target device. This design requires 212846 of such cell types but only 134600 compatible sites are available in the target device. Please analyze your synthesis results and constraints to ensure the design is mapped to Xilinx primitives as expected. If so, please consider targeting a larger device. Please set tcl parameter "drc.disableLUTOverUtilError" to 1 to change this error to warning.)
```

* try adding ```set drc.disableLUTOverUtilError 1``` to build script and running...
```
cd build/cmod7/gateware
vivado -mode tcl -source cmod7.tcl
```

* doesn't change results
* try in gui:
```
set_property SEVERITY WARNING [get_drc_checks {DRC UTLZ-1}]
WARNING: [Vivado 12-4383] DRC UTLZ-1 may not change severity
```
* do get the synth util report; iu=25% lq=28% xu=12% rv=16% fu=9% mmu=8%

```
+-----------------------------------------+--------------------------------------------+------------+------------+---------+------+-------+--------+--------+------------+
|   Instance                              |                   Module                   | Total LUTs | Logic LUTs | LUTRAMs | SRLs |  FFs  | RAMB36 | RAMB18 | DSP Blocks |
+-----------------------------------------+--------------------------------------------+------------+------------+---------+------+-------+--------+--------+------------+
| cmod7                                   |                                      (top) |     212875 |     210949 |    1924 |    2 | 83329 |    116 |     13 |          0 |
|   (cmod7)                               |                                      (top) |        162 |        146 |      16 |    0 |   312 |     20 |      1 |          0 |
|   a2owb                                 |                                      a2owb |     212713 |     210803 |    1908 |    2 | 83017 |     96 |     12 |          0 |
|     c0                                  |                                          c |     212222 |     210312 |    1908 |    2 | 82296 |     96 |     12 |          0 |
|       fupc                              |                                    c_fu_pc |      20918 |      20317 |     600 |    1 |  7726 |      0 |      0 |          0 |
|       iuq0                              |                                        iuq |      54334 |      53794 |     540 |    0 | 19339 |     25 |      6 |          0 |
|       lq0                               |                                         lq |      60745 |      60744 |       0 |    1 | 26090 |     49 |      6
|       mmu0                              |                                        mmq |      16032 |      16032 |       0 |    0 |  8151 |     21 |
|       rv0                               |                                         rv |      34548 |      34292 |     256 |    0 |  9989 |      0 |      0 |          0 |
|       xu0                               |                                         xu |      25469 |      24957 |     512 |    0 | 10997 |      1 |
|     n0                                  |                                     a2l2wb |        491 |        491 |       0 |    0 |   721 |      0 |      0 |          0 |
+-----------------------------------------+--------------------------------------------+------------+------------+---------+------+-------+--------+--------+------------+

```

* errors to check in source: a lot of critical warnings are vdd vs VCC and gnd vs GND; are these inouts and ties missing?

## 7k410tffv676-1  clk1x=50MHz

```
|     c0                                  |                                          c |     241529 |     240987 |     540 |    2 | 95676 |     96 |     12 |          0 |
```

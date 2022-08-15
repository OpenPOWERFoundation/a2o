# Verilator

* verilator now successfully runs, once the nclk[] changes were completed to separate clk and rst, and
remove lcb's driving lclk's

## a2o w/WB wrapper

```
verilator -cc  --exe --trace --Mdir obj_dir --language 1364-2001 -Wno-fatal -Wno-LITENDIAN --error-limit 1  -Iverilog/a2o_litex -Iverilog/work -Iverilog/trilib -Iverilog/unisims a2owb.v tb_litex.cpp |& tee verilator.txt
make -C obj_dir -f Va2owb.mk Va2owb
obj_dir/Va2owb

```

* about 5 non-scan UNOPTFLATs

## Litex SOC

* full SOC also runs; now need to add uart to tb and more code to get to litex terminal

```
top=cmod7_kintex
build=../../build/litex/build/$top/gateware
# keep consistent naming
mod=soc
cp $build/$top.v $mod.v
sed -i "s/module $top/module $mod/" $mod.v

# don't absolutely need this? soc will reset itself; also, csr can reset
# make public - would be nice to do these with a --publics <file>
sed -i 's#reg  soc_rst =.*;#reg  soc_rst /*verilator public*/ = 0;#' $mod.v

# verilog loads a rom init file; gen'd during soc build or externally
# test3 copies tst to @10000; ALSO! the tst wrapper has to be loaded into ram space since it has save/restore areas.
#cp $build/${top}_rom.init . #LE
cp ../mem/test3/rom_soc.init ${top}_rom.init #BE
touch ${top}_mem.init         # csr
touch ${top}_sram.init        # on-board
touch ${top}_main_ram.init    # ext

verilator -cc  --exe --trace --Mdir obj_dir_$mod --language 1364-2001 -Wno-fatal -Wno-LITENDIAN --error-limit 1 -I$. -Iverilog/a2o_litex -Iverilog/work -Iverilog/trilib -Iverilog/unisims -Iverilog/unisims_soc $mod tb_litex_$mod.cpp |& tee verilator_$mod.txt

make -C obj_dir_$mod -f V$mod.mk V$mod
obj_dir_$mod/V$mod | tee sim_soc.txt
vcd2fst a2olitex.vcd soc.fst
rm a2olitex.vcd
gtkwave soc.fst soc.gtkw

time obj_dir_$mod/V$mod > sim_soc_notrace.txt

real	1m3.318s
user	0m58.941s
sys	0m3.368s
```

* notrace - faster execution?

```
dir=obj_dir_${mod}_notrace
verilator -cc --exe -CFLAGS -DNO_TRACE=1 --Mdir $dir --language 1364-2001 -Wno-fatal -Wno-LITENDIAN --error-limit 1 -I$. -Iverilog/a2o_litex -Iverilog/work -Iverilog/trilib -Iverilog/unisims -Iverilog/unisims_soc $mod tb_litex_$mod.cpp |& tee verilator_$mod.txt
make -j6 -C $dir -f V$mod.mk V$mod

time $dir/V$mod > sim_soc_notrace.txt

real	0m19.814s
user	0m19.577s
sys	0m0.188s
```

   that is ~1.25KHz clk (25K cycs/20s).

* -O3 + notrace

```
dir=obj_dir_${mod}_notrace_o3
verilator -cc --exe -O3 -CFLAGS -DNO_TRACE=1 --Mdir $dir --language 1364-2001 -Wno-fatal -Wno-LITENDIAN --error-limit 1 -I$. -Iverilog/a2o_litex -Iverilog/work -Iverilog/trilib -Iverilog/unisims -Iverilog/unisims_soc $mod tb_litex_$mod.cpp |& tee verilator_$mod.txt
make -j6 -C $dir -f V$mod.mk V$mod
$dir/V$mod | tee sim_soc_o3.txt

time $dir/V$mod > sim_soc_notrace_o3.txt

real	0m23.279s
user	0m22.916s
sys	0m0.260s

```

* -O3 -O3 + notrace

```
dir=obj_dir_${mod}_notrace_o3_o3
verilator -cc --exe -O3 -CFLAGS -O3 -CFLAGS -DNO_TRACE=1 --Mdir $dir --language 1364-2001 -Wno-fatal -Wno-LITENDIAN --error-limit 1 -I$. -Iverilog/a2o_litex -Iverilog/work -Iverilog/trilib -Iverilog/unisims -Iverilog/unisims_soc $mod tb_litex_$mod.cpp |& tee verilator_$mod.txt
make -j6 -C $dir -f V$mod.mk V$mod
$dir/V$mod | tee sim_soc_o3_o3.txt

time $dir/V$mod > sim_soc_notrace_o3_o3.txt

real	0m23.244s
user	0m22.963s
sys	0m0.192s

```

##### first try

* runs until last completion of 134C???

```
00001338 <tst_cleanup>:
    1338:	3c 60 00 00 	lis     r3,0
    133c:	60 63 10 60 	ori     r3,r3,4192
    1340:	80 23 00 9c 	lwz     r1,156(r3)
    1344:	3c 60 08 67 	lis     r3,2151
    1348:	60 63 53 09 	ori     r3,r3,21257
    134c:	48 00 0e 0f 	bla     e0c <tst_done>

00000e0c <tst_done>:
     e0c:	94 21 ff e0 	stwu    r1,-32(r1)

```

* bumped stopOnHang to 500 cycles and it does complete 1C0 after 134C.  dsi on stwu.  dear=FFFFFFE0.  that is suspiciously identical to 0-32. what is trying to be read from @1060 to set r1???  that is in rom space. the tst wrapper is being linked into rom and not relocated!  it should probably use a linker-gen'd pointer to use for its r/w data space.  but wouldn't generally be building a tst into rom.

##### second try

* changed linker.ld to put tst in .data so it's copied by bios to ram...

```
00024966 C0: CP 0:000FD8 0000000000000FD8
00024983 C0: CP 0:000FDC 1:000FE0 0000000000000FDC
00024985 C0: CP 0:000FE4 1:000FF4 0000000000000FE4
00024986 C0: CP 0:000FF8 1:000FFC 0000000000000FF8
00025000 ...tick...
00025005 C0: CP 0:001000 0000000000001000
00025006 C0: CP 0:001004 0000000000001004
00025008 C0: CP 0:001008 0000000000001008
00025022 C0: CP 0:00100C 000000000000100C
00025071 C0: CP 0:0007F0 00000000000007F0
*** Passing IAR detected ***


tb_litex_soc

Cycles run=25074

You has opulence.
```



## Experiments

### core-only initial experiment

```
verilator -cc --exe --trace --Mdir obj_dir --language 1364-2001 -Wno-fatal -Wno-LITENDIAN --error-limit 1 -Iverilog/work -Iverilog/trilib_clk1x -Iverilog/trilib -Iverilog/unisims c.v tb.cpp

make -C obj_dir -f Vc.mk Vc
obj_dir/Vc
```

### core + node (extmem version)

```
verilator -cc --exe --trace --Mdir obj_dir --language 1364-2001 -Wno-fatal -Wno-LITENDIAN --error-limit 1  -Iverilog/work -Iverilog/trilib_clk1x -Iverilog/trilib -Iverilog/unisims -Iverilog/a2node a2owb.v tb_node.cpp

make -C obj_dir -f Va2owb.mk Va2owb
obj_dir/Va2owb
```

* doesn't work (test3/mem.init), which does work for coccotb/icarus
* tid compare at start looks like it's using wrong value (imm from following bc?) and erat code is skipped

### core + node wb (litex)

* verilog/a2onode_litex

```
verilator -cc --exe --trace --Mdir obj_dir --language 1364-2001 -Wno-fatal -Wno-LITENDIAN --error-limit 1  -Iverilog/a2o_litex -Iverilog/work -Iverilog/trilib_clk1x -Iverilog/trilib -Iverilog/unisims a2owb.v tb_litex.cpp

make -C obj_dir -f Va2owb.mk Va2owb
obj_dir/Va2owb
```

* debugged several fails near start of test (in issues) - first few are cases of ff behaving incorrectly; syntax changes in trilib got to reaching i=1 ifetches
* added CP signals to track completions (/*verilator public*/) and now first isync fails (flushes to @04)

# Verilator Debug

##### Old Stuff

* install multiple versions concurrently

```
git pull
git checkout master
#..or...
#git checkout stable
#git checkout vxxx

unset VERILATOR_ROOT
export VERILATOR_VERSION=`git describe | sed "s/verilator_//"`
./configure --prefix /tools/verilator/$VERILATOR_VERSION
make -j <n>
make install
cp -r include /tools/verilator/$VERILATOR_VERSION   # had to do this too

# symlink
ln -sf /tools/verilator/$VERILATOR_VERSION /tools/verilator/latest
```

* pick and run...

```
export VERILATOR_ROOT=/tools/verilator/latest

# rm -r obj_dir   # to be safe?
verilator -cc --exe --trace --Mdir obj_dir --language 1364-2001 -Wno-fatal -Wno-LITENDIAN --error-limit 1  -Iverilog/a2o_litex -Iverilog/work -Iverilog/trilib_clk1x -Iverilog/trilib -Iverilog/unisims a2owb.v tb_litex.cpp

make -C obj_dir -f Va2owb.mk Va2owb
obj_dir/Va2owb
```

#### Try different versions with same RTL

* rtl and tb_litex.cpp

```
git log | head -1
commit 7cbbf9f3844a9287c5fac88867bcbcd5739914cf
```

* export VERILATOR_ROOT=/tools/verilator/v4.106
* #define OLD_PUBLIC in tb_litex.cpp

* the ifetch is bad, but so are the completes a little before it; @42C=```eratwe    r8,r0,0```

```
...

00000250 Completed: I0:1 000000000000042C
00000262 WB RD RA=00000460
00000263 WB RD ACK RA=00000460 DATA=7D4011A6
00000264 WB RD RA=00000464
00000265 WB RD ACK RA=00000464 DATA=7C8009A6
00000266 WB RD RA=00000468
00000267 WB RD ACK RA=00000468 DATA=7D0001A6
00000268 WB RD RA=0000046C
00000269 WB RD ACK RA=0000046C DATA=4C00012C
00000272 Completed: I0:1 0000000000000000 I1:1 0000000000000000
00000286 WB RD RA=00000000
*** Fetch to boot address (00000000) after initial boot! ***
```

* export VERILATOR_ROOT=/tools/verilator/v4.204

```
00000250 Completed: I0:1 000000000000042C
00000262 WB RD RA=00000460
00000263 WB RD ACK RA=00000460 DATA=7D4011A6
00000264 WB RD RA=00000464
00000265 WB RD ACK RA=00000464 DATA=7C8009A6
00000266 WB RD RA=00000468
00000267 WB RD ACK RA=00000468 DATA=7D0001A6
00000268 WB RD RA=0000046C
00000269 WB RD ACK RA=0000046C DATA=4C00012C
00000272 Completed: I0:1 0000000000000000 I1:1 0000000000000000
00000286 WB RD RA=00000000
*** Fetch to boot address (00000000) after initial boot! ***
```

* export VERILATOR_ROOT=/tools/verilator/stable  (v4.224-26-g8b7480806)

```
00000250 Completed: I0:1 000000000000042C
00000262 WB RD RA=00000460
00000263 WB RD ACK RA=00000460 DATA=7D4011A6
00000264 WB RD RA=00000464
00000265 WB RD ACK RA=00000464 DATA=7C8009A6
00000266 WB RD RA=00000468
00000267 WB RD ACK RA=00000468 DATA=7D0001A6
00000268 WB RD RA=0000046C
00000269 WB RD ACK RA=0000046C DATA=4C00012C
00000272 Completed: I0:1 0000000000000000 I1:1 0000000000000000
00000286 WB RD RA=00000000
*** Fetch to boot address (00000000) after initial boot! ***
```

* export VERILATOR_ROOT=/tools/verilator/latest  (v4.224-82-gcbe1b8e26)

```
%Error: Verilator internal fault, sorry. Suggest trying --debug --gdbbt
%Error: Command Failed /tools/verilator/latest/bin/verilator_bin -cc --exe --trace --Mdir obj_dir --language 1364-2001 -Wno-fatal -Wno-LITENDIAN --error-limit 1 -Iverilog/a2o_litex -Iverilog/work -I

verilator -cc --debug --gddbt--exe --trace --Mdir obj_dir --language 1364-2001 -Wno-fatal -Wno-LITENDIAN --error-limit 1  -Iverilog/a2o_litex -Iverilog/work -Iverilog/trilib_clk1x -Iverilog/trilib -Iverilog/unisims a2owb.v tb_litex.cpp  |& tee verilator-v224-82-debug.txt

```


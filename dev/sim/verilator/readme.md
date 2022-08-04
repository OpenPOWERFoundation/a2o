# Verilator

### core-only initial experiment - used to work

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


### core + node (extmem version) with cg disabled

* add inits for iucr0, xucr0, mmucr2 to disable controllable clk gating to verilog/clkgating

```
verilator -cc --exe --trace --Mdir obj_dir --language 1364-2001 -Wno-fatal -Wno-LITENDIAN --error-limit 1 -Iverilog/clkgating -Iverilog/work -Iverilog/trilib_clk1x -Iverilog/trilib -Iverilog/unisims -Iverilog/a2node a2owb.v tb_node.cpp

make -C obj_dir -f Va2owb.mk Va2owb
obj_dir/Va2owb

```

### core + node (extmem version) with cg disabled, test, etc. inputs tied in a2owb.v to optimize out

* verilog/a2onode_verilator

```
verilator -cc --exe --trace --Mdir obj_dir --language 1364-2001 -Wno-fatal -Wno-LITENDIAN --error-limit 1 -Iverilog/clkgating -Iverilog/work -Iverilog/trilib_clk1x -Iverilog/trilib -Iverilog/unisims -Iverilog/a2node_verilator a2owb.v tb_node.cpp

make -C obj_dir -f Va2owb.mk Va2owb
obj_dir/Va2owb

```

* nothing fixed it yet; comparing wave with coco, rv is issuing ops/itags in different order; renaming must be messed up because seems like the thread compare is using the r0 from the erat setup (1F) after the branch (getting nonzero compare and branching)

```
00000400 <boot_start>:
 400:	7c be 6a a6 	mfspr   r5,446
 404:	2c 25 00 00 	cmpdi   r5,0
 408:	40 82 00 e0 	bne     4e8 <init_t123>
 40c:	3c 60 8c 00 	lis     r3,-29696
 410:	38 00 00 1f 	li      r0,31
 414:	38 40 00 15 	li      r2,21
 418:	38 80 00 00 	li      r4,0
 41c:	39 00 02 3f 	li      r8,575
```

* doesn't occur with cocotb with normal credits or 1-only credit

* cleaned up many UNOPTFLATs

* go back to 'normal' (no clkgating disable); also enable BP since it was disabled from original test

```
verilator -cc --exe --trace --Mdir obj_dir --language 1364-2001 --timescale 1ns/1ns --report-unoptflat -Wno-fatal -Wno-PINMISSING -Wno-WIDTH -Wno-LITENDIAN --error-limit 1  -Iverilog/a2node_verilator -Iverilog/trilib_clk1x -Iverilog/trilib -Iverilog/unisims -Iverilog/work a2owb.v tb_node.cpp 2>&1 | tee verilator.txt

make -C obj_dir -f Va2owb.mk Va2owb
obj_dir/Va2owb

```

### core + node wb (litex)

* verilog/a2onode_litex

```
verilator -cc --exe --trace --Mdir obj_dir --language 1364-2001 -Wno-fatal -Wno-LITENDIAN --error-limit 1  -Iverilog/a2o_litex -Iverilog/work -Iverilog/trilib_clk1x -Iverilog/trilib -Iverilog/unisims a2owb.v tb_litex.cpp

make -C obj_dir -f Va2owb.mk Va2owb
obj_dir/Va2owb

```

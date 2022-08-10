# Verilator

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

### Verilator Debug

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
...

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

#### Try options (using stable)

* ```--clk clk_1x --clk clk_2x``` no change

* ```-O0``` didn't finish compiling

* all clk2x arrays rewritten - no change

* remove public from iuq0.iuq_cpl_top0.iuq_cpl0.iuq_cpl_ctrl.cp3_nia_q - advances farther

   * now making it to first store (stack) after jump to bios
   * an_ac_req_st_pop is active but lsq.an_ac_req_st_pop_q does not follow _d (tri_rlmlatch_p)
   * all the publics (nothing in lsq)
   ```
work/c.v:   wire [62-`EFF_IFAR_ARCH:61] cp_t0_flush_ifar /* verilator public */;
work/c.v:   wire [62-`EFF_IFAR_ARCH:61] 					cp_t1_flush_ifar /* verilator public */;
work/iuq_cpl.v:   wire [62-`EFF_IFAR_WIDTH:61]   cp2_i0_ifar /*verilator public*/;
work/iuq_cpl.v:   wire [62-`EFF_IFAR_WIDTH:61]   cp2_i1_ifar /*verilator public*/;
work/iuq_cpl.v:   wire                          cp2_i0_completed /*verilator public*/;
work/iuq_cpl.v:   wire                          cp2_i1_completed /*verilator public*/;
   ```

   * do_store === an_ac_req_st_pop; what is the 'if'? tholds, etc. (tri_plat)

   ```
   Va2owb_c__DepSet_hff80e8fd__0.cpp

   if ((1U & (~ ((IData)(vlSelf->__PVT__lq0__DOT__lsq__DOT__perv_1to0_reg__DOT__int_dout)
                      >> 7U)))) {
                        ...
            vlSelf->__PVT__lq0__DOT__lsq__DOT__an_ac_req_st_pop_reg__DOT__int_dout
                = vlSymsp->TOP__a2owb__n0.__PVT__do_store;
            vlSelf->__PVT__lq0__DOT__lsq__DOT__an_ac_req_ld_pop_reg__DOT__int_dout
                = vlSymsp->TOP__a2owb__n0.__PVT__rld_done;
   ```

   * lsq.perv_1to0_reg.int_dout[0:9]=0000011000; so 'if' should be ok, and it doesn't change and works for ld_pop a few cycles before

   * these are essentially identical and load is working
   ```
   tri_rlmlatch_p #(.INIT(0), .NEEDS_SRESET(1)) an_ac_req_ld_pop_reg(
      .vd(vdd),
      .gd(gnd),
      .nclk(nclk),
      .act(tiup),
      .force_t(func_slp_sl_force),
      .d_mode(d_mode_dc),
      .delay_lclkr(delay_lclkr_dc),
      .mpw1_b(mpw1_dc_b),
      .mpw2_b(mpw2_dc_b),
      .thold_b(func_slp_sl_thold_0_b),
      .sg(sg_0),
      .scin(siv[an_ac_req_ld_pop_offset]),
      .scout(sov[an_ac_req_ld_pop_offset]),
      .din(an_ac_req_ld_pop_d),
      .dout(an_ac_req_ld_pop_q)
   );


   tri_rlmlatch_p #(.INIT(0), .NEEDS_SRESET(1)) an_ac_req_st_pop_reg(
      .vd(vdd),
      .gd(gnd),
      .nclk(nclk),
      .act(tiup),
      .force_t(func_slp_sl_force),
      .d_mode(d_mode_dc),
      .delay_lclkr(delay_lclkr_dc),
      .mpw1_b(mpw1_dc_b),
      .mpw2_b(mpw2_dc_b),
      .thold_b(func_slp_sl_thold_0_b),
      .sg(sg_0),
      .scin(siv[an_ac_req_st_pop_offset]),
      .scout(sov[an_ac_req_st_pop_offset]),
      .din(an_ac_req_st_pop_d),
      .dout(an_ac_req_st_pop_q)
   );
   ```

   ```
grep "vlSymsp->TOP__a2owb__n0.__PVT__rld_done" obj_dir/*
obj_dir/Va2owb_c__DepSet_hff80e8fd__0.cpp:                = vlSymsp->TOP__a2owb__n0.__PVT__rld_done;
obj_dir/Va2owb__Trace__45.cpp:        bufp->chgBit(oldp+3713,(vlSymsp->TOP__a2owb__n0.__PVT__rld_done));
obj_dir/Va2owb__Trace__48.cpp:    } else if (((IData)(vlSymsp->TOP__a2owb__n0.__PVT__rld_done)
obj_dir/Va2owb__Trace__79__Slow.cpp:    bufp->fullBit(oldp+149084,(vlSymsp->TOP__a2owb__n0.__PVT__rld_done));
obj_dir/Va2owb__Trace__82__Slow.cpp:    } else if (((IData)(vlSymsp->TOP__a2owb__n0.__PVT__rld_done)

grep "vlSymsp->TOP__a2owb__n0.__PVT__do_store" obj_dir/*
obj_dir/Va2owb_c__DepSet_hff80e8fd__0.cpp:                = vlSymsp->TOP__a2owb__n0.__PVT__do_store;
obj_dir/Va2owb__Trace__38__Slow.cpp:    bufp->fullBit(oldp+23204,(vlSymsp->TOP__a2owb__n0.__PVT__do_store));
obj_dir/Va2owb__Trace__39__Slow.cpp:    } else if (vlSymsp->TOP__a2owb__n0.__PVT__do_store) {
obj_dir/Va2owb__Trace__48.cpp:                | (IData)(vlSymsp->TOP__a2owb__n0.__PVT__do_store))) {
obj_dir/Va2owb__Trace__4.cpp:        bufp->chgBit(oldp+3766,(vlSymsp->TOP__a2owb__n0.__PVT__do_store));
obj_dir/Va2owb__Trace__5.cpp:        } else if (vlSymsp->TOP__a2owb__n0.__PVT__do_store) {
obj_dir/Va2owb__Trace__82__Slow.cpp:                | (IData)(vlSymsp->TOP__a2owb__n0.__PVT__do_store))) {

   ```


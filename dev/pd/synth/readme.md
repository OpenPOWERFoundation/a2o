# Synthesis

```
yosys -s synth.yo &> yosys.txt
```

## Arrays

```
grep tri_1 verilog/work/*
verilog/work/fu_fpr.v:   tri_144x78_2r4w  fpr0(
verilog/work/fu_fpr.v:   tri_144x78_2r4w  fpr1(
verilog/work/iuq_ic_dir.v:   tri_128x34_4w_1r1w  idir(
verilog/work/mmq.v:         tri_128x168_1w_0  tlb_array0(
verilog/work/mmq.v:         tri_128x168_1w_0  tlb_array1(
verilog/work/mmq.v:         tri_128x168_1w_0  tlb_array2(
verilog/work/mmq.v:         tri_128x168_1w_0  tlb_array3(
verilog/work/mmq.v:         tri_128x16_1r1w_1  lru_array0(
verilog/work/rv.v:   tri_144x78_2r4w
verilog/work/xu_gpr.v:   tri_144x78_2r4w gpr0(
verilog/work/xu_gpr.v:   tri_144x78_2r4w gpr1(

grep tri_2 verilog/work/*
verilog/work/lq_data.v:   tri_256x144_8w_1r1w #(.addressable_ports(256), .addressbus_width(8), .port_bitwidth(144), .bit_write_type(9), .ways(8)) tridcarr(

grep tri_3 verilog/work/*
verilog/work/lq_pfetch.v:    tri_32x70_2w_1r1w  rpt(

grep tri_5 verilog/work/*
verilog/work/iuq_ic_dir.v:   tri_512x162_4w_0  idata(

grep tri_6 verilog/work/*
verilog/work/iuq_btb.v:      tri_64x72_1r1w  btb0(
verilog/work/lq_ctl.v:      tri_64x34_8w_1r1w #(.addressable_ports(64), .addressbus_width(6), .port_bitwidth(WAYDATASIZE), .ways(8)) arr(
verilog/work/lq_ldq_relq.v:      tri_64x144_1r1w  rdat(
verilog/work/lq_lsq.v:         tri_64x34_8w_1r1w #(.addressable_ports(64), .addressbus_width(6), .port_bitwidth(WAYDATASIZE), .ways(8)) arr(
verilog/work/xu_spr.v:   tri_64x72_1r1w xu_spr_aspr(

grep tri_bht verilog/work/*
verilog/work/iuq.v:   tri_bht_1024x8_1r1w bht0(
verilog/work/iuq.v:   tri_bht_1024x8_1r1w bht1(
verilog/work/iuq.v:   tri_bht_512x4_1r1w bht2(

grep tri_cam verilog/work/*
verilog/work/iuq_ic_ierat.v:   tri_cam_16x143_1r1w1c  ierat_cam(
verilog/work/lq_derat.v:   tri_cam_32x143_1r1w1c derat_cam(

grep tri_iuq verilog/work/*
verilog/work/iuq_cpl.v:   tri_iuq_cpl_arr #(.ADDRESSABLE_PORTS(64), .ADDRESSBUS_WIDTH(6), .PORT_BITWIDTH(entry_length), .LATCHED_READ(1'b1),                 .LATCHED_READ_DATA(1'b1), .LATCHED_WRITE(1'b1))
```

## By Unit

```
* XU (GPR, SPR)
verilog/work/xu_gpr.v:   tri_144x78_2r4w gpr0(
verilog/work/xu_gpr.v:   tri_144x78_2r4w gpr1(
verilog/work/xu_spr.v:   tri_64x72_1r1w xu_spr_aspr(

* FU (FPR)
verilog/work/fu_fpr.v:   tri_144x78_2r4w  fpr0(
verilog/work/fu_fpr.v:   tri_144x78_2r4w  fpr1(

* RV (LQ)
verilog/work/rv.v:   tri_144x78_2r4w

* IU (CPL, ERAT, DIR, DATA, BTB, BHT)
verilog/work/iuq_cpl.v:   tri_iuq_cpl_arr #(.ADDRESSABLE_PORTS(64), .ADDRESSBUS_WIDTH(6), .PORT_BITWIDTH(entry_length), .LATCHED_READ(1'b1),                 .LATCHED_READ_DATA(1'b1), .LATCHED_WRITE(1'b1))
verilog/work/iuq_ic_ierat.v:   tri_cam_16x143_1r1w1c  ierat_cam(
verilog/work/iuq_ic_dir.v:   tri_128x34_4w_1r1w  idir(
verilog/work/iuq_ic_dir.v:   tri_512x162_4w_0  idata(
verilog/work/iuq_btb.v:      tri_64x72_1r1w  btb0(
verilog/work/iuq.v:   tri_bht_1024x8_1r1w bht0(
verilog/work/iuq.v:   tri_bht_1024x8_1r1w bht1(
verilog/work/iuq.v:   tri_bht_512x4_1r1w bht2(

* LQ (ERAT, DIR, DATA. PFETCH, RLDQ, STQ)
verilog/work/lq_derat.v:   tri_cam_32x143_1r1w1c derat_cam(
verilog/work/lq_pfetch.v:    tri_32x70_2w_1r1w  rpt(
verilog/work/lq_data.v:   tri_256x144_8w_1r1w #(.addressable_ports(256), .addressbus_width(8), .port_bitwidth(144), .bit_write_type(9), .ways(8)) tridcarr(
verilog/work/lq_ctl.v:      tri_64x34_8w_1r1w #(.addressable_ports(64), .addressbus_width(6), .port_bitwidth(WAYDATASIZE), .ways(8)) arr(
verilog/work/lq_ldq_relq.v:      tri_64x144_1r1w  rdat(
verilog/work/lq_lsq.v:         tri_64x34_8w_1r1w #(.addressable_ports(64), .addressbus_width(6), .port_bitwidth(WAYDATASIZE), .ways(8)) arr(

* MMU (TLB)
verilog/work/mmq.v:         tri_128x168_1w_0  tlb_array0(
verilog/work/mmq.v:         tri_128x168_1w_0  tlb_array1(
verilog/work/mmq.v:         tri_128x168_1w_0  tlb_array2(
verilog/work/mmq.v:         tri_128x168_1w_0  tlb_array3(
verilog/work/mmq.v:         tri_128x16_1r1w_1  lru_array0(
```

## By Type

### Normal

```
* tri_144x78_2r4w
verilog/work/xu_gpr.v:   tri_144x78_2r4w gpr0(
verilog/work/xu_gpr.v:   tri_144x78_2r4w gpr1(
verilog/work/fu_fpr.v:   tri_144x78_2r4w  fpr0(
verilog/work/fu_fpr.v:   tri_144x78_2r4w  fpr1(
verilog/work/rv.v:   tri_144x78_2r4w

* tri_64x72_1r1w
verilog/work/xu_spr.v:   tri_64x72_1r1w xu_spr_aspr(
verilog/work/iuq_btb.v:      tri_64x72_1r1w  btb0(

* tri_512x162_4w_0
verilog/work/iuq_ic_dir.v:   tri_512x162_4w_0  idata(

* tri_32x70_2w_1r1w
verilog/work/lq_pfetch.v:    tri_32x70_2w_1r1w  rpt(

* tri_256x144_8w_1r1w
verilog/work/lq_data.v:   tri_256x144_8w_1r1w #(.addressable_ports(256), .addressbus_width(8), .port_bitwidth(144), .bit_write_type(9), .ways(8)) tridcarr(

* tri_128x34_4w_1r1w  
verilog/work/iuq_ic_dir.v:   tri_128x34_4w_1r1w  idir(

* tri_64x34_8w_1r1w
verilog/work/lq_ctl.v:      tri_64x34_8w_1r1w #(.addressable_ports(64), .addressbus_width(6), .port_bitwidth(WAYDATASIZE), .ways(8)) arr(
verilog/work/lq_lsq.v:         tri_64x34_8w_1r1w #(.addressable_ports(64), .addressbus_width(6), .port_bitwidth(WAYDATASIZE), .ways(8)) arr(

* tri_64x144_1r1w
verilog/work/lq_ldq_relq.v:      tri_64x144_1r1w  rdat(

* tri_128x168_1w_0
verilog/work/mmq.v:         tri_128x168_1w_0  tlb_array0(
verilog/work/mmq.v:         tri_128x168_1w_0  tlb_array1(
verilog/work/mmq.v:         tri_128x168_1w_0  tlb_array2(
verilog/work/mmq.v:         tri_128x168_1w_0  tlb_array3(

* tri_128x16_1r1w_1
verilog/work/mmq.v:         tri_128x16_1r1w_1  lru_array0(
```

### Complex

#### Branch History

```
* tri_bht_1024x8_1r1w
verilog/work/iuq.v:   tri_bht_1024x8_1r1w bht0(
verilog/work/iuq.v:   tri_bht_1024x8_1r1w bht1(
   * inner array:
   tri_512x16_1r1w_1  bht0(


* tri_bht_512x4_1r1w
verilog/work/iuq.v:   tri_bht_512x4_1r1w bht2(
   * inner array:
   tri_512x16_1r1w_1  bht0(
```

#### Completion

```
* tri_iuq_cpl_arr
verilog/work/iuq_cpl.v:   tri_iuq_cpl_arr #(.ADDRESSABLE_PORTS(64), .ADDRESSBUS_WIDTH(6), .PORT_BITWIDTH(entry_length), .LATCHED_READ(1'b1),                 .LATCHED_READ_DATA(1'b1), .LATCHED_WRITE(1'b1))
   * inner arrays (143)
   RAM64X1D #(.INIT(64'h0000000000000000)) RAM64X1D0(
   RAM64X1D #(.INIT(64'h0000000000000000)) RAM64X1D1(
   * =2x64x143
```

#### ERATs (CAM)

```
* tri_cam_16x143_1r1w1c
verilog/work/iuq_ic_ierat.v:   tri_cam_16x143_1r1w1c  ierat_cam(

* tri_cam_32x143_1r1w1c
verilog/work/lq_derat.v:   tri_cam_32x143_1r1w1c derat_cam(
```

## Summary

* the difficult arrays are the 2r4w (gpr, fpr, rv) and the cams; everything else is 1r1w

* cpl array is 1r1w (written in iu6, read in cp0), arranged even/odd for i0/i1; CPL_Q_DEPTH=32 means 32 even + 32 odd(?)

* some of these are directly changed with gen parameters; others may be do-able with some combo or parameters/spr settings/simple logic changes

   * GPR rename pool size
   * FPR rename pool size
   * completion queue depth
   * IERAT size
   * IC size
   * IC ways
   * BTB size
   * BHT size
   * DERAT size
   * DC size
   * DC ways
   * TLB size
   * TLB ways

* e.g. no xlate, small caches

   * IERAT, DERAT replaced with single-entry always-hit (no CAMs)
   * IC, DC 1W small data
   * no TLB
   * alter BTB, BHT, rename, completion as necessary
   * mmu logic (and fpu if not needed) could be dropped

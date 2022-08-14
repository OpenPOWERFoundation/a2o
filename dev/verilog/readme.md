# RTL

## fpga/sim arrays

* arrays that had 2x/4x clks

```
trilib/tri_144x78_2r4w.v
trilib/tri_64x72_1r1w.v
trilib/tri_cam_16x143_1r1w1c.v
trilib/tri_cam_32x143_1r1w1c.v
# these two should be checked with cycle counts, etc. vs originals - might not cause errors if wrong...
# at least one matches!
# BHT...test3: orig= [00014100] Passing IAR detected: 000007F0   new= [00014100] Passing IAR detected: 000007F0
# LRU won't be checked until doing TLB translates, and that logic will be rewritten for radix before that
trilib/tri_512x16_1r1w_1.v
trilib/tri_128x16_1r1w_1.v
```

* also got rid of reset_q usages (clk and reset in same nclk vector)
***i doubt reset is needed in any of the array components***

```
trilib/tri_128x16_1r1w_1.v:   reg                                            reset_q;
trilib/tri_512x16_1r1w_1.v:   reg                                            reset_q;
trilib/tri_64x72_1r1w.v:   reg                                 reset_q;
trilib/tri_cam_16x143_1r1w1c.v:   reg                           sreset_q;
trilib/tri_cam_32x143_1r1w1c.v:   reg                           sreset_q;
trilib/tri_iuq_cpl_arr.v:   reg                          reset_q;
```

### arrays using clk4x

* 4W was done with clk4x
* should be built for fpga with 4 arrays and a 'valid' array pointing to last write per entry

```
grep "nclk\[3\]" trilib/*
trilib/tri_144x78_2r4w.v:                  .WCLK(nclk[3]),                       // Port A write clock input : clk4x
```

### arrays using clk2x

```
grep "nclk\[2\]" trilib/*
trilib/tri_128x16_1r1w_1.v:     assign clk2x = nclk[2];
trilib/tri_128x16_1r1w_1.v:     always @(posedge nclk[2])
trilib/tri_144x78_2r4w.v:     assign wr_mux_ctrl = {nclk[0], nclk[2]};
trilib/tri_512x16_1r1w_1.v:     assign clk2x = nclk[2];
trilib/tri_64x72_1r1w.v:     assign clk2x = nclk[2];
trilib/tri_cam_16x143_1r1w1c.v:   assign clk2x = nclk[2];
trilib/tri_cam_16x143_1r1w1c.v:   always @(posedge nclk[2])
trilib/tri_cam_32x143_1r1w1c.v:   assign clk2x = nclk[2];
trilib/tri_cam_32x143_1r1w1c.v:   always @(posedge nclk[2])
```

* IERAT, DERAT (cams)

* BTB, SPR (1R,1W,read-before-write??)

   ```
   grep tri_64x72 work/*
   work/iuq_btb.v:      tri_64x72_1r1w  btb0(
   work/xu_spr.v:   tri_64x72_1r1w xu_spr_aspr(
   ```

* BHT (bitwrite)

   ```
   grep tri_512x16_1r1w_1 trilib/*
   trilib/tri_512x16_1r1w_1.v:module tri_512x16_1r1w_1(
   trilib/tri_bht_1024x8_1r1w.v:            tri_512x16_1r1w_1  bht0(
   trilib/tri_bht_512x4_1r1w.v:            tri_512x16_1r1w_1  bht0(
   ```

* MMU LRU (bitwrite)

   ```
   grep tri_128x16_1r1w_1 work/*
   work/mmq.v:         //tri.tri_128x16_1r1w_1 #(.`EXPAND_TYPE(`EXPAND_TYPE)) lru_array0(
   work/mmq.v:         tri_128x16_1r1w_1  lru_array0(
   ```

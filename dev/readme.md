# Testing RTL with new environments

## Working

* RTL

   * updated source to remove a bunch of Verilator warnings
   * updated source for compatibility with Icaraus -g2012
   * changed arrays to use clk1x
   * refactored nclk[] to separate clk, rst signals and removed lcb's from clock path

* Verilator

  * too big(?) to build with verilator --public_flat_rw with cocotb; but --private can override it; see if it finishes
  * executing boot code and tst with a2o_litex wrapper
  * executing boot code and tst with litex-gen'd SOC

* Icarus (w/cocotb)

   * executing boot code and tst with core/node/a2o_litex

* Yosys

   * finishes compile


## Next To Do

* create Cython code for sharing between cocotb and verilator tb
* OpenLane experiments with blackbox arrays and yosys/abc/sta
* create FPGA version of GPR/FPR (4R4W) using (4)4R1W banks and *valid* table
* parse vcd/fst and serve browser code for custom trace screens (handle spec/arch mapped facilities, arrays, etc.)

#### node

* test BE/LE versions; kernel can stay BE until jump to BIOS; any problem with BIOS to initial ROM copy/zero or is it always words?
* add L2 internally (before WB); or at least a store queue


# Testing RTL with new environments

##

* RTL

   * updated source to remove a bunch of Verilator warnings
   * updated source for compatibility with Icaraus -g2012
   * changed arrays to use clk1x
   * refactored nclk[] to separate clk, rst signals and removed lcb's from clock path
   
* Verilator

  * too big(?) to build with verilator --public with cocotb
  * executing boot code and tst with a2o_litex wrapper

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
* eventually node should handle reset vector fetch; or make the reset vector tied to inputs so always configurable?
* add config pins
* add L2 internally (before WB)


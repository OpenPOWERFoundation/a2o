# Testing RTL with new environments

##

* RTL

   * updated source to remove a bunch of Verilator warnings
   * updated source for compatibility with Icaraus -g2012
   * changed the GPR/FPR macro to remove need for clk4x on FPGA; was ugly and not working with either simulator

* Verilator

   * can IFETCH some ops in ST and SMT2 mode
   * can't get cocotb to build with Verilator (very long compile times)

* Icarus (w/cocotb)

   * executing boot code until test call with python A2L2 interface

* Yosys

   * finishes compile


## Next To Do

* create A2L2 cpp model that can be used by Verilator and cocotb (Cython wrapper)
   * eventually; don't need right now if can skip to RTL for A2L2

* create simple A2L2-WB RTL for easily connecting to Litex, etc.
   * version 1 is pre-WB; uses RAM interface which could be sim driver or BRAM

* create Litex core wrapper
* OpenLane experiments with blackbox arrays and yosys/abc/sta
* create FPGA version of GPR/FPR (4R4W) using (4)4R1W banks and *valid* table
* parse vcd/fst and serve browser code for custom trace screens (handle spec/arch mapped facilities, arrays, etc.)


#### node

* test BE/LE versions; kernel can stay BE until jump to BIOS; any problem with BIOS to initial ROM copy/zero or is it always words?
* eventually node should handle reset vector fetch; or make the reset vector tied to inputs so always configurable?
* add config pins
* add L2 internally (before WB)


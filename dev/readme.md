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
* create simple A2L2-WB RTL for easily connecting to Litex, etc.
* create Litex core wrapper
* OpenLane experiments with blackbox arrays and yosys/abc/sta
* create FPGA version of GPR/FPR (4R4W) using (4)4R1W banks and valid table
* parse vcd/fst and serve browser code for custom trace screens (handle spec/arch mapped facilities, arrays, etc.)

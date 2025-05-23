# a2o smt2 tb
# make -f Makefile.icarus build  # rebuild and sim and fst
# make -f Makefile.icarus run    # sim and fst
# make -f Makefile.icarus        # sim

SIM_BUILD ?= build_smt
SIM ?= icarus

# options
#COCOTB_HDL_TIMEUNIT ?= 1ns
#COCOTB_HDL_TIMEPRECISION ?= 1ps
#COCOTB_RESOLVE_X = VALUE_ERROR # ZEROS ONES RANDOM

# icarus
#
# includes are needed for *.vh
# unisims is for FPGA RAMs
# coco forces -g2012 for some reason, and appends it after COMPILE_ARGS below! issue #781

VERILOG_ROOT = ../../verilog

COMPILE_ARGS = -I$(VERILOG_ROOT)/smt -I$(VERILOG_ROOT)/trilib -I$(VERILOG_ROOT)/work -y$(VERILOG_ROOT)/unisims -y$(VERILOG_ROOT)/trilib -y$(VERILOG_ROOT)/work

# other options

# rtl
TOPLEVEL_LANG = verilog
# top-level to enable trace, etc.
VERILOG_SOURCES = ./cocotb_icarus.v
TOPLEVEL = cocotb_icarus

# python test
MODULE = tb
TESTCASE = tb_smt

# cocotb make rules
include $(shell cocotb-config --makefiles)/Makefile.sim

build: clean sim fst

run: sim fst

fst:
	vcd2fst a2ocore.vcd a2ocore_smt.fst
	rm a2ocore.vcd

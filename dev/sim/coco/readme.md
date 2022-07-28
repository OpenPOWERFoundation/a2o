# Cocotb Sim Experiments

## Core-only version with partial implementation of Python A2L2 interface

* testbench provides memory using A2 core-L2 interface

```
make -f Makefile.st build |& grep -v Anac
```

## Core+wrapper version with partial implementation of A2Node

* testbench provides memory using simple RAM interface

```
make -f Makefile.node build |& grep -v Anac
```

## Core+wrapper version with implementation of A2Node (Wishbone system bus)

* testbench provides Wishbone interface
* can be easily dropped into Litex, etc. for Verilator and FPGA
* can add L2 mem
* can add multiple core intefaces (SMP)
* can add multicore+heterogeneous cores (mixed A2L2, WB-1, WB-2)

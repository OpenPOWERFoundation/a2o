# Cocotb Sim Experiments

## Core-only version with partial implementation of Python A2L2 interface

* testbench provides memory using A2 core-L2 interface

```
make -f Makefile.st build |& grep -v Anac
```

## Core+wrapper version with partial implementation of A2Node (direct memory)

* testbench provides memory using simple RAM interface

```
make -f Makefile.node build |& grep -v Anac
```

## Core+wrapper version with implementation of A2Node (Wishbone system bus)

* testbench provides 4B Wishbone memory interface (using cocoext-wishbone for now)

```
make -f Makefile.wb build |& grep -v Anac
```


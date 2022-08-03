# Build Targets

## Litex

#### Core and wishbone wrapper with extra stuff for Litex integration

* create a2o/core.py and a2o.py (SOC) from a2p
* makes it through vivado compile
* cleaned up some various minor rtl warnings
* added parm to cmod7 platform to allow replacing the target fpga device; trying arty-200 to see if it fits as-is - no, but can override?

```
ERROR: [DRC UTLZ-1] Resource utilization: Slice LUTs over-utilized in Top Level Design (This design requires more Slice LUTs cells than are available in the target device. This design requires 212846 of such cell types but only 134600 compatible sites are available in the target device. Please analyze your synthesis results and constraints to ensure the design is mapped to Xilinx primitives as expected. If so, please consider targeting a larger device. Please set tcl parameter "drc.disableLUTOverUtilError" to 1 to change this error to warning.)
```

* try adding ```set drc.disableLUTOverUtilError 1``` to build script and running...
```
cd build/cmod7/gateware
vivado -mode tcl -source cmod7.tcl
```

* doesn't change results
* try in gui:
```
set_property SEVERITY WARNING [get_drc_checks {DRC UTLZ-1}]
WARNING: [Vivado 12-4383] DRC UTLZ-1 may not change severity
```
* do get the synth util report; iu=25% lq=28% xu=12% rv=16% fu=9% mmu=8%

```
+-----------------------------------------+--------------------------------------------+------------+------------+---------+------+-------+--------+--------+------------+
|   Instance                              |                   Module                   | Total LUTs | Logic LUTs | LUTRAMs | SRLs |  FFs  | RAMB36 | RAMB18 | DSP Blocks |
+-----------------------------------------+--------------------------------------------+------------+------------+---------+------+-------+--------+--------+------------+
| cmod7                                   |                                      (top) |     212875 |     210949 |    1924 |    2 | 83329 |    116 |     13 |          0 |
|   (cmod7)                               |                                      (top) |        162 |        146 |      16 |    0 |   312 |     20 |      1 |          0 |
|   a2owb                                 |                                      a2owb |     212713 |     210803 |    1908 |    2 | 83017 |     96 |     12 |          0 |
|     c0                                  |                                          c |     212222 |     210312 |    1908 |    2 | 82296 |     96 |     12 |          0 |
|       fupc                              |                                    c_fu_pc |      20918 |      20317 |     600 |    1 |  7726 |      0 |      0 |          0 |
|       iuq0                              |                                        iuq |      54334 |      53794 |     540 |    0 | 19339 |     25 |      6 |          0 |
|       lq0                               |                                         lq |      60745 |      60744 |       0 |    1 | 26090 |     49 |      6
|       mmu0                              |                                        mmq |      16032 |      16032 |       0 |    0 |  8151 |     21 |
|       rv0                               |                                         rv |      34548 |      34292 |     256 |    0 |  9989 |      0 |      0 |          0 |
|       xu0                               |                                         xu |      25469 |      24957 |     512 |    0 | 10997 |      1 |
|     n0                                  |                                     a2l2wb |        491 |        491 |       0 |    0 |   721 |      0 |      0 |          0 |
+-----------------------------------------+--------------------------------------------+------------+------------+---------+------+-------+--------+--------+------------+

```

* errors to check in source: a lot of critical warnings are vdd vs VCC and gnd vs GND; are these inouts and ties missing?



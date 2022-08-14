# RTL Notes

### set up ERAT autoload at reset

* iuq_ic_ierat and lq_derat, bcfg_q (2 entries I & D)

```
   //------------------------------------------------
   // scan only latches for boot config
   //------------------------------------------------

   //     epn                                                                  rpn                                   u0:3 E
   //         0                                    31 32                    51 52 54     61 62                    81     86
   //         0                                    31 32                    51 22 24     31 32                    51
   //init => "0000_0000_0000_0000_0000_0000_0000_0000_1111_1111_1111_1111_1111_11_1111_1111_1111_1111_1111_1111_1111_0000_0",

```

### special rings

* tri_slat_scan's seem to be the comps used for core config and boot config

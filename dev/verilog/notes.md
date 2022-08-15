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

### reg bits

* erat-only

   * These two modes are termed “MMU mode” and “ERAT-only mode”. This mode controlled by the CCR2[NOTLB] bit.

   * mmu may be configurable to table-walk but not have a TLB(?) This would allow the erats and htw to be changed for radix before implementing
     the TLB logic.


### translation

* ERAT holes (UM 6.2.3)

The rules for configuring an exclusion range “hole” for a given TLB entry and placing one or more pages
within the “hole” are as follows:

1. Only TLB entries with page sizes greater than 4 KB can have an exclusion range hole enabled via X = 1.
2. A virtual address to be translated that falls within the hole will not match this TLB entry.
3. The size of the hole configured must be smaller than the page size of this TLB entry.
4. The size of the hole is configurable to 2 n  4 KB, where n = 0 to log 2 (entry size in bytes) - 13.
5. The legal binary values of the unused EPN bits of a given TLB entry are contained in the set defined by
2 n - 1, where n = 0 to log 2 (entry size in bytes) - 13.
6. Other TLB entries of valid page sizes (less than or equal to the hole size) can be mapped into the hole.
7. Multiple other TLB entries can be mapped into the hole simultaneously.
8. Not all of the address space defined by the hole needs to be mapped by other entries.
9. Pages mapped in the hole must be page-size aligned.
10. Pages mapped in the hole must not overlap.
11. Pages mapped in the hole must be collectively fully contained within the hole.

* Page sizes

* UM 6.17.3 says

> Supported values of the PS field for this implementation include:
0b0010 (4 KB for sub-page size of 4 KB only), 0b0110 (64 KB), 0b1010 (1 MB), and
0b1110 (16 MB).

   Is this correct?  No 1G size? The logic (iuq_ic_ierat) says:

```
   parameter [0:2]                   CAM_PgSize_1GB  = 3'b110;
   parameter [0:2]                   CAM_PgSize_16MB = 3'b111;
   parameter [0:2]                   CAM_PgSize_1MB  = 3'b101;
   parameter [0:2]                   CAM_PgSize_64KB = 3'b011;
   parameter [0:2]                   CAM_PgSize_4KB  = 3'b001;
```

* UM also says:

>Variable page sizes for direct (IND=0) entries (4KB, 64KB, 1MB, 16MB, 1GB), simultaneously resi-
dent in TLB and/or ERAT, and indirect (IND=1) entries (1 MB and 256 MB) in TLB

>The MMU divides the address space into pages. Five direct (IND=0) page sizes (4KB, 64KB, 1MB, 16MB,
1GB) are simultaneously supported,

### implementing radix

Possible:

1. toss all of MMU and rewrite using MMU interface; update ERAT entries as necessary
2. keep everything and change HTW/TLB for radix (plus ERATs)
3. do in steps; get ERATS+HTW working and then add TLB logic

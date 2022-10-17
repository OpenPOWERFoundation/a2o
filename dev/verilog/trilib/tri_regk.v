// © IBM Corp. 2020
// Licensed under the Apache License, Version 2.0 (the "License"), as modified by
// the terms below; you may not use the files in this repository except in
// compliance with the License as modified.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
//
// Modified Terms:
//
//    1) For the purpose of the patent license granted to you in Section 3 of the
//    License, the "Work" hereby includes implementations of the work of authorship
//    in physical form.
//
//    2) Notwithstanding any terms to the contrary in the License, any licenses
//    necessary for implementation of the Work that are available from OpenPOWER
//    via the Power ISA End User License Agreement (EULA) are explicitly excluded
//    hereunder, and may be obtained from OpenPOWER under the terms and conditions
//    of the EULA.
//
// Unless required by applicable law or agreed to in writing, the reference design
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License
// for the specific language governing permissions and limitations under the License.
//
// Additional rights, including the ability to physically implement a softcore that
// is compliant with the required sections of the Power ISA Specification, are
// available at no cost under the terms of the OpenPOWER Power ISA EULA, which can be
// obtained (along with the Power ISA) here: https://openpowerfoundation.org.

`timescale 1 ns / 1 ns

// *!****************************************************************
// *! FILENAME    : tri_regk.v
// *! DESCRIPTION : Multi-bit non-scannable latch, LCB included
// *!****************************************************************

`include "tri_a2o.vh"

module tri_regk (
   vd,
   gd,
   clk,
   rst,
   act,
   force_t,
   thold_b,
   d_mode,
   sg,
   delay_lclkr,
   mpw1_b,
   mpw2_b,
   scin,
   din,
   scout,
   dout
);
   parameter                      WIDTH = 4;
   parameter                      OFFSET = 0;		//starting bit
   parameter                      INIT = 0;		// will be converted to the least signficant
                                                        // 31 bits of init_v
   parameter                      SYNTHCLONEDLATCH = "";
   parameter                      NEEDS_SRESET = 1;		// for inferred latches
   parameter                      DOMAIN_CROSSING = 0;

   inout                          vd;
   inout                          gd;
   input                          clk;
   input                          rst;
   input                          act;                  // 1: functional, 0: no clock
   input                          force_t;		// 1: force LCB active
   input                          thold_b;		// 1: functional, 0: no clock
   input                          d_mode;		// 1: disable pulse mode, 0: pulse mode
   input                          sg;                   // 0: functional, 1: scan
   input                          delay_lclkr;		// 0: functional
   input                          mpw1_b;		// pulse width control bit
   input                          mpw2_b;		// pulse width control bit
   input [OFFSET:OFFSET+WIDTH-1]  scin;                 // scan in
   input [OFFSET:OFFSET+WIDTH-1]  din;                  // data in
   output [OFFSET:OFFSET+WIDTH-1] scout;
   output [OFFSET:OFFSET+WIDTH-1] dout;

   parameter [0:WIDTH-1]          init_v = INIT;

   generate

     wire                         sreset;
     reg [0:WIDTH-1]              int_dout;
       (* analysis_not_referenced="true" *)
     wire                         unused;

     assign sreset = (NEEDS_SRESET == 1) ? rst : 0;

     always @(posedge clk) begin: l
       if (sreset)
         int_dout <= init_v;
       else if (act & thold_b)
         int_dout <= din;
     end

     assign dout = int_dout;

     assign scout = {WIDTH{1'b0}};

     assign unused = | {d_mode, sg, delay_lclkr, mpw1_b, mpw2_b, scin};

   endgenerate

endmodule

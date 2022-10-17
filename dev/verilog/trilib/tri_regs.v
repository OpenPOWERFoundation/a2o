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
// *! FILENAME    : tri_regs.v
// *! DESCRIPTION : Multi-bit scan-only latch, LCB included
// *!****************************************************************

`include "tri_a2o.vh"

module tri_regs (
   vd,
   gd,
   clk,
   rst,
   force_t,
   thold_b,
   delay_lclkr,
   scin,
   scout,
   dout
);
   parameter                      WIDTH = 4;
   parameter                      OFFSET = 0;		//starting bit
   parameter                      INIT = 0;		// will be converted to the least signficant
                                                        // 31 bits of init_v
   parameter                      IBUF = 1'b0;		//inverted latch IOs, if set to true.
   parameter                      DUALSCAN = "";		// if "S", marks data ports as scan for Moebius
   parameter                      NEEDS_SRESET = 1;		// for inferred latches
   parameter                      DOMAIN_CROSSING = 0;

   inout                          vd;
   inout                          gd;
   input                          clk;
   input                          rst;
   input                          force_t;		// 1: force LCB active
   input                          thold_b;		// 1: functional, 0: no clock
   input                          delay_lclkr;		// 0: functional
   input [OFFSET:OFFSET+WIDTH-1]  scin;		// scan in
   output [OFFSET:OFFSET+WIDTH-1] scout;
   output [OFFSET:OFFSET+WIDTH-1] dout;

   parameter [0:WIDTH-1]          init_v = INIT;

   generate
      wire                        sreset;
      reg [0:WIDTH-1]             int_dout;
       (* analysis_not_referenced="true" *)
      wire                        unused;

      assign sreset = (NEEDS_SRESET == 1) ? rst : 0;

      always @(posedge clk) begin: l
         if (sreset)
            int_dout <= init_v;
      end

      assign dout = (IBUF == 1'b1) ? ~int_dout : int_dout;

      assign scout = {WIDTH{1'b0}};

      assign unused = | {delay_lclkr, scin};

   endgenerate

endmodule

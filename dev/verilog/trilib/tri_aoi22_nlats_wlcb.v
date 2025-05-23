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
// *! FILENAME    : tri_aoi22_nlats_wlcb.v
// *! DESCRIPTION : Multi-bit aoi22-latch, LCB included
// *!
// *!****************************************************************

`include "tri_a2o.vh"

module tri_aoi22_nlats_wlcb (
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
   scout,
   a1,
   a2,
   b1,
   b2,
   qb
);

   parameter                      WIDTH = 4;
   parameter                      OFFSET = 0;		//starting bit
   parameter                      INIT = 0;		// will be converted to the least signficant
                                                        // 31 bits of init_v
   parameter                      IBUF = 1'b0;		//inverted latch IOs, if set to true.
   parameter                      DUALSCAN = "";		// if "S", marks data ports as scan for Moebius
   parameter                      NEEDS_SRESET = 1;		// for inferred latches
   parameter                      L2_LATCH_TYPE = 2;            //L2_LATCH_TYPE = slave_latch;
                                                                //0=master_latch,1=L1,2=slave_latch,3=L2,4=flush_latch,5=L4
   parameter                      SYNTHCLONEDLATCH = "";
   parameter                      BTR = "NLL0001_X2_A12TH";

   inout                          vd;
   inout                          gd;
   input                          clk;
   input                          rst;
   input                          act;		// 1: functional, 0: no clock
   input                          force_t;		// 1: force LCB active
   input                          thold_b;		// 1: functional, 0: no clock
   input                          d_mode;		// 1: disable pulse mode, 0: pulse mode
   input                          sg;		// 0: functional, 1: scan
   input                          delay_lclkr;		// 0: functional
   input                          mpw1_b;		// pulse width control bit
   input                          mpw2_b;		// pulse width control bit
   input [OFFSET:OFFSET+WIDTH-1]  scin;		// scan in
   output [OFFSET:OFFSET+WIDTH-1] scout;
   input [OFFSET:OFFSET+WIDTH-1]  a1;
   input [OFFSET:OFFSET+WIDTH-1]  a2;
   input [OFFSET:OFFSET+WIDTH-1]  b1;
   input [OFFSET:OFFSET+WIDTH-1]  b2;
   output [OFFSET:OFFSET+WIDTH-1] qb;

   // tri_aoi22_nlats_wlcb

   parameter [0:WIDTH-1]          init_v = INIT;
   parameter [0:WIDTH-1]          ZEROS = {WIDTH{1'b0}};

   generate
      wire                        sreset;
      wire [0:WIDTH-1]            int_din;
      wire [0:WIDTH-1]            din;
      reg [0:WIDTH-1]             int_dout;
      wire [0:WIDTH-1]            vact;
      wire [0:WIDTH-1]            vact_b;
      wire [0:WIDTH-1]            vsreset;
      wire [0:WIDTH-1]            vsreset_b;
      wire [0:WIDTH-1]            vthold;
      wire [0:WIDTH-1]            vthold_b;
       (* analysis_not_referenced="true" *)
      wire                        unused;

      if (NEEDS_SRESET == 1) begin
         assign sreset = rst;
      end else begin
         assign sreset = 1'b0;
      end

      assign vsreset = {WIDTH{sreset}};
      assign vsreset_b = {WIDTH{~sreset}};

      assign din = (a1 & a2) | (b1 & b2);		// Output is inverted, so just AND-OR here
      assign int_din = (vsreset_b & din) | (vsreset & init_v);

      assign vact = {WIDTH{act | force_t}};
      assign vact_b = {WIDTH{~(act | force_t)}};

      assign vthold_b = {WIDTH{thold_b}};
      assign vthold = {WIDTH{~thold_b}};

      always @(posedge clk) begin: l
        //int_dout <= (((vact & vthold_b) | vsreset) & int_din) | (((vact_b | vthold) & vsreset_b) & int_dout);
        if (sreset)
          int_dout <= int_din;
        else if ((act | force_t) & thold_b)
          int_dout <= int_din;
      end

      assign qb = (~int_dout);

      assign scout = ZEROS;

      assign unused = d_mode | sg | delay_lclkr | mpw1_b | mpw2_b | scin;
   endgenerate
endmodule

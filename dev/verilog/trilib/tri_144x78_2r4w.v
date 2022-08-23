// © IBM Corp. 2022
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

//*****************************************************************************
//  Description:  Tri-Lam Array Wrapper
//
//*****************************************************************************

// sim version, clk1x

`include "tri_a2o.vh"

module tri_144x78_2r4w (
   // Inputs
   // Power
   inout                    vdd,
   inout                    gnd,
   // Clock & Scan
   input                    clk,
   input                    rst,

   //-------------------------------------------------------------------
   // Pervasive
   //-------------------------------------------------------------------
   input                    delay_lclkr_dc,
   input                    mpw1_dc_b,
   input                    mpw2_dc_b,
   input                    func_sl_force,
   input                    func_sl_thold_0_b,
   input                    func_slp_sl_force,
   input                    func_slp_sl_thold_0_b,
   input                    sg_0,
   input                    scan_in,
   output                   scan_out,

   //-------------------------------------------------------------------
   // Read Port
   //-------------------------------------------------------------------
   input                     r_late_en_1,
   input [0:`GPR_POOL_ENC+`THREADS_POOL_ENC-1] r_addr_in_1,
   output [64-`GPR_WIDTH:77] r_data_out_1,
   input                     r_late_en_2,
   input [0:`GPR_POOL_ENC+`THREADS_POOL_ENC-1] r_addr_in_2,
   output [64-`GPR_WIDTH:77] r_data_out_2,

   //-------------------------------------------------------------------
   // Write Port
   //-------------------------------------------------------------------
   input                     w_late_en_1,
   input [0:`GPR_POOL_ENC+`THREADS_POOL_ENC-1] w_addr_in_1,
   input [64-`GPR_WIDTH:77]  w_data_in_1,
   input                     w_late_en_2,
   input [0:`GPR_POOL_ENC+`THREADS_POOL_ENC-1] w_addr_in_2,
   input [64-`GPR_WIDTH:77]  w_data_in_2,
   input                     w_late_en_3,
   input [0:`GPR_POOL_ENC+`THREADS_POOL_ENC-1] w_addr_in_3,
   input [64-`GPR_WIDTH:77]  w_data_in_3,
   input                     w_late_en_4,
   input [0:`GPR_POOL_ENC+`THREADS_POOL_ENC-1] w_addr_in_4,
   input [64-`GPR_WIDTH:77]  w_data_in_4
);

   wire unused;

   // sim array
   reg   [64-`GPR_WIDTH:77]   mem[0:143] /*verilator public*/;

   reg   [0:`GPR_POOL_ENC+`THREADS_POOL_ENC-1]  r1a_q;
   wire  [0:`GPR_POOL_ENC+`THREADS_POOL_ENC-1]  r1a_d;
   reg   [0:`GPR_POOL_ENC+`THREADS_POOL_ENC-1]  r2a_q;
   wire  [0:`GPR_POOL_ENC+`THREADS_POOL_ENC-1]  r2a_d;

   reg   [64-`GPR_WIDTH:77]   r1d_q;
   wire  [64-`GPR_WIDTH:77]   r1d_d;
   reg   [64-`GPR_WIDTH:77]   r2d_q;
   wire  [64-`GPR_WIDTH:77]   r2d_d;

   integer i;
   initial begin
      for (i = 0; i < 144; i = i + 1)
         mem[i] = 0;
   end

   //wtf:icarus $dumpvars cannot dump a vpiMemory
   generate
       genvar j;
       for (j = 0; j < 144; j=j+1) begin: loc
   //assign w0d_int[64 - `GPR_WIDTH:65 + `GPR_WIDTH/8] = w0d;  there are 2 extra bits of 0 on end
   //assign w0d_int[66 + `GPR_WIDTH/8:77] = {4{1'b0}};
          wire [64-`GPR_WIDTH:63] dat;
          wire [0:7] par;
          assign dat = mem[j][64-`GPR_WIDTH:63];
          assign par = mem[j][64:63 + `GPR_WIDTH/8];
       end
   endgenerate

   assign r1a_d = r_addr_in_1;
   assign r2a_d = r_addr_in_2;

   always @(posedge clk) begin

      r1a_q <= r1a_d;
      r2a_q <= r2a_d;

      r1d_q <= r1d_d;
      r2d_q <= r2d_d;

      if (w_late_en_1) begin
         mem[w_addr_in_1] <= w_data_in_1;
      end
      if (w_late_en_2) begin
         mem[w_addr_in_2] <= w_data_in_2;
      end
      if (w_late_en_3) begin
         mem[w_addr_in_3] <= w_data_in_3;
      end
      if (w_late_en_4) begin
         mem[w_addr_in_4] <= w_data_in_4;
      end

   end

   // r_late_en_x are unused in original also
   assign r1d_d = mem[r1a_q];
   assign r2d_d = mem[r2a_q];

   assign r_data_out_1 = r1d_q;
   assign r_data_out_2 = r2d_q;

   assign unused = | {func_slp_sl_force, func_slp_sl_thold_0_b};

endmodule

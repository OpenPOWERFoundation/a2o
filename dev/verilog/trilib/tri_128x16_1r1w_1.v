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
//  Description:  Tri Array Wrapper
//
//*****************************************************************************

// sim version, clk1x

`include "tri_a2o.vh"

module tri_128x16_1r1w_1 (
   vdd,
   vcs,
   gnd,
   clk,
   rst,
   rd_act,
   wr_act,
   lcb_d_mode_dc,
   lcb_clkoff_dc_b,
   lcb_mpw1_dc_b,
   lcb_mpw2_dc_b,
   lcb_delay_lclkr_dc,
   ccflush_dc,
   scan_dis_dc_b,
   scan_diag_dc,
   func_scan_in,
   func_scan_out,
   lcb_sg_0,
   lcb_sl_thold_0_b,
   lcb_time_sl_thold_0,
   lcb_abst_sl_thold_0,
   lcb_ary_nsl_thold_0,
   lcb_repr_sl_thold_0,
   time_scan_in,
   time_scan_out,
   abst_scan_in,
   abst_scan_out,
   repr_scan_in,
   repr_scan_out,
   abist_di,
   abist_bw_odd,
   abist_bw_even,
   abist_wr_adr,
   wr_abst_act,
   abist_rd0_adr,
   rd0_abst_act,
   tc_lbist_ary_wrt_thru_dc,
   abist_ena_1,
   abist_g8t_rd0_comp_ena,
   abist_raw_dc_b,
   obs0_abist_cmp,
   lcb_bolt_sl_thold_0,
   pc_bo_enable_2,
   pc_bo_reset,
   pc_bo_unload,
   pc_bo_repair,
   pc_bo_shdata,
   pc_bo_select,
   bo_pc_failout,
   bo_pc_diagloop,
   tri_lcb_mpw1_dc_b,
   tri_lcb_mpw2_dc_b,
   tri_lcb_delay_lclkr_dc,
   tri_lcb_clkoff_dc_b,
   tri_lcb_act_dis_dc,
   bw,
   wr_adr,
   rd_adr,
   di,
   dout
);
   parameter                                      addressable_ports = 128;	// number of addressable register in this array
   parameter                                      addressbus_width = 7;		// width of the bus to address all ports (2^addressbus_width >= addressable_ports)
   parameter                                      port_bitwidth = 16;		// bitwidth of ports
   parameter                                      ways = 1;                     // number of ways

   // POWER PINS
   inout                                          vdd;
   inout                                          vcs;
   inout                                          gnd;

   input                                          clk;
   input                                          rst;

   input                                          rd_act;
   input                                          wr_act;

   // DC TEST PINS
   input                                          lcb_d_mode_dc;
   input                                          lcb_clkoff_dc_b;
   input [0:4]                                    lcb_mpw1_dc_b;
   input                                          lcb_mpw2_dc_b;
   input [0:4]                                    lcb_delay_lclkr_dc;

   input                                          ccflush_dc;
   input                                          scan_dis_dc_b;
   input                                          scan_diag_dc;
   input                                          func_scan_in;
   output                                         func_scan_out;

   input                                          lcb_sg_0;
   input                                          lcb_sl_thold_0_b;
   input                                          lcb_time_sl_thold_0;
   input                                          lcb_abst_sl_thold_0;
   input                                          lcb_ary_nsl_thold_0;
   input                                          lcb_repr_sl_thold_0;
   input                                          time_scan_in;
   output                                         time_scan_out;
   input                                          abst_scan_in;
   output                                         abst_scan_out;
   input                                          repr_scan_in;
   output                                         repr_scan_out;

   input [0:3]                                    abist_di;
   input                                          abist_bw_odd;
   input                                          abist_bw_even;
   input [0:6]                                    abist_wr_adr;
   input                                          wr_abst_act;
   input [0:6]                                    abist_rd0_adr;
   input                                          rd0_abst_act;
   input                                          tc_lbist_ary_wrt_thru_dc;
   input                                          abist_ena_1;
   input                                          abist_g8t_rd0_comp_ena;
   input                                          abist_raw_dc_b;
   input [0:3]                                    obs0_abist_cmp;

   // BOLT-ON
   input                                          lcb_bolt_sl_thold_0;
   input                                          pc_bo_enable_2;	// general bolt-on enable
   input                                          pc_bo_reset;		// reset
   input                                          pc_bo_unload;		// unload sticky bits
   input                                          pc_bo_repair;		// execute sticky bit decode
   input                                          pc_bo_shdata;		// shift data for timing write and diag loop
   input                                          pc_bo_select;		// select for mask and hier writes
   output                                         bo_pc_failout;	// fail/no-fix reg
   output                                         bo_pc_diagloop;
   input                                          tri_lcb_mpw1_dc_b;
   input                                          tri_lcb_mpw2_dc_b;
   input                                          tri_lcb_delay_lclkr_dc;
   input                                          tri_lcb_clkoff_dc_b;
   input                                          tri_lcb_act_dis_dc;

   input [0:15]                                   bw;
   input [0:6]                                    wr_adr;
   input [0:6]                                    rd_adr;
   input [0:15]                                   di;

   output [0:15]                                  dout;

   // tri_128x16_1r1w_1

   // Configuration Statement for NCsim
   //for all:ramb16_s36_s36 use entity unisim.RAMB16_S36_S36;

   wire                                           clk;
   wire [0:8]                                     b0addra;
   wire [0:8]                                     b0addrb;
   wire                                           wea;
   wire                                           web;
   wire                                           wren_a;
   wire [0:15]                                    w_data_in_0;
   wire [0:15]                                    r_data_out_0_bram;

   // Latches
   reg [0:15]                                     r_data_out_1_q;


   (* analysis_not_referenced="true" *)
   wire                                           unused;

  // sim array
   reg   [0:15]                  mem[0:127];

   integer i;
   initial begin
      for (i = 0; i < 128; i = i + 1)
         mem[i] = 0;
   end

   //wtf:icarus $dumpvars cannot dump a vpiMemory
   generate
       genvar j;
       for (j = 0; j < 128; j=j+1) begin: loc
          wire [0:15] dat;
          assign dat = mem[j][0:15];
       end
   endgenerate

     assign b0addra[2:8] = wr_adr;
     assign b0addrb[2:8] = rd_adr;

     // Unused Address Bits
     assign b0addra[0:1] = 2'b00;
     assign b0addrb[0:1] = 2'b00;

     // port a is a read-modify-write port
     assign wren_a = (bw != 0) & wr_act;
     assign wea = wren_a;
     assign web = 1'b0;
     assign w_data_in_0[0]  = bw[0]  ? di[0]  : r_data_out_0_bram[0];
     assign w_data_in_0[1]  = bw[1]  ? di[1]  : r_data_out_0_bram[1];
     assign w_data_in_0[2]  = bw[2]  ? di[2]  : r_data_out_0_bram[2];
     assign w_data_in_0[3]  = bw[3]  ? di[3]  : r_data_out_0_bram[3];
     assign w_data_in_0[4]  = bw[4]  ? di[4]  : r_data_out_0_bram[4];
     assign w_data_in_0[5]  = bw[5]  ? di[5]  : r_data_out_0_bram[5];
     assign w_data_in_0[6]  = bw[6]  ? di[6]  : r_data_out_0_bram[6];
     assign w_data_in_0[7]  = bw[7]  ? di[7]  : r_data_out_0_bram[7];
     assign w_data_in_0[8]  = bw[8]  ? di[8]  : r_data_out_0_bram[8];
     assign w_data_in_0[9]  = bw[9]  ? di[9]  : r_data_out_0_bram[9];
     assign w_data_in_0[10] = bw[10] ? di[10] : r_data_out_0_bram[10];
     assign w_data_in_0[11] = bw[11] ? di[11] : r_data_out_0_bram[11];
     assign w_data_in_0[12] = bw[12] ? di[12] : r_data_out_0_bram[12];
     assign w_data_in_0[13] = bw[13] ? di[13] : r_data_out_0_bram[13];
     assign w_data_in_0[14] = bw[14] ? di[14] : r_data_out_0_bram[14];
     assign w_data_in_0[15] = bw[15] ? di[15] : r_data_out_0_bram[15];

     always @(posedge clk) begin

       r_data_out_1_q <= mem[b0addrb];
       if (wea) begin
         mem[b0addra] <= w_data_in_0;
       end

     end

     assign r_data_out_0_bram = mem[b0addra];
     assign dout = r_data_out_1_q[0:15];

     assign func_scan_out = func_scan_in;
     assign time_scan_out = time_scan_in;
     assign abst_scan_out = abst_scan_in;
     assign repr_scan_out = repr_scan_in;

     assign bo_pc_failout = 1'b0;
     assign bo_pc_diagloop = 1'b0;

     assign unused = |{vdd, vcs, gnd, lcb_d_mode_dc, lcb_clkoff_dc_b, lcb_mpw1_dc_b, lcb_mpw2_dc_b,
                       lcb_delay_lclkr_dc, ccflush_dc, scan_dis_dc_b, scan_diag_dc, lcb_sg_0, lcb_sl_thold_0_b,
                       lcb_time_sl_thold_0, lcb_abst_sl_thold_0, lcb_ary_nsl_thold_0, lcb_repr_sl_thold_0,
                       abist_di, abist_bw_odd, abist_bw_even, abist_wr_adr, wr_abst_act, abist_rd0_adr, rd0_abst_act,
                       tc_lbist_ary_wrt_thru_dc, abist_ena_1, abist_g8t_rd0_comp_ena, abist_raw_dc_b, obs0_abist_cmp,
                       lcb_bolt_sl_thold_0, pc_bo_enable_2, pc_bo_reset, pc_bo_unload, pc_bo_repair, pc_bo_shdata,
                       pc_bo_select, tri_lcb_mpw1_dc_b, tri_lcb_mpw2_dc_b, tri_lcb_delay_lclkr_dc, tri_lcb_clkoff_dc_b,
                       tri_lcb_act_dis_dc, rd_act};
endmodule

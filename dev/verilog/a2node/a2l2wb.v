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

// A2L2 bridge
// 1. interface to a sim mem[]
// 2. interface to wb (could use mem for l2 also)

a2l2wb n0(
   parameter                        MEM_QW = 16384;
)
(
   input                            clk,
   input                            rst,

   input                            ac_an_req_pwr_token,
   input                            ac_an_req,
	input  [64-`REAL_IFAR_WIDTH:63]  ac_an_req_ra,
	input  [0:5]                     ac_an_req_ttype,
	input  [0:2]                     ac_an_req_thread,
	input  [0:4]                     ac_an_req_ld_core_tag,
	input  [0:2]                     ac_an_req_ld_xfr_len,
	input                            ac_an_req_wimg_w,
	input                            ac_an_req_wimg_i,
	input                            ac_an_req_wimg_m,
	input                            ac_an_req_wimg_g,
	input                            ac_an_req_endian,
	input  [0:3]                     ac_an_req_user_defined,
	input  [0:3]                     ac_an_req_spare_ctrl_a0,
	input                            ac_an_st_data_pwr_token,
	input  [0:31]                    ac_an_st_byte_enbl,
	input  [0:255]                   ac_an_st_data,

	output                           an_ac_reld_data_vld,
	output [0:4]                     an_ac_reld_core_tag,
	output [0:127]                   an_ac_reld_data,
	output [58:59]                   an_ac_reld_qw,
	output                           an_ac_reld_ecc_err,
	output                           an_ac_reld_ecc_err_ue,
	output                           an_ac_reld_data_coming,
	output                           an_ac_reld_ditc,
	output                           an_ac_reld_crit_qw,
	output                           an_ac_reld_l1_dump,
	output [0:3]                     an_ac_req_spare_ctrl_a1,
	output [0:`THREADS-1]            an_ac_sync_ack,

	output                           an_ac_req_ld_pop,
	output                           an_ac_req_st_pop,
	output                           an_ac_req_st_gather,

	output [0:`THREADS-1]            an_ac_stcx_complete,
	output [0:`THREADS-1]            an_ac_stcx_pass,
   output [0:`THREADS-1]            an_ac_reservation_vld,

	output                           an_ac_icbi_ack,
	output [0:1]                     an_ac_icbi_ack_thread,
   output                           an_ac_back_inv,
	output [64-`REAL_IFAR_WIDTH:63]  an_ac_back_inv_addr,
	output [0:4]                     an_ac_back_inv_target,
	output                           an_ac_back_inv_local,
	output                           an_ac_back_inv_lbit,
	output                           an_ac_back_inv_gs,
	output                           an_ac_back_inv_ind,
	output [0:7]                     an_ac_back_inv_lpar_id,
	input                            ac_an_back_inv_reject,
	input  [0:7]                     ac_an_lpar_id,

   output [0:31]                    mem_adr,
   input  [0:127]                   mem_dat,
   output                           mem_wr_val,
   output [0:127]                   mem_wr_dat,

   output                           wb_i_stb,
   output                           wb_i_cyc,
   output [31:0]                    wb_i_adr,
   input                            wb_i_ack,
   input  [31:0]                    wb_i_datr,
   output                           wb_d_stb,
   output                           wb_d_cyc,
   output [31:0]                    wb_d_adr,
   output                           wb_d_we,
   output [3:0]                     wb_d_sel,
   output [31:0]                    wb_d_datw,
   input                            wb_d_ack,
   input  [31:0]                    wb_d_datr
   );

   // unsupported right now

   assign an_ac_sync_ack = 0;
   assign an_ac_stcx_complete = 0;
   assign an_ac_stcx_pass = 0;
   assign an_ac_reservation_vld = 0;

   assign an_ac_icbi_ack = 0;
   assign an_ac_icbi_ack_thread = 0;
   assign an_ac_back_inv = 0;
   assign an_ac_back_inv_addr = 0;
   assign an_ac_back_inv_target = 0;
   assign an_ac_back_inv_local = 0;
   assign an_ac_back_inv_lbit = 0;
   assign an_ac_back_inv_gs = 0;
   assign an_ac_back_inv_ind = 0;
   assign an_ac_back_inv_lpar_id = 0;

   assign an_ac_req_st_gather = 0;
   assign an_ac_req_spare_ctrl_a1 = 0;
   assign an_ac_reld_l1_dump = 0;

   wire   [0:4]                   cmdseq_d;
   reg    [0:4]                   cmdseq_q;
   wire   [0:31+`REAL_IFAR_WIDTH] req_d;
   reg    [0:31+`REAL_IFAR_WIDTH] req_q;
   wire   [0:31+256]              std_d;
   reg    [0:31+256]              std_q;
   reg                            std_q
   reg                            req_tkn_q;
   reg                            std_tkn_q;
   wire   [0:255]                 rld_d;
   reg    [0:255]                 rld_q;

   wire                           req_ld_val;
   wire                           req_st_val;
   wire 	 [64-`REAL_IFAR_WIDTH:63] req_adr;
   wire   [0:127]                 st_alg_data;
   wire   [0:127]                 st_mask;
   wire                           rld_coming;
   wire                           rld_valid;
   wire                           rld_done;
   wire   [0:1]                   rld_qw;
   wire                           idle;

   //reg    [0:127]                 mem[MEM_QW];

   // todo
   /*


   input                            ac_an_req_pwr_token,
   input                            ac_an_req,
	input  [64-`REAL_IFAR_WIDTH:63]  ac_an_req_ra,
	input  [0:5]                     ac_an_req_ttype,
	input  [0:2]                     ac_an_req_thread,
	input  [0:4]                     ac_an_req_ld_core_tag,
	input  [0:2]                     ac_an_req_ld_xfr_len,
	input                            ac_an_req_wimg_w,
	input                            ac_an_req_wimg_i,
	input                            ac_an_req_wimg_m,
	input                            ac_an_req_wimg_g,
	input                            ac_an_req_endian,
	input  [0:3]                     ac_an_req_user_defined,
	input  [0:3]                     ac_an_req_spare_ctrl_a0,
	input                            ac_an_st_data_pwr_token,
	input  [0:31]                    ac_an_st_byte_enbl,
	input  [0:255]                   ac_an_st_data
   */

   // FF
   always @(posedge clk) begin

      if (rst) begin

         cmdseq_q = 'b11111;
         req_q = 0;
         std_q = 0;
         req_tkn_q = 0;
         std_tkn_q = 0;

      end else begin

         cmdseq_q = cmdseq_d;
         req_q = req_d;
         std_q = std_d;
         req_tkn_q = ac_an_req_pwr_token;
         std_tkn_q = ac_an_st_data_pwr_token;

      end
   end

   // Mem

/*
   always @(posedge clk) begin

      if (do_store) begin
         mem[req_adr] = st_rmw_data;
      end
   end
   assign mem_dat = mem[mem_adr];

*/
   assign mem_adr = req_adr >> 4;

   // clkgate
   assign req_d = req_tkn_q ? {ac_an_req,
                               ac_an_req_thread,         // 0:2
                               ac_an_req_ttype,          // 0:5
                               ac_an_req_ld_core_tag,    // 0:2
                               ac_an_req_ra,             //
                               ac_an_req_ld_xfr_len,     // 0:2
                               ac_an_req_wimg_w,
                               ac_an_req_wimg_i,
                               ac_an_req_wimg_m,
                               ac_an_req_wimg_g,
                               ac_an_req_wimg_endian,
                               ac_an_req_user_defined,   // 0:3
                               ac_an_req_spare_ctrl_a0   // 0:3
                              } : 0;
   assign std_d = std_tkn_q ? {ac_an_st_byte_enbl,       // 0:31
                               ac_an_st_data             // 0:255
                              } : 0;

   // request
   assign req_ld_val = req_q[0] & (
                       (req_q[4:9] == 'b000000) |  // if
                       (req_q[4:9] == 'b001000) |  // ld
                       (req_q[4:9] == 'b100010) |  // ditc
                       (req_q[4:9] == 'b001001) |  // larx
                       (req_q[4:9] == 'b001011);   // larx hint
   );

   assign req_st_val = req_q[0] & (
                       (req_q[4:9] == 'b100000) |  // st
                       (req_q[4:9] == 'b101001)    // stcx
   );

   assign req_tag = req_q[10:12];
   assign req_adr = req_q[14+64-`REAL_IFAR_WIDTH:14+63];

   // coming  ---    ---
   // valid      --- --- --- ---  (and qw, crit)
   // data           --- --- --- ---

   //tbl cmdseq
   //n cmdseq_q                            cmdseq_d
   //n |                                   |     rld_coming
   //n |     ld_req_val                    |     |rld_valid
   //n |     |st_req_val                   |     ||do_store
   //n |     ||ld_ready                    |     |||rld_done
   //n |     |||st_ready                   |     ||||
   //n |     ||||ld_ieq1                   |     ||||   idle
   //n |     |||||                         |     ||||   |
   //n |     |||||                         |     ||||   |
   //b 01234 |||||                         01234 ||||   |
   //t iiiii iiiii                         ooooo oooo   o
   //*----------------------------------------------------------------------
   //* Idle ****************************************************************
   //s 11111 -----                         ----- 0000   1
   //s 11111 00---                         11111 0000   -                              * ...zzz...
   //s 11111 1----                         00001 0000   -
   //s 11111 -1---                         10000 0000   -
   //* Load ****************************************************************
   //* 00001 --0--                         00001 0000   0
   //* 00001 --1--                         00010 1000   0
   //* Reload V0 ***********************************************************           * val 0
   //* 00010 ----1                         00011 0100   0
   //* 00011 ----0                         00100 0100   0
   //* Reload D0 (I=1) ******************************************************          * dat 0
   //* 00011 -----                         11111 0001   0
   //* Reload D0 ************************************************************          * val 1, dat 0
   //* 00100 -----                         00101 1100   0
   //* Reload D1 ************************************************************          * val 2, dat 1
   //* 00101 -----                         00110 0100   0
   //* Reload D2 ************************************************************          * val 3, dat 2
   //* 00110 -----                         00111 0100   0
   //* Reload D3 ************************************************************          * dat 3
   //* 00111 -----                         11111 0001   0
   //* Store ***************************************************************
   //* 10000 ---0-                         10000 0000   0
   //* 10000 ---1-                         11111 0010   0
   //*----------------------------------------------------------------------
   //tbl cmdseq

   assign reld_qw = cmdseq_q[3:4];

   // response
   assign an_ac_reld_ecc_err = 0;
   assign an_ac_reld_ecc_err_ue = 0;
   assign an_ac_reld_ditc = 0;

   // loads
   assign an_ac_reld_data_coming = rld_coming;
   assign an_ac_reld_data_vld = rld_valid;
   assign an_ac_reld_core_tag = req_tag;
   assign an_ac_reld_qw = reld_qw;
   assign an_ac_reld_crit_qw = req_ieq1 | (req_adr[58:59] == reld_qw);
   assign an_ac_reld_data = mem[{req_adr[64-`REAL_IFAR_WIDTH:59], reld_qw}];
   assign an_ac_req_ld_pop = rld_done;

   // stores
   assign st_ready = 1;  // random delay, or future functional stuff
   assign an_ac_req_st_pop = st_ready;

   assign st_mask = {
      {8{std_q[0]}},  {8{std_q[1]}},  {8{std_q[2]}},  {8{std_q[3]}},
      {8{std_q[4]}},  {8{std_q[5]}},  {8{std_q[6]}},  {8{std_q[7]}},
      {8{std_q[8]}},  {8{std_q[9]}},  {8{std_q[10]}}, {8{std_q[11]}},
      {8{std_q[12]}}, {8{std_q[13]}}, {8{std_q[14]}}, {8{std_q[15]}},
      {8{std_q[16]}}, {8{std_q[17]}}, {8{std_q[18]}}, {8{std_q[19]}},
      {8{std_q[20]}}, {8{std_q[21]}}, {8{std_q[22]}}, {8{std_q[23]}},
      {8{std_q[24]}}, {8{std_q[25]}}, {8{std_q[26]}}, {8{std_q[27]}},
      {8{std_q[28]}}, {8{std_q[29]}}, {8{std_q[30]}}, {8{std_q[31]}}
   };

   // BE, 16B max store
   assign st_alg_data = req_q[32:32+127];  // no shift needed?

   assign mem_wr_val = do_store;
   assign mem_wr_dat = (mem_dat & st_mask) | (st_alg_data & ~st_mask);


//vtable cmdseq
//vtable cmdseq
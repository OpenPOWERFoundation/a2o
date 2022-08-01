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
//  single req (shared L/S credit)
//  interface to wb32

`include "tri_a2o.vh"

`timescale 1ns/1ps

module a2l2wb #(
   parameter                        MEM_MODE = 2,           // 0:ext 1:int 2:wb
   parameter                        MEM_QW = 16384
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
   output                           an_ac_checkstop,

    // direct-attach mem
   output [0:31]                    mem_adr,
   input  [0:127]                   mem_dat,
   output                           mem_wr_val,
   output [0:15]                    mem_wr_be,
   output [0:127]                   mem_wr_dat,

    // wishbone
   output                           wb_stb,
   output                           wb_cyc,
   output [31:0]                    wb_adr,
   output                           wb_we,
   output [3:0]                     wb_sel,
   output [31:0]                    wb_datw,
   input                            wb_ack,
   input  [31:0]                    wb_datr
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

   wire   [0:4]                  cmdseq_d;
   reg    [0:4]                  cmdseq_q /*verilator public */;
   wire   [0:30+`REAL_IFAR_WIDTH] req_d;
   reg    [0:30+`REAL_IFAR_WIDTH] req_q;
   wire   [0:31+256]             std_d;
   reg    [0:31+256]             std_q;
   reg                           req_tkn_q;
   reg                           std_tkn_q;
   wire   [0:255]                rld_d;
   reg    [0:255]                rld_q;
   wire   [0:1]                  qw_d;
   reg    [0:1]                  qw_q;
   wire   [0:1]                  mem_qw_d;
   reg    [0:1]                  mem_qw_q;
   wire   [0:1]                  wb_qw_d;
   reg    [0:1]                  wb_qw_q;
   wire   [0:7]                  err_d;
   reg    [0:7]                  err_q /*verilator public */;

   // depend on MEM_MODE
   reg    [0:127]                mem[MEM_QW];
   wire   [0:127]                mem_dat_int;
   reg    [0:3]                  wbseq_q;
   wire   [0:3]                  wbseq_d;
   reg    [0:127]                wb_datr_q[0:3];
   wire   [0:127]                wb_datr_d[0:3];

   wire                          new_req;
   wire                          req_ld_val;
   wire                          req_st_val;
   wire                          req_ieq1;
   wire                          req_le;
   wire 	 [64-`REAL_IFAR_WIDTH:63] req_adr;
   wire   [0:4]                  req_tag;
   wire   [0:2]                  req_len;
   wire   [0:255]                req_st_dat;
   wire   [0:31]                 req_st_be;
   wire   [0:7]                  req_st_we;

   wire                          rld_coming;
   wire                          rld_valid;
   wire                          rld_done;
   wire   [0:1]                  rld_qw;
   wire                          cmdseq_idle;
   wire                          ld_ready;
   wire                          st_ready;
   wire                          do_store;
   wire                          wb_inc_qw;
   wire                          inc_qw;
   wire   [0:1]                  dat_sel;
   wire                          qw_sel_0;
   wire                          qw_sel_1;
   wire                          qw_sel_2;
   wire                          qw_sel_3;

   // FF
   always @(posedge clk) begin

      if (rst) begin

         cmdseq_q = 'b11111;
         req_q = 0;
         std_q = 0;
         req_tkn_q = 0;
         std_tkn_q = 0;
         qw_q = 0;
         mem_qw_q = 0;
         err_q = 0;

      end else begin

         cmdseq_q = cmdseq_d;
         req_q = req_d;
         std_q = std_d;
         req_tkn_q = ac_an_req_pwr_token;
         std_tkn_q = ac_an_st_data_pwr_token;
         qw_q = qw_d;
         mem_qw_q = mem_qw_d;
         err_q = err_d;

      end
   end

// adr needs to be created for cacheable!

// ext/int mem
// mem_adr ---          (qw-aligned byte address)
// mem_dat     ---

// external memory
generate if (MEM_MODE == 0) begin
   assign mem_dat_int = mem_dat;
end
endgenerate

// internal memory
generate if (MEM_MODE == 1) begin
   always @(posedge clk) begin
      if (!rst & mem_wr_val) begin
         mem[mem_adr] = mem_wr_dat;
      end
   end
   assign mem_dat_int = mem[req_adr];
end
endgenerate

// wishbone
generate if (MEM_MODE == 2) begin
   always @(posedge clk) begin
      if (rst) begin
         wbseq_q = 4'b1111;
         wb_qw_q = 0;
      end else begin
         wbseq_q = wbseq_d;
         wb_datr_q[0] = wb_datr_d[0];
         wb_datr_q[1] = wb_datr_d[1];
         wb_datr_q[2] = wb_datr_d[2];
         wb_datr_q[3] = wb_datr_d[3];
         wb_qw_q = wb_qw_d;
      end
   end
   assign mem_dat_int = wb_qw_q == 2'b00 ? wb_datr_q[0] :
                        wb_qw_q == 2'b01 ? wb_datr_q[1] :
                        wb_qw_q == 2'b10 ? wb_datr_q[2] :
                                           wb_datr_q[3];
end
endgenerate

generate if (MEM_MODE == 2) begin
   assign mem_adr = req_st_val ? {req_adr[32:59], dat_sel, 2'b00} :
                    req_ieq1 ?   {req_adr[32:59], dat_sel, 2'b00} :
                                 {req_adr[32:57], qw_q, dat_sel, 2'b00};
end else begin
   assign mem_adr = req_st_val ? {req_adr[32:59], 4'b0000} :
                    req_ieq1 ?   req_adr[32:63] :
                                 {req_adr[32:57], mem_qw_q, 4'b0000};
end
endgenerate

   // clkgate
   // oflow if req_q[0]==1!
   assign new_req = req_tkn_q & ac_an_req;
   assign req_d = new_req ?
                              {1'b1,                     // 0
                               ac_an_req_thread,         // 1:3
                               ac_an_req_ttype,          // 4:9
                               ac_an_req_ld_core_tag,    // 10:14
                               ac_an_req_ra,             // 15:56
                               ac_an_req_ld_xfr_len,     // 57:59
                               ac_an_req_wimg_w,         // 60
                               ac_an_req_wimg_i,         // 61
                               ac_an_req_wimg_m,         // 62
                               ac_an_req_wimg_g,         // 63
                               ac_an_req_endian,         // 64
                               ac_an_req_user_defined,   // 65:68
                               ac_an_req_spare_ctrl_a0   // 69:72
                              } :
                   (rld_done | do_store) ? 0 : req_q;

   assign std_d = std_tkn_q ? {ac_an_st_byte_enbl,       // 0:31
                               ac_an_st_data             // 32:287
                              } : do_store ? 0 : std_q;

   // request
   assign req_ld_val = req_q[0] & (
                       (req_q[4:9] == 6'b000000) |  // if
                       (req_q[4:9] == 6'b001000) |  // ld
                       (req_q[4:9] == 6'b100010) |  // ditc
                       (req_q[4:9] == 6'b001001) |  // larx
                       (req_q[4:9] == 6'b001011)    // larx hint
   );
   assign req_ieq1 = req_q[61];
   assign req_le = req_q[64];

   assign req_st_val = req_q[0] & (
                       (req_q[4:9] == 6'b100000) |  // st
                       (req_q[4:9] == 6'b101001)    // stcx
   );

   assign req_tag = req_q[10:14];
   assign req_adr = req_q[15:15+`REAL_IFAR_WIDTH-1];
   assign req_len = req_q[57:59];

   assign req_st_be = std_q[0:31];
   assign req_st_we[0] = |std_q[0:3];
   assign req_st_we[1] = |std_q[4:7];
   assign req_st_we[2] = |std_q[8:11];
   assign req_st_we[3] = |std_q[12:15];
   assign req_st_dat = std_q[32:287];

// random delay, or wb trans complete
generate if (MEM_MODE != 2) begin
   assign ld_ready = 1;
   assign st_ready = 1;
end
endgenerate

   // A2L2 Interface

   // b2b
   // coming  ---    ---
   // valid      --- --- --- ---           (and qualifiers)
   // data               --- --- --- ---   (only 1 beat for ieq1)

   // vtable -V -b 0 a2l2wb.v
   //tbl cmdseq
   //n cmdseq_q                            cmdseq_d
   //n |                                   |     rld_coming
   //n |     req_ld_val                    |     |rld_valid
   //n |     |req_st_val                   |     ||do_store
   //n |     ||ld_ready                    |     |||rld_done
   //n |     |||st_ready                   |     ||||inc_qw
   //n |     ||||req_ieq1                  |     |||||  cmdseq_idle
   //n |     |||||                         |     |||||  |
   //n |     |||||                         |     |||||  |
   //b 01234 |||||                         01234 |||||  |
   //t iiiii iiiii                         ooooo ooooo  o
   //*----------------------------------------------------------------------
   //* Idle ****************************************************************
   //s 11111 -----                         ----- 00000  1
   //s 11111 00---                         11111 00000  -                              * ...zzz...
   //s 11111 1----                         00001 00000  -
   //s 11111 -1---                         10000 00000  -
   //* Load ****************************************************************
   //s 00001 --0--                         00001 00000  0
   //s 00001 --1--                         00010 10000  0
   //* Reload V0 ***********************************************************           * val 0
   //s 00010 -----                         00011 01001  0
   //* Reload Nop ***********************************************************          * val 1 (not ieq1)
   //s 00011 ----1                         00100 00000  0
   //s 00011 ----0                         01000 11001  0
   //* Reload D0 (I=1) ******************************************************          * dat 0 (ieq1)
   //s 00100 -----                         11111 00010  0
   //* Reload D0 ************************************************************          * val 2, dat 0
   //s 01000 -----                         01001 01001  0
   //* Reload D1 ************************************************************          * val 3, dat 1
   //s 01001 -----                         01010 01001  0
   //* Reload D2 ************************************************************          * dat 2
   //s 01010 -----                         01011 00000  0
   //* Reload D3 ************************************************************          * dat 3
   //s 01011 -----                         11111 00010  0
   //* Store ***************************************************************
   //s 10000 ---0-                         10000 00000  0
   //s 10000 ---1-                         11111 00100  0
   //*----------------------------------------------------------------------
   //tbl cmdseq

   // Wishbone Interface
   // 4B data
   // req_ld_val: 4 or 16 wb reqs based on ieq1
   // set ldready when all data rcvd
   // req_st_val: 0-4 wb reqs based on be
   // set stready when last data ack'd

   //tbl wbseq
   //n wbseq_q                               wbseq_d
   //n |    cmdseq_idle                      |
   //n |    | req_ld_val                     |
   //n |    | |req_ieq1                      |    wb_stb
   //n |    | ||req_st_val                   |    |wb_cyc
   //n |    | |||req_st_we                   |    ||wb_we
   //n |    | ||||                           |    ||| dat_sel
   //n |    | ||||                           |    ||| |  ld_ready
   //n |    | ||||    qw_q                   |    ||| |  |st_ready
   //n |    | ||||    |  wb_ack              |    ||| |  ||wb_inc_qw
   //n |    | ||||    |  |                   |    ||| |  |||
   //n |    | ||||    |  |                   |    ||| |  |||
   //b 0123 | |||0123 01 |                   0123 ||| 01 |||
   //t iiii i iiiiiii ii i                   oooo ooo oo ooo
   //*------------------------------------------------------
   //* Idle ************************************************
   //s 1111 - 0-0---- -- -                   1111 000 00 000          * ...zzz...
   //s 1111 - 1-0---- -- -                   0100 000 00 000
   //s 1111 - 0-11--- -- -                   1000 000 00 000
   //s 1111 - 0-101-- -- -                   1001 000 00 000
   //s 1111 - 0-1001- -- -                   1010 000 00 000
   //s 1111 - 0-10001 -- -                   1011 000 00 000
   //s 1111 - 0-10000 -- -                   1111 000 00 010
   //* Load W0 *********************************************
   //s 0100 - ------- -- 0                   0100 110 00 000
   //s 0100 - ------- -- 1                   0101 110 00 000
   //* Load W1 *********************************************
   //s 0101 - ------- -- 0                   0101 110 01 000
   //s 0101 - ------- -- 1                   0110 110 01 000
   //* Load W2 *********************************************
   //s 0110 - ------- -- 0                   0110 110 10 000
   //s 0110 - ------- -- 1                   0111 110 10 000
   //* Load W3 *********************************************
   //s 0111 - ------- -- 0                   0111 110 11 000
   //s 0111 - -0----- 0- 1                   0100 110 11 001
   //s 0111 - -0----- -0 1                   0100 110 11 001
   //s 0111 - -1----- -- 1                   1110 110 11 100
   //s 0111 - -0----- 11 1                   1110 110 11 100
   //* Store W0 ********************************************
   //s 1000 - ------- -- 0                   1000 111 00 000
   //s 1000 - ----1-- -- 1                   1001 111 00 000
   //s 1000 - ----01- -- 1                   1010 111 00 000
   //s 1000 - ----001 -- 1                   1011 111 00 000
   //s 1000 - ----000 -- 1                   1110 111 00 010
   //* Store W1 ********************************************
   //s 1001 - ------- -- 0                   1001 111 01 000
   //s 1001 - -----1- -- 1                   1010 111 01 000
   //s 1001 - -----01 -- 1                   1011 111 01 000
   //s 1001 - -----00 -- 1                   1110 111 01 010
   //* Store W2 ********************************************
   //s 1010 - ------- -- 0                   1010 111 10 000
   //s 1010 - ------1 -- 1                   1011 111 10 000
   //s 1010 - ------0 -- 1                   1110 111 10 010
   //* Store W3 ********************************************
   //s 1011 - ------- -- 0                   1011 111 11 000
   //s 1011 - ------- -- 1                   1110 111 11 010
   //* Wait for op complete ********************************
   //s 1110 0 ------- -- -                   1110 000 00 000
   //s 1110 1 ------- -- -                   1111 000 00 000
   //*------------------------------------------------------
   //tbl wbseq

generate if (MEM_MODE == 2) begin
   assign wb_adr = mem_adr;

   assign qw_sel_0 = qw_q == 2'b00;
   assign qw_sel_1 = qw_q == 2'b01;
   assign qw_sel_2 = qw_q == 2'b10;
   assign qw_sel_3 = qw_q == 2'b11;

   assign wb_datr_d[0][0:31]   = (req_ld_val & wb_ack & qw_sel_0 & dat_sel == 2'b00) ? wb_datr : wb_datr_q[0][0:31];
   assign wb_datr_d[0][32:63]  = (req_ld_val & wb_ack & qw_sel_0 & dat_sel == 2'b01) ? wb_datr : wb_datr_q[0][32:63];
   assign wb_datr_d[0][64:95]  = (req_ld_val & wb_ack & qw_sel_0 & dat_sel == 2'b10) ? wb_datr : wb_datr_q[0][63:95];
   assign wb_datr_d[0][96:127] = (req_ld_val & wb_ack & qw_sel_0 & dat_sel == 2'b11) ? wb_datr : wb_datr_q[0][96:127];

   assign wb_datr_d[1][0:31]   = (req_ld_val & wb_ack & qw_sel_1 & dat_sel == 2'b00) ? wb_datr : wb_datr_q[1][0:31];
   assign wb_datr_d[1][32:63]  = (req_ld_val & wb_ack & qw_sel_1 & dat_sel == 2'b01) ? wb_datr : wb_datr_q[1][32:63];
   assign wb_datr_d[1][64:95]  = (req_ld_val & wb_ack & qw_sel_1 & dat_sel == 2'b10) ? wb_datr : wb_datr_q[1][63:95];
   assign wb_datr_d[1][96:127] = (req_ld_val & wb_ack & qw_sel_1 & dat_sel == 2'b11) ? wb_datr : wb_datr_q[1][96:127];

   assign wb_datr_d[2][0:31]   = (req_ld_val & wb_ack & qw_sel_2 & dat_sel == 2'b00) ? wb_datr : wb_datr_q[2][0:31];
   assign wb_datr_d[2][32:63]  = (req_ld_val & wb_ack & qw_sel_2 & dat_sel == 2'b01) ? wb_datr : wb_datr_q[2][32:63];
   assign wb_datr_d[2][64:95]  = (req_ld_val & wb_ack & qw_sel_2 & dat_sel == 2'b10) ? wb_datr : wb_datr_q[2][63:95];
   assign wb_datr_d[2][96:127] = (req_ld_val & wb_ack & qw_sel_2 & dat_sel == 2'b11) ? wb_datr : wb_datr_q[2][96:127];

   assign wb_datr_d[3][0:31]   = (req_ld_val & wb_ack & qw_sel_3 & dat_sel == 2'b00) ? wb_datr : wb_datr_q[3][0:31];
   assign wb_datr_d[3][32:63]  = (req_ld_val & wb_ack & qw_sel_3 & dat_sel == 2'b01) ? wb_datr : wb_datr_q[3][32:63];
   assign wb_datr_d[3][64:95]  = (req_ld_val & wb_ack & qw_sel_3 & dat_sel == 2'b10) ? wb_datr : wb_datr_q[3][63:95];
   assign wb_datr_d[3][96:127] = (req_ld_val & wb_ack & qw_sel_3 & dat_sel == 2'b11) ? wb_datr : wb_datr_q[3][96:127];

   assign wb_sel = dat_sel == 2'b00 ? req_st_be[0:3]  :
                   dat_sel == 2'b01 ? req_st_be[4:7]  :
                   dat_sel == 2'b10 ? req_st_be[8:11] :
                                      req_st_be[12:15];

   assign wb_datw = dat_sel == 2'b00 ? req_st_dat[0:31]  :
                    dat_sel == 2'b01 ? req_st_dat[32:63] :
                    dat_sel == 2'b10 ? req_st_dat[64:95] :
                                       req_st_dat[96:127];
end
endgenerate

   // qw for wb loads, or a2l2 rld
   // crit first uses qw pattern instead of +1
   // valid (d-2)
   assign qw_d = (new_req | ld_ready) ? 0 :
                 (inc_qw | wb_inc_qw) ? qw_q + 1 :
                 qw_q;

   assign rld_qw = req_ieq1 ? 2'b00 : qw_q;

   // mem address (d-1) non-wb
   assign mem_qw_d = rld_qw;

   // dat sel (d-0) wb
   //assign wb_qw_d = mem_qw_q;  wb_qw_q is not always following wb_qw_d!!! iverilog e7b700f48ed07c2e272c436079da057394642443
   assign wb_qw_d[0] = mem_qw_q[0];
   assign wb_qw_d[1] = mem_qw_q[1];

   // response
   assign an_ac_reld_ecc_err = 0;
   assign an_ac_reld_ecc_err_ue = 0;
   assign an_ac_reld_ditc = 0;

   // loads
   assign an_ac_reld_data_coming = rld_coming;
   assign an_ac_reld_data_vld = rld_valid;
   assign an_ac_reld_core_tag = req_tag;
   assign an_ac_reld_qw = rld_qw;
   assign an_ac_reld_crit_qw = req_ieq1 | (req_adr[58:59] == rld_qw);
   assign an_ac_reld_data = mem_dat_int;
   assign an_ac_req_ld_pop = rld_done;

   // stores
   assign an_ac_req_st_pop = do_store;

   // BE, 16B max store
   assign mem_wr_val = do_store;
   assign mem_wr_be = std_q[0:15];
   assign mem_wr_dat = std_q[32:32+127];

   // misc
   assign err_d = {(new_req & ~cmdseq_idle), 7'b0};
   assign an_ac_checkstop = err_q != 0;

//vtable cmdseq
assign cmdseq_d[0] =
  (cmdseq_q[0] & cmdseq_q[1] & cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4] & ~req_ld_val & ~req_st_val) |
  (cmdseq_q[0] & cmdseq_q[1] & cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4] & req_st_val) |
  (~cmdseq_q[0] & ~cmdseq_q[1] & cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4]) |
  (cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4] & ~st_ready) |
  (cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4] & st_ready);
assign cmdseq_d[1] =
  (cmdseq_q[0] & cmdseq_q[1] & cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4] & ~req_ld_val & ~req_st_val) |
  (~cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4] & ~req_ieq1) |
  (~cmdseq_q[0] & ~cmdseq_q[1] & cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4]) |
  (cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4] & st_ready);
assign cmdseq_d[2] =
  (cmdseq_q[0] & cmdseq_q[1] & cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4] & ~req_ld_val & ~req_st_val) |
  (~cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4] & req_ieq1) |
  (~cmdseq_q[0] & ~cmdseq_q[1] & cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4]) |
  (cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4] & st_ready);
assign cmdseq_d[3] =
  (cmdseq_q[0] & cmdseq_q[1] & cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4] & ~req_ld_val & ~req_st_val) |
  (~cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & cmdseq_q[4] & ld_ready) |
  (~cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & ~cmdseq_q[1] & cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4]) |
  (cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4] & st_ready);
assign cmdseq_d[4] =
  (cmdseq_q[0] & cmdseq_q[1] & cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4] & ~req_ld_val & ~req_st_val) |
  (cmdseq_q[0] & cmdseq_q[1] & cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4] & req_ld_val) |
  (~cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & cmdseq_q[4] & ~ld_ready) |
  (~cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & ~cmdseq_q[1] & cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4]) |
  (cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4] & st_ready);
assign rld_coming =
  (~cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & cmdseq_q[4] & ld_ready) |
  (~cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4] & ~req_ieq1);
assign rld_valid =
  (~cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4] & ~req_ieq1) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & cmdseq_q[4]);
assign do_store =
  (cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4] & st_ready);
assign rld_done =
  (~cmdseq_q[0] & ~cmdseq_q[1] & cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4]);
assign inc_qw =
  (~cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & ~cmdseq_q[1] & ~cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4] & ~req_ieq1) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & ~cmdseq_q[4]) |
  (~cmdseq_q[0] & cmdseq_q[1] & ~cmdseq_q[2] & ~cmdseq_q[3] & cmdseq_q[4]);
assign cmdseq_idle =
  (cmdseq_q[0] & cmdseq_q[1] & cmdseq_q[2] & cmdseq_q[3] & cmdseq_q[4]);
//vtable cmdseq

generate if (MEM_MODE == 2) begin
//vtable wbseq
assign wbseq_d[0] =
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & ~req_st_val) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & req_st_val & req_st_we[0]) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & req_st_val & ~req_st_we[0] & req_st_we[1]) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & req_st_val & ~req_st_we[0] & ~req_st_we[1] & req_st_we[2]) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & req_st_val & ~req_st_we[0] & ~req_st_we[1] & ~req_st_we[2] & req_st_we[3]) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & req_st_val & ~req_st_we[0] & ~req_st_we[1] & ~req_st_we[2] & ~req_st_we[3]) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & req_ieq1 & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & qw_q[0] & qw_q[1] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & req_st_we[1] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & req_st_we[2] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & ~req_st_we[2] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & req_st_we[2] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & wb_ack) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~cmdseq_idle) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & cmdseq_idle);
assign wbseq_d[1] =
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & ~req_st_val) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & req_ld_val & ~req_st_val) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & req_st_val & ~req_st_we[0] & ~req_st_we[1] & ~req_st_we[2] & ~req_st_we[3]) |
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & ~qw_q[0] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & ~qw_q[1] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & req_ieq1 & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & qw_q[0] & qw_q[1] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & wb_ack) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~cmdseq_idle) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & cmdseq_idle);
assign wbseq_d[2] =
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & ~req_st_val) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & req_st_val & ~req_st_we[0] & ~req_st_we[1] & req_st_we[2]) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & req_st_val & ~req_st_we[0] & ~req_st_we[1] & ~req_st_we[2] & req_st_we[3]) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & req_st_val & ~req_st_we[0] & ~req_st_we[1] & ~req_st_we[2] & ~req_st_we[3]) |
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & req_ieq1 & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & qw_q[0] & qw_q[1] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & req_st_we[2] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & ~req_st_we[2] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & req_st_we[2] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & wb_ack) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~cmdseq_idle) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & cmdseq_idle);
assign wbseq_d[3] =
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & ~req_st_val) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & req_st_val & ~req_st_we[0] & req_st_we[1]) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & req_st_val & ~req_st_we[0] & ~req_st_we[1] & ~req_st_we[2] & req_st_we[3]) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & req_st_val & ~req_st_we[0] & ~req_st_we[1] & ~req_st_we[2] & ~req_st_we[3]) |
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & req_st_we[1] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & ~req_st_we[2] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & cmdseq_idle);
assign wb_stb =
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & ~qw_q[0] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & ~qw_q[1] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & req_ieq1 & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & qw_q[0] & qw_q[1] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & req_st_we[1] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & req_st_we[2] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & ~req_st_we[2] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & req_st_we[2] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & wb_ack);
assign wb_cyc =
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & ~qw_q[0] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & ~qw_q[1] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & req_ieq1 & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & qw_q[0] & qw_q[1] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & req_st_we[1] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & req_st_we[2] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & ~req_st_we[2] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & req_st_we[2] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & wb_ack);
assign wb_we =
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & req_st_we[1] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & req_st_we[2] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & ~req_st_we[2] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & req_st_we[2] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & wb_ack);
assign dat_sel[0] =
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & ~qw_q[0] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & ~qw_q[1] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & req_ieq1 & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & qw_q[0] & qw_q[1] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & wb_ack);
assign dat_sel[1] =
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & ~qw_q[0] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & ~qw_q[1] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & req_ieq1 & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & qw_q[0] & qw_q[1] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & req_st_we[2] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & wb_ack);
assign ld_ready =
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & req_ieq1 & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & qw_q[0] & qw_q[1] & wb_ack);
assign st_ready =
  (wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ld_val & req_st_val & ~req_st_we[0] & ~req_st_we[1] & ~req_st_we[2] & ~req_st_we[3]) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[1] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & ~wbseq_q[2] & wbseq_q[3] & ~req_st_we[2] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & ~wbseq_q[3] & ~req_st_we[3] & wb_ack) |
  (wbseq_q[0] & ~wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & wb_ack);
assign wb_inc_qw =
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & ~qw_q[0] & wb_ack) |
  (~wbseq_q[0] & wbseq_q[1] & wbseq_q[2] & wbseq_q[3] & ~req_ieq1 & ~qw_q[1] & wb_ack);
//vtable wbseq
end
endgenerate

endmodule

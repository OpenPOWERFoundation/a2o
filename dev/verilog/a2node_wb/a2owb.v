// add ties for all the test junk, etc. so they can be optimized out of model

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

`include "tri_a2o.vh"

`timescale 1ns/1ps

module a2owb (

	 input                                                  clk,
    input                                                  rst,
	 input                                                  scan_in,
	 output                                                 scan_out,

/*
	 // Pervasive clock control
	 input                                                  an_ac_rtim_sl_thold_8,
	 input                                                  an_ac_func_sl_thold_8,
	 input                                                  an_ac_func_nsl_thold_8,
	 input                                                  an_ac_ary_nsl_thold_8,
	 input                                                  an_ac_sg_8,
	 input                                                  an_ac_fce_8,
	 input  [0:7]                                           an_ac_abst_scan_in,


	 //SCOM Satellite
	 input  [0:3]                                           an_ac_scom_sat_id,
	 input                                                  an_ac_scom_dch,
	 input                                                  an_ac_scom_cch,
*/
	 output                                                 ac_an_scom_dch,
	 output                                                 ac_an_scom_cch,

	 // FIR and Error Signals
	 output [0:`THREADS-1]                                  ac_an_special_attn,
	 output [0:2]                                           ac_an_checkstop,
	 output [0:2]                                           ac_an_local_checkstop,
	 output [0:2]                                           ac_an_recov_err,
	 output                                                 ac_an_trace_error,
    output                                                 ac_an_livelock_active,

	 // Perfmon Event Bus
	 output [0:4*`THREADS-1]                                ac_an_event_bus0,
	 output [0:4*`THREADS-1]                                ac_an_event_bus1,

	 // Power Management
	 output [0:`THREADS-1]                                  ac_an_pm_thread_running,
	 input  [0:`THREADS-1]                                  an_ac_pm_thread_stop,
	 input  [0:`THREADS-1]                                  an_ac_pm_fetch_halt,

/*
	 // Clock, Test, and LCB Controls
	 input                                                  an_ac_gsd_test_enable_dc,
	 input                                                  an_ac_gsd_test_acmode_dc,
	 input                                                  an_ac_ccflush_dc,
	 input                                                  an_ac_ccenable_dc,
	 input                                                  an_ac_lbist_en_dc,
	 input                                                  an_ac_lbist_ip_dc,
	 input                                                  an_ac_lbist_ac_mode_dc,
	 input                                                  an_ac_scan_diag_dc,
	 input                                                  an_ac_scan_dis_dc_b,

	 //Thold input to clock control macro
	 input  [0:8]                                           an_ac_scan_type_dc,
*/

	 // Pervasive
	 output                                                 ac_an_reset_1_request,
	 output                                                 ac_an_reset_2_request,
	 output                                                 ac_an_reset_3_request,
	 output                                                 ac_an_reset_wd_request,
/*
	 input                                                  an_ac_lbist_ary_wrt_thru_dc,
*/
	 input  [0:`THREADS-1]                                  an_ac_sleep_en,
	 input  [0:`THREADS-1]                                  an_ac_ext_interrupt,
	 input  [0:`THREADS-1]                                  an_ac_crit_interrupt,
	 input  [0:`THREADS-1]                                  an_ac_perf_interrupt,
	 input  [0:`THREADS-1]                                  an_ac_hang_pulse,
	 input                                                  an_ac_tb_update_enable,
	 input                                                  an_ac_tb_update_pulse,
/*
	 input  [0:3]                                           an_ac_chipid_dc,
	 input  [0:7]                                           an_ac_coreid,
*/
	 output [0:`THREADS-1]                                  ac_an_machine_check,
	 input                                                  an_ac_debug_stop,
	 output [0:`THREADS-1]                                  ac_an_debug_trigger,
	 input  [0:`THREADS-1]                                  an_ac_uncond_dbg_event,
	 output [0:31]                                          ac_an_debug_bus,
	 output                                                 ac_an_coretrace_first_valid,
	 output							                             ac_an_coretrace_valid,
	 output [0:1]						                          ac_an_coretrace_type,
    input                                                  an_ac_flh2l2_gate,
    input                                                  an_ac_reset_1_complete,
    input                                                  an_ac_reset_2_complete,
    input                                                  an_ac_reset_3_complete,
    input                                                  an_ac_reset_wd_complete,
    output                                                 an_ac_checkstop,
    input  [0:`THREADS-1]                                  an_ac_external_mchk,
    output                                                 ac_an_power_managed,
    output                                                 ac_an_rvwinkle_mode,

    // direct-attach mem
    output [0:31]                                          mem_adr,
    input  [0:127]                                         mem_dat,
    output                                                 mem_wr_val,
    output [0:15]                                          mem_wr_be,
    output [0:127]                                         mem_wr_dat,

    // wishbone
    output                                                 wb_stb,
    output                                                 wb_cyc,
    output [31:0]                                          wb_adr,
    output                                                 wb_we,
    output [3:0]                                           wb_sel,
    output [31:0]                                          wb_datw,
    input                                                  wb_ack,
    input  [31:0]                                          wb_datr
);

wire   [0:`THREADS-1]            an_ac_stcx_complete /*verilator public */;
wire   [0:`THREADS-1]            an_ac_stcx_pass;
wire                             an_ac_icbi_ack;
wire   [0:1]                     an_ac_icbi_ack_thread;
wire                             an_ac_back_inv_lbit;
wire                             an_ac_back_inv_gs;
wire                             an_ac_back_inv_ind;
wire                             ac_an_back_inv_reject;
wire                             an_ac_reld_data_vld;
wire                             an_ac_reld_ecc_err;
wire                             an_ac_reld_ecc_err_ue;
wire                             an_ac_reld_data_coming;
wire                             an_ac_reld_ditc;
wire                             an_ac_reld_crit_qw;
wire                             an_ac_reld_l1_dump;
wire                             an_ac_req_ld_pop;
wire                             an_ac_req_st_pop;
wire                             an_ac_req_st_gather;
wire                             ac_an_req_pwr_token;
wire                             ac_an_req /*verilator public */;
wire                             ac_an_req_wimg_w;
wire                             ac_an_req_wimg_i;
wire                             ac_an_req_wimg_m;
wire                             ac_an_req_wimg_g;
wire                             ac_an_req_endian;
wire                             ac_an_st_data_pwr_token;
wire   [64-`REAL_IFAR_WIDTH:63]  ac_an_req_ra /*verilator public */;
wire                             an_ac_back_inv;
wire                             an_ac_back_inv_local;
wire   [0:4]                     an_ac_back_inv_target;
wire   [0:7]                     an_ac_back_inv_lpar_id;
wire   [0:7]                     ac_an_lpar_id;
wire   [0:4]                     an_ac_reld_core_tag;
wire   [0:127]                   an_ac_reld_data;
wire   [0:1]                     an_ac_reld_qw;
wire   [64-`REAL_IFAR_WIDTH:63]  an_ac_back_inv_addr;
wire   [0:5]                     ac_an_req_ttype;
wire   [0:2]                     ac_an_req_thread;
wire   [0:3]                     ac_an_req_user_defined;
wire   [0:3]                     ac_an_req_spare_ctrl_a0;
wire   [0:4]                     ac_an_req_ld_core_tag;
wire   [0:2]                     ac_an_req_ld_xfr_len;
wire   [0:31]                    ac_an_st_byte_enbl;
wire   [0:255]                   ac_an_st_data;
wire   [0:3]                     an_ac_req_spare_ctrl_a1;
wire   [0:`THREADS-1]            an_ac_sync_ack;
wire   [0:`THREADS-1]            an_ac_reservation_vld;

// ties
wire                             an_ac_rtim_sl_thold_8;
wire                             an_ac_func_sl_thold_8;
wire                             an_ac_func_nsl_thold_8;
wire                             an_ac_ary_nsl_thold_8;
wire                             an_ac_sg_8;
wire                             an_ac_fce_8;
wire  [0:7]                      an_ac_abst_scan_in;
wire  [0:3]                      an_ac_scom_sat_id;
wire                             an_ac_scom_dch;
wire                             an_ac_scom_cch;
wire                             an_ac_gsd_test_enable_dc;
wire                             an_ac_gsd_test_acmode_dc;
wire                             an_ac_ccflush_dc;
wire                             an_ac_ccenable_dc;
wire                             an_ac_lbist_en_dc;
wire                             an_ac_lbist_ip_dc;
wire                             an_ac_lbist_ac_mode_dc;
wire                             an_ac_scan_diag_dc;
wire                             an_ac_scan_dis_dc_b;
wire  [0:8]                      an_ac_scan_type_dc;
wire                             an_ac_lbist_ary_wrt_thru_dc;
wire  [0:3]                      an_ac_chipid_dc;
wire  [0:7]                      an_ac_coreid;

assign an_ac_chipid_dc = 4'h0;
assign an_ac_coreid = 8'h0;

// Pervasive clock control
assign an_ac_rtim_sl_thold_8 = 0;
assign an_ac_func_sl_thold_8 = 0;
assign an_ac_func_nsl_thold_8 = 0;
assign an_ac_ary_nsl_thold_8 = 0;
assign an_ac_sg_8 = 0;
assign an_ac_fce_8 = 0;
assign an_ac_abst_scan_in = 8'h00;

// SCOM
assign an_ac_scom_sat_id = 4'h0;
assign an_ac_scom_dch = 0;
assign an_ac_scom_cch = 0;

// Clock, Test, and LCB Controls
assign an_ac_gsd_test_enable_dc = 0;
assign an_ac_gsd_test_acmode_dc = 0;
assign an_ac_ccflush_dc = 0;
assign an_ac_ccenable_dc = 0;
assign an_ac_lbist_en_dc = 0;
assign an_ac_lbist_ip_dc = 0;
assign an_ac_lbist_ac_mode_dc = 0;
assign an_ac_scan_diag_dc = 0;
assign an_ac_scan_dis_dc_b = 0;

assign an_ac_scan_type_dc = 9'h000;
assign an_ac_lbist_ary_wrt_thru_dc = 0;


c c0(
      .clk(clk),
      .rst(rst),
      .scan_in(scan_in),
      .scan_out(scan_out),

      .an_ac_rtim_sl_thold_8(an_ac_rtim_sl_thold_8),
      .an_ac_func_sl_thold_8(an_ac_func_sl_thold_8),
      .an_ac_func_nsl_thold_8(an_ac_func_nsl_thold_8),
      .an_ac_ary_nsl_thold_8(an_ac_ary_nsl_thold_8),
      .an_ac_sg_8(an_ac_sg_8),
      .an_ac_fce_8(an_ac_fce_8),
      .an_ac_abst_scan_in(an_ac_abst_scan_in),

      .an_ac_stcx_complete(an_ac_stcx_complete[0]),
      .an_ac_stcx_pass(an_ac_stcx_pass[0]),
      .an_ac_reservation_vld(an_ac_reservation_vld[0]),

      .an_ac_icbi_ack(an_ac_icbi_ack),
      .an_ac_icbi_ack_thread(an_ac_icbi_ack_thread),
      .an_ac_sync_ack(an_ac_sync_ack[0]),

      .an_ac_back_inv(an_ac_back_inv),
      .an_ac_back_inv_addr(an_ac_back_inv_addr),
      .an_ac_back_inv_target(an_ac_back_inv_target),
      .an_ac_back_inv_local(an_ac_back_inv_local),
      .an_ac_back_inv_lbit(an_ac_back_inv_lbit),
      .an_ac_back_inv_gs(an_ac_back_inv_gs),
      .an_ac_back_inv_ind(an_ac_back_inv_ind),
      .an_ac_back_inv_lpar_id(an_ac_back_inv_lpar_id),
      .ac_an_back_inv_reject(ac_an_back_inv_reject),
      .ac_an_lpar_id(ac_an_lpar_id),

      .an_ac_reld_data_vld(an_ac_reld_data_vld),
      .an_ac_reld_core_tag(an_ac_reld_core_tag),
      .an_ac_reld_data(an_ac_reld_data),
      .an_ac_reld_qw(an_ac_reld_qw),
      .an_ac_reld_ecc_err(an_ac_reld_ecc_err),
      .an_ac_reld_ecc_err_ue(an_ac_reld_ecc_err_ue),
      .an_ac_reld_data_coming(an_ac_reld_data_coming),
      .an_ac_reld_ditc(an_ac_reld_ditc),
      .an_ac_reld_crit_qw(an_ac_reld_crit_qw),
      .an_ac_reld_l1_dump(an_ac_reld_l1_dump),
      .an_ac_req_spare_ctrl_a1(an_ac_req_spare_ctrl_a1),

      .an_ac_flh2l2_gate(an_ac_flh2l2_gate),
      .an_ac_req_ld_pop(an_ac_req_ld_pop),
      .an_ac_req_st_pop(an_ac_req_st_pop),
      .an_ac_req_st_gather(an_ac_req_st_gather),
      .an_ac_pm_fetch_halt(an_ac_pm_fetch_halt),

      .an_ac_scom_sat_id(an_ac_scom_sat_id),
      .an_ac_scom_dch(an_ac_scom_dch),
      .an_ac_scom_cch(an_ac_scom_cch),
      .ac_an_scom_dch(ac_an_scom_dch),
      .ac_an_scom_cch(ac_an_scom_cch),

      .ac_an_special_attn(ac_an_special_attn),
      .ac_an_checkstop(ac_an_checkstop),
      .ac_an_local_checkstop(ac_an_local_checkstop),
      .ac_an_recov_err(ac_an_recov_err),
      .ac_an_trace_error(ac_an_trace_error),
      .ac_an_livelock_active(ac_an_livelock_active),
      .an_ac_checkstop(an_ac_checkstop),
      .an_ac_external_mchk(an_ac_external_mchk),

      .ac_an_event_bus0(ac_an_event_bus0),

      .an_ac_reset_1_complete(an_ac_reset_1_complete),
      .an_ac_reset_2_complete(an_ac_reset_2_complete),
      .an_ac_reset_3_complete(an_ac_reset_3_complete),
      .an_ac_reset_wd_complete(an_ac_reset_wd_complete),

      .ac_an_pm_thread_running(ac_an_pm_thread_running),
      .an_ac_pm_thread_stop(an_ac_pm_thread_stop),
      .ac_an_power_managed(ac_an_power_managed),
      .ac_an_rvwinkle_mode(ac_an_rvwinkle_mode),

      .an_ac_gsd_test_enable_dc(an_ac_gsd_test_enable_dc),
      .an_ac_gsd_test_acmode_dc(an_ac_gsd_test_acmode_dc),
      .an_ac_ccflush_dc(an_ac_ccflush_dc),
      .an_ac_ccenable_dc(an_ac_ccenable_dc),
      .an_ac_lbist_en_dc(an_ac_lbist_en_dc),
      .an_ac_lbist_ip_dc(an_ac_lbist_ip_dc),
      .an_ac_lbist_ac_mode_dc(an_ac_lbist_ac_mode_dc),
      .an_ac_scan_diag_dc(an_ac_scan_diag_dc),
      .an_ac_scan_dis_dc_b(an_ac_scan_dis_dc_b),
      .an_ac_scan_type_dc(an_ac_scan_type_dc),
      .ac_an_reset_1_request(ac_an_reset_1_request),
      .ac_an_reset_2_request(ac_an_reset_2_request),
      .ac_an_reset_3_request(ac_an_reset_3_request),
      .ac_an_reset_wd_request(ac_an_reset_wd_request),
      .an_ac_lbist_ary_wrt_thru_dc(an_ac_lbist_ary_wrt_thru_dc),
      .an_ac_sleep_en(an_ac_sleep_en),
      .an_ac_ext_interrupt(an_ac_ext_interrupt),
      .an_ac_crit_interrupt(an_ac_crit_interrupt),
      .an_ac_perf_interrupt(an_ac_perf_interrupt),
      .an_ac_hang_pulse(an_ac_hang_pulse),
      .an_ac_tb_update_enable(an_ac_tb_update_enable),
      .an_ac_tb_update_pulse(an_ac_tb_update_pulse),
      .an_ac_chipid_dc(an_ac_chipid_dc),
      .an_ac_coreid(an_ac_coreid),
      .ac_an_machine_check(ac_an_machine_check),
      .an_ac_debug_stop(an_ac_debug_stop),
      .ac_an_debug_trigger(ac_an_debug_trigger),
      .an_ac_uncond_dbg_event(an_ac_uncond_dbg_event),

      .ac_an_req_pwr_token(ac_an_req_pwr_token),
      .ac_an_req(ac_an_req),
      .ac_an_req_ra(ac_an_req_ra),
      .ac_an_req_ttype(ac_an_req_ttype),
      .ac_an_req_thread(ac_an_req_thread),
      .ac_an_req_wimg_w(ac_an_req_wimg_w),
      .ac_an_req_wimg_i(ac_an_req_wimg_i),
      .ac_an_req_wimg_m(ac_an_req_wimg_m),
      .ac_an_req_wimg_g(ac_an_req_wimg_g),
      .ac_an_req_user_defined(ac_an_req_user_defined),
      .ac_an_req_spare_ctrl_a0(ac_an_req_spare_ctrl_a0),
      .ac_an_req_ld_core_tag(ac_an_req_ld_core_tag),
      .ac_an_req_ld_xfr_len(ac_an_req_ld_xfr_len),
      .ac_an_st_byte_enbl(ac_an_st_byte_enbl),
      .ac_an_st_data(ac_an_st_data),
      .ac_an_req_endian(ac_an_req_endian),
      .ac_an_st_data_pwr_token(ac_an_st_data_pwr_token)
   );

a2l2wb n0(
      .clk(clk_1x),
      .rst(rst),

      // request
      .ac_an_req_pwr_token(ac_an_req_pwr_token),
      .ac_an_req(ac_an_req),
      .ac_an_req_ra(ac_an_req_ra),
      .ac_an_req_ttype(ac_an_req_ttype),
      .ac_an_req_thread(ac_an_req_thread),
      .ac_an_req_ld_core_tag(ac_an_req_ld_core_tag),
      .ac_an_req_ld_xfr_len(ac_an_req_ld_xfr_len),
      .ac_an_st_data_pwr_token(ac_an_st_data_pwr_token),
      .ac_an_st_byte_enbl(ac_an_st_byte_enbl),
      .ac_an_st_data(ac_an_st_data),
      .ac_an_req_wimg_w(ac_an_req_wimg_w),
      .ac_an_req_wimg_i(ac_an_req_wimg_i),
      .ac_an_req_wimg_m(ac_an_req_wimg_m),
      .ac_an_req_wimg_g(ac_an_req_wimg_g),
      .ac_an_req_endian(ac_an_req_endian),
      .ac_an_req_user_defined(ac_an_req_user_defined),
      .ac_an_req_spare_ctrl_a0(ac_an_req_spare_ctrl_a0),

      // reload
      .an_ac_reld_data_vld(an_ac_reld_data_vld),
      .an_ac_reld_core_tag(an_ac_reld_core_tag),
      .an_ac_reld_data(an_ac_reld_data),
      .an_ac_reld_qw(an_ac_reld_qw),
      .an_ac_reld_ecc_err(an_ac_reld_ecc_err),
      .an_ac_reld_ecc_err_ue(an_ac_reld_ecc_err_ue),
      .an_ac_reld_data_coming(an_ac_reld_data_coming),
      .an_ac_reld_ditc(an_ac_reld_ditc),
      .an_ac_reld_crit_qw(an_ac_reld_crit_qw),
      .an_ac_reld_l1_dump(an_ac_reld_l1_dump),
      .an_ac_req_spare_ctrl_a1(an_ac_req_spare_ctrl_a1),

      // larx/stcx
      .an_ac_stcx_complete(an_ac_stcx_complete),
      .an_ac_stcx_pass(an_ac_stcx_pass),
      .an_ac_reservation_vld(an_ac_reservation_vld),

      // icbi
      .an_ac_icbi_ack(an_ac_icbi_ack),
      .an_ac_icbi_ack_thread(an_ac_icbi_ack_thread),

      // back invalidate
      .an_ac_back_inv(an_ac_back_inv),
      .an_ac_back_inv_addr(an_ac_back_inv_addr),
      .an_ac_back_inv_target(an_ac_back_inv_target),
      .an_ac_back_inv_local(an_ac_back_inv_local),
      .an_ac_back_inv_lbit(an_ac_back_inv_lbit),
      .an_ac_back_inv_gs(an_ac_back_inv_gs),
      .an_ac_back_inv_ind(an_ac_back_inv_ind),
      .an_ac_back_inv_lpar_id(an_ac_back_inv_lpar_id),
      .ac_an_back_inv_reject(ac_an_back_inv_reject),
      .ac_an_lpar_id(ac_an_lpar_id),

      // credits
      .an_ac_req_ld_pop(an_ac_req_ld_pop),
      .an_ac_req_st_pop(an_ac_req_st_pop),
      .an_ac_req_st_gather(an_ac_req_st_gather),
      .an_ac_sync_ack(an_ac_sync_ack),
      //.an_ac_pm_fetch_halt(an_ac_pm_fetch_halt),

      // misc
      //.an_ac_flh2l2_gate(an_ac_flh2l2_gate),
      //.an_ac_reset_1_complete(an_ac_reset_1_complete),
      //.an_ac_reset_2_complete(an_ac_reset_2_complete),
      //.an_ac_reset_3_complete(an_ac_reset_3_complete),
      //.an_ac_reset_wd_complete(an_ac_reset_wd_complete),
      //.an_ac_sleep_en(an_ac_sleep_en),
      //.an_ac_ext_interrupt(an_ac_ext_interrupt),
      //.an_ac_crit_interrupt(an_ac_crit_interrupt),
      //.an_ac_perf_interrupt(an_ac_perf_interrupt),
      //.an_ac_hang_pulse(an_ac_hang_pulse),
      //.an_ac_tb_update_enable(an_ac_tb_update_enable),
      //.an_ac_tb_update_pulse(an_ac_tb_update_pulse),
      //.an_ac_chipid_dc(an_ac_chipid_dc),
      //.an_ac_coreid(an_ac_coreid),
      //.an_ac_debug_stop(an_ac_debug_stop),
      //.ac_an_debug_trigger(ac_an_debug_trigger),
      //.an_ac_uncond_dbg_event(an_ac_uncond_dbg_event),

      // scom
      //.an_ac_scom_sat_id(an_ac_scom_sat_id),
      //.an_ac_scom_dch(an_ac_scom_dch),
      //.an_ac_scom_cch(an_ac_scom_cch),
      //.ac_an_scom_dch(ac_an_scom_dch),
      //.ac_an_scom_cch(ac_an_scom_cch),

      // errors
      //.ac_an_special_attn(ac_an_special_attn),
      //.ac_an_checkstop(ac_an_checkstop),
      //.ac_an_local_checkstop(ac_an_local_checkstop),
      //.ac_an_recov_err(ac_an_recov_err),
      //.ac_an_trace_error(ac_an_trace_error),
      //.ac_an_livelock_active(ac_an_livelock_active),
      .an_ac_checkstop(an_ac_checkstop),
      //.an_ac_external_mchk(an_ac_external_mchk),
      //.ac_an_machine_check(ac_an_machine_check),

      // perfmon
      //.ac_an_event_bus0(ac_an_event_bus0),
      //.ac_an_event_bus1(ac_an_event_bus1),

      // power
      //.ac_an_pm_thread_running(ac_an_pm_thread_running),
      //.an_ac_pm_thread_stop(an_ac_pm_thread_stop),
      //.ac_an_power_managed(ac_an_power_managed),
      //.ac_an_rvwinkle_mode(ac_an_rvwinkle_mode)
      // direct-attach mem
      .mem_adr(mem_adr),
      .mem_dat(mem_dat),
      .mem_wr_be(mem_wr_be),
      .mem_wr_val(mem_wr_val),

      .mem_wr_dat(mem_wr_dat),

      // wishbone
      .wb_stb(wb_stb),
      .wb_cyc(wb_cyc),
      .wb_adr(wb_adr),
      .wb_we(wb_we),
      .wb_ack(wb_ack),
      .wb_sel(wb_sel),
      .wb_datr(wb_datr),
      .wb_datw(wb_datw)

   );

endmodule
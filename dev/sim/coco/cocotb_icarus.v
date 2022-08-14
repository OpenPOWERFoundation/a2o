
`include "tri_a2o.vh"

`timescale 1ns / 1ns

module cocotb_icarus (

	 input                                                  clk,
    input                                                  reset,
	 input                                                  scan_in,
	 output                                                 scan_out,

	 // Pervasive clock control
	 input                                                  an_ac_rtim_sl_thold_8,
	 input                                                  an_ac_func_sl_thold_8,
	 input                                                  an_ac_func_nsl_thold_8,
	 input                                                  an_ac_ary_nsl_thold_8,
	 input                                                  an_ac_sg_8,
	 input                                                  an_ac_fce_8,
	 input [0:7]                                            an_ac_abst_scan_in,

	 // L2 LARX/STCX
  	 input [0:`THREADS-1]                                   an_ac_reservation_vld,
	 input [0:`THREADS-1]                                   an_ac_stcx_complete,
	 input [0:`THREADS-1]                                   an_ac_stcx_pass,

	 // ICBI ACK Interface
	 input                                                  an_ac_icbi_ack,
	 input [0:1]                                            an_ac_icbi_ack_thread,

	 // Back invalidate interface
	 input                                                  an_ac_back_inv,
	 input [64-`REAL_IFAR_WIDTH:63]                         an_ac_back_inv_addr,
	 input [0:4]                                            an_ac_back_inv_target,		// connect to bit(0)
	 input                                                  an_ac_back_inv_local,
	 input                                                  an_ac_back_inv_lbit,
	 input                                                  an_ac_back_inv_gs,
	 input                                                  an_ac_back_inv_ind,
	 input [0:7]                                            an_ac_back_inv_lpar_id,
	 output                                                 ac_an_back_inv_reject,
	 output [0:7]                                           ac_an_lpar_id,

	 // L2 Reload Inputs
	 input                                                  an_ac_reld_data_vld,		// reload data is coming next cycle
	 input [0:4]                                            an_ac_reld_core_tag,		// reload data destinatoin tag (which load queue)
	 input [0:127]                                          an_ac_reld_data,		// Reload Data
	 input [58:59]                                          an_ac_reld_qw,		// quadword address of reload data beat
	 input                                                  an_ac_reld_ecc_err,		// Reload Data contains a Correctable ECC error
	 input                                                  an_ac_reld_ecc_err_ue,		// Reload Data contains an Uncorrectable ECC error
	 input                                                  an_ac_reld_data_coming,
	 input                                                  an_ac_reld_ditc,
	 input                                                  an_ac_reld_crit_qw,
	 input                                                  an_ac_reld_l1_dump,
	 input [0:3]                                            an_ac_req_spare_ctrl_a1,		// spare control bits from L2

	 // load/store credit control
	 input                                                  an_ac_flh2l2_gate,		// Gate L1 Hit forwarding SPR config bit
	 input                                                  an_ac_req_ld_pop,		// credit for a load (L2 can take a load command)
	 input                                                  an_ac_req_st_pop,		// credit for a store (L2 can take a store command)
	 input                                                  an_ac_req_st_gather,		// credit for a store due to L2 gathering of store commands
	 input [0:`THREADS-1]                                   an_ac_sync_ack,

	 //SCOM Satellite
	 input [0:3]                                            an_ac_scom_sat_id,
	 input                                                  an_ac_scom_dch,
	 input                                                  an_ac_scom_cch,
	 output                                                 ac_an_scom_dch,
	 output                                                 ac_an_scom_cch,

	 // FIR and Error Signals
	 output [0:`THREADS-1]                                  ac_an_special_attn,
	 output [0:2]                                           ac_an_checkstop,
	 output [0:2]                                           ac_an_local_checkstop,
	 output [0:2]                                           ac_an_recov_err,
	 output                                                 ac_an_trace_error,
    output                                                 ac_an_livelock_active,
	 input                                                  an_ac_checkstop,
	 input [0:`THREADS-1]                                   an_ac_external_mchk,

	 // Perfmon Event Bus
	 output [0:4*`THREADS-1]                                ac_an_event_bus0,
	 output [0:4*`THREADS-1]                                ac_an_event_bus1,

	 // Reset related
	 input                                                  an_ac_reset_1_complete,
	 input                                                  an_ac_reset_2_complete,
	 input                                                  an_ac_reset_3_complete,
	 input                                                  an_ac_reset_wd_complete,

	 // Power Management
	 output [0:`THREADS-1]                                  ac_an_pm_thread_running,
	 input [0:`THREADS-1]                                   an_ac_pm_thread_stop,
	 input [0:`THREADS-1]                                   an_ac_pm_fetch_halt,
	 output                                                 ac_an_power_managed,
	 output                                                 ac_an_rvwinkle_mode,

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
	 input [0:8]                                            an_ac_scan_type_dc,

	 // Pervasive
	 output                                                 ac_an_reset_1_request,
	 output                                                 ac_an_reset_2_request,
	 output                                                 ac_an_reset_3_request,
	 output                                                 ac_an_reset_wd_request,
	 input                                                  an_ac_lbist_ary_wrt_thru_dc,
	 input [0:`THREADS-1]                                   an_ac_sleep_en,
	 input [0:`THREADS-1]                                   an_ac_ext_interrupt,
	 input [0:`THREADS-1]                                   an_ac_crit_interrupt,
	 input [0:`THREADS-1]                                   an_ac_perf_interrupt,
	 input [0:`THREADS-1]                                   an_ac_hang_pulse,
	 input                                                  an_ac_tb_update_enable,
	 input                                                  an_ac_tb_update_pulse,
	 input [0:3]                                            an_ac_chipid_dc,
	 input [0:7]                                            an_ac_coreid,
	 output [0:`THREADS-1]                                  ac_an_machine_check,
	 input                                                  an_ac_debug_stop,
	 output [0:`THREADS-1]                                  ac_an_debug_trigger,
	 input [0:`THREADS-1]                                   an_ac_uncond_dbg_event,
	 output [0:31]                                          ac_an_debug_bus,
	 output                                                 ac_an_coretrace_first_valid,	// coretrace_ctrls[0]
	 output							                             ac_an_coretrace_valid,		// coretrace_ctrls[1]
	 output	[0:1]						                          ac_an_coretrace_type,		// coretrace_ctrls[2:3]

	 // L2 Outputs
	 output                                                 ac_an_req_pwr_token,		// power token for command coming next cycle
	 output                                                 ac_an_req,		// command request valid
	 output [64-`REAL_IFAR_WIDTH:63]                        ac_an_req_ra,		// real address for request
	 output [0:5]                                           ac_an_req_ttype,		// command (transaction) type
	 output [0:2]                                           ac_an_req_thread,		// encoded thread ID
	 output                                                 ac_an_req_wimg_w,		// write-through
	 output                                                 ac_an_req_wimg_i,		// cache-inhibited
	 output                                                 ac_an_req_wimg_m,		// memory coherence required
	 output                                                 ac_an_req_wimg_g,		// guarded memory
	 output [0:3]                                           ac_an_req_user_defined,		// User Defined Bits
	 output [0:3]                                           ac_an_req_spare_ctrl_a0,		// Spare bits
	 output [0:4]                                           ac_an_req_ld_core_tag,		// load command tag (which load Q)
	 output [0:2]                                           ac_an_req_ld_xfr_len,		// transfer length for non-cacheable load
	 output [0:31]                                          ac_an_st_byte_enbl,		// byte enables for store data
	 output [0:255]                                         ac_an_st_data,		// store data
	 output                                                 ac_an_req_endian,		// endian mode (0=big endian, 1=little endian)
	 output                                                 ac_an_st_data_pwr_token		// store data power token
);

c c0(
      //  generic map (
      //       EXPAND_TYPE         => EXPAND_TYPE
      //  );

      .clk(clk),
      .rst(rst),
      .scan_in(scan_in),
      .scan_out(scan_out),

      // Pervasive clock control
      .an_ac_rtim_sl_thold_8(an_ac_rtim_sl_thold_8),
      .an_ac_func_sl_thold_8(an_ac_func_sl_thold_8),
      .an_ac_func_nsl_thold_8(an_ac_func_nsl_thold_8),
      .an_ac_ary_nsl_thold_8(an_ac_ary_nsl_thold_8),
      .an_ac_sg_8(an_ac_sg_8),
      .an_ac_fce_8(an_ac_fce_8),
      .an_ac_abst_scan_in(an_ac_abst_scan_in),

      // L2 STCX complete
      .an_ac_stcx_complete(an_ac_stcx_complete),
      .an_ac_stcx_pass(an_ac_stcx_pass),

      // ICBI ACK Interface
      .an_ac_icbi_ack(an_ac_icbi_ack),
      .an_ac_icbi_ack_thread(an_ac_icbi_ack_thread),

      // Back invalidate interface
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

      // L2 Reload Inputs
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

      // load/store credit control
      .an_ac_flh2l2_gate(an_ac_flh2l2_gate),
      .an_ac_req_ld_pop(an_ac_req_ld_pop),
      .an_ac_req_st_pop(an_ac_req_st_pop),
      .an_ac_req_st_gather(an_ac_req_st_gather),
      .an_ac_sync_ack(an_ac_sync_ack),
      .an_ac_pm_fetch_halt(an_ac_pm_fetch_halt),

      //SCOM Satellite
      .an_ac_scom_sat_id(an_ac_scom_sat_id),
      .an_ac_scom_dch(an_ac_scom_dch),
      .an_ac_scom_cch(an_ac_scom_cch),
      .ac_an_scom_dch(ac_an_scom_dch),
      .ac_an_scom_cch(ac_an_scom_cch),

      // FIR and Error Signals
      .ac_an_special_attn(ac_an_special_attn),
      .ac_an_checkstop(ac_an_checkstop),
      .ac_an_local_checkstop(ac_an_local_checkstop),
      .ac_an_recov_err(ac_an_recov_err),
      .ac_an_trace_error(ac_an_trace_error),
      .ac_an_livelock_active(ac_an_livelock_active),
      .an_ac_checkstop(an_ac_checkstop),
      .an_ac_external_mchk(an_ac_external_mchk),

      // Perfmon Event Bus
      .ac_an_event_bus0(ac_an_event_bus0),
      .ac_an_event_bus1(ac_an_event_bus1),

      // Reset related
      .an_ac_reset_1_complete(an_ac_reset_1_complete),
      .an_ac_reset_2_complete(an_ac_reset_2_complete),
      .an_ac_reset_3_complete(an_ac_reset_3_complete),
      .an_ac_reset_wd_complete(an_ac_reset_wd_complete),

      // Power Management
      .ac_an_pm_thread_running(ac_an_pm_thread_running),
      .an_ac_pm_thread_stop(an_ac_pm_thread_stop),
      .ac_an_power_managed(ac_an_power_managed),
      .ac_an_rvwinkle_mode(ac_an_rvwinkle_mode),

      // Clock, Test, and LCB Controls
      .an_ac_gsd_test_enable_dc(an_ac_gsd_test_enable_dc),
      .an_ac_gsd_test_acmode_dc(an_ac_gsd_test_acmode_dc),
      .an_ac_ccflush_dc(an_ac_ccflush_dc),
      .an_ac_ccenable_dc(an_ac_ccenable_dc),
      .an_ac_lbist_en_dc(an_ac_lbist_en_dc),
      .an_ac_lbist_ip_dc(an_ac_lbist_ip_dc),
      .an_ac_lbist_ac_mode_dc(an_ac_lbist_ac_mode_dc),
      .an_ac_scan_diag_dc(an_ac_scan_diag_dc),
      .an_ac_scan_dis_dc_b(an_ac_scan_dis_dc_b),

      //Thold input to clock control macro
      .an_ac_scan_type_dc(an_ac_scan_type_dc),

      // Pervasive
      .ac_an_reset_1_request(ac_an_reset_1_request),
      .ac_an_reset_2_request(ac_an_reset_2_request),
      .ac_an_reset_3_request(ac_an_reset_3_request),
      .ac_an_reset_wd_request(ac_an_reset_wd_request),
      .an_ac_lbist_ary_wrt_thru_dc(an_ac_lbist_ary_wrt_thru_dc),
      .an_ac_reservation_vld(an_ac_reservation_vld),
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

      // L2 Outputs
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

initial begin
  $dumpfile ("a2ocore.vcd");
  // you can do it by levels and also by module so could prune down
  $dumpvars;
  // need to explicitly specify arrays for icarus
  // guess not: $dumpvars cannot dump a vpiMemory
  //$dumpvars(0, c0.iuq0.iuq_slice_top0.slice0.iuq_ibuf0.buffer_data_q);
  #1;
end

endmodule
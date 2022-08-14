
`include "tri_a2o.vh"

`timescale 1ns / 1ns

module cocotb_icarus_node (

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
	 input [0:7]                                            an_ac_abst_scan_in,

	 //SCOM Satellite
	 input [0:3]                                            an_ac_scom_sat_id,
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
	 input [0:`THREADS-1]                                   an_ac_external_mchk,
    output                                                 an_ac_checkstop,

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
	 input                                                  an_ac_flh2l2_gate,

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
	 input [0:8]                                            an_ac_scan_type_dc,
*/

	 // Pervasive
	 output                                                 ac_an_reset_1_request,
	 output                                                 ac_an_reset_2_request,
	 output                                                 ac_an_reset_3_request,
	 output                                                 ac_an_reset_wd_request,
/*
	 input                                                  an_ac_lbist_ary_wrt_thru_dc,
*/
	 input [0:`THREADS-1]                                   an_ac_sleep_en,
	 input [0:`THREADS-1]                                   an_ac_ext_interrupt,
	 input [0:`THREADS-1]                                   an_ac_crit_interrupt,
	 input [0:`THREADS-1]                                   an_ac_perf_interrupt,
	 input [0:`THREADS-1]                                   an_ac_hang_pulse,
	 input                                                  an_ac_tb_update_enable,
	 input                                                  an_ac_tb_update_pulse,
/*
	 input [0:3]                                            an_ac_chipid_dc,
	 input [0:7]                                            an_ac_coreid,
*/
	 output [0:`THREADS-1]                                  ac_an_machine_check,
	 input                                                  an_ac_debug_stop,
	 output [0:`THREADS-1]                                  ac_an_debug_trigger,
	 input [0:`THREADS-1]                                   an_ac_uncond_dbg_event,
	 output [0:31]                                          ac_an_debug_bus,
	 output                                                 ac_an_coretrace_first_valid,
	 output							                             ac_an_coretrace_valid,
	 output	[0:1]						                          ac_an_coretrace_type,

    output [0:31]                                          mem_adr,
    input  [0:127]                                         mem_dat,
    output                                                 mem_wr_val,
    output [0:15]                                          mem_wr_be,
    output [0:127]                                         mem_wr_dat,

    output                                                 wb_stb,
    output                                                 wb_cyc,
    output [31:0]                                          wb_adr,
    output                                                 wb_we,
    output [3:0]                                           wb_sel,
    output [31:0]                                          wb_datw,
    input                                                  wb_ack,
    input  [31:0]                                          wb_datr

);

a2owb c0 (
      .clk(clk),
      .rst(rst),
      .scan_in(scan_in),
      .scan_out(scan_out),

/*
      // Pervasive clock control
      .an_ac_rtim_sl_thold_8(an_ac_rtim_sl_thold_8),
      .an_ac_func_sl_thold_8(an_ac_func_sl_thold_8),
      .an_ac_func_nsl_thold_8(an_ac_func_nsl_thold_8),
      .an_ac_ary_nsl_thold_8(an_ac_ary_nsl_thold_8),
      .an_ac_sg_8(an_ac_sg_8),
      .an_ac_fce_8(an_ac_fce_8),
      .an_ac_abst_scan_in(an_ac_abst_scan_in),

      //SCOM Satellite
      .an_ac_scom_sat_id(an_ac_scom_sat_id),
      .an_ac_scom_dch(an_ac_scom_dch),
      .an_ac_scom_cch(an_ac_scom_cch),
*/
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
      .an_ac_pm_fetch_halt(an_ac_pm_fetch_halt),

/*
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
*/
      // Pervasive
      .ac_an_reset_1_request(ac_an_reset_1_request),
      .ac_an_reset_2_request(ac_an_reset_2_request),
      .ac_an_reset_3_request(ac_an_reset_3_request),
      .ac_an_reset_wd_request(ac_an_reset_wd_request),
/*
      .an_ac_lbist_ary_wrt_thru_dc(an_ac_lbist_ary_wrt_thru_dc),
*/
      .an_ac_sleep_en(an_ac_sleep_en),
      .an_ac_ext_interrupt(an_ac_ext_interrupt),
      .an_ac_crit_interrupt(an_ac_crit_interrupt),
      .an_ac_perf_interrupt(an_ac_perf_interrupt),
      .an_ac_hang_pulse(an_ac_hang_pulse),
      .an_ac_tb_update_enable(an_ac_tb_update_enable),
      .an_ac_tb_update_pulse(an_ac_tb_update_pulse),
/*
      .an_ac_chipid_dc(an_ac_chipid_dc),
      .an_ac_coreid(an_ac_coreid),
*/
      .ac_an_machine_check(ac_an_machine_check),
      .an_ac_debug_stop(an_ac_debug_stop),
      .ac_an_debug_trigger(ac_an_debug_trigger),
      .an_ac_uncond_dbg_event(an_ac_uncond_dbg_event),

      // direct-attach mem
      .mem_adr(mem_adr),
      .mem_dat(mem_dat),
      .mem_wr_val(mem_wr_val),
      .mem_wr_be(mem_wr_be),
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

initial begin
  $dumpfile ("a2onode.vcd");
  // you can do it by levels and also by module so could prune down
  $dumpvars;
  // need to explicitly specify arrays for icarus
  // guess not: $dumpvars cannot dump a vpiMemory
  //$dumpvars(0, c0.iuq0.iuq_slice_top0.slice0.iuq_ibuf0.buffer_data_q);
  #1;
end

endmodule
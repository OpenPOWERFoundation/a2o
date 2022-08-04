
# Create Project

create_project -force -name cmod7_kintex -part xc7k410t-ffv676-1
set_msg_config -id {Common 17-55} -new_severity {Warning}

# Add Sources

add_files {/data/projects/a2o/dev/build/litex/a2o/verilog/a2o_litex}
add_files {/data/projects/a2o/dev/build/litex/a2o/verilog/trilib}
add_files {/data/projects/a2o/dev/build/litex/a2o/verilog/trilib_clk1x}
add_files {/data/projects/a2o/dev/build/litex/a2o/verilog/work}
read_verilog {/data/projects/a2o/dev/build/litex/build/cmod7_kintex/gateware/cmod7_kintex.v}

# Add EDIFs


# Add IPs


# Add constraints

read_xdc cmod7_kintex.xdc
set_property PROCESSING_ORDER EARLY [get_files cmod7_kintex.xdc]

# Add pre-synthesis commands


# Synthesis

synth_design -directive default -top cmod7_kintex -part xc7k410t-ffv676-1

# Synthesis report

report_timing_summary -file cmod7_kintex_timing_synth.rpt
report_utilization -hierarchical -file cmod7_kintex_utilization_hierarchical_synth.rpt
report_utilization -file cmod7_kintex_utilization_synth.rpt

# Optimize design

opt_design -directive default

# Add pre-placement commands


# Placement

place_design -directive default

# Placement report

report_utilization -hierarchical -file cmod7_kintex_utilization_hierarchical_place.rpt
report_utilization -file cmod7_kintex_utilization_place.rpt
report_io -file cmod7_kintex_io.rpt
report_control_sets -verbose -file cmod7_kintex_control_sets.rpt
report_clock_utilization -file cmod7_kintex_clock_utilization.rpt

# Add pre-routing commands


# Routing

route_design -directive default
phys_opt_design -directive default
write_checkpoint -force cmod7_kintex_route.dcp

# Routing report

report_timing_summary -no_header -no_detailed_paths
report_route_status -file cmod7_kintex_route_status.rpt
report_drc -file cmod7_kintex_drc.rpt
report_timing_summary -datasheet -max_paths 10 -file cmod7_kintex_timing.rpt
report_power -file cmod7_kintex_power.rpt

# Bitstream generation

write_bitstream -force cmod7_kintex.bit 

# End

quit
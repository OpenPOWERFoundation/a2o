################################################################################
# IO constraints
################################################################################
# serial:0.tx
set_property LOC J18 [get_ports {serial_tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_tx}]

# serial:0.rx
set_property LOC J17 [get_ports {serial_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_rx}]

# clk12:0
set_property LOC F22 [get_ports {clk12}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk12}]

# user_led:0
set_property LOC A17 [get_ports {user_led0}]
set_property IOSTANDARD LVCMOS33 [get_ports {user_led0}]

# user_led:1
set_property LOC C16 [get_ports {user_led1}]
set_property IOSTANDARD LVCMOS33 [get_ports {user_led1}]

# user_btn:0
set_property LOC A18 [get_ports {user_btn0}]
set_property IOSTANDARD LVCMOS33 [get_ports {user_btn0}]

# user_btn:1
set_property LOC B18 [get_ports {user_btn1}]
set_property IOSTANDARD LVCMOS33 [get_ports {user_btn1}]

################################################################################
# Design constraints
################################################################################

################################################################################
# Clock constraints
################################################################################


create_clock -name clk12 -period 83.333 [get_ports clk12]

set_clock_groups -group [get_clocks -include_generated_clocks -of [get_nets sys_clk]] -group [get_clocks -include_generated_clocks -of [get_nets crg_clkin]] -asynchronous

################################################################################
# False path constraints
################################################################################


set_false_path -quiet -through [get_nets -hierarchical -filter {mr_ff == TRUE}]

set_false_path -quiet -to [get_pins -filter {REF_PIN_NAME == PRE} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE || ars_ff2 == TRUE}]]

set_max_delay 2 -quiet -from [get_pins -filter {REF_PIN_NAME == C} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE}]] -to [get_pins -filter {REF_PIN_NAME == D} -of_objects [get_cells -hierarchical -filter {ars_ff2 == TRUE}]]
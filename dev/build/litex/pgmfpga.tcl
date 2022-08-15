# vivado -mode tcl -source pgmfpga.tcl

open_hw_manager

connect_hw_server
current_hw_target [get_hw_targets */xilinx_tcf/Digilent/*]
open_hw_target

set dev [lindex [get_hw_devices] 0]
current_hw_device $dev
refresh_hw_device -update_hw_probes false $dev
set_property PROGRAM.FILE {./cmod7.bit} $dev
#set_property PROBES.FILE {./cmod7.ltx} $dev

program_hw_devices $dev
refresh_hw_device $dev

puts "Device programmed."

quit

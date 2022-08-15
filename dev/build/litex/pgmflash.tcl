# vivado -mode tcl -source pgmflash.tcl
# can also use this to load ~2 MB of bootable code/data
# can also load multiple bitstreams by changing address
#
# does this 'erase' the memory or make it unusable or ???
# delete_hw_cfgmem [current_hw_cfgmem]

open_hw_manager

connect_hw_server
current_hw_target [get_hw_targets */xilinx_tcf/Digilent/*]
open_hw_target

set dev [lindex [get_hw_devices] 0]
current_hw_device $dev
refresh_hw_device -update_hw_probes false $dev

# select n25q32-3.3v-spi-x1-x2-x4 flash (32Mb)
# should check get_hw_cfgmems to see if exists, and use lindex 0 if there?
# get_hw_cfgmems
# cfgmem_0
create_hw_cfgmem -hw_device $dev [lindex [get_cfgmem_parts {n25q32-3.3v-spi-x1_x2_x4}] 0]
set_property PROGRAM.BLANK_CHECK  0 [ get_property PROGRAM.HW_CFGMEM $dev
set_property PROGRAM.ERASE  1 [ get_property PROGRAM.HW_CFGMEM $dev
set_property PROGRAM.CFG_PROGRAM  1 [ get_property PROGRAM.HW_CFGMEM $dev
set_property PROGRAM.VERIFY  1 [ get_property PROGRAM.HW_CFGMEM $dev
set_property PROGRAM.CHECKSUM  0 [ get_property PROGRAM.HW_CFGMEM $dev
refresh_hw_device $dev

# when not a compressed bitstream and -size 2:
# ERROR: [Writecfgmem 68-4] Bitstream at address 0x00000000 has size 2192012 bytes which cannot fit in memory of size 2097152 bytes.
# -rw-rw-r-- 1 wtf wtf 2192113 Nov  9 07:43 cmod7.bit
#  need to get this to be set in soc:
#  set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
write_cfgmem -format mcs -size 4 -interface SMAPx8 -loadbit {up 0x00000000 ./cmod7.bit} ./cmod7.mcs
program_hw_cfgmem [current_hw_cfgmem]

refresh_hw_device $dev

puts "Device programmed."

quit



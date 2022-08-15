open_run impl_1

catch {
   report_utilization -cells [get_cells -hierarchical A2P_WB*] -file cells_utilization.txt
}

catch {
   report_utilization -cells [get_cells -hierarchical *_zz*]   -append -file cells_utilization.txt
}
catch {
   report_utilization -cells [get_cells -hierarchical dBusWB*] -append -file cells_utilization.txt
}
catch {
   report_utilization -cells [get_cells -hierarchical iBusWB*] -append -file cells_utilization.txt
}

catch {
   report_utilization -cells [get_cells -hierarchical execute_MemoryTranslatorPlugin*] -append -file cells_utilization.txt
   report_utilization -cells [get_cells -hierarchical MemoryTranslatorPlugin*] -append -file cells_utilization.txt
}

report_utilization -cells [get_cells -hierarchical RegFilePlugin*] -append -file cells_utilization.txt
catch {
   report_utilization -cells [get_cells -hierarchical SPRPlugin*] -append -file cells_utilization.txt
}

# egrep "Command|Slice LUT|Muxes" cells_utilization.txt

# stages
report_utilization -cells [get_cells -hierarchical IBusCachedPlugin*] -append -file cells_utilization.txt
catch {
   report_utilization -cells [get_cells -hierarchical IBusCachedPlugin_fetchPc_*] -append -file cells_utilization.txt
   report_utilization -cells [get_cells -hierarchical IBusCachedPlugin_predictor_*] -append -file cells_utilization.txt
   report_utilization -cells [get_cells -hierarchical IBusCachedPlugin_injector_*] -append -file cells_utilization.txt
}
report_utilization -cells [get_cells -hierarchical decode_*] -append -file cells_utilization.txt
report_utilization -cells [get_cells -hierarchical execute_*] -append -file cells_utilization.txt
catch {
   report_utilization -cells [get_cells -hierarchical execute_BranchPlugin*] -append -file cells_utilization.txt
}
#went away when i added areas below!
#report_utilization -cells [get_cells -hierarchical execute_IntAluPlugin*] -append -file cells_utilization.txt
#why are these gone with donttouch?
#report_utilization -cells [get_cells -hierarchical execute_DBusCachedPlugin*] -append -file cells_utilization.txt
report_utilization -cells [get_cells -hierarchical memory_*] -append -file cells_utilization.txt
report_utilization -cells [get_cells -hierarchical writeBack_*] -append -file cells_utilization.txt


# new stuff!  got areas named
catch {
   report_utilization -cells [get_cells -hierarchical Hazards*] -append -file cells_utilization.txt
   report_utilization -cells [get_cells -hierarchical *DECODER*] -append -file cells_utilization.txt
   report_utilization -cells [get_cells -hierarchical *SRC1*] -append -file cells_utilization.txt
   #?report_utilization -cells [get_cells -hierarchical *SRC2*] -append -file cells_utilization.txt
   #report_utilization -cells [get_cells -hierarchical *ALU1*] -append -file cells_utilization.txt
   report_utilization -cells [get_cells -hierarchical *ALU2*] -append -file cells_utilization.txt
   #?report_utilization -cells [get_cells -hierarchical *MUL1*] -append -file cells_utilization.txt
   #?report_utilization -cells [get_cells -hierarchical *MUL2*] -append -file cells_utilization.txt
   #?report_utilization -cells [get_cells -hierarchical *MUL3*] -append -file cells_utilization.txt
   report_utilization -cells [get_cells -hierarchical *MULDIV*] -append -file cells_utilization.txt
   report_utilization -cells [get_cells -hierarchical *MULDIV1*] -append -file cells_utilization.txt
   #?report_utilization -cells [get_cells -hierarchical *MULDIV2*] -append -file cells_utilization.txt
}

### cells

# LUT
set outFile [open {cells_lut.txt} w]

#set cells [get_cells -hier -filter {PARENT == A2P_WB}]
set cells [get_cells -hier -filter {PARENT == a2p_i/A2P_WB/inst}]vrv_i/VexRiscv_0/inst
set cells [get_cells -hier -filter {PARENT == vrv_i/VexRiscv_0/inst}]

set names {}

puts ""
puts "Cells (non-flop)"
foreach cell $cells {
   set name [get_property NAME $cell]
   if {[get_property PRIMITIVE_GROUP $cell] != "LUT"} {
      if {[get_property PRIMITIVE_GROUP $cell] != "FLOP_LATCH"} {
         # OTHERS CARRY MUXFX BMEM MULT [EMPTY=MACRO TOP]
         puts "Not a LUT or FLOP_LATCH: [get_property PRIMITIVE_GROUP $cell] $name"
      }
   } else {
      #puts $name
      puts $outFile $name
      lappend names $name
   }
}
puts "Cells (nonflop): [llength $names]"
close $outFile

# flops
set outFile [open {cells_ff.txt} w]

#set cells [get_cells -hier -filter {(PRIMITIVE_TYPE =~ FLOP*) && (PARENT == A2P_WB)}]
set cells [get_cells -hier -filter {(PRIMITIVE_TYPE =~ FLOP*) && (PARENT == a2p_i/A2P_WB/inst)}]
set cells [get_cells -hier -filter {(PRIMITIVE_TYPE =~ FLOP*) && (PARENT == vrv_i/VexRiscv_0/inst)}]
set names {}

puts ""
puts "Flops"
foreach cell $cells {
   set name [get_property NAME $cell]
   #puts $name
   puts $outFile $name
   lappend names $name
}
puts "Flops: [llength $names]"
close $outFile
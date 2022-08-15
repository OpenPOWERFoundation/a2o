proc startsim {} {
   launch_simulation -mode behavioral
   open_wave_config {wtf.wcfg}   
   restart
   source {sim.tcl}
}

proc rerun {} {
   restart
   source {sim.tcl}
}

proc jumpctr {{runCycs 100} {value 4} {stickCycs 5}} {
   set f [add_force A2P_WB/execute_BranchPlugin_CTR -radix dec $value]
   runCyc $stickCycs
   remove_forces $f
   runCyc $runCycs
}
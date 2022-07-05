# init for a2o

# install acts on highlighted traces; filter=0 uninstalls

#set which_f [gtkwave::setCurrentTranslateFile ./gtkf-alias.py]
#puts "$which_f"
#gtkwave::installFileFilter $which_f

#set which_f [gtkwave::setCurrentTranslateProc ./gtkf-ppc.py]
#puts "$which_f"
#gtkwave::installProcFilter $which_f

set sigs [gtkwave::getDisplayedSignals]
puts "$sigs"

# cant figure out how to unhighlight all; somehow it is remembering after reinvoke
# unhighlight all
foreach sig $sigs {
   puts "$sig off"
   gtkwave::setTraceHighlightFromNameMatch $sig off
}

# highlight bus
set h [list {A2L2_AC_AN}]  ;# combined - does it work?
set n [gtkwave::highlightSignalsFromList $h]

if {$h > 0} {
   set f [gtkwave::setCurrentTranslateTransProc ./gtkf-a2l2.py]
   gtkwave::installTransFilter $f
} else {
   puts "Didn't apply trans filter to [lindex $h 0]"
}


#!/usr/bin/wish

set sig_list [list]

set nfacs [ gtkwave::getNumFacs ]

for {set i 0} {$i < $nfacs } {incr i} {
    set facname [ gtkwave::getFacName $i ]
    #puts "$i: $facname"
    #Only top level show
    set d_cnt [expr {[llength [split $facname "."]] - 1}]
    if { $d_cnt == 1 } {lappend sig_list $facname}}

set num_added [ gtkwave::addSignalsFromList $sig_list ]

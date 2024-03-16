set fh [open input.txt r]
set data [read $fh]
set data1 [split $data "\n"]
close $fh
set list1 ""
set list2 ""
set list3 ""
set result ""
set fh1 [open output.txt a+]
foreach i [lrange $data1 0 end-1]  {
           set j [list [lindex $i 0] [lindex $i 2] [lindex $i 3] [lindex $i 1]]
           puts $fh1 "$j"
           lappend list1 $j
        }
        #puts $list1
close $fh1
set fh2 [open input2.txt r]
set data3 [read $fh2]
set data4 [split $data3 "\n"]
#puts $data4
close $fh2
foreach i $data4 {
       foreach j $list1 {
               if { [lindex $i 1]==[lindex $j 0]} {
                       lappend list2 $j
               }}}
#puts $list2
foreach i $list2 {
        lappend list3 [lindex $i 3]
}
proc fibonacci {list3} {
        set result {}
        set sum 0
        foreach i $list3 {
                set sum [expr {$sum+$i}]
                lappend result $sum
        }
        return $result
}
set total_delay [fibonacci $list3]
#puts $total_delay
set list4 [linsert $total_delay 0 "TOTAL_DELAY"]
#puts $total_delay
set list2 [linsert $list2 0 [lindex $list1 0]]
for {set i 0} {$i<5} {incr i} {
        set list5 [concat [lindex $list2 $i] [lindex $list4 $i]]
        puts $list5
        lappend result $list5
}
puts $result
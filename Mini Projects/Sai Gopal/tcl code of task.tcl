set f1 [open "file_input1.txt" r]
set fr [read $f1]
set f2 [open "file_input2.txt" r]
set fr1 [read $f2]

puts "Content of file_input1.txt:"
puts $fr
puts "\nContent of file_input2.txt:"
puts $fr1
proc calculate_total_delay {delay_of_cell delay_of_previous_stage} {
    set total_delay [expr $col1 + $delay_of_previous_stage]
    return $total_delay
}
set total_delay_of_previous_stage 0.0
set rol1_list {}
set rol2_list {}

foreach line2 [split $fr1 "\n"] {

        lappend rol1_list [lindex $line2 0]
        lappend rol2_list [lindex $line2 1]
    }

puts "\nCell Names:"
puts $rol2_list
puts "\nCorresponding Data:"

foreach cell_name  $rol2_list  {
    foreach line1 [split $fr "\n"] {
        set fields [split $line 1 "\t"]
        if {[lindex $fields 0] eq $cell_name} {
            set trans [lindex $fields 2]
            set col3 [lindex $fields 3]
            set col1 [lindex $fields 1]
            set total_delay_of_previous_stage [calculate_total_delay $col1 $total_delay_of_previous_stage]

            puts "$cell_name\t\t$trans\t\t$load\t\t$delay_of_cell\t\t$total_delay_of_previous_stage"
            break
        }
    }
}
close $f1
close $f2

~                                                                                                                                                                                                   ~
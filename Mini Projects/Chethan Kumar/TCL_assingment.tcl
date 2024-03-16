##extarcting the contensts


set input_file [open input.txt r]
set input2_file [open input2.txt r]
set output_file [open file3.txt w+]


set cells_to_extract {}
while {[gets $input2_file line] >= 0} {
   lassign $line cell_name pattern
   lappend cells_to_extract $pattern
}
puts $output_file "Name\tTrans\tLoad\tDelay\t"

while {[gets $input_file line] >= 0} {
   set cell_name [lindex $line 0]

   
   foreach pattern $cells_to_extract {
       if {[string match $pattern $cell_name]} {
           puts $output_file $line
           break
       }
   }
}


close $input_file
close $input2_file
close $output_file


##Computing the total delay


set inputFile [open "file3.txt" "r"]
set outputFile [open "total_delay.txt" "w"]

puts $outputFile "Name\tTrans\tLoad\tDelay\tTotalDelay"

set totalDelay 0.0
while {[gets $inputFile line] != -1} {
    set details [split $line]
    set cellName [lindex $details 0]
    set trans [lindex $details 1]
    set load [lindex $details 2]
    
   
    set delayList [regexp -all -inline -nocase {\d+(\.\d+)?} [lindex $details 3]]
    if {[llength $delayList] > 0} {
        set delay [lindex $delayList 0]
    } else {
        set delay ""
    }
    
    if {[string is double -strict $delay]} {
        set totalDelay [expr {$delay + $totalDelay}]
        puts $outputFile "$cellName\t$trans\t$load\t$delay\t$totalDelay ns"
    } 
}
close $inputFile
close $outputFile



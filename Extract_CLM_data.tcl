# Convert the C.pfb to .txt file using TCL script.

lappend   auto_path $env(PARFLOW_DIR)/bin
package   require parflow
namespace import Parflow::*

set tcl_precision 16
pfset FileVersion    4

set runname SA_005

puts "Convert PFB to TXT"
set Tend 9504

#loop through variables and  write text files

for {set j 1} {$j <=$Tend} {incr j} {
            puts "File: $j"
            set fin [format $runname.out.clm_output.%05d.C.pfb $j]
            puts $fin
            set input [pfload $fin]
            set fout [format $runname.out.clm_output.%05d.txt $j]
            pfsave $input  -sa $fout
            pfdelete $input
	    file delete -force $fin
         }
     	 
puts "...Done with year $runname pressure file conversions"


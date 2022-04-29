#Import the ParFlow TCL package

lappend   auto_path $env(PARFLOW_DIR)/bin
package   require parflow
namespace import Parflow::*

set tcl_precision 16

#-----------------------------------------------------------------------------
#File input version number
#-----------------------------------------------------------------------------
pfset FileVersion 4

set runname SA_015

#-----------------------------------------------------------------------------
#Process Topology
#-----------------------------------------------------------------------------
pfset Process.Topology.P        1
pfset Process.Topology.Q        1
pfset Process.Topology.R        1
#-----------------------------------------------------------------------------
#Computational Grid
#-----------------------------------------------------------------------------
pfset ComputationalGrid.Lower.X           0.0
pfset ComputationalGrid.Lower.Y           0.0
pfset ComputationalGrid.Lower.Z           0.0

pfset ComputationalGrid.DX                50.0
pfset ComputationalGrid.DY                50.0
pfset ComputationalGrid.DZ                0.2

pfset ComputationalGrid.NX                58
pfset ComputationalGrid.NY                54
pfset ComputationalGrid.NZ                50

#-----------------------------------------------------------------------------
#Names of the GeomInputs
#-----------------------------------------------------------------------------
pfset GeomInput.Names                     "box_input indi_input"

#-----------------------------------------------------------------------------
#Domain Geometry Input
#-----------------------------------------------------------------------------
pfset GeomInput.box_input.InputType      Box
pfset GeomInput.box_input.GeomName      domain

#-----------------------------------------------------------------------------
#Domain Geometry
#-----------------------------------------------------------------------------

pfset Geom.domain.Lower.X                        0.0
pfset Geom.domain.Lower.Y                        0.0
pfset Geom.domain.Lower.Z                        0.0

pfset Geom.domain.Upper.X                        2900.0
pfset Geom.domain.Upper.Y                        2700.0
pfset Geom.domain.Upper.Z                          10.0
pfset Geom.domain.Patches             "x-lower x-upper y-lower y-upper z-lower z-upper"

#-----------------------------------------------------------------------------
# Domain
#-----------------------------------------------------------------------------
pfset Domain.GeomName                     "domain"

pfundist $runname
pfundist $runname.out.manning.pfb
set mask        	 [pfload Stettbach_mask.pfb]
set slope_x     	 [pfload xslope.pfb]
set slope_y   		 [pfload yslope.pfb]
set porosity             [pfload $runname.out.porosity.pfb]
set specific_storage     [pfload $runname.out.specific_storage.pfb]
set mannings             [pfload $runname.out.mannings.pfb]
set top        		 [Parflow::pfcomputetop $mask]



set runnumb 10967
set verbose 1

for {set i 1} {$i <= $runnumb} {incr i} {
set time_step [expr {0+$i}]
set pfbnamesaturation [format "%s.out.satur.%05d.pfb" $runname $i]
#set txtnamesaturation [format "%s.out.satur.%05d.txt" $runname $i]
set toptextsaturation [format "%s.out.satur.top.%05d.txt" $runname $i]

set pfbnamepressure [format "%s.out.press.%05d.pfb" $runname $i]
#set txtnamepressure [format "%s.out.press.%05d.txt" $runname $i]


set saturation [pfload $pfbnamesaturation]
#pfsave $saturation -sa $txtnamesaturation

set pressure [pfload $pfbnamepressure]
#pfsave $pressure -sa $txtnamepressure

set top_saturation [Parflow::pfextracttop $top $saturation]
set total_top_saturation [pfsum $top_saturation]
#pfsave $top_saturation -sa $toptextsaturation


set subsurface_storage [pfsubsurfacestorage $mask $porosity $pressure $saturation $specific_storage]
#set output_subsurface_storage [format "%s.subsurfacestorage.%05d.txt" $runname $i]
set total_subsurface_storage [pfsum $subsurface_storage]
#pfsave $subsurface_storage -sa $output_subsurface_storage 
#puts [format "Subsurface storage\t\t %.16e" $total_subsurface_storage]


set gw_storage [pfgwstorage $mask $porosity $pressure $saturation $specific_storage]
#set output_gw_storage [format "%s.gwstorage.%05d.txt" $runname $i]
set total_gw_storage [pfsum $gw_storage]
#pfsave $gw_storage -sa $output_gw_storage
#puts [format "GW_storage\t\t %.16e:" $total_gw_storage]


set surface_storage [pfsurfacestorage $top $pressure]
#set output_surface_storage [format "%s.surfacestorage.%05d.txt" $runname $i]
set total_surface_storage [pfsum $surface_storage]
#pfsave $surface_storage -sa $output_surface_storage
#set total_surface_storage [pfsum $surface_storage]


set surface_runoff [pfsurfacerunoff $top $slope_x $slope_y $mannings $pressure]
#set output_surface_runoff [format "%s.surfacerunoff.%05d.txt" $runname $i]
set total_surface_runoff [pfsum $surface_runoff]
#pfsave $surface_runoff -sa $output_surface_runoff


file delete -force $pfbnamesaturation
file delete -force $pfbnamepressure

set water_storage [format "water_storage.%05d.txt" $i]
set water_storage [open $water_storage w]
puts $water_storage [format {%s %.16e %.16e %.16e %.16e %.16e} $time_step\t $total_subsurface_storage\t $total_gw_storage\t $total_surface_storage\t $total_surface_runoff\t $total_top_saturation\n]
close $water_storage

}


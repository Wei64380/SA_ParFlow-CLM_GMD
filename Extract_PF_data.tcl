#Import the ParFlow TCL package

lappend   auto_path $env(PARFLOW_DIR)/bin
package   require parflow
namespace import Parflow::*

set tcl_precision 16

#-----------------------------------------------------------------------------
#File input version number
#-----------------------------------------------------------------------------
pfset FileVersion 4

set runname SA_005

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
set top        		 [pfcomputetop $mask]
set bottom               [pfcomputebottom $mask]
set top3                 [pfload top3.pfb]
set top5                 [pfload top5.pfb]
set top35                [pfload top_35.pfb] 

set runnumb 18288

for {set i 1} {$i <= $runnumb} {incr i} {
set time_step [expr {0+$i}]
set pfbnamesaturation [format "%s.out.satur.%05d.pfb" $runname $i]
set txtnamesaturation [format "%s.out.satur.%05d.txt" $runname $i]
set toptextsaturation [format "%s.out.satur.top.%05d.txt" $runname $i]
set bottomtextsaturation [format "%s.out.satur.bottom.%05d.txt" $runname $i]

set pfbnamepressure [format "%s.out.press.%05d.pfb" $runname $i]
#set txtnamepressure [format "%s.out.press.%05d.txt" $runname $i]


set saturation [pfload $pfbnamesaturation]
#pfsave $saturation -sa $txtnamesaturation

set pressure [pfload $pfbnamepressure]
#pfsave $pressure -sa $txtnamepressure

set top_saturation [Parflow::pfextracttop $top $saturation]
set total_top_saturation [pfsum $top_saturation]
#pfsave $top_saturation -sa $toptextsaturation

set top3_saturation [Parflow::pfextracttop $top3 $saturation]
set total_top3_saturation [pfsum $top3_saturation]
set top5_saturation [Parflow::pfextracttop $top5 $saturation]
set total_top5_saturation [pfsum $top5_saturation]
set top35_saturation [Parflow::pfextracttop $top35 $saturation]
set total_top35_saturation [pfsum $top35_saturation]

set bottom_saturation [Parflow::pfcomputebottom $bottom $saturation]
set total_bottom_saturation [pfsum $bottom_saturation]
#pfsave $bottom_saturation -SA $bottomtextsaturation

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
set output_surface_runoff [format "%s.surfacerunoff.%05d.txt" $runname $i]
set total_surface_runoff [pfsum $surface_runoff]
set Xloc1 20
set Xloc2 21
set Yloc 7
set Zloc 0

set runoff_1 [pfgetelt $surface_runoff $Xloc1 $Yloc 0]
set runoff_2 [pfgetelt $surface_runoff $Xloc2 $Yloc 0]

#pfsave $surface_runoff -sa $output_surface_runoff

#-----------------------------------------------
#set dx  50
#set n   0.0036

#set sx1 [pfgetelt $slope_x $Xloc1 $Yloc 0]
#set sy1 [pfgetelt $slope_y $Xloc1 $Yloc 0]
#set S [expr ($sx1**2+$sy1**2)**0.5]
#Get the pressure at the point
#set press [pfload runname.out.press.00001.pfb]
#set P [pfgetelt $pressure $Xloc1 $Yloc $Zloc]
#If the pressure is less than zero set to zero
#if {$P < 0} { set P 0 }
#set QT1 [expr ($dx/$n)*($S**0.5)*($P**(5./3.))]

#set sx2 [pfgetelt $slope_x $Xloc2 $Yloc 0]
#set sy2 [pfgetelt $slope_y $Xloc2 $Yloc 0]
#set S2 [expr ($sx2**2+$sy2**2)**0.5]
#set P2 [pfgetelt $pressure $Xloc2 $Yloc $Zloc]
#If the pressure is less than zero set to zero
#if {$P2 < 0} { set P2 0 }
#set QT2 [expr ($dx/$n)*($S2**0.5)*($P2**(5./3.))]

#----------------------------------------------

file delete -force $pfbnamesaturation
file delete -force $pfbnamepressure

set water_storage [format "water_storage.txt"]
set water_storage [open $water_storage a+]
puts $water_storage [format {%s %.16e %.16e %.16e %.16e %.16e %.16e %.16e %.16e %.16e %.16e %.16e} $time_step\t $total_subsurface_storage\t $total_gw_storage\t $total_surface_storage\t $total_surface_runoff\t $runoff_1\t $runoff_2\t $total_top_saturation\t $total_top3_saturation\t $total_top5_saturation\t $total_top35_saturation\t $total_bottom_saturation\n]
close $water_storage

}


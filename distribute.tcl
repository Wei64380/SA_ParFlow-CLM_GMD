#Import the ParFlow TCL package

lappend   auto_path $env(PARFLOW_DIR)/bin
package   require parflow
namespace import Parflow::*

set tcl_precision 16

#-----------------------------------------------------------------------------
#File input version number
#-----------------------------------------------------------------------------
pfset FileVersion 4

#-----------------------------------------------------------------------------
#Process Topology
#-----------------------------------------------------------------------------
pfset Process.Topology.P        8
pfset Process.Topology.Q        8
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
#Distribute inputs
#-----------------------------------------------------------------------------
pfset ComputationalGrid.NX                58
pfset ComputationalGrid.NY                54
pfset ComputationalGrid.NZ                1
pfdist xslope.pfb
pfdist yslope.pfb

pfset ComputationalGrid.NX                58
pfset ComputationalGrid.NY                54
pfset ComputationalGrid.NZ                50
pfdist indicater_Stettbach.pfb
pfdist initial_press.pfb

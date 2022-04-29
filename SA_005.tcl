

# Import the ParFlow TCL package
lappend   auto_path $env(PARFLOW_DIR)/bin
package   require parflow
namespace import Parflow::*

#-----------------------------------------------------------------------------
# Make a directory for the simulation run, files will be copied to this
# directory for running.
#-----------------------------------------------------------------------------

pfset     FileVersion    4

#-----------------------------------------------------------------------------
# Set Processor topology 
#-----------------------------------------------------------------------------
pfset Process.Topology.P 8
pfset Process.Topology.Q 8
pfset Process.Topology.R 1

#-----------------------------------------------------------------------------
# Computational Grid
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
# Names of the GeomInputs
#-----------------------------------------------------------------------------
pfset GeomInput.Names                     "box_input indi_input"

#-----------------------------------------------------------------------------
# Domain Geometry Input
#-----------------------------------------------------------------------------
pfset GeomInput.box_input.InputType      Box
pfset GeomInput.box_input.GeomName      domain

#-----------------------------------------------------------------------------
# Domain Geometry
#-----------------------------------------------------------------------------
pfset Geom.domain.Lower.X                        0.0
pfset Geom.domain.Lower.Y                        0.0
pfset Geom.domain.Lower.Z                        0.0

pfset Geom.domain.Upper.X                        2900.0
pfset Geom.domain.Upper.Y                        2700.0
pfset Geom.domain.Upper.Z                          10.0
pfset Geom.domain.Patches             "x-lower x-upper y-lower y-upper z-lower z-upper"

#-----------------------------------------------------------------------------
# Set Parameters for SA
#-----------------------------------------------------------------------------
#set SA_Sres           0.03
#set SA_thetas         0.58
#set SA_VGalpha        2.3
#set SA_VGn            1.5
#set SA_Ks             0.35
#set SA_Manning        0.0036
#set SA_Ss             0.0001
#set SA_fc             0.44
#set SA_wp             0.08
#set runname           "SA_005"
#set b_Ks              0.1


set SA_Sres           0.03
set SA_thetas         0.6428
set SA_VGalpha        0.0819
set SA_VGn            1.8700
set SA_Ks             0.4087
set SA_Manning        0.0036
set SA_Ss             0.0038664
set SA_fc             0.40
set SA_wp             0.08
set runname           "SA_005"
set b_Ks              0.1
#-----------------------------------------------------------------------------
# Indicator Geometry Input
#-----------------------------------------------------------------------------
pfset GeomInput.indi_input.InputType      IndicatorField
pfset GeomInput.indi_input.GeomNames      "s1 b9"
pfset Geom.indi_input.FileName            "indicater_Stettbach.pfb"

pfset GeomInput.s1.Value                1
pfset GeomInput.b9.Value                9

#-----------------------------------------------------------------------------
# Permeability (values in m/hr)
#-----------------------------------------------------------------------------
pfset Geom.Perm.Names                     "domain s1 b9"

pfset Geom.domain.Perm.Type           Constant
pfset Geom.domain.Perm.Value          $SA_Ks

pfset Geom.s1.Perm.Type               Constant
pfset Geom.s1.Perm.Value              $SA_Ks

pfset Geom.b9.Perm.Type               Constant
pfset Geom.b9.Perm.Value              $b_Ks

pfset Perm.TensorType                     TensorByGeom
pfset Geom.Perm.TensorByGeom.Names        "domain"
pfset Geom.domain.Perm.TensorValX         2.0d0
pfset Geom.domain.Perm.TensorValY         1.0d0
pfset Geom.domain.Perm.TensorValZ         1.0d0

#-----------------------------------------------------------------------------
# Specific Storage
#-----------------------------------------------------------------------------
pfset SpecificStorage.Type                Constant
pfset SpecificStorage.GeomNames           "domain"
pfset Geom.domain.SpecificStorage.Value   $SA_Ss

#-----------------------------------------------------------------------------
# Phases
#-----------------------------------------------------------------------------
pfset Phase.Names                         "water"
pfset Phase.water.Density.Type            Constant
pfset Phase.water.Density.Value           1.0
pfset Phase.water.Viscosity.Type          Constant
pfset Phase.water.Viscosity.Value         1.0

#-----------------------------------------------------------------------------
# Contaminants
#-----------------------------------------------------------------------------
pfset Contaminants.Names                  ""

#-----------------------------------------------------------------------------
# Gravity
#-----------------------------------------------------------------------------
pfset Gravity                             1.0

#-----------------------------------------------------------------------------
# Timing (time units is set by units of permeability)
#-----------------------------------------------------------------------------
pfset TimingInfo.BaseUnit                 1.0
pfset TimingInfo.StartCount               0.0
pfset TimingInfo.StartTime                0.0
pfset TimingInfo.StopTime                 18288.0
pfset TimingInfo.DumpInterval             1.0
pfset TimeStep.Type                       Constant
pfset TimeStep.Value                      1.0

#-----------------------------------------------------------------------------
# Porosity
#-----------------------------------------------------------------------------
pfset Geom.Porosity.GeomNames             "domain s1 b9"

pfset Geom.domain.Porosity.Type          Constant
pfset Geom.domain.Porosity.Value         $SA_thetas

pfset Geom.s1.Porosity.Type    Constant
pfset Geom.s1.Porosity.Value   $SA_thetas

pfset Geom.b9.Porosity.Type    Constant
pfset Geom.b9.Porosity.Value   0.1

#-----------------------------------------------------------------------------
# Domain
#-----------------------------------------------------------------------------
pfset Domain.GeomName                     "domain"

#----------------------------------------------------------------------------
# Mobility
#----------------------------------------------------------------------------
pfset Phase.water.Mobility.Type        Constant
pfset Phase.water.Mobility.Value       1.0

#-----------------------------------------------------------------------------
# Wells
#-----------------------------------------------------------------------------
pfset Wells.Names                         ""

#-----------------------------------------------------------------------------
# Time Cycles
#-----------------------------------------------------------------------------
pfset Cycle.Names                         "constant"
pfset Cycle.constant.Names                "alltime"
pfset Cycle.constant.alltime.Length        1
pfset Cycle.constant.Repeat               -1

#-----------------------------------------------------------------------------
# Boundary Conditions
#-----------------------------------------------------------------------------
pfset BCPressure.PatchNames                   [pfget Geom.domain.Patches]

pfset Patch.x-lower.BCPressure.Type                   FluxConst
pfset Patch.x-lower.BCPressure.Cycle                  "constant"
pfset Patch.x-lower.BCPressure.alltime.Value          0.0

pfset Patch.y-lower.BCPressure.Type                   FluxConst
pfset Patch.y-lower.BCPressure.Cycle                  "constant"
pfset Patch.y-lower.BCPressure.alltime.Value          0.0

pfset Patch.z-lower.BCPressure.Type                   FluxConst
pfset Patch.z-lower.BCPressure.Cycle                  "constant"
pfset Patch.z-lower.BCPressure.alltime.Value          0.0

pfset Patch.x-upper.BCPressure.Type                   FluxConst
pfset Patch.x-upper.BCPressure.Cycle                  "constant"
pfset Patch.x-upper.BCPressure.alltime.Value          0.0

pfset Patch.y-upper.BCPressure.Type                   FluxConst
pfset Patch.y-upper.BCPressure.Cycle                  "constant"
pfset Patch.y-upper.BCPressure.alltime.Value          0.0

pfset Patch.z-upper.BCPressure.Type                   OverlandFlow
pfset Patch.z-upper.BCPressure.Cycle                  "constant"
pfset Patch.z-upper.BCPressure.alltime.Value          0.0

#-----------------------------------------------------------------------------
# Topo slopes in x-direction
#-----------------------------------------------------------------------------
pfset TopoSlopesX.Type                                "PFBFile"
pfset TopoSlopesX.GeomNames                           "domain"
pfset TopoSlopesX.FileName                            "xslope.pfb"

#-----------------------------------------------------------------------------
# Topo slopes in y-direction
#-----------------------------------------------------------------------------
pfset TopoSlopesY.Type                                "PFBFile"
pfset TopoSlopesY.GeomNames                           "domain"
pfset TopoSlopesY.FileName                            "yslope.pfb"

#-----------------------------------------------------------------------------
# Mannings coefficient
#-----------------------------------------------------------------------------
pfset Mannings.Type                                   "Constant"
pfset Mannings.GeomNames                              "domain"
pfset Mannings.Geom.domain.Value                      $SA_Manning

#-----------------------------------------------------------------------------
# Relative Permeability
#-----------------------------------------------------------------------------
pfset Phase.RelPerm.Type                  VanGenuchten
pfset Phase.RelPerm.GeomNames             "domain s1 b9"

pfset Geom.domain.RelPerm.Alpha           $SA_VGalpha
pfset Geom.domain.RelPerm.N               $SA_VGn

pfset Geom.s1.RelPerm.Alpha               $SA_VGalpha
pfset Geom.s1.RelPerm.N                   $SA_VGn

pfset Geom.b9.RelPerm.Alpha        $SA_VGalpha
pfset Geom.b9.RelPerm.N            $SA_VGn

#-----------------------------------------------------------------------------
# Saturation
#-----------------------------------------------------------------------------
pfset Phase.Saturation.Type               VanGenuchten
pfset Phase.Saturation.GeomNames          "domain s1 b9"

pfset Geom.domain.Saturation.Alpha        $SA_VGalpha
pfset Geom.domain.Saturation.N            $SA_VGn
pfset Geom.domain.Saturation.SRes         $SA_Sres
pfset Geom.domain.Saturation.SSat         1.0

pfset Geom.s1.Saturation.Alpha        $SA_VGalpha
pfset Geom.s1.Saturation.N            $SA_VGn
pfset Geom.s1.Saturation.SRes         $SA_Sres
pfset Geom.s1.Saturation.SSat         1.0

pfset Geom.b9.Saturation.Alpha        $SA_VGalpha
pfset Geom.b9.Saturation.N            $SA_VGn
pfset Geom.b9.Saturation.SRes         $SA_Sres
pfset Geom.b9.Saturation.SSat         1.0

#-----------------------------------------------------------------------------
# Phase sources:
#-----------------------------------------------------------------------------
pfset PhaseSources.water.Type                         "Constant"
pfset PhaseSources.water.GeomNames                    "domain"
pfset PhaseSources.water.Geom.domain.Value            0.0

#----------------------------------------------------------------
# CLM Settings:
# ------------------------------------------------------------
pfset Solver.LSM                                      CLM
pfset Solver.CLM.CLMFileDir                           "clm_output/"
pfset Solver.CLM.Print1dOut                           False
pfset Solver.BinaryOutDir                             False
pfset Solver.CLM.CLMDumpInterval                      1

pfset Solver.CLM.MetForcing                           1D
pfset Solver.CLM.MetFileName                          metfile_2020_2021.dat
pfset Solver.CLM.MetFilePath                          "./"
#pfset Solver.CLM.MetFileNT                            24
pfset Solver.CLM.IstepStart                           1

pfset Solver.CLM.EvapBeta                             Linear
pfset Solver.CLM.VegWaterStress                       Saturation
pfset Solver.CLM.ResSat                               $SA_Sres
pfset Solver.CLM.WiltingPoint                         $SA_wp
pfset Solver.CLM.FieldCapacity                        $SA_fc
pfset Solver.CLM.IrrigationType                       none

#---------------------------------------------------------
# Initial conditions: water pressure
#---------------------------------------------------------
pfset ICPressure.Type                                 PFBFile
pfset ICPressure.GeomNames                            domain
pfset Geom.domain.ICPressure.RefPatch                   z-lower
pfset Geom.domain.ICPressure.FileName                   initial_press.pfb
#pfset ICPressure.Type                                   HydroStaticPatch
#pfset ICPressure.GeomNames                              domain
#pfset Geom.domain.ICPressure.Value                      0
#pfset Geom.domain.ICPressure.RefGeom                    domain
#pfset Geom.domain.ICPressure.RefPatch                   z-lower

#----------------------------------------------------------------
# Outputs
# ------------------------------------------------------------
#Writing output (all pfb):
pfset Solver.PrintSubsurfData                         True
pfset Solver.PrintPressure                            True
pfset Solver.PrintSaturation                          True
pfset Solver.PrintMask                                True
pfset Solver.PrintMannings                            True 

pfset Solver.CLM.SingleFile                           True
pfset Solver.WriteCLMBinary                           False
pfset Solver.PrintCLM                                 True
pfset Solver.WriteSiloSpecificStorage                 False
pfset Solver.WriteSiloMannings                        False
pfset Solver.WriteSiloMask                            False
pfset Solver.WriteSiloSlopes                          False
pfset Solver.WriteSiloSubsurfData                     False
pfset Solver.WriteSiloPressure                        False
pfset Solver.WriteSiloSaturation                      False
pfset Solver.WriteSiloEvapTrans                       False
pfset Solver.WriteSiloEvapTransSum                    False
pfset Solver.WriteSiloOverlandSum                     False
pfset Solver.WriteSiloCLM                             False
pfset Solver.CLM.WriteLastRST                         True

#-----------------------------------------------------------------------------
# Exact solution specification for error calculations
#-----------------------------------------------------------------------------
pfset KnownSolution                                   NoKnownSolution

#-----------------------------------------------------------------------------
# Set solver parameters
#-----------------------------------------------------------------------------
# ParFlow Solution
pfset Solver                                          Richards
pfset Solver.TerrainFollowingGrid                     True
pfset Solver.Nonlinear.VariableDz                     False

pfset Solver.MaxIter                                  25000
pfset Solver.Drop                                     1E-20
pfset Solver.AbsTol                                   1E-8
pfset Solver.MaxConvergenceFailures                   5
pfset Solver.Nonlinear.MaxIter                        80
pfset Solver.Nonlinear.ResidualTol                    1e-6

## new solver settings for Terrain Following Grid
pfset Solver.Nonlinear.EtaChoice                         EtaConstant
pfset Solver.Nonlinear.EtaValue                          0.001
pfset Solver.Nonlinear.UseJacobian                       True
pfset Solver.Nonlinear.DerivativeEpsilon                 1e-16
pfset Solver.Nonlinear.StepTol                           1e-30
pfset Solver.Nonlinear.Globalization                     LineSearch
pfset Solver.Linear.KrylovDimension                      70
pfset Solver.Linear.MaxRestarts                           2

pfset Solver.Linear.Preconditioner                       PFMGOctree
pfset Solver.Linear.Preconditioner.PCMatrixType          FullJacobian

#-----------------------------------------------------------------------------
# Run Simulation
#-----------------------------------------------------------------------------
#set runname "SA_001"
#pfrun    $runname
puts $runname
pfwritedb $runname
exit

#-----------------------------------------------------------------------------
# Undistribute outputs
#-----------------------------------------------------------------------------
pfundist $runname
pfundist xslope.pfb
pfundist yslope.pfb
puts "ParFlow run Complete"

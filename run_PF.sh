#!/bin/bash

#SBATCH -C avx512
#SBATCH -A project01605
#SBATCH -J SA_005   
#SBATCH -n 64   
#SBATCH --time=05:00:00
#SBATCH --export=ALL
#SBATCH --mem-per-cpu=1950
#SBATCH --mail-type=End
#SBATCH --mail-user=wei.qu@geo.tu-darmstadt.de

module purge
module load gcc tcl openmpi/4
export PARFLOW_DIR=/home/wq13vuwi/ParFlow_v3.9.0/parflow
export PATH=$PATH:/home/wq13vuwi/ParFlow_v3.9.0/parflow/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/wq13vuwi/ParFlow_v3.9.0/parflow/lib


tclsh SA_005.tcl 8 8 1
mpiexec -n 64 $PARFLOW_DIR/bin/parflow SA_005


rm SA*.out.*.dist
rm clm_output*
rm clm_para_out*
rm clm.rst*
rm clm_out*



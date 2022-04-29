#!/bin/bash

#SBATCH -C avx512
#SBATCH -p test24
#SBATCH -A project01605
#SBATCH -J dat_058   
#SBATCH -n 1   
#SBATCH --time=2:00:00
#SBATCH --export=ALL
#SBATCH --mem-per-cpu=60000
#SBATCH --mail-type=End
#SBATCH --mail-user=wei.qu@geo.tu-darmstadt.de

module purge
module load gcc tcl openmpi/4
export PARFLOW_DIR=/home/wq13vuwi/ParFlow_v3.9.0/parflow
export PATH=$PATH:/home/wq13vuwi/ParFlow_v3.9.0/parflow/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/wq13vuwi/ParFlow_v3.9.0/parflow/lib

tclsh Extract_CLM_data.tcl
module load matlab
matlab -batch "extract_clm"
mkdir Data_output
mv *.dat ./Data_output
rm SA_*.out.clm_output.*.txt


tclsh Extract_PF_data.tcl
module load matlab
matlab -batch "extract_PF"
mv *.dat ./Data_output
rm water_storage*.txt

mv ./Data_output/drv* .
mv ./Data_output/metfile.dat .
mv ./Data_output/ind0.dat .




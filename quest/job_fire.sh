#!/bin/bash 
#MSUB -N m12i_res7000
#MSUB -q cosmoscomputeq6
#MSUB -A b1026
#MSUB -l walltime=168:00:00 
#MSUB -l nodes=11:ppn=28
#MSUB -l partition=quest6
#MSUB -o log_fire.out
#MSUB -e log_fire.err

cd $PBS_O_WORKDIR
export OMP_NUM_THREADS=4
export MV2_ENABLE_AFFINITY=0


mpirun -np 77 -ppn 7 ../gizmo-master/gizmo-chimes/GIZMO ./latte_restart.param 2

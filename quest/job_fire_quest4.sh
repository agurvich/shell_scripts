#!/bin/bash 
#MSUB -N latte_restart
#MSUB -q cosmoscompute
#MSUB -A b1026
#MSUB -l walltime=168:00:00 
#MSUB -l nodes=15:ppn=20
#MSUB -l partition=quest4
#MSUB -o log_fire.out
#MSUB -e log_fire.err

cd $PBS_O_WORKDIR
export OMP_NUM_THREADS=4
export MV2_ENABLE_AFFINITY=0


mpirun -np 75 -ppn 5 ./gizmo-chimes/GIZMO ./latte_restart.param 1

#!/bin/bash
#SBATCH -o %j_out.o       # output and error file name (%j expands to jobID)
#SBATCH -N 1              # total number of nodes
#SBATCH -n 1              # total number of mpi tasks requested
#SBATCH -p cosmoscompute     # queue (partition) -- cosmoscompute or cosmoshimem
#SBATCH -t 4:00:00        # run time (hh:mm:ss) - 4 hours
#SBATCH -A b1026

redshifts=(2.0 1.5 0.7 0.1)
for redshift in "${redshifts[@]}"
do 
    python python_test.py $redshift 
done

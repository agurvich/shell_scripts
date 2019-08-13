#!/bin/bash
#SBATCH -o %j_out.o       # output and error file name (%j expands to jobID)
#SBATCH -N 1              # total number of nodes
#SBATCH -n 1              # total number of mpi tasks requested
#SBATCH -p cosmoscompute     # queue (partition) -- cosmoscompute or cosmoshimem
#SBATCH -t 4:00:00        # run time (hh:mm:ss) - 4 hours
#SBATCH --mail-user=agurvich@u.northwestern.edu
#SBATCH -A b1026

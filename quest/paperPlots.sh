#!/bin/bash
#SBATCH -o %j_out.o       # output and error file name (%j expands to jobID)
#SBATCH -N 1              # total number of nodes
#SBATCH -n 24              # total number of mpi tasks requested
#SBATCH -p cosmoshimem     # queue (partition) -- cosmoscompute or cosmoshimem
#SBATCH --mail-user=agurvich@u.northwestern.edu
#SBATCH -A b1026
#SBATCH -t 48:00:00        # run time (hh:mm:ss) - 4 hours
#SBATCH --mem 0
#SBATCH --exclusive
#SBATCH -J all_paper_plots          # job name


cd ${HOME}/starformation/scripts

python paperPlots.py --appendix=True

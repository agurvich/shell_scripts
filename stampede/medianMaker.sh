#!/bin/bash
#SBATCH -o log_out.o%j       # output and error file name (%j expands to jobID)
#SBATCH -N 1              # total number of mpi tasks requested
#SBATCH -n 1              # total number of mpi tasks requested
#SBATCH -p skx-dev     # queue (partition) -- normal, development, etc.
#SBATCH -t 2:00:00        # run time (hh:mm:ss) - 2 hours
#SBATCH --mail-user=agurvich@u.northwestern.edu

cd $HOME/starformation/scripts
python medianMaker.py

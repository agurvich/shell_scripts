#!/bin/bash
#SBATCH -o log_out.o%j       # output and error file name (%j expands to jobID)
#SBATCH -N 1              # total number of mpi tasks requested
#SBATCH -n 1              # total number of mpi tasks requested
#SBATCH -p skx-normal     # queue (partition) -- normal, development, etc.
#SBATCH -t 4:00:00        # run time (hh:mm:ss) - 24 hours
#SBATCH --mail-user=agurvich@u.northwestern.edu
#SBATCH -A TG-AST140023
#SBATCH -J m11q_res7100    # job name
cd /home1/04210/tg835099/SF_indicators
python run.py --savename=m11q_res7100

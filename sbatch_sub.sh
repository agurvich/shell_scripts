#!/bin/bash
#SBATCH -J myJob           # job name
#SBATCH -o log_out.o%j       # output and error file name (%j expands to jobID)
#SBATCH -N 1              # total number of mpi tasks requested
#SBATCH -n 1              # total number of mpi tasks requested
#SBATCH -p serial     # queue (partition) -- normal, development, etc.
#SBATCH -t 12:00:00        # run time (hh:mm:ss) - 1.5 hours
#SBATCH --mail-user=agurvich@u.northwestern.edu

cd /home1/04210/tg835099/python
python masshist.py

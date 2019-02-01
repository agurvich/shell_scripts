#!/bin/bash
#SBATCH -J alex_g_interactive           # job name
#SBATCH -o log_out.o%j       # output and error file name (%j expands to jobID)
#SBATCH -N 1              # total number of mpi tasks requested
#SBATCH -A TG-AST140023    # account to charge          
#SBATCH -n 48              # total number of mpi tasks requested
#SBATCH -p skx-dev     # queue (partition) -- normal, development, etc.
#SBATCH -t 2:00:00        # run time (hh:mm:ss) -- 2 hours
#SBATCH --exclusive 
#SBATCH --pty
#SBATCH -u
#SBATCH -i # interactive

bash 

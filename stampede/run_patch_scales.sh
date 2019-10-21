#!/bin/bash
#SBATCH -o log_out.o%j       # output and error file name (%j expands to jobID)
#SBATCH -N 1              # total number of mpi tasks requested
#SBATCH -n 1              # total number of mpi tasks requested
#SBATCH -p skx-normal     # queue (partition) -- normal, development, etc.
#SBATCH -t 24:00:00        # run time (hh:mm:ss) - 24 hours
#SBATCH --mail-user=agurvich@u.northwestern.edu
#SBATCH -A TG-AST140023
#SBATCH -J m12i_scales           # job name

fname='m12i_res7100'
cd $HOME/starformation/scripts
python makeFullHistory.py --snaplow=700 --savename=$fname --mps=4
python makeFullHistory.py --snaplow=700 --savename=$fname --mps=4 --patch=1
python makeFullHistory.py --snaplow=700 --savename=$fname --mps=4 --patch=.3
#python makeFullHistory.py --snaplow=700 --savename=$fname --mps=2 --patch=.1

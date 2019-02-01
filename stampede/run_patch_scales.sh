#!/bin/bash 
#MSUB -N alex_g_interactive_session
#MSUB -q cosmoshimem
#MSUB -A b1026
#MSUB -l walltime=48:00:00 
#MSUB -l nodes=1:ppn=24
#MSUB -l partition=quest5

fname='h113'
cd /home/abg6257/starformation/scripts
python makeFullHistory.py --snaplow=700 --savename=$fname --mps=4 --patch=1
python makeFullHistory.py --snaplow=700 --savename=$fname --mps=4 --patch=.3
python makeFullHistory.py --snaplow=700 --savename=$fname --mps=4 --patch=.1

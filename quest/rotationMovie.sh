#!/bin/bash 
#MSUB -N iso_gal_rotation_movie
#MSUB -q cosmoshimem
#MSUB -A b1026
#MSUB -l walltime=12:00:00 
#MSUB -l nodes=1:ppn=24
#MSUB -l partition=quest5

cd $HOME/starformation/scripts
python rotationMovie.py

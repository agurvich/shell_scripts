#!/bin/bash

#SBATCH --account=p30879
#SBATCH --partition=gengpu
#SBATCH --job-name=abg6257_interactive
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=3G
#SBATCH --time=02:00:00
#SBATCH --gres=gpu:k40:1

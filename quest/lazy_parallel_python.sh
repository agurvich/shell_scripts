#!/bin/bash 
#MSUB -N cos_extctr_snly
#MSUB -q cosmoscomputeq6
#MSUB -A b1026
#MSUB -l partition=quest6
#MSUB -l walltime=8:00:00 
#MSUB -l nodes=1:ppn=1




SAVENAME="m12i_res7000_rescaled_0.05"




SAVENAME="m12i_res7000_latte"


SAVENAME="m12i_res7000_snonly_rescaled_6.0"
SAVENAME="m12i_res7000_snonly"

cd /home/abg6257/starformation/scripts

#python starformation_history.py --savename=$SAVENAME -g

python cosmoExtractor.py --savename=$SAVENAME --low=492 --high=600
#python pixelGrid.py --savename=$SAVENAME --low=1 --high=130 -g
#python translateExtraOutput.py --savename=$SAVENAME

#python movie_maker.py --snapdir="/projects/b1026/agurvich/cosmo/$SAVENAME/output" --snapstart=555 --snapmax=600 --frame_width=30 --frame_depth=15


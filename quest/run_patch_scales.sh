#!/bin/bash
#SBATCH -o %j_out.o       # output and error file name (%j expands to jobID)
#SBATCH -N 1              # total number of nodes
#SBATCH -n 1              # total number of mpi tasks requested
#SBATCH -p cosmoshimem     # queue (partition) -- cosmoscompute or cosmoshimem
#SBATCH -t 48:00:00        # run time (hh:mm:ss) - 4 hours
#SBATCH --mail-user=agurvich@u.northwestern.edu
#SBATCH -A b1026

this_command=sbatch #bash #
preamble=himempreamble.sh ## preamble.sh ##
gal_str="m12i"
fname="${gal_str}_res7100"
#fname='m12i_res7100_noRHD'

snapnums=(564 567 570 573 576 579 582 585 588 600)
#snapnums=(567) # 574 580 600)

patches=(3 1) # 0.3 0.1)

for snapnum in "${snapnums[@]}"
do
    cat ${preamble} > temp.sh 
    echo "#SBATCH -J ${gal_str}_${snapnum}_0.1          # job name" >> temp.sh
    echo "cd $HOME/starformation/scripts" >> temp.sh
    for patch in "${patches[@]}"
    do
        echo "python makeFullHistory.py --snaplow=$snapnum --snaphigh=$snapnum --savename=$fname --mps=1 --patch=${patch}" >> temp.sh
    done
    ${this_command} temp.sh
done

#!/bin/bash
#SBATCH -o %j_out.o       # output and error file name (%j expands to jobID)
#SBATCH -N 1              # total number of nodes
#SBATCH -n 1              # total number of mpi tasks requested
#SBATCH -p cosmoscompute     # queue (partition) -- cosmoscompute or cosmoshimem
#SBATCH -t 48:00:00        # run time (hh:mm:ss) - 4 hours
#SBATCH --mail-user=agurvich@u.northwestern.edu
#SBATCH -A b1026

gal_str="m12i"
fname="${gal_str}_res7100"


snapnums=( 564 567 570 573 576 579 582 585 588 600)
patches=( 3 )  #1 0.3 0.1 )
for snapnum in "${snapnums[@]}"
do
    for patch in "${patches[@]}"
    do
        cat preamble.sh > temp.sh 
        echo "#SBATCH -J ${gal_str}_${snapnum}_${patch}           # job name" >> temp.sh
        echo "cd $HOME/starformation/scripts" >> temp.sh
        echo "python makeFullHistory.py --snaplow=$snapnum --snaphigh=$snapnum --savename=$fname --mps=1 --patch=${patch}" >> temp.sh
        sbatch temp.sh
    done
done

#!/bin/bash
#SBATCH -o %j_out.o       # output and error file name (%j expands to jobID)
#SBATCH -N 1              # total number of nodes
#SBATCH -n 1              # total number of mpi tasks requested
#SBATCH -p cosmoshimem     # queue (partition) -- cosmoscompute or cosmoshimem
#SBATCH -t 48:00:00        # run time (hh:mm:ss) - 4 hours
#SBATCH --mail-user=agurvich@u.northwestern.edu
#SBATCH -A b1026

this_command=bash #
preamble=himempreamble.sh ## preamble.sh ##
gal_str="m12i"
fname="${gal_str}_res7100"
#fname='m12i_res7100_noRHD'

snapnums=(564 567 570 573 576 579 582 585 588 600)
#snapnums=(564 565 566 567 568 569 570 571 572 573 574 575 576 577 578 579 580 581 582 583 584 585 586 587 588 589 590 600)

patches=(1) #3 1 0.3 0.1)

## low: 81
##  : 401
## high: 2001

uniform=81
name_append=_low

for snapnum in "${snapnums[@]}"
do
    cat ${preamble} > temp.sh 
    echo "#SBATCH -J high_priority_${gal_str}_${snapnum}          # job name" >> temp.sh
    echo "cd $HOME/disk_formation/scripts" >> temp.sh
    for patch in "${patches[@]}"
    do
        echo "python pressure_balance.py --uniform=${uniform} --name_append=${name_append} --snaplow=$snapnum --snaphigh=$snapnum --savename=$fname --mps=1 --patch=${patch}" >> temp.sh
    done
    ${this_command} temp.sh
done

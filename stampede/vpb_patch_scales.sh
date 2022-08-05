#!/bin/bash

this_command=bash #bash
preamble=preamble.sh ## preamble.sh ##
gal_str="m12f"
fname="${gal_str}_res7100"
fname="${gal_str}_res57000"


## all snapnums
snapnums=(564 565 566 567 568 569 570 571 572 573 574 575 576 577 578 579 580 581 582 583 584 585 586 587 588 589 590 600)
## base snapnums
snapnums=(564 567 567 570 573 576 579 582 585 588 600)
## extra snapnums
#snapnums=(569 571 572 574 575 577 578 580 581 583 584 586 587 589 590) #565 566 568 

patches=(3) # 1 0.3 0.1)

## low: 81
##  : 401
## high: 2001

uniform=401
#name_append=low

for snapnum in "${snapnums[@]}"
do
    cat ${preamble} > temp.sh 
    echo "#SBATCH -J ${gal_str}_${snapnum}          # job name" >> temp.sh
    echo "cd $HOME/disk_formation/scripts" >> temp.sh
    for patch in "${patches[@]}"
    do
        echo "python pressure_balance.py --uniform=${uniform} --name_append=${name_append} --snaplow=$snapnum --snaphigh=$snapnum --savename=$fname --mps=1 --patch=${patch}" >> temp.sh
    done
    ${this_command} temp.sh
done

#!/bin/bash

this_command=sbatch #bash
preamble=preamble.sh ##himempreamble.sh ##
gal_str="m12b"
fname="${gal_str}_res57000"
#fname='m12i_res7100_noRHD'

snapnums=(579 582 585 588 600) ## 564 567 570 573 576 
#565 
#extra_snapnums=(566 568 569 571 572 574 575 577 578 580 581 583 584 586 587 589 590)

patches=(3 1 0.3 0.1)

for snapnum in "${snapnums[@]}"
do
    cat ${preamble} > temp.sh 
    echo "#SBATCH -J ${gal_str}_${snapnum}_res         # job name" >> temp.sh
    echo "export NUMBA_NUM_THREADS=23" >> temp.sh
    echo "cd $HOME/starformation/scripts" >> temp.sh
    for patch in "${patches[@]}"
    do
        echo "python makeFullHistory.py --snaplow=$snapnum --snaphigh=$snapnum --savename=$fname --mps=1 --patch=${patch}" >> temp.sh
    done
    ${this_command} temp.sh
done


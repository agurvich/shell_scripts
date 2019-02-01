#!/bin/bash

curdir=`pwd`
for var in "$@"
do

    cd $var/output
    max=-1
    for filename in *.hdf5
    do
        if [[ $filename == *"snapshot"* ]]
        then
            snapnum=${filename%".hdf5"}
            snapnum=${snapnum#"snapshot_"}
            if [ $snapnum -gt $max ]
            then 
                #remove leading zeros so as not to confuse printf
                max=${snapnum##"0"}
            fi
        fi
    done
    # go back up to curdir
    cd $curdir
    ls $var/output/`printf "snapshot_%03d.hdf5" $max `
done


#for i in {1..2500}
    #filename=$var/output/`printf "snapshot_%03d.hdf5" $i `
    #if [ ! -f $filename ]
    #then
    #ls $old_filename
    #break
    #fi
    #old_filename=$filename


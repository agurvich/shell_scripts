#!/bin/bash

echo hi
arr=(h113 h206 h29 h2)
patches=(300pc 100pc)

for patch in "${patches[@]}"
do 
    for name in "${arr[@]}"
    do
        cd $patch/$name
        echo $patch/$name
        #ln -s ../../$name/subsnaps subsnaps
        #mkdir metadata
        #cp ../../$name/metadata/* metadata
        #cp ../../$name/snapshot_times.txt . 
        #rm metadata/*
        #cp ../../1kpc/$name/metadata/* metadata

        cd ../..

    done

done

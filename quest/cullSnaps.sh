#!/bin/bash

echo "Culling 90% of snapshots"
rm *1.hdf5
rm *2.hdf5
rm *3.hdf5
rm *4.hdf5
rm *5.hdf5
rm *6.hdf5
rm *7.hdf5
rm *8.hdf5
rm *9.hdf5

echo "Renaming remaining snapshots" 
for i in {0..340}
    do 
    filename=`printf "snapshot_%02d0.hdf5" $i`
    target=`printf "snapshot_%03d.hdf5" $i`
    mv $filename $target
    done

#!/bin/bash


target=~/projects/isoDisk/retest_6.0/output
for snapnum in {1001..1479..1}
do
    snap=`printf snapshot_%03d.hdf5 $snapnum`
    mv $snap $target
done

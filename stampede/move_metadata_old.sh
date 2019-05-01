#!/bin/bash

savenamearr=(*pc)
current_dir=`pwd`
for fname in "${savenamearr[@]}"
do
    cd $fname
    simdirarr=(m12*)
    for simdir in "${simdirarr[@]}"
    do
        ls $simdir/metadata/old
    done
    cd $current_dir
done

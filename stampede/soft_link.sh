#!/bin/bash

big_folders=`du -sh -t 1M ../src/* | awk '{print $2}'`

for folder in ${big_folders[@]}
do
    if [ ! -f `basename ${folder}` ] & [ ! -L `basename ${folder}` ]
    then
        echo "ln -s ${folder} ."
    fi
done

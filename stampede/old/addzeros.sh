#!/bin/bash

for i in {0..100..1}
do
    mv ksmap_$i.png ksmap_`printf "%03d" $i`.png
    mv ksratio_$i.png ksratio_`printf "%03d" $i`.png
done


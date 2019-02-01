#!/bin/bash

prefix_string='/scratch/04210/tg835099/data/m12i_res7100/Plots'
frame_string='ginormo_gmc_'
for (( frame_number=0; frame_number<=600; frame_number++ )); do
    filename=${prefix_string}/`printf "${frame_string}%03d.png" $frame_number`
    #if file exists
    if [ ! -f ${filename} ]
        then
        echo ${filename} not found!
        cp ${HOME}/src/blank_frame.png ${filename}
    fi
    #less filenames$3.txt
    ## Convert plays nicer and doesn't lead to stutterring when the images have slightly different color palettes, or something...
    #montage @filenames$3.txt -tile 3x1 -geometry +0+0 $merged_directory/merged_rescaled_transient_$frame_number.png
    #convert +append @filenames$3.txt $merged_directory/$output_prefix\_merged_$frame_number.png
    #rm filenames$3.txt
done

#!/bin/bash


savenamearr=($HOME/scratch/data/m12i_res7100/Plots/*500*)
#savenamearr=(m10q_res250  m10v_res250  m11c_res2100  m11q_res7100  m11v_res7100  m12f_res7100  m12i_res7100  m12m_res7100)

strindex() { 
  x="${1%%$2*}"
    [[ "$x" = "$1" ]] && echo -1 || echo "${#x}"
}

for fname in "${savenamearr[@]}"
do
    echo $fname
    cut="${fname%/*}" ## find the last instance of /* -- an arbitrary string beginning with /
    cut_length=${#cut} ## get the length of that string
    prefix="${fname[@]:0:$cut_length}"
    echo $prefix
    fname="${fname[@]:${cut_length}+1}" ## let's slice the filename from that string to the end
    last_png=`strindex $fname ".png"` ## let's find how far down the last instance of png is
    fname="${fname[@]:0:${last_png}-4}" ## and take it out plus the _%03d
    echo $fname ## the final fname
    ffmpeg -framerate 15 -start_number 250 -i ${prefix}/${fname}_%03d.png -q:v 1 ~/movies/${fname}.avi -n
done

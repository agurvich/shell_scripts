#!/bin/bash
function interactive_time(){
    squeue -u $USER -o "%.20j %10R %.10L" | grep 'bash' | awk '{print $2, $3}'
}

function memory(){
    echo `free -mh` | awk '{print $9,"/",$8}'
}

bar=`memory`
foo=`interactive_time`
echo -e you are doing a good job $foo #"( $bar )"

#watch -n 1 'squeue -u $USER -o "%.20j %.10L" | grep idv' 
#echo -e you are doing a good job '\t' `interactive_time`

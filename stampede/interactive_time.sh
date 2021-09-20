#!/bin/bash
function interactive_time(){
    squeue -u $USER -o "%.20j %8R %.10L" | grep 'idv' | awk '{print $2, $3}'
}
function memory(){
    echo `free -mh` | awk '{print $9,"/",$8}'
}

#squeue -u $USER -o "%.20j %.10L" | grep 'idv'
#alias showmyq="squeue -u $USER -o \"%.10i %.20j %.10L %5D %8R %2t\""
#watch -n 1 'squeue -u $USER -o "%.20j %.10L" | grep idv' 

foo=`interactive_time`
bar=`memory`

echo $foo "( $bar )"

#watch -n 1 'squeue -u $USER -o "%.20j %.10L" | grep idv' 
#echo -e you are doing a good job '\t' `interactive_time`

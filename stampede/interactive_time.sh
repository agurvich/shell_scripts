#!/bin/bash
function interactive_time(){
    squeue -u $USER -o "%.20j %8R %.10L" | grep 'idv'
}

    #squeue -u $USER -o "%.20j %.10L" | grep 'idv'
#alias showmyq="squeue -u $USER -o \"%.10i %.20j %.10L %5D %8R %2t\""
#watch -n 1 'squeue -u $USER -o "%.20j %.10L" | grep idv' 
echo `interactive_time`

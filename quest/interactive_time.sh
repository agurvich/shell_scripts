#!/bin/bash
function interactive_time(){
    squeue -u $USER -o "%.20j %10R %.10L" | grep 'bash'
}

#watch -n 1 'squeue -u $USER -o "%.20j %.10L" | grep idv' 
echo -e you are doing a good job '\t' `interactive_time`

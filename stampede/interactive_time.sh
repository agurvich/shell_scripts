#!/bin/bash
function interactive_time(){
    squeue -u $USER -o "%.20j %.10L" | grep 'idv'
}

#watch -n 1 'squeue -u $USER -o "%.20j %.10L" | grep idv' 
echo `interactive_time`

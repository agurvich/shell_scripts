#!/bin/bash


LINE=523 #835
LINE=get_level4_PTEH_for_eosdt
#LINE2=4047
LINE2=317

gdb star_make_planets -ex 'set breakpoint pending on' -ex 'dir ../mesa-r12778/eos/private' -ex "b eosdt_eval.f90:${LINE}" -ex 'dir ../mesa-r12778/star/private' -ex "b eosdt_eval.f90:${LINE2}" -ex 'run'

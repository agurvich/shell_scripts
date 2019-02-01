#!/bin/bash

#savenamearr=(m10v_res250)
#savenamearr=(m10q_res250)
#savenamearr=(m10v_res250)
#savenamearr=(m11c_res2100 m12m_res7100)
#savenamearr=(m11q_res7100 m12f_res7100)

#savenamearr=(m11v_res7100 m12i_res7100)
#savenamearr=(m12i_res7100)

savenamearr=(m12m_res7100)
#savenamearr=(m12f_res7100 m12i_res7100)
#savenamearr=(m12i_res7100)

for fname in "${savenamearr[@]}"
do
    for i in {0..551..50}
    do
        echo "Submitting $fname: snaplow = $i snaphigh = $(($i+50))"
        cat ks_movie.sh > tmp.sh
        echo "#SBATCH -J ${i}_${fname}           # job name" >>tmp.sh
        echo "cd /home1/04210/tg835099/starformation/scripts" >>tmp.sh
        echo python makeFullHistory.py --snaplow=$i --snaphigh=$(($i+50)) --savename=$fname --mps=2 >> tmp.sh
        sbatch tmp.sh
        rm tmp.sh
    done

done

#!/bin/bash
#SBATCH -o log_out.o%j       # output and error file name (%j expands to jobID)
#SBATCH -N 1              # total number of mpi tasks requested
#SBATCH -n 1              # total number of mpi tasks requested
#SBATCH -p skx-normal     # queue (partition) -- normal, development, etc.
#SBATCH -t 24:00:00        # run time (hh:mm:ss) - 24 hours
#SBATCH --mail-user=agurvich@u.northwestern.edu
#SBATCH -A TG-AST140023
#SBATCH -J SFR indicators           # job name


# cd /scratch/03057/zhafen/

#(python3) login3:zhafen tg835099$ ls halo_files/core/
#m10q_res250  m10y_res250  m11a_res2100  m11c_res2100  m11v_res7100  m12i_res7100
#m10v_res250  m10z_res250  m11b_res2100  m11q_res7100  m12f_res7100  m12m_res7100

#(python3) login3:zhafen tg835099$ ls halo_files/metal_diffusion/
#m11d_res7100  m11i_res7100  m12c_res7100                   m12i_res7100  m12w_res7100
#m11e_res7100  m11q_res7100  m12_elvis_RomeoJuliet_res3500  m12m_res7100  m12z_res4200
#m11h_res7100  m12b_res7100  m12f_res7100                   m12r_res7100

## core: m10q_res250 m10v_res250 m11q_res7100 m11v_res7100 m12i_res7100 m12f_res7100
## metal_diffusion: 
#fname='m12f_res7100'
metal_diffusion=False
cd $HOME/SF_indicators

fnames=(m10q_res250 m10v_res250 m11q_res7100 m11v_res7100 m12i_res7100 m12f_res7100)
for fname in "${fnames[@]}"
do
    python run.py --savename=${fname} --metal_diffusion=${metal_diffusion}
done

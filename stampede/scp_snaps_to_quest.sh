#!/bin/bash



file_arr=(
snapdir_600
snapdir_564 
snapdir_567 
snapdir_570 
snapdir_573 
snapdir_576 
snapdir_579 
snapdir_582 
snapdir_585 
snapdir_588 
)


file_arr=() 

savename=m12f_res57000
post_save=_md
dest_prefix=metal_diffusion/
branch=metal_diffusion

## copy the ahf halo file
halo_file=/scratch/03057/zhafen/halo_files/${branch}/${savename}/halo/halo_00000_smooth.dat
halo_file=/scratch/03057/zhafen/halo_files/${branch}/${savename}/halo_00000_smooth.dat
#/scratch/projects/xsede/GalaxiesOnFIRE
quest_halo_dst=/projects/b1026/agurvich/snaps/${dest_prefix}${savename}${post_save}/halo/ahf

ls ${halo_file}
echo ${quest_halo_dst}
echo

scp $halo_file abg6257@quest.northwestern.edu:$quest_halo_dst

for fname in "${file_arr[@]}"
do
    #du -sh $fname
    #/projects/b1026/agurvich/snaps/m12i_res7100/output
    src=/scratch/projects/xsede/GalaxiesOnFIRE/${branch}/${savename}/output/${fname}
    dst=/projects/b1026/agurvich/snaps/${dest_prefix}${savename}${post_save}/output/
    echo ${src}
    #ls ${src}
    echo ${dst}
    rsync -r --progress -u $src abg6257@quest.northwestern.edu:$dst
done

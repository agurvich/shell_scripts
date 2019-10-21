


file_arr=(
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


for fname in "${file_arr[@]}"
do
    #du -sh $fname
    #/projects/b1026/agurvich/snaps/m12i_res7100/output
    src=/scratch/projects/xsede/GalaxiesOnFIRE/core/m12i_res7100/output/$fname
    dst=/projects/b1026/agurvich/snaps/m12i_res7100/output/
    echo $src 
    echo $dst
    rsync -r --progress -u $src abg6257@quest.northwestern.edu:$dst

done

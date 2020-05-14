paths=(*/*/*.tar)

cwd=`pwd`

for path in "${paths[@]}"
do
    dir=`dirname ${path}`
    fname=`basename ${path}`
    cd $dir
    echo $dir
    tar -xvf $fname
    cd $cwd
done

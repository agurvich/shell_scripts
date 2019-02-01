fname=$1
out_name=$2
ffmpeg -framerate 15 -start_number 50 -i ${fname}_%03d.png -q:v 1 ~/movies/${out_name}.avi -y

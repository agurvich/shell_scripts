fname=$1
out_name=$2
#-start_number 71
ffmpeg -framerate 15  -i ${fname}%03d.png -q:v 1 ~/movies/${out_name}.mp4 -y

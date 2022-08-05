#!/bin/bash


ffmpeg -framerate ${1} -i ${@:3} -q:v 1 -o ${2}

#!/bin/bash

## remove all whitespace
savenamearr=(signatures/*)
for fname in "${savenamearr[@]}"
    do
        extension="${fname##*.}"
        filename="${fname%.*}"
        #echo $filename $extension
        no_whitespace=${fname// /_}
        mv "$fname" "$no_whitespace"
    done

## change to lowercase pdf
savenamearr=(signatures/*PDF)
for fname in "${savenamearr[@]}"
    do
        extension="${fname##*.}"
        filename="${fname%.*}"
        #echo $filename $extension
        mv "$fname" "$filename.pdf"
    done

## separate out the pdfs
mv signatures/*pdf pdfs
mv signatures/* imgs

## convert all images to 300 dpi pdfs
savenamearr=(imgs/*)
for fname in "${savenamearr[@]}"
    do
        extension="${fname##*.}"
        filename="${fname%.*}"
        if [ "$extension" != "pdf" ]
            then
            echo convert -density 100 $fname ${filename}.pdf
            convert -density 100 $fname ${filename}.pdf
            fi
    done

savenamearr=(imgs/*pdf pdfs/*pdf)
for fname in "${savenamearr[@]}"
    do
    extension="${fname##*.}"
    filename="${fname%.*}"
    convert "$fname" -flatten -resize 500x -gravity center ${filename}_resize.${extension} #-crop 100x100+0+0\! -background white -flatten this_mentor.png
    done

mv imgs/*resize* finals
mv pdfs/*resize* finals

mv imgs/* converted_already/imgs
mv pdfs/* converted_already/pdfs

convert finals/*pdf concat.pdf

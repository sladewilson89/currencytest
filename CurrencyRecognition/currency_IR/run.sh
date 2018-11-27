#!/bin/bash 

if [ ! -d "train_files" ]; then
	mkdir train_files;  
fi

topKValue=10;


for f in $2/ten/*.JPG; do echo $f;done > train_files/ten.txt
for f in $2/twenty/*.JPG; do echo $f;done > train_files/twenty.txt
for f in $2/fifty/*.JPG; do echo $f;done > train_files/fifty.txt
for f in $2/hundred/*.JPG; do echo $f;done > train_files/hundred.txt
for f in $2/fivehundred/*.JPG; do echo $f;done > train_files/fivehundred.txt
for f in $2/thousand/*.JPG; do echo $f;done > train_files/thousand.txt

g++ `pkg-config --cflags --libs opencv` testCurrency.cpp -o currency-test -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_objdetect -lopencv_flann -lopencv_calib3d -lopencv_xfeatures2d -lopencv_features2d -lopencv_imgcodecs;
./currency-test $1/dataFile.txt $1/vocabulary.bin $1/labels.txt $1/indicesSize.txt $1/allIndex.bin $topKValue $1/keypoints/ train_files/

rm -r train_files;
rm currency-test;





#!/bin/bash
SRC_ROOT_DIR=../downloads
DST_ROOT_DIR=./photos

# Refer to the proejct https://github.com/milochen0418/bash-get-google-images
# For the command $ get-google-images keyword 200
# it will make folder in ./downlodas with the name the same as to keyword
# You will have a lot of keyword subforder in downloads folder
# Thus, you can can create_a_galleries_set.sh [SRC] [DST]
# [SRC] is mean you folder downloads. DST is the folder for you to make a gallery web by this project.

if [ $# -eq 2 ]
then
	SRC_ROOT_DIR=$1
	DST_ROOT_DIR=$2
fi 

for DIR in $(ls $SRC_ROOT_DIR); 
do 
	./create_a_gallery.sh $SRC_ROOT_DIR/$DIR $DST_ROOT_DIR/$DIR 
done

echo "[Finish] the tree struture for your galleries set is"
tree -d $DST_ROOT_DIR

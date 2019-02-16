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



echo "Start to make each gallery from $SRC_ROOT_DIR to $DST_ROOT_DIR"

sleep 1 

for DIR in $(ls $SRC_ROOT_DIR); 
do 
	./create_a_gallery.sh $SRC_ROOT_DIR/$DIR $DST_ROOT_DIR/$DIR 
done

echo "All subfolder in $DST_ROOT_DIR is ready now..."

sleep 1

echo "Start to make ALL gallery to show all picture"

sleep 1



rm -rf $DST_ROOT_DIR/ALL
mkdir -p $DST_ROOT_DIR/ALL
for fp in $(find $DST_ROOT_DIR | grep .jpg$ | grep -v preview | grep -v thumbs | grep -v ALL); do
	NEW_FILE_NAME=$(md5sum $fp | awk '{print $1}').jpg #the name is md5sum of file with .jpg
	DST_FILE_PATH=$DST_ROOT_DIR/ALL/$NEW_FILE_NAME
	echo "$fp -> $DST_FILE_PATH"
	cp $fp $DST_FILE_PATH
done

echo "all photos is in the ALL gallery "
sleep 1
echo "start to make previews and thumbs for ALL gallery"
./node_modules/.bin/epg-prep $DST_ROOT_DIR/ALL


echo "[Finish] the tree struture for your galleries set is"
tree -d $DST_ROOT_DIR





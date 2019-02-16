#!/bin/bash

SRC_DIR=~/Downloads
DIST_DIR=/tmp
if [ $# -eq 2 ]; then
	SRC_DIR=$1
	DIST_DIR=$2
fi


rm -rf ./raw_photos
rm -rf 
cp -rf $SRC_DIR ./raw_photos

./rename_process.sh raw_photos $DIST_DIR
./identify_process.sh $DIST_DIR
./clean_gif_process.sh $DIST_DIR
# make preview and thumb
./node_modules/.bin/epg-prep $DIST_DIR




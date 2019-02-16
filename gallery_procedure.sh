#!/bin/bash

SRC_DIR=~/Downloads
PORT_NUM=1234

if [ $# -eq 2 ]; then
	SRC_DIR=$1
	PORT_NUM=$2
fi


apt-get install imagemagick  
apt-get install graphicsmagick  
apt-get install graphicsmagick-imagemagick-compat

npm install
rm -rf ./raw_photos
rm -rf 

cp -rf $SRC_DIR ./raw_photos

./rename_process.sh raw_photos photos
./identify_process.sh photos
# make preview
./node_modules/.bin/epg-prep ./photos

node ./app.js

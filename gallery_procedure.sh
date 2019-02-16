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


./create_a_gallery.sh $SRC_DIR ./photos


node ./app.js

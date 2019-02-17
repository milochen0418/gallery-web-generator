#!/bin/bash

SRC_DIR=~/Downloads
PORT_NUM=1234
SUB_DIR=/
if [ $# -eq 2 ]; then
	SRC_DIR=$1
	PORT_NUM=$2
fi


sudo ./deb_package_install.sh
npm install

./create_a_gallery.sh $SRC_DIR ./photos

node ./app.js --port=$PORT_NUM --subdir=$SUB_DIR

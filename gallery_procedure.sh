#!/bin/bash


PORT_NUM=1234
SRC_DIR=~/Downloads
SUB_DIR=ALL
if [ $# -gt 0 ]; then
	PORT_NUM=$1
fi

if [ $# -gt 1 ]; then
	SRC_DIR=$2
fi

if [ $# -gt 1 ]; then
	SUB_DIR=$3
fi


#basic install packages for this procedure on ubuntu
sudo ./deb_package_install.sh

npm install


# the following  method is just for single folder to show
# ./create_a_gallery.sh $SRC_DIR ./photos


# But we have a galleries set and each gallery for each subdir
./create_a_galleries_set.sh $SRC_DIR ./photos


node ./app.js --port=$PORT_NUM --subdir=$SUB_DIR

# if you call 
# $ ./gallery_procedure.sh 8866 ../downloads 校花
# Then the program will refer ../downlaods and create a galleries set in ./photos
# Thus any subdir in ./photos is gallery. and subdir is the name of that gallery.
# After galleries ready , then it will start the web by the following command
# $ node ./app.js --port=8866 --subdir=校花
# This command is mean you open gallery 校花 with port number 8866
# So you can open browser to open http://yourhost:8866/  to see 校花 gallery

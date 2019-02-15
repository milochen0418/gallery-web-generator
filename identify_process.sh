#!/bin/bash
RAW_DIR=./copy.orig
COPY_DIR=./copy
COPYTO_DIR=./copy2
FAILED_FP=/tmp/failed_pics.txt

if [ $# -eq 1 ]; then
	COPYTO_DIR=$1
fi 
rm -f $FAILED_FP
touch $FAILED_FP   

while read i; do
	if ! identify $COPYTO_DIR/$i ; then 
		echo $i >> $FAILED_FP
		rm -f $COPYTO_DIR/$i
	fi
done < <(ls $COPYTO_DIR)

exit 0



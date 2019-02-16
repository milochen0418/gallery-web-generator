#!/bin/bash

PROCESS_DIR=./photos/
if [ $# -eq 1 ]; then
	PROCESS_DIR=$1
fi

for i in $(ls $PROCESS_DIR); do 
	if file $PROCESS_DIR/$i | grep -i gif ; then 
		rm $PROCESS_DIR/$i
	fi  
done

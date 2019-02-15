#!/bin/bash

RAW_DIR=./copy.orig
COPY_DIR=./copy
COPYTO_DIR=./copy2

if [ $# -eq 2 ]; then
	RAW_DIR=$1
	COPYTO_DIR=$2
fi 
rm -rf $COPYTO_DIR
rm -rf $COPY_DIR
cp -rf $RAW_DIR $COPY_DIR
mkdir -p $COPYTO_DIR
while read i; do
	cmd=$(printf "mv '$COPY_DIR/%s' '$COPYTO_DIR/%sjpg'"  "$i"  "$(echo $i | awk '{print $1}')" )
	echo $cmd
	eval "$cmd"
done < <(ls $COPY_DIR)
exit 0




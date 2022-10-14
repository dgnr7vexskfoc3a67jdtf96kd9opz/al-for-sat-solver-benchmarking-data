#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Usage: $0 [dir]"
	exit 0
fi

f=$1
if [ -e $f ]; then
	if [ ! -e $f.xz.backup ]; then
		echo "missing $f.xz.backup"
		exit 0
	fi
	h1=$(gbd hash $f)
	h2=$(gbd hash $f.xz.backup)
	if [ "$h1" == "$h2" ]; then
		echo "hash equal to original in second round. replacing first try $f.xz"
		rm $f.xz
		xz $f
	fi
fi

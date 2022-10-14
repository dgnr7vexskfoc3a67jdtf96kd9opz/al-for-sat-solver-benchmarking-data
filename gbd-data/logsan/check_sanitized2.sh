#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Usage: $0 [dir]"
	exit 0
fi

f=$1
if [ -e $f ]; then
	if [ ! -e $f.xz ]; then
		echo "missing $f.xz"
		exit 0
	fi
	h1=$(gbd hash $f)
	h2=$(gbd hash $f.xz)
	if [ "$h1" == "$h2" ]; then
		echo "matching hashes in second round. deleting second backup $f"
		rm $f
	fi
fi

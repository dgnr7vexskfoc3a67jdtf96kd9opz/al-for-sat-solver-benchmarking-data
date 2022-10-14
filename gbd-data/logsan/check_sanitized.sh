#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Usage: $0 [dir]"
	exit 0
fi

f=$1
g=${f%.*}

h1=$(gbd hash $f)
h2=$(gbd hash $g)
if [ "$h1" != "$h2" ]; then
	echo "mismatching hashes: double checking..."
	h=${g%.*}
	if [ ! -e $h ]; then
		cnftools sanitize $f > $h
	fi
fi

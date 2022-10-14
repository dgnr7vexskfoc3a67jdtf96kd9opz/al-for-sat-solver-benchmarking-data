#!/bin/bash

URL="https://gbd.iti.kit.edu/file/"

if [ $# -lt 1 ]; then
	echo "Usage: $0 file-with-hashes"
	exit
fi

file=$1

while read -r hash; do 
	echo $URL$hash
done< <(cat $file)

#!/bin/bash

if [ $# -lt 2 ]; then
	echo "Usage: $0 [attribute] [directory]"
	exit 0
fi

cat=$1
dir=$2
for file in $(find $dir -name $cat); do 
	path=$(dirname $file); 
	val=$(cat $file)
	hashes=$(gbd get "local like $path%")
	gbd set -n $cat -v $val $hashes
done

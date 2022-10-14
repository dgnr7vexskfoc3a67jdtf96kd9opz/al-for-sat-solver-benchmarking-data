#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Usage: $0 [directory]"
	exit 0
fi

dir=$1

for f in $dir/*.out; do 
	fname=$(grep "Input:" $f | cut -d":" -f2 | xargs)
	hfixed=$(gbd get "local = $fname")
	hold=$(basename ${f%.out})
	mv -v ${dir}/${hold}.out ${dir}/${hfixed}.out
	mv -v ${dir}/${hold}.err ${dir}/${hfixed}.err
done

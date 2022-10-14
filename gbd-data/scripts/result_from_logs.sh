#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Usage: $0 [directory]"
	exit 0
fi

dir=$1

hashes=$(gbd get "year = 2020 and result = unknown")
for h in $hashes; do
	f=$dir/$h.out
#for f in $dir/*.out; do 
	#h=$(basename ${f%.out})
	if [ -e $f ]; then
		sat=$(grep '^s SATISFIABLE$' $f)
		unsat=$(grep '^s UNSATISFIABLE$' $f)
		if [[ ! -z $unsat ]]; then 
			gbd set -n result -v unsat $h
		elif [[ ! -z $sat ]]; then 
			gbd set -n result -v sat $h
		fi
	fi
done

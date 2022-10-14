#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Usage: $0 [directory]"
	exit 0
fi

dir=$1

#gbd group -u empty minisat

for h in $(gbd get); do
	f=$dir/$h.out
        if [ -e $f ]; then
		res=$(grep 'SATISFIABLE$' $f)
		if [ ! -z "$res" ]; then
			#fname=$(grep "Input:" $f | cut -d":" -f2 | xargs)
			#h=$(gbd get "local = $fname")
			#h=$(basename ${f%.out})
			runtime=$(grep "CPU time" $f | cut -d":" -f2 | cut -d"." -f1 | tr -dc '0-9' | xargs)
			gbd set -f -n minisat -v $runtime $h
			echo $h $runtime
		else
			mem=$(grep 'out of memory' $dir/$h.err)
			tim=$(grep 'out of time' $dir/$h.err)
			if [ ! -z "$mem" ]; then
				gbd set -f -n minisat -v memout $h
				echo $h memout
			elif [ ! -z "$tim" ]; then
				gbd set -f -n minisat -v timeout $h
				echo $h timeout
			else 
				gbd set -f -n minisat -v failed $h
				echo $h failed
			fi
		fi
	fi
done

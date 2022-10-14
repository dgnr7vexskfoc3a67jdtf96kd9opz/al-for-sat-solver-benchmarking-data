#!/bin/bash

if [ $# -lt 2 ]; then
	echo "Usage: $0 [attribute] [database]"
	exit 0
fi

cat=$1
db=$2
IFS=$'\n'; for line in $(gbd --db $db get "$cat != unknown" -r $cat local -c); do
	path=$(echo $line | cut -d" " -f3)
	val=$(echo $line | cut -d" " -f2)
	hashes=$(gbd get "local like $path%")
	gbd set -f -n $cat -v $val $hashes
done

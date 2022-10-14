#!/bin/bash

# init
n_per=13
n_new=300
n_old=100
benchs=""

# select new benchs
Q="track=submissions_2022 and interesting=yes"
authors=$(gbd get "$Q" -g author)
for a in $authors; do
	if [ "$a" == "aws" ]; then
		sel=$(gbd get "$Q and author=$a" | shuf --random-source=<(yes 2022) -n 20)
		echo "selected $(echo $sel | wc -w) instances of author $a"
		benchs="$benchs $sel"
	else	
		sel=$(gbd get "$Q and author=$a" | shuf --random-source=<(yes 2022) -n $n_per)
                echo "selected $(echo $sel | wc -w) instances of author $a"
                benchs="$benchs $sel"
	fi
done

# count
n_total=$(echo $benchs | wc -w)
n_unsat=$(echo $benchs | gbd get "result=unsat" | wc -l)
n_sat=$(echo $benchs | gbd get "result=sat" | wc -l)

echo "selected $n_total instances, of which $n_sat are known to be satisfiable and $n_unsat are known to be unsatisfiable"

# remove random k such that n_total = n_new (check before if we have more sat or more unsat instances)
if [ $n_total -gt $n_new ]; then
        n_diff=$(($n_total - $n_new))
        n_total=$n_new
        echo "removing $n_diff instances"
        if [ $n_sat -gt $n_unsat ]; then
				n_new_sat=$(($n_sat - $n_diff))
                keep=$(echo $benchs | gbd get "result!=sat")
                subs=$(echo $benchs | gbd get "result=sat" | shuf --random-source=<(yes 2022) -n $n_new_sat)
                benchs="$keep $subs"
                n_sat=$n_new_sat
        else
				n_new_unsat=$(($n_unsat - $n_diff))
                keep=$(echo $benchs | gbd get "result!=unsat")
                subs=$(echo $benchs | gbd get "result=unsat" | shuf --random-source=<(yes 2022) -n $n_new_unsat)
                benchs="$keep $subs"
                n_unsat=$n_new_unsat
        fi
fi

echo "selected $n_total instances, of which $n_sat are known to be satisfiable and $n_unsat are known to be unsatisfiable:"

echo $benchs

# select old benchs
n_diff=$(($n_unsat - $n_sat))
n_old_unsat=$(( ($n_old - $n_diff) / 2 ))
n_old_sat=$(($n_old - $n_old_unsat))

Q="local unlike %sat2022% and family unlike %random% and track unlike %random% and family unlike %agile% and track unlike %crafted% and track unlike %handmade% and interesting=yes"
bench_sat=$(gbd get "$Q and result=sat" | shuf --random-source=<(yes 2022) -n $n_old_sat)
bench_unsat=$(gbd get "$Q and result=unsat" | shuf --random-source=<(yes 2022) -n $n_old_unsat)

echo "selected $n_old instances, of which $n_old_sat are known to be satisfiable and $n_old_unsat are known to be unsatisfiable:"

echo $bench_sat $bench_unsat

#!/bin/bash
exec 2> /dev/null

# setup database
export GBD_DB=/home/iser/git/gbd-data/meta.db

if [ ! -e $GBD_DB ]; then
	echo "Download https://gbd.iti.kit.edu/getdatabase/meta.db"
	echo "Then modify the database path $GBD_DB accordingly"
	exit
fi

filenew="main2021.new"
fileold="main2021.old"
fileboth="main2021.all"
filecrypto="crypto2021.all"

# selection paramters:
#  - size: number of instances per author
#  - hard: hardness measure based on minisat (timeout was set to 600 sec.)
size=12 
if [ $# -gt 0 ]; then size=$1; fi

#
## SELECT 300 INSTANCES NOT "SEEN" BEFORE
submissions="local like %sat2021%"
hard="(minisat = timeout or minisat > 60)" 

# get k random instances per author in new submissions
for a in $(gbd get "$submissions" -g author); do 
	gbd get "author=$a and family != cryptography and $hard and $submissions" | shuf -n $size 
done > $filenew

# get k random instances per author in ISC-2020 unselected submissions 
# (_unselected_ instances, _largest_ sets, authors _not participating_)
previous="local like %sat2020%"
hashes=$(gbd get "$previous" -r competition_track | grep -v "main\|planning")
for a in holten johnson schidler; do
	echo $hashes | gbd get "(author = $a and $hard and $previous)" | shuf -n $size
done >> $filenew

# fill with preiner's SMT instances
amount=$((300 - $(cat $filenew | wc -l)))
echo $hashes | gbd get "author = preiner and $hard and $previous" | shuf -n $amount >> $filenew

#
## SELECT 100 INSTANCES "SEEN" BEFORE
nsat=$(cat $filenew | gbd get "result = sat" | wc -l)
nunsat=$(cat $filenew | gbd get "result = unsat" | wc -l)
osat=$((50 - ($nsat - $nunsat) / 2))
ounsat=$((50 - ($nunsat - $nsat) / 2))

old="(local like %sat201% or local like sat200%)"
family="family != unknown and family != cryptography and family != popularity-similarity-random and family != random-modularity and family != random-mus and family != random-planted-solution and family != random-popularity-similarity and family != random-selman and family != uniform-random"
author="author != unknown"
for a in $(gbd get "local like %sat2021%" -g author); do
	author+=" and author != $a"
done
gbd get "result = sat and $old and $hard and $author and $family" | shuf -n $osat > $fileold
gbd get "result = unsat and $old and $hard and $author and $family" | shuf -n $ounsat >> $fileold

#
## SELECT 200 CRYPTOGRAPHIC INSTANCES
for g in md4 md5 sha1 sha256; do
	# k instance per sub-category of author gocht
	gbd get "author = gocht and family = cryptography and $hard and $submissions and local like %$g%" | shuf -n $size
done > $filecrypto
# all crypto instances not selected in last year
gbd get "local like %sat2020% and $hard and family = cryptography" -r competition_track | sort -k2 | grep -v main >> $filecrypto
#
## that makes 56 gocht + 63 (paxian,shaw,soos) = 119 instances "not seen before"
### now select 81 instances "seen before"
amount=$((200 - $(cat $filecrypto | wc -l)))

oldhardcrypto="family like crypto% and $hard and (local like %sat201% or local like %sat200%)"
for a in $(gbd get "$oldhardcrypto" -g author); do
	if [ "$a" == "md5gen" ]; then continue; fi
	if [ "$a" == "desgen" ]; then continue; fi
	if [ "$a" == "unknown" ]; then continue; fi
	gbd get "$oldhardcrypto and author = $a" | shuf -n 6
done >> $filecrypto

# fill with old crypto instances of 'unknown' origin
amount=$((200 - $(cat $filecrypto | wc -l)))
gbd get "$oldhardcrypto and author = unknown" | shuf -n $amount >> $filecrypto

#
## MERGE RESULT AND PRINT STATS
cat $filenew > $fileboth
cat $fileold >> $fileboth

for f in $filenew $fileold $fileboth $filecrypto; do
	total=$(wc -l $f)
	# get sat/unsat stats
	dist=$(cat $f | gbd get -r result | cut -d" " -f2 | sort | uniq -c | xargs)
	echo "Total: $total ($dist)"
	# get author/family stats
	cat $f | gbd get -r author family | cut -d" " -f2- | sort | uniq -c
done

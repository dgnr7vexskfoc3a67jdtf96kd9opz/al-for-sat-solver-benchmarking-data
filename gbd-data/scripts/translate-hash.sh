f=$1
cnf=$(grep "Input:" $f)
g=$(echo ${cnf##*/} | sed 's/.gz//' | sed 's/[#:=]/% and filename like %/g')
h=$(gbd get "filename like $g%") 
if [ $(echo $h | wc -w) -eq 1 ]; then
	echo "Found unique hash by filename search"
	echo $h > translate-hash/${f##*/}
else
	echo "Filename search ambiguous. Recalculating hash."
	g=$(grep Input $f | sed 's/raid\/iser\/cnf/raid\/gbd\/cnf-3/;s/.gz//')
	gbd hash ${g#*:}.xz > translate-hash/${f##*/};
fi

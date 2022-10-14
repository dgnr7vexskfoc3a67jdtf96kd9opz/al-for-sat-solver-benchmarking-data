gbd group year
for y in $(seq 2006 2020); do
	gbd set -n year -v $y $(gbd get "local like %sat$y%")
done

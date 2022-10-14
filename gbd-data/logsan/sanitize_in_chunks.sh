#!/bin/bash

for a in $(gbd get "track != submissions_2022" -g author); do
	echo gbd -j 64 init sanitize "track != submissions_2022 and author = $a"
	gbd -j 64 init sanitize "track != submissions_2022 and author = $a"
done

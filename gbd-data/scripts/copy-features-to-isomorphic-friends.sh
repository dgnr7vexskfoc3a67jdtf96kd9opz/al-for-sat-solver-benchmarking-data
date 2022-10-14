ask() {
    # https://djm.me/ask
    local prompt default reply

    if [ "${2:-}" = "Y" ]; then
        prompt="Y/n"
        default=Y
    elif [ "${2:-}" = "N" ]; then
        prompt="y/N"
        default=N
    else
        prompt="y/n"
        default=
    fi

    while true; do

        # Ask the question (not using "read -p" as it uses stderr not stdout)
        echo -n "$1 [$prompt] "

        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read reply </dev/tty

        # Default?
        if [ -z "$reply" ]; then
            reply=$default
        fi

        # Check if the reply is valid
        case "$reply" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}

always=0
feature="family"
if [ $# -gt 0 ]; then
	feature=$1
	if [ $# -gt 1 ]; then 
		ask "copy without asking?" N
		if [ $? -eq 0 ]; then
			always=1
		fi
	fi
fi

IFS=$'\n'
for line in $(gbd get -g degree_sequence_hash -r hash | grep , | cut -d" " -f2- | tr , " " 2> /dev/null); do 
	fam="start"; hash="start"
	for inst in $(echo $line | gbd get -r year $feature filename 2> /dev/null); do 
		IFS=$' '; arr=($inst); echo $inst
		if [ $fam = "start" ]; then 
			fam=${arr[2]}; hash=${arr[0]}
		elif [ $fam != ${arr[2]} ]; then 
			echo $fam ${arr[2]}
			if [ $fam = "unknown" ]; then 
				if [ $always -eq 0 ]; then
					ask "set $hash to ${arr[2]}?" Y
					if [ $? -eq 0 ]; then 
						gbd set -n $feature -v ${arr[2]} $hash
					fi 
				else
					gbd set -n $feature -v ${arr[2]} $hash
				fi
			elif [ ${arr[2]} = "unknown" ]; then 
				if [ $always -eq 0 ]; then
					ask "set ${arr[0]} to $fam?" Y
					if [ $? -eq 0 ]; then
						gbd set -n $feature -v $fam ${arr[0]}
					fi
				else
					gbd set -n $feature -v $fam ${arr[0]}
				fi
			fi
		fi
	done
	IFS=$'\n'
	echo -----
done

#!/usr/bin/env sh

#-------------------------------------
# tidyman  v.1.0
# a script for lazy people which tidies files
# by dastergon -- dastergon [AT] gmail [DOT] com
# www.dastergon.gr
#-------------------------------------

name="$0"

usage() {
    printf "usage: %s [option(s)] path\n\n  %s\n" "$name" "Options:"
    printf "\t%s\n" "-a - Tidy only audio"              \
                    "-d - Tidy only documents\n"        \
                    "-h - Display this help and exit\n" \
                    "-i - Tidy only images"             \
                    "-v - Tidy only videos"             \
                    "e.g. $name -adiv /home/user/Downloads - Tidy all"
}

while true; do
	case "$1" in
		-h|--help)
            usage
			exit 0
			;;
		-a)
            audio=1
			;;
		-d)
            docum=1
			;;
		-i)
            image=1
			;;
        -v)
            video=1
            ;;
		-*)
            printf "error: unknown argument: %s\nTry %s -h for help.\n" "$1" "$name"
			exit 1
			;;
		esac
	done
unset IFS

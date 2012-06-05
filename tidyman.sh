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
        *)
            break
            ;;
    esac
    shift
done

folder="${1%/}"
[ -n "$folder" ] || {
    printf "error: %s: no directory given\n" "$name"
    exit 1
}
[ -d "$folder" ] || {
    printf "error: %s: can't find directory: %s\n" "$name" "$folder"
    exit 1
}

if [ "$audio" -eq 1 ]; then
    type="audio"
    printf "Tidying %s files ...\n" "$type"
    [ -d "$folder/tidyman/$type" ] || mkdir -p "$folder/tidyman/$type"
    mv "$folder"/*.{mp3,wma,wav,acc,flac} "$folder/tidyman/$type" 2>/dev/null
fi

if [ "$docum" -eq 1 ]; then
    type="document"
    printf "Tidying %s files ...\n" "$type"
    [ -d "$folder/tidyman/$type" ] || mkdir -p "$folder/tidyman/$type"
    mv "$folder"/*.{doc,pdf,txt,odt,docx,xls,ppt} "$folder/tidyman/$type" 2>/dev/null
fi

if [ "$image" -eq 1 ]; then
    type="image"
    printf "Tidying %s files ...\n" "$type"
    [ -d "$folder/tidyman/$type" ] || mkdir -p "$folder/tidyman/$type"
    mv "$folder"/*.{png,gif,jpg,tif,jpeg,tiff,JPEG,TIFF} "$folder/tidyman/$type" 2>/dev/null
fi

if [ "$video" -eq 1 ]; then
    type="video"
    printf "Tidying %s files ...\n" "$type"
    [ -d "$folder/tidyman/$type" ] || mkdir -p "$folder/tidyman/$type"
    mv "$folder"/*.{3gp,mov,avi,wmv,webm,mpeg,ogg,mpg,mp4,flv,swf} "$folder/tidyman/$type" 2>/dev/null
fi


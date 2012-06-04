#!/usr/bin/env sh

#-------------------------------------
# tidyman  v.1.0
# a script for lazy people which tidies files
# by dastergon -- dastergon [AT] gmail [DOT] com
# www.dastergon.gr
#-------------------------------------

name="$0"

IFS=$(echo -en "\n\b") #fix the issue about files with space between - e.g. "foo bar.jpg"
OPTIND=1 #reset getopts
folder=$2

#reg.exp form vars
aud=".mp3|.wma|.flac|.wav|.aac"
img=".png|.gif|.jpg|.jpeg|.tif|.tiff|.JPEG|.TIFF"
doc=".doc|.pdf|.txt|.odt|.docx|.xls|.ppt"
vid=".3gp|.mov|.webm|.avi|.wmv|.ogg|.mpeg|.mpg|.mp4|.flv|.swf"

usage() {
    printf "usage: %s [option(s)] path\n\n  %s\n" "$name" "Options:"
    printf "\t%s\n" "-a - Tidy only audio"              \
                    "-d - Tidy only documents\n"        \
                    "-h - Display this help and exit\n" \
                    "-i - Tidy only images"             \
                    "-v - Tidy only videos"             \
                    "e.g. $name -adiv /home/user/Downloads - Tidy all"
}

while getopts ":a:d:i:v:h" optchar; do
	case ${optchar} in
		h)
            usage
			exit 0
			;;
		\?)
            printf "error: unknown argument: -%s\nTry %s -h for help\n" "$OPTARG" "$name"
			exit 1
			;;
		:)
            printf "Option -%s requires a path. see %s -h\n" "$OPTARG" "$name"
			exit 1
			;;
		a)
			count_audio=`ls  $folder | egrep "$aud"| wc -l`
			echo "Tidying $count_audio audio files ..."
			if [ ! -d "$folder/tidyman/Audio" ];then
				mkdir -p $folder/tidyman/Audio
			fi
			for i in `ls $folder | egrep "$aud"`; do
				mv $folder/$i $folder/tidyman/Audio/
			done
			;;
		d)
			count_doc=`ls $folder | egrep "$doc"| wc -l`
			echo "Tidying $count_doc documents ..."
			if [ ! -d "$folder/tidyman/Documents" ]; then
				mkdir -p $folder/tidyman/Documents
			fi
			for i in `ls $folder | egrep "$doc"`; do
				mv $folder/$i $folder/tidyman/Documents/
			done
			;;
		i)
			count_images=`ls  $folder | egrep  "$img"| wc -l`
			echo "Tidying $count_images images ..."
			if [ ! -d "$folder/tidyman/Images" ];then
				mkdir -p $folder/tidyman/Images
			fi
			for i in `ls $folder | egrep "$img"`; do
				mv $folder/$i $folder/tidyman/Images/
			done
			;;
		v)
			count_videos=`ls  $folder |  egrep "$vid"| wc -l`
			echo "Tidying $count_videos videos ..."
			if [ ! -d "$folder/tidyman/Videos" ]; then
				mkdir -p $folder/tidyman/Videos
			fi
			for i in `ls $folder | egrep "$vid"`; do
				mv $folder/$i $folder/tidyman/Videos/
			done
			;;
		esac
	done
unset IFS

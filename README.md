## Introduction

In real life you need to tidy up things
like your clothes and your house when your parents are going to visit you (true story).
When you're in front of the computer/laptop/netbook screen
downloading things like images, videos, audio files and documents..
when you go to your "Downloads" folder there is a total chaos,
then you realize that you should tidy these things to clean up this mess,
and to tell the truth, it is one of the most boring things.
Time is precious time and this is where tidyman comes in!

## About Tidyman

Tidyman is a tool that automatically tidies your images, your videos, your audio files and your documents .
It is very easy to use and you need only few seconds to run it!!
It creates a folder named "tidyman" in the folder you want to tidy and it creates folders based on what type of file you want to tidy.

## Usage

    usage: ./tidyman.sh [option(s)] path

      Options:
    	-a - Tidy only audio
    	-d - Tidy only documents\n
    	-h - Display this help and exit\n
    	-i - Tidy only images
    	-v - Tidy only videos
    	e.g. ./tidyman.sh -adiv /home/user/Downloads - Tidy all

## Examples

Single argument - tidy only images.

    user@linux~$./tidyman.sh -i Downloads/

Double argument - tidy images and videos

    user@linux~$./tidyman.sh -i -v Downloads/

All arguments - tidy all (audio,documents,images,videos)

    user@linux~$./tidyman.sh -a -d -i -v Downloads/

## Author

 * Pavlos Ratis ( dastergon )
   dastergon [at] gmail [dot] com
   http://dastergon.gr

 * Ivan Kanakarakis ( c00kiemon5ter )
   http://c00kiemon5ter.github.com

## License

Public domain


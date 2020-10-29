#!/bin/bash

if [ ! $# == 2 ]; then
    echo "Usage: $0 [download program] [file with download links]"
    exit
fi

if [ ! -f $2 ]; then
    echo "File with links not found!"
    exit
fi

if [ $1 == "wget" ]; then
    wget -i $2
    exit
elif [ $1 == "yt-dl" ] || [ $1 == "youtube-dl" ]; then
    youtube-dl -f best $(cat $2)
    exit
else
    $1 $(cat $2)
    exit
fi
exit

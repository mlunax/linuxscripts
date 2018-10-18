#!/bin/bash

if [ ! $# == 2 ]; then
    echo "Usage: $0 [axel/wget/megadl] [file with download links]"
    exit
fi

if [ ! -f $2 ]; then
    echo "File with links not found!"
    exit
fi

if [ $1 == "axel" ]; then
    axel $(cat $2)
elif [ $1 == "wget" ]; then
    wget -i $2
elif [ $1 == "megadl" ]; then
    megadl $(cat $2)
fi
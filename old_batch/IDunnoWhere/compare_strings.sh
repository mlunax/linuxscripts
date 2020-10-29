#!/bin/bash

if [ ! $# == 2 ]; then
	echo 'Put first string'
	read $ONE
	echo 'And now second string'
	read $TWO
else
ONE="$1"
TWO="$2"
fi

if [ "$ONE" == "$TWO" ]; then
	echo -e '\e[92mSame'
else
	echo -e '\e[91mNot the same'
fi
echo -e '\e[39m'

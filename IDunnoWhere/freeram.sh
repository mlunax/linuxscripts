#!/bin/bash

ctrl_c() {
 exit;
}

if [ ! $# == 1 ]; then
	TIME=300;
else
	TIME=$1;
fi

echo
echo Sleep time: $TIME
echo

while true; do
	trap ctrl_c INT
	trap ctrl_c INT
	echo -------------------
	free -m;
	sync && echo 3 > /proc/sys/vm/drop_caches;
	free -m;
	echo Done
	echo -------------------
	echo
	sleep $TIME;
done



#!/bin/bash
if [ ! $# == 1 ]; then
	TIME=300;
else
	TIME=$1
fi
while true; do
echo -------------------
free -m;
sync && echo 3 > /proc/sys/vm/drop_caches;
free -m;
echo Done
echo -------------------
sleep $TIME;
done



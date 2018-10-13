#!/bin/bash
me=`basename "$0"`
echo $me "$$"

ctrl_c() {
 exit;
}
for (( ; ; ))
do
trap ctrl_c INT
trap ctrl_c INT
beep -f 1000
beep -f 2000
beep -f 1500
done


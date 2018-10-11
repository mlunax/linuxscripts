#!/bin/bash

echo 'Remember to make backup the original /etc/portainer/make.conf'
echo
echo

if [ ! -f /etc/portage/make.conf.nodistcc ]; then
	echo "Make the '/etc/portage/make.conf.nodistcc' file without distcc configuration. Then add \#nodistcc at the first line"
	exit
fi

if [ ! -f /etc/portage/make.conf.distcc ]; then
        echo "Make the '/etc/portage/make.conf.nodistcc' file without distcc configuration. Then add \#distcc at the first line"
        exit
fi

if [ "$(head -n1 /etc/portage/make.conf.distcc)" != "#distcc" ]; then
	echo "Give to the /etc/portage/make.conf.distcc the beggining line with '#distcc'"
	exit
fi

if [ "$(head -n1 /etc/portage/make.conf.nodistcc)" != "#nodistcc" ]; then
        echo "Give to the /etc/portage/make.conf.distcc the beggining line with '#NOdistcc'"
        exit
fi


echo 'The checking return successful msg'

exit


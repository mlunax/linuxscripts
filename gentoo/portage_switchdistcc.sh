#!/bin/bash
echo "Distcc portage changer"

if [ "$(head -n1 /etc/portage/make.conf)" == "#distcc" ]; then
	cp -f /etc/portage/make.conf.nodistcc /etc/portage/make.conf
	echo "Distcc change to NODistcc"
	exit
fi

if [ "$(head -n1 /etc/portage/make.conf)" == "#nodistcc" ]; then
        cp -f /etc/portage/make.conf.distcc /etc/portage/make.conf
        echo "NODistcc change to Distcc"
	exit
fi



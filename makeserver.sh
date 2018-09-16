#!/bin/bash

#checking distro
apt install lsb-core
if [ $(lsb_release -is) !=  "Debian" ]; then echo "Script only for Debian"; fi
if [ $(id -u) != "0" ]; then echo "Only root"; fi

#What's your zsh theme?
echo "What's your ZSH theme? ('0' or empty will not install)"
read zshtheme

#Install docker?
echo "Install docker? [Y/n]"
read dockerbool

if ( [ "$dockerbool" == "Y" ] || [ "$dockerbool" == "y" ]  || [ -z "$dockerbool" ]  || [ "$dockerbool" == "p" ] ); then
	echo "Portainer port? ('0' or empty will not install)"
	read portainerport
fi

#Instal basics
apt install -y git wget curl sudo

#Install zsh
if ( [ "$zshtheme" != "0" ]  && [ -n "$zshtheme" ] ); then
	apt install -y zsh
	curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"$zshtheme\"/g" ~/.zshrc
	source ~/.zshrc
fi

installportainer (){
	if  ( ( [ "$portainerport" != "0" ] && [ -n "$portainerport" ] ) || [ "$dockerbool" == "p" ] ); then
		docker volume create portainer_data
		docker run --name portainer -d -p $portainerport:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
	fi
}

#Install docker
if ( [ "$dockerbool" == "Y" ] || [ "$dockerbool" == "y" ] ) || [ -z "$dockerbool" ]; then
	sudo apt-get install -y apt-transport-https ca-certificates wget software-properties-common
	wget https://download.docker.com/linux/debian/gpg
	sudo apt-key add gpg
	rm gpg
	if [ $(lsb_release -cs) == "sid" ]; then
		echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" | tee -a /etc/apt/sources.list.d/docker.list
	else
		echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee -a /etc/apt/sources.list.d/docker.list
	fi
	apt update
	apt-get -y install docker-ce python-pip
	pip install docker-compose
	systemctl enable docker
fi
installportainer
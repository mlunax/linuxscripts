#!/bin/bash
sudo pacman -S noto-fonts-emoji
[ -f ~/.config/fontconfig/ ] || mkdir ~/.config/fontconfig/
if [ -f ~/.config/fontconfig/fonts.conf ]; then
	cp ~/.config/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf.bak
fi
curl "https://gist.githubusercontent.com/SohamG/6b8830cc08a22bc5bc24c76ef799510a/raw/d660235f2358e3256aeea7e28f88d48a42d2d74b/fonts.conf" >> ~/.config/fontconfig/fonts.conf

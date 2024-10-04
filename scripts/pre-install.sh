#!/bin/bash

######## yay ########

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

####### pentesting #######

curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
./strap.sh

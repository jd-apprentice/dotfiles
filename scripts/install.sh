#!/bin/bash

# variables
pacman=pacman.txt
yay=yay.txt
repos=repos.txt

# pacman applications
if [[ $1 = txt/$pacman ]]; then
  echo "🔴 Installing apt packages..."
  for f in $(cat $1);
  do 
    yes | sudo pacman -S $f;
  done;
# yay applications
elif [[ $1 = txt/$yay ]]; then
  echo "🔴 Installing snap packages..."
  for f in $(cat $1);
  do 
    sudo yay -S $f;
  done;
# aur packages
elif [[ $1 = txt/$repos ]]; then
  echo "🔴 Installing deb packages..."
  for f in $1/*.git;
  do 
    sudo git clone $f
    sudo chown -R whoami $f
    cd $f
    makepkg -si
    cd ..
  done;
# wrong file name
else
  echo "$1 does not exist"
fi

# update dependencies
sudo pacman -Syu

# finished installation
echo "🏁 Done"
clear

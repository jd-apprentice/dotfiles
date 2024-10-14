#!/bin/bash

arg=$1
pacman_options=("txt/pacman.txt" "txt/development.txt" "txt/pentest.txt")

if [[ " ${pacman_options[*]} " =~ " ${arg} " ]]; then
  echo "🔴 Installing pacman packages..."
  for f in $(cat "$arg");
  do 
    yes | sudo pacman -S $f;
  done;
fi

if [[ "$arg" = "txt/$yay" ]]; then
  echo "🔴 Installing yay packages..."
  for f in $(cat "$arg");
  do 
    sudo yay -S $f;
  done;
fi

if [[ "$arg" = "txt/$repos" ]]; then
  echo "🔴 Installing native packages..."
  for f in "$arg"/*.git;
  do 
    sudo git clone $f
    sudo chown -R whoami $f
    cd $f
    makepkg -si
    cd ..
  done;
fi

sudo pacman -Syyu
echo "🏁 Done"
clear

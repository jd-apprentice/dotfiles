#!/bin/bash

# Permissions for the scripts
for file in $(cat ./txt/scripts.txt);
  do 
    chmod +x $file;
  done;

# Running scripts
./download.sh
./install.sh txt/software-install.txt
./install.sh txt/snap-install.txt
./install.sh ~/Downloads
./post-install.sh
./directory.sh
./git-install.sh

# Post install
clear
# Setting zsh as default shell
chsh -s $(which zsh)
#!/bin/bash

# Permissions for the scripts
for file in $(cat ./txt/scripts.txt);
  do 
    chmod +x $file;
  done;

# Running scripts
./scripts/install.sh txt/pacman.txt
./scripts/install.sh txt/yay.txt
./scripts/install.sh txt/repos.txt
#./scripts/post-install.sh
#./scripts/directory.sh
#./scripts/git-install.sh
#./scripts/pem.sh

# Post install
clear

# Setting zsh as default shell
chsh -s $(which zsh)
#!/bin/bash

# Permissions for the scripts
for file in $(cat ./txt/scripts.txt);
  do 
    chmod +x ./scripts/$file;
  done;

# Running scripts
./scripts/download.sh
./scripts/install.sh txt/software-install.txt
./scripts/install.sh ~/Downloads
./scripts/post-install.sh
./scripts/directory.sh
./scripts/themes.sh
./scripts/git-install.sh

# Post install
clear

# Setting zsh as default shell
chsh -s $(which zsh)
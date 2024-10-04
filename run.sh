#!/bin/bash

# Permissions for the scripts
for file in $(cat ./txt/scripts.txt);
  do
    chmod +x $file;
  done;

# Running scripts
./scripts/pre-install.sh
./scripts/install.sh txt/pacman.txt
./scripts/install.sh txt/yay.txt
./scripts/install.sh txt/repos.txt
./scripts/post-install.sh
./scripts/directory.sh
./scripts/git-config.sh

# Post install
clear

#!/bin/bash

# Permissions for the scripts
for file in $(cat ./txt/scripts.txt);
  do 
    chmod +x $file;
  done;

# Running scripts
./install.sh txt/software-install.txt
./install.sh txt/snap-install.txt
./directory.sh
./git-install.sh

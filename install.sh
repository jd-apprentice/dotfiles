#!/bin/bash
software=software-install.txt
snap=snap-install.txt

if [[ $1 = txt/$software ]]; then
  for f in $(cat $1);
  do 
    sudo apt install $f -y;
  done;
elif [[ $1 = txt/$snap ]]; then
  for f in $(cat $1);
  do 
    sudo snap install $f;
  done;
else
  echo "$1 does not exist"
fi
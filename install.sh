#!/bin/bash

software=software-install.txt
snap=snap-install.txt

if [[ $1 = txt/$software ]]; then
  echo "🔴 Installing apt packages..."
  for f in $(cat $1);
  do 
    sudo apt install $f -y;
  done;
  echo "🏁 Done"
elif [[ $1 = txt/$snap ]]; then
  echo "🔴 Installing apt packages..."
  for f in $(cat $1);
  do 
    sudo snap install $f;
  done;
  echo "🏁 Done"
else
  echo "$1 does not exist"
fi
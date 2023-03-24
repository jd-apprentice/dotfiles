#!/bin/bash

# variables
software=software-install.txt
deb=~/Downloads

# apt applications
if [[ $1 = txt/$software ]]; then
  echo "🔴 Installing apt packages..."
  for f in $(cat $1);
  do 
    sudo apt install $f -y;
  done;
# deb applications
elif [[ $1 = $deb ]]; then
  echo "🔴 Installing deb packages..."
  for f in $1/*.deb;
  do 
    sudo dpkg -i $f;
  done;
# wrong file name
else
  echo "$1 does not exist"
fi

# install peer-dependencies
sudo apt install -f -y

# finished installation
echo "🏁 Done"
clear
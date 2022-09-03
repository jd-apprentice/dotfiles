#!/bin/bash

# variables
software=software-install.txt
snap=snap-install.txt
deb=~/Downloads

# apt applications
if [[ $1 = txt/$software ]]; then
  echo "🔴 Installing apt packages..."
  for f in $(cat $1);
  do 
    sudo apt install $f -y;
  done;
# snap applications
elif [[ $1 = txt/$snap ]]; then
  echo "🔴 Installing snap packages..."
  for f in $(cat $1);
  do 
    sudo snap install $f;
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

# post-install
sudo apt install -f

# finished installation
echo "🏁 Done"
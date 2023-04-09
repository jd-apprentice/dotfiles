#!/bin/bash

mkdir ./themes/ready2install

files=./themes/*.tar.xz

for f in $files; do
  echo "🔴 Extracting $f..."
  tar -xf $f -C ./themes/ready2install
done

## Copy files

echo "🔴 Copying files..."

cp ./themes/ready2install/Ultimate-Maia-Black ~/.themes
cp ./themes/ready2install/Black-Maia-43 ~/.themes
cp ./themes/ready2install/Kripton-v40 ~/.themes
cp ./themes/ready2install/Red-Maia ~/.icons
cp ./themes/wallpapers/bg.mp4 ~/Videos
#!/bin/bash

mkdir ./themes/ready2install

files=themes/*

for f in $files; do
    if [[ -e $files ]]; then
        tar xvf ./themes/${f:7} --directory ./themes/ready2install
    else
        echo "Unable to find files in ${files} directory"
    fi
done;

## Copy files

echo "🔴 Copying files..."

cp ./themes/ready2install/Ultimate-Maia-Black ~/.themes
cp ./themes/ready2install/Black-Maia-43 ~/.themes
cp ./themes/ready2install/Red-Maia ~/.icons
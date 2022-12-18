#!/bin/bash

echo "🔴 Moving to Home..."

cd $HOME

echo "🔴 Creating base folders..."

mkdir Documents/Trabajo
mkdir Documents/Proyectos

mkdir ~/.icons
mkdir ~/.themes

echo "🟢 Coming back to the folder repository..."

cd dotfiles/

echo "🟢 Copying configuration files..."

cp -r ./kitty ~/.config
cp ./zsh/.zshrc $HOME

echo "🏁 Finished"

clear
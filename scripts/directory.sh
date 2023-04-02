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
cp -r ./ulauncher ~/.config
cp -r ./autokey ~/.config
cp ./zsh/.zshrc $HOME
cp ./neofetch/config.conf ~/.config/neofetch
cp ./video-wallpaper/settings.conf ~/.config/gpu-video-wallpaper

echo "🏁 Finished"

clear
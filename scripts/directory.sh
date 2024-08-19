#!/bin/bash

echo "🔴 Moving to Home..."

cd $HOME

echo "🔴 Creating base folders..."

mkdir Documents/Trabajo
mkdir Documents/Proyectos
mkdir Documents/Ideas
mkdir Documents/Youtube

echo "🟢 Coming back to the folder repository..."

cd dotfiles/

echo "🟢 Copying configuration files..."

cp -r ./alacritty ~/.config
cp ./zsh/.zshrc $HOME

echo "🏁 Finished"

clear
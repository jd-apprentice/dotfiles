#!/bin/bash

######## configuration ########

sudo timedatectl set-timezone America/Argentina/Buenos_Aires
chmod 400 ~/.ssh/config

######## nvm ########

echo "🎯 Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
echo "🔌 Getting node lts..."
nvm install --lts

######## docker ########

sudo usermod -aG docker $USER
newgrp docker

######## clear ########

rm -rf $HOME/dotfiles
rm $HOME/RiceInstaller

######## rsync ########
cp utils/.rsyncignore $HOME
cp utils/backup /usr/local/bin/backup
chmod +x /usr/local/bin/backup
backup restore

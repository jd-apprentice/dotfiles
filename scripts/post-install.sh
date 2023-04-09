#!/bin/bash

######## oh-my-zsh ########

echo "🎳 Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "🎲 Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "🎷 Cloning the zsh-autosuggestions repo..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

######## nvm ########

echo "🎯 Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "🔌 Getting node lts..."
nvm install --lts

######## TMUX ########

echo "🔴 Moving to Home..."
cd

# clone the config
echo "⌛️ Cloning the repository..."
git clone https://github.com/gpakosz/.tmux.git

# create ls
echo "🔗 Creating symbolic link..."
ln -s -f .tmux/.tmux.conf

# copy the config
echo "🛠️ Copying config..."
cp .tmux/.tmux.conf.local .

####### DOCKER ########

# Allow user to use a repository over HTTPS
echo "⌛️ Repository over HTTPS..."
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Adding up GPG Key & Setting up the repository
echo "🛠️ Adding up the GPG Key..."
sudo mkdir -p /etc/apt/keyrings

# Docker 🐋
echo "🛠️ Checking distribution..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine, containerd, and Docker Compose
echo "🛠️ Installing everything..."
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Video wallpaper 🎥
echo "🎥 Installing video wallpaper..."

git clone https://github.com/ghostlexly/gpu-video-wallpaper.git
cd gpu-video*
./install.sh

# Librewolf 🦊

sudo apt update && sudo apt install -y wget gnupg lsb-release apt-transport-https ca-certificates

distro=$(if echo " una vanessa focal jammy bullseye vera uma" | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi)

wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg

sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF

sudo apt update

sudo apt install librewolf -y

clear
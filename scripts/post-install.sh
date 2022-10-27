#!/bin/bash

######## oh-my-zsh ########

# install oh-my-zsh
echo "🎳 Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install fzf
echo "🎲 Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install zsh-autosuggestions
echo "🎷 Cloning the zsh-autosuggestions repo..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

######## nvm ########

# install nvm
echo "🎯 Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "🔌 Getting node lts..."
nvm install --lts

######## vs-code ########

# doki theme
echo "🎮 Setting up theme for doki..."
sudo chown -R $(whoami) /usr/share/code/resources/app/out/vs/workbench

######## TMUX ########

# go $HOME
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

clear
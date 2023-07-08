#!/bin/bash

sudo apt-get install -y && sudo apt upgrade
sudo apt-get install git curl wget zsh tmux cmus cava -y

######## oh-my-zsh ########
echo "🎳 Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "🎷 Cloning the zsh-autosuggestions repo..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

######## nvm ########
echo "🎯 Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
echo "🔌 Getting node lts..."
nvm install --lts 2> /dev/null

######## tmux ########
echo "🔴 Moving to Home..."
cd
echo "⌛️ Cloning the repository..."
git clone https://github.com/gpakosz/.tmux.git
echo "🔗 Creating symbolic link..."
ln -s -f .tmux/.tmux.conf
echo "🛠️ Copying config..."
cp .tmux/.tmux.conf.local .

####### DOCKER ########
echo "🐳 Installing Docker..."
sudo apt-get update -y
sudo apt-get install docker* -y
echo "🐳 Docker installed!"
clear

######## ULAUNCHER ########
sudo add-apt-repository ppa:agornostal/ulauncher 
sudo apt update 
sudo apt install ulauncher -y

######## ZSH ########
echo "🔴 Making zsh the default shell..."
chsh -s $(which zsh)

######## COPY FILES ########
cd

cp dotfiles/zsh/.zshrc $HOME
cp dotfiles/neofetch/config.conf $HOME/.config/neofetch/config.conf
cp -r dotfiles/kitty $HOME/.config
cp -r dotfiles/ulauncher $HOME/.config
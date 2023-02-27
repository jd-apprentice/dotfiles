# User settings

user=whoami

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="half-life"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf alias-finder zsh-autosuggestions)
ZSH_ALIAS_FINDER_AUTOMATIC=true
bindkey '^ ' autosuggest-accept
export ZSH=/home/$user/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Aliases
alias work="cd ~/Documents/Trabajo"
alias projects="cd ~/Documents/Proyectos"
alias c="clear" # ctrl + l do the same.
alias x="exit"
alias stats="neofetch"
alias conf="vim ~/.config/kitty/kitty.conf"

# NVM Config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

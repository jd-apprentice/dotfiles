# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="half-life"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git alias-finder zsh-autosuggestions)
ZSH_ALIAS_FINDER_AUTOMATIC=true
bindkey '^ ' autosuggest-accept
source $ZSH/oh-my-zsh.sh

# Aliases
alias work="cd ~/Documents/Trabajo"
alias projects="cd ~/Documents/Proyectos"
alias c="clear"
alias x="exit"
alias kittycfg="nano ~/.config/kitty/kitty.conf"
alias zshcfg="nano ~/.zshrc"

# NVM Config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Environment Variables
export GPT_KEY=""
export STABILITY_API_KEY=""
export GH_KEY=""

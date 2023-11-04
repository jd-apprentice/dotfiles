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
alias dio_root=""
alias webdock=""
alias aws_portfolio=""
alias balena="$HOME/Apps/balena.AppImage"
alias keepass="$HOME/Apps/keepass.AppImage"
alias retro="$HOME/Apps/RetroArch.AppImage"
alias cord="$HOME/Apps/WebCord-4.3.0-x64.AppImage"
alias cursor="$HOME/Apps/Cursor.AppImage"
alias slack="$HOME/Apps/Slack.AppImage"
alias lens="$HOME/Apps/Lens.AppImage"
alias neofetch="neofetch --ascii_distro windowscd"

# NVM Config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GPT_KEY=''
export STABILITY_API_KEY=''
export GH_KEY=""
export DIO_TOKEN=""
export CONSUMER_KEY=""
export CONSUMER_SECRET=""

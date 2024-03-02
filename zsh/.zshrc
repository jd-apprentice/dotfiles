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
alias balena="$HOME/Apps/Balena.AppImage"
alias keepass="$HOME/Apps/Keepass.AppImage"
alias bruno="$HOME/Apps/Bruno.AppImage"
alias cursor="$HOME/Apps/Cursor.AppImage"
alias slack="$HOME/Apps/Slack.AppImage"
alias lens="$HOME/Apps/Lens.AppImage"
alias obsidian="$HOME/Apps/Obsidian.AppImage"
alias yt="$HOME/Apps/Youtube.AppImage"
alias neofetch="neofetch --ascii_distro windowscd"

# NVM Config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Environment Variables
export GPT_KEY=""
export STABILITY_API_KEY=""
export GH_KEY=""
export DIO_TOKEN=""
export CONSUMER_KEY=""
export CONSUMER_SECRET=""

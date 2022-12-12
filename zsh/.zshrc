# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="smt"

# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf dotenv alias-finder zsh-autosuggestions)
ZSH_ALIAS_FINDER_AUTOMATIC=true
bindkey '^ ' autosuggest-accept
export ZSH=/home/jonathan/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# User configuration
# Aliases

alias ..="cd .."
alias app_add="sudo apt install"
alias work="cd ~/Documents/Trabajo"
alias projects="cd ~/Documents/Proyectos"
alias c="clear"
alias x="exit"
alias stats="neofetch"
alias weather="curl wttr.in"
alias conf="vim ~/.config/kitty/kitty.conf"
alias notes="cd /media/jonathan/c72f5751-c2bf-4f78-ab01-4c46b4e1db80/Apps/Standard-Notes && ./AppRun"
alias busy='my_file=$(find /usr/include -type f | sort -R | head -n 1); my_len=$(wc -l $my_file | awk "{print $1}"); let "r = $RANDOM % $my_len" 2>/dev/null; vim +$r $my_file'

# NVM Config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Debian Variables
export DEBFULLNAME="Jonathan Dyallo"
export DEBEMAIL="contacto@jonathan.com.ar"

# Bun
[ -s "/home/jonathan/.bun/_bun" ] && source "/home/jonathan/.bun/_bun"
BUN_INSTALL="/home/jonathan/.bun"
PATH="$BUN_INSTALL/bin:$PATH"

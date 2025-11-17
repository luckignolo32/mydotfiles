eval "$(starship init zsh)"
fastfetch
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/snapd/desktop"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

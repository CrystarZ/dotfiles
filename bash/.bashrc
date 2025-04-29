[ -f "$HOME/.profile.local" ] && . "$HOME/.profile.local"

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

#export SHENV_PROMPT=none
export SHENV_SHELL=bash
export SHENV_THEME=oneiroi-dream
source "$HOME/.config/shell/init.sh"

#!/bin/sh

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

unset PROMPT
unset ZAP_THEME
export ZAP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zap"
[ -f "$ZAP_DIR/zap.zsh" ] && source "$ZAP_DIR/zap.zsh"


# plugins
plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"

# keybinds
bindkey '^ ' autosuggest-accept
bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down

export SHENV_SHELL=zsh
export SHENV_THEME=oneiroi-dream
source "$HOME/.config/shell/init.sh"

#!/bin/sh

[ -f "$HOME/.profile.local" ] && . "$HOME/.profile.local"

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

unset PROMPT
unset ZAP_THEME
export ZAP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zap"
[ -f "$ZAP_DIR/zap.zsh" ] && source "$ZAP_DIR/zap.zsh"

autoload -Uz compinit; compinit

# plugins
plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "hlissner/zsh-autopair"
plug "Aloxaf/fzf-tab"

# keybinds
bindkey -v
bindkey '^ ' autosuggest-accept
bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down

source "$HOME/.config/shell/init.sh"

#!/bin/sh

#package
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

unset ZAP_THEME
unset PROMPT
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# plugins
plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
# plug "zap-zsh/vim"
# plug "zap-zsh/zap-prompt"
# plug "zap-zsh/atmachine"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"

# keybinds
bindkey '^ ' autosuggest-accept

bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down
bindkey '^L' autosuggest-accept

# bindkey '^I' vi-cmd-mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
alias :q="exit"

source "$HOME/.config/shell/init.sh"

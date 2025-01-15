#j/bin/sh
unset ZAP_THEME
unset PROMPT
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# history
HISTFILE=~/.zsh_history

# source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/functions.zsh"

# plugins
plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
# plug "zap-zsh/zap-prompt"
# plug "zap-zsh/atmachine" 
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"

# keybinds
bindkey '^ ' autosuggest-accept

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
alias :q="exit"

#ENVARS

eval "$(oh-my-posh init zsh --config ${_themes_}/oh-my-posh/oneiroi.omp.json)"

# >>> conda initialize >>>
export CONDA_HOME="$HOME/miniconda3/"

ci() {
    if [ -f "$CONDA_HOME/etc/profile.d/conda.sh" ]; then
        . "$CONDA_HOME/etc/profile.d/conda.sh"
        export CONDA_PROMPT_MODIFIER="($CONDA_DEFAULT_ENV)"
    else
        export PATH="$CONDA_HOME/bin:$PATH"
    fi
    echo "$(tput setaf 10)Conda环境已初始化，使用conda activate {env}激活$(tput sgr0)"
}
# <<< conda initialize <<<

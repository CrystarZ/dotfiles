#!/bin/sh
alias hosts='${EDITOR} /etc/hosts'
alias dfrc='${EDITOR} $_dfs_'
alias thmrc='${EDITOR} $_themes_'
alias nvimrc='${EDITOR} ~/.config/nvim/'
alias shrc='${EDITOR} ~/.config/shell/'
alias zshrc='${EDITOR} ~/.zshrc'

#modern tools
cmdv bat && alias cat='bat -pp'
cmdv eza && alias ls='eza --icons'
cmdv eza && alias tree='eza --tree --icons'
#and more?

alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias :q='exit'
alias ll='ls -lh --git'
alias la='ll -a'
alias lt='ls -T'
alias v='vim'
alias vi='vim'
alias vim='nvim'
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# disk
alias df='df -h'
alias free='free -m'

#git
alias g='lazygit'
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gco="git checkout"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gp="git push"
alias gpl="git pull"
alias gl="git log --oneline --graph --decorate --all"
alias gd="git diff"
alias gdc="git diff --cached"
alias gst="git stash"
alias gsp="git stash pop"
alias gf="git fetch"
alias gfm="git fetch origin main"
alias grh="git reset --hard"
alias grs="git reset --soft HEAD^"

#procs
alias psmem='procs|(read -r header && echo " $header" && sort -nr -k 5|head -n 5)'
alias pscpu='procs|(read -r header && echo " $header" && sort -nr -k 4|head -n 5)'

# systemd
alias systemctl_list="systemctl list-unit-files --state=enabled"
alias brewservice_list="brew services list"

# stow
alias stowa='stow -t $HOME */'
alias stowe='sudo stow -t /etc etc'

case "$(uname -s)" in

Darwin) ;;
Linux) ;;
CYGWIN* | MINGW32* | MSYS* | MINGW*) ;;
*) ;;

esac

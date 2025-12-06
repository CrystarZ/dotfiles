#!/bin/sh
alias hosts='${EDITOR} /etc/hosts'
alias nvimrc='${EDITOR} ~/.config/nvim/'
alias shrc='${EDITOR} ~/.config/shell/'
alias zshrc='${EDITOR} ~/.zshrc'

alias mux=tmuxinator

alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias :q='exit'
alias c='clear'
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias v='vim'
alias vi='vim'
cmdv nvim && alias vim='nvim'
cmdv bat && alias cat='bat -pp'
cmdv eza && alias ls="eza --icons --time-style +%Y-%m-%d\ %H:%M:%S"
alias ll="ls -lh"
alias la="ll -a"
alias lg="la --git"
alias lt="ls -T"
alias tree="ls -T"

# disk
alias df='df -h'
alias free='free -m'

#git
alias g='lazygit'
alias gi="git init"
alias gcl="git clone"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gco="git checkout"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gp="git push"
alias gu="git pull"
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

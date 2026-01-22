[ -f "$HOME/.profile.local" ] && . "$HOME/.profile.local"

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

export PS1='\[\e[33m\]\u\[\e[31m\]@\h\[\e[0m\] \[\e[33m\]\w\[\e[0m\] \[\e[37m\]>\[\e[0m\] '
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#export SHENV_PROMPT=none
source "$HOME/.config/shell/init.sh"

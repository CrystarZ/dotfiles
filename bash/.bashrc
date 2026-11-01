[ -f "$HOME/.profile.local" ] && . "$HOME/.profile.local"

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

HOSTCOLOR='\e[1;91m'
DIRCOLOR='\e[36m'
ENDCOLOR='\e[0m'
export PS1="$HOSTCOLOR\h$ENDCOLOR:$DIRCOLOR\w$ENDCOLOR:\$ "
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#export SHENV_PROMPT=none
source "$HOME/.config/shell/init.sh"

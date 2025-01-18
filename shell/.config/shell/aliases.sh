#!/bin/sh
#alias j='z'
#alias f='zi'
alias g='lazygit'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
alias dfrc='${EDITOR} $_dfs_'
alias thmrc='${EDITOR} $_themes_'
alias nvimrc='${EDITOR} ~/.config/nvim/'
alias shrc='${EDITOR} ~/.config/shell/'
alias zshrc='${EDITOR} ~/.zshrc'
#alias sshk="kitty +kitten ssh"
# alias lvim="env TERM=wezterm lvim"
# alias nvim="env TERM=wezterm nvim"

#modern tools
# alias cd='z'
alias ls='eza --icons'
alias grep='rg --fixed-strings --color=auto'
alias cat='bat -pp'
alias du='ncdu' #yazi
alias tree='eza --tree --icons'
alias find='fd --hidden --follow --color=auto'
#alias cut='choose'
alias man='man -L zh_CN'
alias mian='tldr' #mini-man
alias ps='procs --color=auto'
alias curl='curlie --color=auto'
alias vim='nvim'

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"Visual Studio Dark+\"" 
  alias catt="bat --theme \"Visual Studio Dark+\"" 
fi

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'
# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# systemd
alias systemctl_list="systemctl list-unit-files --state=enabled"

#alias mach_java_mode="export SDKMAN_DIR="$HOME/.sdkman" && [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh""


case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
	;;

Linux)
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac

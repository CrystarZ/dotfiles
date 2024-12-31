#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="Windows Terminal"
# export BROWSER="firefox"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/bin/shtools":$PATH
#export PATH="$HOME/.docker/bin":$PATH
#export PATH="$HOME/.local/nvim-macos-arm64/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
#export PATH=$HOME/.cargo/bin:$PATH
#export PATH=$HOME/.local/share/go/bin:$PATH
#export GOPATH=$HOME/.local/share/go
#export PATH=$HOME/.fnm:$PATH
#export PATH="$HOME/.local/share/neovim/bin":$PATH
#export PATH="$HOME/.local/share/bob/nvim-bin":$PATH
#export XDG_CURRENT_DESKTOP="Wayland"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
#export PATH="$PATH:./node_modules/.bin"
#eval "$(fnm env)"
eval "$(zoxide init zsh)"

export _dfs_="$HOME/DotFiles/"
export _rws_="$HOME/_EVOLINK_/"
export _ws_="$HOME/WorkSpace/"
export _configs_="$HOME/.config/"
export _themes_="${_rws_}Themes/oneiroi-theme/"
export POSH_DISABLE_UPDATE=true

#proxy
host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
export http_proxy="http://$host_ip:7890"
export https_proxy="http://$host_ip:7890"

case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
  export DYLD_LIBRARY_PATH=/opt/homebrew/lib/
  export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib
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

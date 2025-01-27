#!/bin/sh
export EDITOR="nvim"
export TERMINAL="wezterm"
export BROWSER="firefox"
export MANPAGER='nvim +Man!'
export MANWIDTH=999
# export XDG_CURRENT_DESKTOP="Wayland"

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

#PATH
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.local/share/neovim/bin":$PATH
export PATH="$HOME/.node_modules/.bin":$PATH

export _rws_="$HOME/"
export _ws_="$HOME/WorkSpace/"
export _configs_="$HOME/.config/"
export _dfs_="${_rws_}DotFiles/"
export _dfsl_="${_rws_}DotFiles.local/"
export _themes_="${_rws_}Themes/oneiroi-theme/themes/"

case "$(uname -s)" in

Darwin) ;;
Linux) ;;
CYGWIN* | MINGW32* | MSYS* | MINGW*) ;;
*) ;;

esac

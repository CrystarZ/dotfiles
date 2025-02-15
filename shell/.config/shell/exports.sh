#!/bin/sh
export EDITOR="nvim"
export TERMINAL="wezterm"
export BROWSER="firefox"
export MANPAGER='nvim +Man!'
export MANWIDTH=999
# export XDG_CURRENT_DESKTOP="Wayland"

#PATH
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.local/share/nvim/bin":$PATH
export PATH="$HOME/.local/share/nvim/mason/bin":$PATH
export PATH="$HOME/.node_modules/.bin":$PATH

export _rws_="$HOME"
export _ws_="$HOME/workspace"
export _configs_="$HOME/.config"
export _dfs_="${_rws_}/dotfiles"
export _dfsl_="${_rws_}/dotfiles.local"
export _themes_="${_rws_}/themes/oneiroi-theme/themes"

case "$(uname -s)" in

Darwin) ;;
Linux) ;;
CYGWIN* | MINGW32* | MSYS* | MINGW*) ;;
*) ;;

esac

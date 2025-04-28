#!/bin/sh
export EDITOR="nvim"
export TERMINAL="wezterm"
export BROWSER="firefox"
export MANPAGER='nvim +Man!'
export MANWIDTH=999
# export XDG_CURRENT_DESKTOP="Wayland"

#PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/nvim/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="$HOME/.node_modules/.bin:$PATH"

case "$(uname -s)" in

Darwin) ;;
Linux) ;;
CYGWIN* | MINGW32* | MSYS* | MINGW*) ;;
*) ;;

esac

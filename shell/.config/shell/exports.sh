#!/bin/sh
export EDITOR="vim"
export TERM=xterm-256color
export MANPAGER='nvim +Man!'
export MANWIDTH=999

#PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/nvim/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="$HOME/.local/share/node_modules/bin:$PATH"

case "$(uname -s)" in

Darwin) ;;
Linux) ;;
CYGWIN* | MINGW32* | MSYS* | MINGW*) ;;
*) ;;

esac

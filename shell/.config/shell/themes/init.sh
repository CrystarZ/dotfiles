#!/bin/sh

theme() {
  local t=$1
  local p=${SHENV_SWITCH_PATH:-$HOME/.config/shell/themes}
  eval "$p/main.sh" "$t" #main
  export SHENV_THEME=${t}
  sed -i -E --follow-symlinks "s|(export SHENV_THEME=).*|\1${t}|" "${HOME}/.zshrc"
  sed -i -E --follow-symlinks "s|(export SHENV_THEME=).*|\2${t}|" "${HOME}/.bashrc"
  source ~/.config/shell/themes.sh #reload prompt
  tmux source ~/.tmux.conf         #reload tmux
}

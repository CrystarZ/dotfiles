#!/bin/sh

theme() {
  local t=$1
  sed -i -E --follow-symlinks "s|(export SHENV_THEME=).*|\1${t}|" "${HOME}/.zshrc"
  sed -i -E --follow-symlinks "s|(export SHENV_THEME=).*|\1${t}|" "${HOME}/.bashrc"
  export SHENV_THEME=${t}
  source ~/.config/shell/themes.sh
  ~/.config/shell/themes/main.sh $t
}


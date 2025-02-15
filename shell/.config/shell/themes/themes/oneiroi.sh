#!/bin/bash

script=$(basename $0)
err() {
  local msg=$1
  local relese=$2
  echo "Error: '$script' $msg" >&2
  [ -z "$relese" ] || $relese
  exit 1
}

#############################################################

flag_verbose=false
packages=$_themes_
palettes=$_themes_/../palettes
flag_transparent=false

#参数提取
ARGS=$(getopt -o vT -l verbose -n "$0" -- "$@")
[ $? = 0 ] || err "Error parsing arguments"
eval set -- "$ARGS"

while true; do
  case "$1" in
  -T) flag_transparent=true && shift ;;
  -v | --verbose) flag_verbose=true && shift ;;
  --) shift && break ;;
  *) err "unknown option $1" ;;
  esac
done

theme=oneiroi
plt="$1"
pkg="$2"
[[ $plt = "default" ]] && plt=dream

Utheme=Oneiroi
Uplt=$(echo "$plt" | sed 's/^\(.\)/\U\1/')
[[ ! -f "$palettes/${plt}.css" ]] && err "not support palette '$plt',check '$palettes'"

if [ $pkg = "ALL" ]; then
  unset pkg[0]
  for i in $(find "$packages" -mindepth 1 -maxdepth 1 -type d); do
    pkg+=($(basename "$i"))
  done
fi

set() {
  p=$1
  f=$2
  [[ ! -f "$f" ]] && return 1
  sed -i -E --follow-symlinks "$p" "$f"
}

build() {
  local pkg=$1
  case "$pkg" in
  vscode)
    code_dfile=${code_dfile:-$HOME/.config/Code/User/settings.json}
    code_pattern=${code_pattern:-"s|(\"workbench.colorTheme\":).*|\1 \"$theme ${plt}\",|"}
    set "$code_pattern" "$code_dfile"
    ;;
  nvim)
    nvim_dfile=${nvim_dfile:-$HOME/.config/nvim/lua/plugins/colorscheme.lua}
    nvim_pattern=${nvim_pattern:-"s|(style =).*|\1 \"${plt}\",|"}
    set "$nvim_pattern" "$nvim_dfile"
    ;;
  windows-terminal)
    wt_dfile=${wt_dfile:-$HOME/.config/wt/settings.json}
    wt_pattern=${wt_pattern:-"s|(\"colorScheme\":).*|\1 \"$Utheme $Uplt\",|"}
    set "$wt_pattern" "$wt_dfile"
    ;;
  termux)
    termux_dfile=${termux_dfile:-$HOME/.termux/colors.properties}
    termux_theme=${termux_theme:-$packages/termux/$theme-$plt.properties}
    [[ ! -f "$termux_dfile" ]] && return 1
    mv "$termux_dfile" "$termux_dfile.bak"
    cp "$termux_theme" "$termux_dfile"
    ;;
  wezterm)
    wezterm_dfile=${wezterm_dfile:-$HOME/.wezterm.lua}
    wezterm_pattern=${wezterm_pattern:-"s|(config\.color_scheme =).*|\1 \"$theme $plt\"|"}
    set "$wezterm_pattern" "$wezterm_dfile"
    ;;
  alacritty)
    relative_path="${packages#$HOME}"
    [[ $relative_path == /* ]] && relative_path="~$relative_path"
    alacritty_dfile=${alacritty_dfile:-$HOME/.config/alacritty/alacritty.toml}
    alacritty_pattern=${alacritty_pattern:-"s|(general\.import =).*|\1 [\"${relative_path}/alacritty/$theme-$plt.toml\"]|"}
    set "$alacritty_pattern" "$alacritty_dfile"
    ;;
  tmux)
    tmux_dfile=${tmux_dfile:-$HOME/.tmux.conf}
    tmux_pattern=${tmux_pattern:-"s|(set -g @${theme}_palette).*|\1 \"$plt\"|"}
    set "$tmux_pattern" "$tmux_dfile"
    ;;
  *) ;;
  esac
}

[[ $flag_verbose = true ]] && echo "palette: $theme"
for p in "${pkg[@]}"; do
  [[ $flag_verbose = true ]] && echo "build package: $p"
  build $p
done

exit 0

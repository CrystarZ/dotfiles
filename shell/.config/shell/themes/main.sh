#!/bin/bash

# NOTE:Preview version,only guaranteed to adapt to `onerioi-themes`
# NOTE:Require user has installed `onerioi-themes`

info() {
  local title=$1
  local info=$2
  local color=$3
  color=${color:-4} #blue

  echo \
    "$(tput setab $color setaf 0)$title$(tput sgr0)" \
    "$info"
  return 0
}

script=$(basename $0)
tip() {
  echo "Try '$script --help' for more information."
}

warn() {
  local msg=$1
  info "Warning" "$script: $msg" 3
  return 0
}

err() {
  local msg=$1
  local relese=$2
  echo "Error: '$script' $msg" >&2
  [ -z "$relese" ] || $relese
  exit 1
}
#############################################################
#params
script_path=$(realpath "$0")
script_dir=$(dirname "$script_path")
flag_help=false
flag_verbose=false
flag_transparent=false
var_theme=""
var_package=ALL

help() {
  echo "Usage $script <command> [options]"
  echo "Options:"
  echo "  -h, --help                  Show this help message"
  echo "  -v, --verbose               Verbose"
  echo "  -T                          transparent"
  echo "Commands:"
  echo "  <theme-plt> [package]       set specific palette"
}
[ $# = 0 ] && help && exit 0

#参数提取
ARGS=$(getopt -o hvT -l help,verbose -n "$0" -- "$@")
[ $? = 0 ] || err "Error parsing arguments"
eval set -- "$ARGS"

while true; do
  case "$1" in
  -h | --help) flag_help=true && shift ;;
  -v | --verbose) flag_verbose=true && shift ;;
  -T) flag_transparent=true && shift ;;
  --) shift && break ;;
  *) err "unknown option $1" ;;
  esac
done

var_theme=$1
[[ -z $var_theme ]] && err "not set themes"
if [[ "$var_theme" == *"-"* ]]; then
  theme=$(echo "$var_theme" | cut -d'-' -f1)
  plt=$(echo "$var_theme" | cut -d'-' -f2-)
else
  theme="$var_theme"
  plt="default"
fi

var_package=$2
var_package=${var_package:-"ALL"}
[[ -z $var_package ]] && err "not set package"

theme_path=$script_dir/themes
theme_exe=$theme_path/${theme}.sh
[[ ! -f "$theme_exe" ]] && err "not support theme '$theme',check '$theme_path'"

$theme_exe $plt $var_package $([[ $flag_transparent = true ]] && echo -T) $([[ $flag_verbose = true ]] && echo -v)

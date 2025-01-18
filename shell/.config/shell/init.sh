#!/bin/sh

#params
false=1
true=0
flag_help=$false
flag_conda=$false
flag_mode_aliases=$true
flag_mode_exports=$true
flag_mode_functions=$true
var_shell=$(basename $(readlink /proc/$$/exe))
var_prompt="starship"

help() {
  echo "Usage $0 [options]"
  echo "Options:"
  echo "  -h, --help                          Show this help message"
  echo "  -s, --shell       <SHELL>           default = basename $(readlink /proc/$$/exe)"
  echo "      SHELL = bash|zsh"
  echo "  -P, --prompt      <PROMPT>          default = starship"
  echo "      PROMPT = empty|omp|starship"
  echo "  -C, --conda                         start with condainit"
  echo "  --disable_aliases                   not load aliases.sh"
  echo "  --disable_exports                   not load exports.sh"
  echo "  --disavle_functions                 not load functions.sh"
}

#参数提取
ARGS=$(getopt -o hs:P:C -l help,shell:,prompt:,conda,disable_aliases,disable_exports,disable_functions -n "$0" -- "$@")
if [[ $? != 0 ]]; then
  echo "Error parsing arguments"
  exit $false
fi
eval set -- "$ARGS"

copt() {
  local value="$1"
  local default="$2"
  echo "${value:-$default}"
  return $true
}

while true; do
  case "$1" in
  -h | --help)
    flag_help=$true
    shift
    ;;
  -s | --shell)
    var_shell=$(copt $2 $var_shell)
    shift 2
    ;;
  -P | --prompt)
    var_prompt=$(copt $2 $var_prompt)
    shift 2
    ;;
  -C | --conda)
    flag_conda=$true
    shift
    ;;
  disable_aliases)
    flag_mode_aliases=$false
    shift
    ;;
  disable_exports)
    flag_mode_exports=$false
    shift
    ;;
  disavle_functions)
    flag_mode_functions=$false
    shift
    ;;
  --)
    shift
    break
    ;;
  *)
    echo "Error: Unknown option $1"
    help
    exit $false
    ;;
  esac
done

#source
[[ $flag_mode_aliases == $true ]] && source "$HOME/.config/shell/aliases.sh"
[[ $flag_mode_exports == $true ]] && source "$HOME/.config/shell/exports.sh"
[[ $flag_mode_functions == $true ]] && source "$HOME/.config/shell/functions.sh"

#ENVARS
# >>> prompt initialize >>>
export POSH_DISABLE_UPDATE=true
[[ $var_prompt == "omp" ]] && eval "$(oh-my-posh init $var_shell --config ${_themes_}/oh-my-posh/oneiroi.omp.json)"
[[ $var_prompt == "starship" ]] && eval "$(starship init $var_shell)"
# <<< prompt initialize <<<

eval "$(zoxide init bash)"

# >>> conda initialize >>>
export CONDA_HOME="$HOME/miniconda3/"

ci() {
  if [ -f "$CONDA_HOME/etc/profile.d/conda.sh" ]; then
    . "$CONDA_HOME/etc/profile.d/conda.sh"
    export CONDA_PROMPT_MODIFIER="($CONDA_DEFAULT_ENV)"
    export CONDA_CHANGEPS1="no"
  else
    export PATH="$CONDA_HOME/bin:$PATH"
  fi
  echo "$(tput setaf 10)Conda环境已初始化，使用conda activate {env}激活$(tput sgr0)"
}

[[ $flag_conda == $true ]] && ci
# <<< conda initialize <<<

#!/bin/sh

export SHENV_SHELL=${SHENV_SHELL:=$(basename $(readlink /proc/$$/exe))} #shell = bash|zsh
export SHENV_THEME=${SHENV_THEME:="oneiroi-dream"}                      #theme = oneiroi-dream|oneiroi-melatonin
export SHENV_PROMPT=${SHENV_PROMPT:="starship"}                         #prompt = none|omp|starship"

SHENV_HOME=${SHENV_HOME:="$HOME/.config/shell/"}
SHENV_LOCAL=${SHENV_LOCAL:="$HOME/.config/shell/.local"}
SHENV_ALIASES=${SHENV_ALIASES:=true}
SHENV_EXPORTS=${SHENV_EXPORTS:=true}
SHENV_FUNCTIONS=${SHENV_FUNCTIONS:=true}
SHENV_THEMES=${SHENV_THEMES:=true}
SHENV_INIT_CONDA=${SHENV_INIT_CONDA:=false}

#BREW
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/home/linuxbrew/.linuxbrew}"
[ -f "${HOMEBREW_PREFIX}/bin/brew" ] && eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"

cmdv() {
  command -v "$@" >/dev/null 2>&1
}

#source
[[ $SHENV_ALIASES == "true" ]] && source "$SHENV_HOME/aliases.sh"
[[ $SHENV_EXPORTS == "true" ]] && source "$SHENV_HOME/exports.sh"
[[ $SHENV_FUNCTIONS == "true" ]] && source "$SHENV_HOME/functions.sh"
[[ $SHENV_THEMES == "true" ]] && source "$SHENV_HOME/themes.sh"

#local source
[[ -f "$SHENV_LOCAL/init.sh" ]] && source "$SHENV_LOCAL/init.sh"

# >>> ENV INITIALIZE >>>

cmdv zoxide && eval "$(zoxide init $SHENV_SHELL)"
cmdv fzf && eval "$(fzf --$SHENV_SHELL)"

# >>> conda initialize >>>
export CONDA_HOME="${CONDA_HOME:-$HOME/miniconda3}"

ci() {
  if [ -f "$CONDA_HOME/etc/profile.d/conda.sh" ]; then
    . "$CONDA_HOME/etc/profile.d/conda.sh"
    export CONDA_PROMPT_MODIFIER="($CONDA_DEFAULT_ENV)"
    export CONDA_CHANGEPS1="no"
  else
    export PATH="$CONDA_HOME/bin:$PATH"
  fi
  echo "$(tput setab 4)$(tput setaf 0)CONDA$(tput sgr0) use conda activate {env}"
}

[[ $SHENV_INIT_CONDA == "true" ]] && ci
# <<< conda initialize <<<

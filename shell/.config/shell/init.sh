#!/bin/sh

export SHENV_SHELL="${SHENV_SHELL:=$(basename "$(readlink /proc/$$/exe)")}" #shell = bash|zsh

SHENV_HOME=${SHENV_HOME:="$HOME/.config/shell/"}
SHENV_ALIASES=${SHENV_ALIASES:=true}
SHENV_EXPORTS=${SHENV_EXPORTS:=true}
SHENV_FUNCTIONS=${SHENV_FUNCTIONS:=true}

cmdv() {
  command -v "$@" >/dev/null 2>&1
}

# >>> ENV INITIALIZE >>>

. "$SHENV_HOME/pkgs/nix.sh"
. "$SHENV_HOME/pkgs/brew.sh"
. "$SHENV_HOME/pkgs/conda.sh"
. "$SHENV_HOME/pkgs/prompt.sh"

cmdv zoxide && eval "$(zoxide init "$SHENV_SHELL")"
cmdv fzf && eval "$(fzf --"$SHENV_SHELL")"

#source
[ "$SHENV_ALIASES" = "true" ] && . "$SHENV_HOME/aliases.sh"
[ "$SHENV_EXPORTS" = "true" ] && . "$SHENV_HOME/exports.sh"
[ "$SHENV_FUNCTIONS" = "true" ] && . "$SHENV_HOME/functions.sh"

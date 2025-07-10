#!/bin/sh
export SHENV_THEME_HOME="${SHENV_THEME_HOME:="$_themes_"}"
export SHENV_THEME_HOME="${SHENV_THEME_HOME:="$HOME/Themes"}"

export THEME="${THEME:="oneiroi-dream"}"    #theme = oneiroi-dream|oneiroi-melatonin
export PROMPTYPE="${PROMPTYPE:="starship"}" #prompt = none|omp|starship"

# >>> prompt initialize >>>
export POSH_DISABLE_UPDATE=true
OMP_CONFIG="${SHENV_THEME_HOME}/oh-my-posh/${THEME}.omp.json"
[ "$PROMPTYPE" = "omp" ] && command -v oh-my-posh >/dev/null && eval "$(oh-my-posh init "$SHENV_SHELL" --config "$OMP_CONFIG")"

export STARSHIP_CONFIG="${SHENV_THEME_HOME}/starship/${THEME}.toml"
[ "$PROMPTYPE" = "starship" ] && command -v starship >/dev/null && eval "$(starship init "$SHENV_SHELL")"
# <<< prompt initialize <<<

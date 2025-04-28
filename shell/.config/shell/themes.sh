#!/bin/sh
export SHENV_THEME_HOME="${SHENV_THEME_HOME:="$_themes_"}"
export SHENV_THEME_HOME="${SHENV_THEME_HOME:="$HOME/Themes"}"

# >>> prompt initialize >>>
export POSH_DISABLE_UPDATE=true
OMP_CONFIG="${SHENV_THEME_HOME}/oh-my-posh/${SHENV_THEME}.omp.json"
[ "$SHENV_PROMPT" = "omp" ] && command -v oh-my-posh >/dev/null && eval "$(oh-my-posh init "$SHENV_SHELL" --config "$OMP_CONFIG")"

export STARSHIP_CONFIG="${SHENV_THEME_HOME}/starship/${SHENV_THEME}.toml"
[ "$SHENV_PROMPT" = "starship" ] && command -v starship >/dev/null && eval "$(starship init "$SHENV_SHELL")"
# <<< prompt initialize <<<

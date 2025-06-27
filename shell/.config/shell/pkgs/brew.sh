#BREW
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/home/linuxbrew/.linuxbrew}"
[ -f "${HOMEBREW_PREFIX}/bin/brew" ] && eval "$("${HOMEBREW_PREFIX}/bin/brew" shellenv)"

#!/bin/sh

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

[ "$SHENV_INIT_CONDA" = "true" ] && ci
# <<< conda initialize <<<

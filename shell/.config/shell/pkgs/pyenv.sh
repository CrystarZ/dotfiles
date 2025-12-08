#!/bin/bash

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

cmdv pyenv && eval "$(pyenv init - "${SHENV_SHELL}")"

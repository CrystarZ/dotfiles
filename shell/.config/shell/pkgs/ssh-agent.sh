#!/bin/bash

alias start-sshagent='systemctl --user start ssh-agent && export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"'
alias stop-sshagent="systemctl --user stop ssh-agent.{service,socket} && unset SSH_AUTH_SOCK"
alias add-sshagent="ssh-add ~/.ssh/id_rsa"

if [ -n "$XDG_RUNTIME_DIR" ] &&
  [ -S "$XDG_RUNTIME_DIR/ssh-agent.socket" ]; then
  export SSH_AUTH_SOCK="${SSH_AUTH_SOCK:=$XDG_RUNTIME_DIR/ssh-agent.socket}"
fi

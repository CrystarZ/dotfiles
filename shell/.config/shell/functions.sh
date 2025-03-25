#!/bin/sh

batch() {
  [ $# -lt 1 ] && echo "Usage: batch <file> <func>" && return 1
  local file="$1"
  shift 1

  local func=${@:-echo {}}
  find . -type f -name "$file" -exec bash -c "$func" \;
}

ext() { #get file extension
  local f="$(basename "$@")"
  echo ${f#*.}
}

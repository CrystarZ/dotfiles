#!/bin/sh

batch() {
  [ $# -lt 2 ] && echo "Usage: batch <path> <file> <func>" && return 1
  local spath="$1"
  local file="$2"
  shift 2
  local func="$@"
  find "$spath" -name "$file" | xargs -I{} sh -c "$func"
}

purename() { #basename without filename extension
  local f="$(basename "$@")"
  echo "$f" | awk -F "." '{print $1}'
}

dpname() { # dirname/purename
  local f="$@"
  echo $(dirname "$f")/$(purename "$f")
}

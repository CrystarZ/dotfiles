#!/bin/sh

export NIX_HOME="$HOME/.nix-profile/etc/profile.d/nix.sh"
if [ -e "$NIX_HOME" ]; then . "$NIX_HOME"; fi # added by Nix installer

if [ -e "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"; fi

alias hm="home-manager"
alias hmrc='$EDITOR ~/.config/home-manager/home.nix'

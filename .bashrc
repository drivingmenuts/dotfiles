#!/bin/bash
export DOTFILES=$HOME/.dotfiles

if [[ ! -d $DOTFILES ]]; then
	echo Dotfiles directory missing ... please reinstall.
	exit 1
fi

source $DOTFILES/setup
source $DOTFILES/paths
source $DOTFILES/history
source $DOTFILES/prompt
source $DOTFILES/functions
source $DOTFILES/aliases

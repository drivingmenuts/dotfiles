#!/bin/bash
if [[ ! -d "$HOME/.dotfiles" ]]; then
	echo Dotfiles directory missing ... please reinstall.
	exit 1
fi

export DOTFILES=$HOME/.dotfiles
export INPUTRC=$HOME/.dotfiles/readline
export OSUNAME=`uname`

source $DOTFILES/paths
source $DOTFILES/history
source $DOTFILES/aliases
source $DOTFILES/prompt
source $DOTFILES/functions

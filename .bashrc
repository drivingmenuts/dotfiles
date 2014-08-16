#!/bin/bash
if [[ ! -d "$HOME/.dotfiles" ]]; then
	echo Dotfiles directory missing ... please reinstall.
	exit 1
fi

export OSUNAME=`uname`

export DOTFILES=$HOME/.dotfiles
export INPUTRC=$DOTFILES/readline

source $DOTFILES/paths
source $DOTFILES/history
source $DOTFILES/aliases
source $DOTFILES/prompt
source $DOTFILES/functions

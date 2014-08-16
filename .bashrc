#!/bin/bash
if [[ ! -d "$HOME/.dotfiles" ]]; then
	echo Dotfiles directory missing ... please reinstall.
	exit 1
fi

export DOTFILES=$HOME/.dotfiles
export INPUTRC=$HOME/.dotfile/readline
export OSUNAME=`uname`

source $DOTFILES/history
source $DOTFILES/aliases
source $DOTFILES/prompt

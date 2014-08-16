#!/bin/bash
BACKUP_DIR=~/.holdfiles
if [[ -f ~/.bash_profile || -f ~/.bashrc ]]; then
	mkdir $BACKUP_DIR
	mv ~/.bash* $BACKUP_DIR
	mv ~/.inputrc $BACKUP_DIR
else
	echo No bash files found.
fi

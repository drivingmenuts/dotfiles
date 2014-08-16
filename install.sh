#!/bin/bash
BACKUP_DIR=~/.holdfiles
SOURCE_DIR=$( cd "$( dirname "$0" )" && pwd )
if [[ -f ~/.bash_profile || -f ~/.bashrc ]]; then
	mkdir $BACKUP_DIR
	mv ~/.bash* $BACKUP_DIR
	mv ~/.inputrc $BACKUP_DIR
	cp $SOURCE_DIR/.bash_profile ~
	cp $SOURCE_DIR/.bashrc ~
else
	echo No bash files found.
fi

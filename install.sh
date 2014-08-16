#!/bin/bash
BACKUP_DIR=~/.holdfiles
SOURCE_DIR=$( cd "$( dirname "$0" )" && pwd )
HOSTFILE=".`hostname`"

if [[ -f ~/.bash_profile || -f ~/.bashrc ]]; then
	mkdir $BACKUP_DIR
	mv ~/.bash* $BACKUP_DIR
	mv ~/.inputrc $BACKUP_DIR
	cp $SOURCE_DIR/.bash* ~
	if [[ ! -f $HOSTFILE ]]; then
		touch $HOSTFILE
	else
		echo "Per-host customization file '$HOSTFILE' already exists."
	fi
else
	echo No bash files found.
fi

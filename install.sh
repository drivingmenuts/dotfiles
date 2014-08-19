#!/bin/bash
SOURCE_DIR=$( cd "$( dirname "$0" )" && pwd )
BACKUP_DIR="$SOURCE_DIR/save"
HOSTFILE=".`hostname`"

if [[ -f ~/.bash_profile || -f ~/.bashrc ]]; then
	mkdir $BACKUP_DIR
	mv ~/.bash* $BACKUP_DIR

	if [[ -f ~/.inputrc ]]; then
		mv ~/.inputrc $BACKUP_DIR
	fi

	if [[ -f ~/.vimrc ]]; then
		mv ~/.vimrc $BACKUP_DIR
	fi

	BASH_FILES=`ls $SOURCE_DIR/.bash*`
	for BASH_FILE in $BASH_FILES; do
		DEST_FILE=`basename $BASH_FILE`
		cp $BASH_FILE ~/$DEST_FILE
	done

	if [[ ! -f ~/.rsyncignore_global ]]; then
		cp $SOURCE_DIR/.rsyncignore_global ~
	fi

	if [[ ! -f ~/.vimrc ]]; then
		cp $SOURCE_DIR/.vimrc ~
	fi

	if [[ ! -f $HOSTFILE ]]; then
		touch $HOSTFILE
	else
		echo -e "Warning: Per-host customization file '$HOSTFILE' already exists."
	fi
else
	echo No bash files found.
fi

#!/bin/bash
SOURCE_DIR=$( cd "$( dirname "$0" )" && pwd )
BACKUP_DIR="$SOURCE_DIR/save"
HOSTFILE=".`hostname`"

if [[ -f ~/.bash_profile || -f ~/.bashrc ]]; then
	mkdir $BACKUP_DIR
	mv ~/.bash* $BACKUP_DIR
	mv ~/.inputrc $BACKUP_DIR

	BASH_FILES=`ls $SOURCE_DIR/.bash*`
	for BASH_FILE in $BASH_FILES; do
		SYMLINK=`basename $BASH_FILE`
		ln -s $BASH_FILE ~/$SYMLINK
	done

	cp $SOURCE_DIR/.rsyncignore_global ~
	if [[ ! -f $HOSTFILE ]]; then
		touch $HOSTFILE
	else
		echo -e "Warning: Per-host customization file '$HOSTFILE' already exists."
	fi
else
	echo No bash files found.
fi

#!/usr/bin/env bash

SOURCE_DIR=$( cd "$( dirname "$0" )" && pwd )
BACKUP_DIR="$SOURCE_DIR/save"
HOSTFILE=".`hostname`"

if [[ -f ~/.bash_profile || -f ~/.bashrc ]]; then

	mkdir $BACKUP_DIR
	mv ~/.bash* $BACKUP_DIR

else
	echo No bash files found ...
fi

echo Setting up new bashrc file
cat "${SOURCE_DIR}/bashrc_install" | sed s#@SOURCE_DIR@#${SOURCE_DIR}# > "${SOURCE_DIR}/.bashrc"

echo Installing new bash files ...

BASH_FILES=`ls $SOURCE_DIR/.bash*`
for BASH_FILE in $BASH_FILES; do
	DEST_FILE=`basename $BASH_FILE`
	echo "$DEST_FILE ..."
	cp $BASH_FILE ~/$DEST_FILE
done

if [[ -f ~/.inputrc ]]; then
	echo Saving inputrc ...
	mv ~/.inputrc $BACKUP_DIR
fi

if [[ -f ~/.vimrc ]]; then
	echo Saving vimrc ...
	mv ~/.vimrc $BACKUP_DIR
fi

if [[ ! -f ~/.rsyncignore_global ]]; then
	echo Creating global rsync ignore file ...
	cp $SOURCE_DIR/.rsyncignore_global ~
else
	echo Existing global rsync ignore file. Skipping ...
fi


if [[ ! -f ~/.vimrc ]]; then
	echo Creating vimrc file ...
	cp $SOURCE_DIR/.vimrc ~
else
	echo Existing vimrc. Skipping ...
fi

if [[ ! -f $HOSTFILE ]]; then
	touch $HOSTFILE
else
	echo -e "Warning: Per-host customization file '$HOSTFILE' already exists."
fi

echo Done ...

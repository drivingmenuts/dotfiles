#!/usr/bin/env bash

INST_DIR="$( cd "$( dirname "$0" )" && pwd )"
BACK_DIR="$INST_DIR/save"
HOSTFILE="$( hostname )"

mkdir $BACK_DIR

if [[ -f ~/.bash_profile || -f ~/.bashrc ]]; then

	mv ~/.bash* $BACK_DIR

else
	echo No bash files found ...
fi

if [[ -f ~/.profile ]]; then

	mv ~/.profile $BACK_DIR

else
	echo No bash files found ...
fi

echo Setting up new bashrc file
cat "${INST_DIR}/bashrc_install" | sed s#@INST_DIR@#${INST_DIR}# > "${INST_DIR}/.bashrc"

echo Installing new bash files ...

BASH_FILES=`ls $INST_DIR/.bash*`
for BASH_FILE in $BASH_FILES; do
	DEST_FILE=`basename $BASH_FILE`
	echo "$DEST_FILE ..."
	cp $BASH_FILE ~/$DEST_FILE
done

if [[ -f ~/.inputrc ]]; then
	echo Saving inputrc ...
	mv ~/.inputrc $BACK_DIR
fi

if [[ -f ~/.vimrc ]]; then
	echo Saving vimrc ...
	mv ~/.vimrc $BACK_DIR
fi

if [[ ! -f ~/.rsyncignore_global ]]; then
	echo Creating global rsync ignore file ...
	cp $INST_DIR/.rsyncignore_global ~
else
	echo Existing global rsync ignore file. Skipping ...
fi


if [[ ! -f ~/.vimrc ]]; then
	echo Creating vimrc file ...
	cp $INST_DIR/.vimrc ~
else
	echo Existing vimrc. Skipping ...
fi

if [[ ! -f $HOSTFILE ]]; then
	touch $HOSTFILE
else
	echo -e "Warning: Per-host customization file '$HOSTFILE' already exists."
fi

echo Done ...

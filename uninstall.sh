#!/bin/bash
BACKUP_DIR=~/.holdfiles
cp $BACKUP_DIR/.bash* ~
if [[ -f $BACKUP_DIR/.inputrc ]]; then
	cp $BACKUP_DIR/.inputrc ~
fi
rm -rf $BACKUP_DIR

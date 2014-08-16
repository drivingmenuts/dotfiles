#!/bin/bash
SOURCE_DIR=$( cd "$( dirname "$0" )" && pwd )
BACKUP_DIR="$SOURCE_DIR/save"
cp $BACKUP_DIR/.bash* ~
if [[ -f $BACKUP_DIR/.inputrc ]]; then
	cp $BACKUP_DIR/.inputrc ~
fi
rm -rf $BACKUP_DIR

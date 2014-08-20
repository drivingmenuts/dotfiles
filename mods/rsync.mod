#!/bin/bash
if [[ -x /usr/bin/rsync && -f $HOME/.rsyncignore_global ]]; then
	alias rsync='rsync -vh --exclude-from=$HOME/.rsyncignore_global --include=".**"'
fi
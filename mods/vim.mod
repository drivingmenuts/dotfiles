#!/usr/bin/env bash

if [ -e /usr/local/bin/vim ]; then
    export EDITOR=vim
    export VISUAL="$EDITOR"
    alias vi="$EDITOR"
fi

#!/usr/bin/env bash

if [ -d /usr/local/Cellar/coreutils ]; then
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

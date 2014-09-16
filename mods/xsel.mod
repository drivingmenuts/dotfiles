#!/bin/bash

if [ ! $(uname -s) = 'Darwin' ]; then
    if [ -e /usr/bin/xsel ]; then
        alias pbcopy='xsel --clipboard --input '
        alias pbpaste='xsel --clipboard --output '
    fi
fi

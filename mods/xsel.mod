#!/bin/bash

if [ -e /usr/bin/xsel ]; then
    alias pbcopy='xsel --clipboard --input '
    alias pbpaste='xsel --clipboard --output'
fi

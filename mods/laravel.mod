#!/usr/bin/env bash

if [ -d "$HOME/.composer/vendor/bin/" ] ; then
    $PATH="$HOME/.composer/vendor/bin/:$PATH"
fi

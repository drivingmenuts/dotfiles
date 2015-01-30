#!/usr/bin/env bash

if [ -f /usr/local/opt/pyenv ]; then
    if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
    export PYENV_ROOT=/usr/local/opt/pyenv
    if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
fi

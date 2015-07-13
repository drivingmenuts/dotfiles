#!/usr/bin/env bash

if [ -f /usr/local/bin/pyenv ]; then
    if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
    export PYENV_ROOT=/usr/local/bin/pyenv
    if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
fi

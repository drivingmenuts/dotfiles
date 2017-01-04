#!/usr/bin/env bash

if [ -h /usr/local/opt/nvm ]; then
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
fi

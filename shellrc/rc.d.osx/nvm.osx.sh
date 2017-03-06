#!/bin/bash

command -v realpath_osx >/dev/null 2>&1 || realpath_osx() {
  [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

export NVM_DIR=$(realpath_osx "$HOME/.nvm")
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

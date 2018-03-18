#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# zeit/hyper.js
if [ ! -f ~/.hyper.js ]; then
    ln -s ${BASEDIR}/.hyper.js ~/.hyper.js
fi

# zsh
if [ ! -f ~/.zshrc ]; then
    ln -s ${BASEDIR}/.zshrc ~/.zshrc
fi

# git
if [ ! -f ~/.gitconfig ]; then
    ln -s ${BASEDIR}/.gitconfig ~/.gitconfig
fi

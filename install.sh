#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install custom ZSH theme
if [ ! -f ${ZSH}/themes/custom.zsh-theme ]; then
  ln -s ${BASEDIR}/custom.zsh-theme ${ZSH}/themes/custom.zsh-theme
fi

# Install Homebrew
if ! [ -x "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Yarn
if ! [ -x "$(command -v yarn)" ]; then
  brew install yarn --without-node
fi

# Install N
if ! [ -x "$(command -v n)" ]; then
  curl -L https://git.io/n-install | bash
fi

# Install Z
if ! [ -x "$(command -v z)" ]; then
  brew install z
fi

# Install The Fuck
if ! [ -x "$(command -v fuck)" ]; then
  brew install thefuck
fi

# Link zsh configuration
if [ ! -f ~/.zshrc ]; then
  ln -s ${BASEDIR}/.zshrc ~/.zshrc
fi

# Link zeit/hyper.js configuration
if [ ! -f ~/.hyper.js ]; then
  ln -s ${BASEDIR}/.hyper.js ~/.hyper.js
fi

# Link git global configuration
if [ ! -f ~/.gitconfig ]; then
  ln -s ${BASEDIR}/.gitconfig ~/.gitconfig
fi

# Link git global ignore
if [ ! -f ~/.gitignore ]; then
  ln -s ${BASEDIR}/.gitignore ~/.gitignore
fi
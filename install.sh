#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install Homebrew
if ! [ -x "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Link files located in `./files
for file in $(ls -A ${BASEDIR}/files); do
  if [ ! -f ~/$file ]; then
    ln -s ${BASEDIR}/files/$file ~/$file
  fi
done

# Link Alfred preferences
ln -s ${BASEDIR}/alfred ~/Alfred.alfredpreferences

# Install commands listed in `./config/commands`
for command in $(cat ${BASEDIR}/config/commands); do
  if ! brew list $command &> /dev/null; then
    brew install $command
  fi
done

# Install applications listed in `./config/casks`
for cask in $(cat ${BASEDIR}/config/casks); do
  if ! brew cask list $cask &> /dev/null; then
    brew cask install $cask
  fi
done

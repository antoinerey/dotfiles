#!/bin/bash

# Files to symlink to the home directory.
FILES=(.zshrc)

# Commands to install using Brew.
COMMANDS=(n thefuck yarn)

# -------------------------------------------------------------------- #

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install Homebrew
if ! [ -x "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
else
  echo "✔ brew is already installed.";
fi

# Link configuration files
for FILE in $FILES; do
  if [ ! -f ~/$FILE ]; then
    ln -s ${BASEDIR}/files/$FILE ~/$FILE;
  else
    echo "✔ $FILE is already linked.";
  fi
done

# Install commands.
for COMMAND in $COMMANDS; do
  if ! brew list $COMMAND &> /dev/null; then
    brew install $COMMAND;
  else
    echo "✔ $COMMAND is already installed.";
  fi
done

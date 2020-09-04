#!/bin/bash

# Files to symlink to the home directory.
FILES=(
  .config/karabiner.edn
  .zshrc
)

# Commands to install using Brew.
COMMANDS=(
  n
  thefuck
  yarn
)

# -------------------------------------------------------------------- #

# Install Homebrew
if ! [ -x "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
  echo "✔ brew has been installed successfully.";
else
  echo "✔ brew is already installed.";
fi

echo ""

# Link configuration files
for FILE in $FILES; do
  if [ ! -f ~/$FILE ]; then
    ln -s ~/.dotfiles/files/$FILE ~/$FILE;
    echo "✔ $FILE has been linked successfully.";
  else
    echo "✔ $FILE is already linked.";
  fi
done

echo ""

# Install commands.
for COMMAND in $COMMANDS; do
  if ! brew list $COMMAND &> /dev/null; then
    brew install $COMMAND;
    echo "✔ $COMMAND has been installed successfully.";
  else
    echo "✔ $COMMAND is already installed.";
  fi
done

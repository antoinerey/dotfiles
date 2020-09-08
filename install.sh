#!/bin/bash

# Files to symlink to the home directory.
FILES=(
  .config/karabiner.edn
  .config/starship.toml
  .gitconfig
  .zshrc
)

# Commands to install using Brew.
COMMANDS=(
  diff-so-fancy
  go
  n
  starship
  thefuck
  yarn
  yqrashawn/goku/goku
)

CASKS=(
  # 1password
  # alfred
  # firefox
  # iterm
  karabiner-elements
  # keyboard-maestro
  notion
  spotify
  visual-studio-code
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

echo ""

# Install casks.
for CASK in $CASKS; do
  if ! brew cask list $CASK &> /dev/null; then
    brew cask install $CASK;
    echo "✔ $CASK has been installed successfully.";
  else
    echo "✔ $CASK is already installed.";
  fi
done

echo ""

# Register Goku service to launch at login.
# See: https://github.com/yqrashawn/GokuRakuJoudo#usage
brew services restart yqrashawn/goku/goku

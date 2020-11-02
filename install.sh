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
  gh
  go
  jq
  n
  starship
  thefuck
  yarn
  yqrashawn/goku/goku
)

CASKS=(
  1password
  alfred
  firefox
  iterm2
  karabiner-elements
  keyboard-maestro
  notion
  spectacle
  spotify
  visual-studio-code
)

# -------------------------------------------------------------------- #

# Install Homebrew
if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";
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

osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'
echo "✔ Switched to dark mode"

defaults write com.apple.finder AppleShowAllFiles true
echo "✔ Dotfiles shown in Finder"

defaults write com.apple.dock tilesize -integer 24
echo "✔ Dock size set"

defaults write com.apple.dock static-only -bool true
echo "✔ Dock now only show active applications"

killall Dock
echo "✔ Dock configured"

echo ""

gh config set git_protocol ssh
gh config set editor "code --wait"
echo "✔ gh configured"

echo ""

# Register Goku service to launch at login.
# See: https://github.com/yqrashawn/GokuRakuJoudo#usage
brew services restart yqrashawn/goku/goku

# Finalise some settings enabling
killall Finder

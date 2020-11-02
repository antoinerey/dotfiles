#!/bin/bash

# Files to symlink to the home directory.
FILES=(
  .config/karabiner.edn
  .config/starship.toml
  .gitconfig
  .hushlogin
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
  slack
  spectacle
  spotify
  visual-studio-code
  zoomus
)

# -------------------------------------------------------------------- #

# Install Homebrew
if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";
  echo "✔ brew has been installed successfully.";
else
  echo "✔ brew is already installed.";
fi

# Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  rm ~/.zshrc
  echo "✔ oh-my-zsh has been installed successfully"
else
  echo "✔ oh-my-zsh is already installed"
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

defaults write com.apple.finder QuitMenuItem -bool true
echo "✔ Finder may be quit"

defaults write com.apple.finder AppleShowAllFiles true
echo "✔ Dotfiles shown in Finder"

defaults write com.apple.dock tilesize -integer 24
echo "✔ Dock size configured"

defaults write com.apple.dock static-only -bool true
echo "✔ Dock now only show active applications"

defaults write -g ApplePressAndHoldEnabled -bool false
echo "✔ Long keypress action disabled"

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
echo "✔ Key repeat rate configured"

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
killall Dock

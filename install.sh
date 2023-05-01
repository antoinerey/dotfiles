#!/bin/sh

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# ZSH
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

ln -Fs "$(pwd)/zsh/.zshrc" ~/.zshrc

# Any file symlinked to ZSH custom directory will be automatically sourced.
# See https://github.com/ohmyzsh/ohmyzsh/issues/4865#issuecomment-401121707.
ln -Fs "$(pwd)/zsh/aliases.zsh" "$ZSH/custom/aliases.zsh"
ln -Fs "$(pwd)/zsh/env.zsh"     "$ZSH/custom/env.zsh"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Neovim
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

mkdir -p ~/.config/nvim
ln -Fs "$(pwd)/nvim" ~/.config/nvim

## # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# tmux
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

ln -Fs "$(pwd)/tmux/.tmux.conf" ~/.tmux.conf
ln -Fs "$(pwd)/tmux" ~/.tmux

 # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Git
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

mkdir -p ~/.config/git
ln -Fs "$(pwd)/git/.gitconfig"      ~/.gitconfig
ln -Fs "$(pwd)/git/.gitignore"      ~/.config/git/.gitignore
ln -Fs "$(pwd)/git/.git-commit.tpl" ~/.config/git/.git-commit.tpl

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Other
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

ln -Fs "$(pwd)/other/karabiner.edn" ~/.config/karabiner.edn
ln -Fs "$(pwd)/other/starship.toml" ~/.config/starship.toml
ln -Fs "$(pwd)/other/.hushlogin"    ~/.hushlogin

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Brew
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew bundle install --file "$(pwd)/other/Brewfile" --no-lock

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Applications
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

gh config set git_protocol ssh
gh config set editor "code --wait"
echo "✔ gh configured"

# Register Goku service to launch at login.
# See: https://github.com/yqrashawn/GokuRakuJoudo#usage
brew services restart yqrashawn/goku/goku
echo "✔ goku configured"

# Enable fzf auto-complete and key bindings.
# See: https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
"$(brew --prefix)/opt/fzf/install" --key-bindings --completion --update-rc
echo "✔ fzf configured"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# MacOS Settings
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

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

defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.3
defaults write com.apple.dock autohide -bool true
echo "✔ Dock automatically hidden"

defaults write NSGlobalDomain _HIHideMenuBar -bool true
echo "✔ Menu bar automatically hidden"

defaults write -g ApplePressAndHoldEnabled -bool false
echo "✔ Long keypress action disabled"

defaults write -g InitialKeyRepeat -int 20
defaults write -g KeyRepeat -int 1
echo "✔ Key repeat rate configured"

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
echo "✔ Tap to click configured"

defaults write com.apple.LaunchServices LSQuarantine -bool false
echo "✔ 'Are you sure you want to open this application?' dialog disabled"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Teardown
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

killall Finder
killall Dock

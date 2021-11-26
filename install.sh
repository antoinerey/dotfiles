# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# ZSH
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

if [ ! -d ~/.oh-my-zsh ]; then
  # Install oh-my-zsh.
  # See https://ohmyz.sh.
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ln -Fs $(pwd)/zsh/.zshrc ~/.zshrc

# Any file symlinked to ZSH custom directory will be automatically sourced.
# See https://github.com/ohmyzsh/ohmyzsh/issues/4865#issuecomment-401121707.
ln -Fs $(pwd)/zsh/aliases.zsh $ZSH/custom/aliases.zsh
ln -Fs $(pwd)/zsh/env.zsh     $ZSH/custom/env.zsh

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Git
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

mkdir -p ~/.config/git
ln -Fs $(pwd)/git/.gitconfig ~/.gitconfig
ln -Fs $(pwd)/git/.gitignore ~/.config/git/.gitignore
ln -Fs $(pwd)/git/.git-commit.tpl ~/.config/git/.git-commit.tpl

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Other
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

ln -Fs $(pwd)/other/.hushlogin    ~/.hushlogin
ln -Fs $(pwd)/other/karabiner.edn ~/.config/karabiner.edn
ln -Fs $(pwd)/other/starship.toml ~/.config/starship.toml

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Brew
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew bundle install --file $(pwd)/other/Brewfile --no-lock

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
$(brew --prefix)/opt/fzf/install --key-bindings --completion --update-rc
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

defaults write -g ApplePressAndHoldEnabled -bool false
echo "✔ Long keypress action disabled"

defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
echo "✔ Key repeat rate configured"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Teardown
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

killall Finder
killall Dock

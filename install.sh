# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# ZSH
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

ln -s $(pwd)/zsh/.zshrc ~/.zshrc

# Any file symlinked to ZSH custom directory will be automatically sourced.
# See https://github.com/ohmyzsh/ohmyzsh/issues/4865#issuecomment-401121707.
ln -s $(pwd)/zsh/aliases.zsh $ZSH/custom/aliases.zsh
ln -s $(pwd)/zsh/env.zsh     $ZSH/custom/env.zsh

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Git
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

ln -s $(pwd)/git/.gitconfig ~/.gitconfig
ln -s $(pwd)/git/.git-commit.tpl ~/.config/.git-commit.tpl

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Other
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

ln -s $(pwd)/other/.hushlogin    ~/.hushlogin
ln -s $(pwd)/other/karabiner.edn ~/.config/karabiner.edn
ln -s $(pwd)/other/starship.toml ~/.config/starship.toml

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
# Platform Specific
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

if [[ "$OSTYPE" == "darwin"* ]]; then
  chmod +x $(pwd)/install.mac.sh && ./install.mac.sh
fi

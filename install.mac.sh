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

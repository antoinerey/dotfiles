#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Save Dotfiles
# @raycast.mode compact
# @raycast.author Antoine Rey
# @raycast.icon ⚙️
# @raycast.packageName Dotfiles

cd ~/.dotfiles
git add .
git commit -m "Update"
git push

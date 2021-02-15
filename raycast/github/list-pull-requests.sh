#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Pull Requests
# @raycast.mode inline
# @raycast.refreshTime 10s
# @raycast.author Antoine Rey
# @raycast.icon ../assets/github-dark.png
# @raycast.iconDark ../assets/github-light.png
# @raycast.packageName Github

open_pr=$(gh api issues | jq length)

echo "$open_pr pull requests"

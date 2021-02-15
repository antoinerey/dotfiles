#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Notifications
# @raycast.mode inline
# @raycast.refreshTime 10s
# @raycast.author Antoine Rey
# @raycast.icon ../assets/github-dark.png
# @raycast.iconDark ../assets/github-light.png
# @raycast.packageName Github

notifications=$(gh api notifications | jq length)

echo "$notifications notifications"

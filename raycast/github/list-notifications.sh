#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Notifications
# @raycast.mode inline
# @raycast.refreshTime 10s
# @raycast.author Antoine Rey
# @raycast.icon ../assets/github-dark.png
# @raycast.iconDark ../assets/github-light.png
# @raycast.packageName Github

# Fetch notifications from the Github API.
notifications=$(gh api notifications)

# Compute the notifications count.
# See: https://stedolan.github.io/jq/manual/#length
notifications_count=$(echo $notifications | jq length)

if [ $notifications_count = 0 ]; then
  echo "☀️";
fi

# Group every notifications by their repository name.
# See: https://stedolan.github.io/jq/manual/#group_by(path_expression)
notifications_grouped_by=$(echo $notifications | jq 'group_by(.repository.name)')

# Transform each notifications group into a stringified overview: "<repository>: <number>".
# See: https://stedolan.github.io/jq/manual/#map(x),map_values(x)
notifications_grouped_by_strings=$(echo $notifications_grouped_by | jq 'map(.[0].repository.name + ": " + (length | tostring))')

# Join the array of strings into a single string.
# See: https://stedolan.github.io/jq/manual/#join(str)
notifications_count_raw=$(echo $notifications_grouped_by_strings | jq 'join(", ")')

# Remove `"` from the final string, so it looks cleaner in the interface.
notifications_count_clean=$(echo $notifications_count_raw | sed 's/"//g')

echo $notifications_count_clean

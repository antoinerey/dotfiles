#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Pull Requests
# @raycast.mode inline
# @raycast.refreshTime 10s
# @raycast.author Antoine Rey
# @raycast.icon ../assets/github-dark.png
# @raycast.iconDark ../assets/github-light.png
# @raycast.packageName Github

# Fetch pull requests from the Github API.
pull_requests=$(gh api issues)

# Compute the pull requests count.
# See: https://stedolan.github.io/jq/manual/#length
pull_requests_count=$(echo $pull_requests | jq length)

if [ $pull_requests_count = 0 ]; then
  echo "☀️";
fi

# Group every pull requests by their repository name.
# See: https://stedolan.github.io/jq/manual/#group_by(path_expression)
pull_requests_grouped_by=$(echo $pull_requests | jq 'group_by(.repository.name)')

# Transform each pull requests group into a stringified overview: "<repository>: <number>".
# See: https://stedolan.github.io/jq/manual/#map(x),map_values(x)
pull_requests_grouped_by_strings=$(echo $pull_requests_grouped_by | jq 'map(.[0].repository.name + ": " + (length | tostring))')

# Join the array of strings into a single string.
# See: https://stedolan.github.io/jq/manual/#join(str)
pull_requests_count_raw=$(echo $pull_requests_grouped_by_strings | jq 'join(", ")')

# Remove `"` from the final string, so it looks cleaner in the interface.
pull_requests_count_clean=$(echo $pull_requests_count_raw | sed 's/"//g')

echo $pull_requests_count_clean

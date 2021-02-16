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

echo "$pull_requests_count pull requests";

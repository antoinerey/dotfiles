#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Travis
# @raycast.mode silent
# @raycast.author Antoine Rey

# Optional parameters:
# @raycast.icon ⚙️
# @raycast.packageName Web Searches
# @raycast.argument1 { "type": "text", "placeholder": "repository" }

open "https://travis-ci.com/github/BackMarket/${1}"


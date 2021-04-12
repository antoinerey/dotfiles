#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Circle CI
# @raycast.mode silent
# @raycast.author Antoine Rey
# @raycast.icon ../assets/circleci.png
# @raycast.packageName Web Searches
# @raycast.argument1 { "type": "text", "placeholder": "repository", "optional": true }

open "https://app.circleci.com/pipelines/github/BackMarket/${1}"

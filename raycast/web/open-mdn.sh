#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title MDN
# @raycast.mode silent
# @raycast.author Antoine Rey

# Optional parameters:
# @raycast.icon ../assets/mdn-light.png
# @raycast.iconDark ../assets/mdn-dark.png
# @raycast.packageName Web Searches
# @raycast.argument1 { "type": "text", "placeholder": "query" }

open "https://developer.mozilla.org/fr/search?q=${1}"

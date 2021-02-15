#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Bundlephobia
# @raycast.mode silent
# @raycast.author Antoine Rey
# @raycast.icon 📦
# @raycast.packageName Web Searches
# @raycast.argument1 { "type": "text", "placeholder": "package" }

open "https://bundlephobia.com/result?p=${1}"

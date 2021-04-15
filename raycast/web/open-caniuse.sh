#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Can I Use
# @raycast.mode silent
# @raycast.author Antoine Rey
# @raycast.icon ../assets/caniuse.png
# @raycast.packageName Web Searches
# @raycast.argument1 { "type": "text", "placeholder": "query", "percentEncoded": true }

open "https://caniuse.com/?search=${1}"

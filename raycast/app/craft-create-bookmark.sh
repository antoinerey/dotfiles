#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Bookmark Current URL
# @raycast.mode inline

# Optional parameters:
# @raycast.icon ../assets/cleanshot-record-screen.png
# @raycast.packageName Craft

parentBlockId=bff09ab7-d379-1bf0-9376-cfd4a27fb9d2
spaceId=6e679756-2b50-cda7-07a3-68c1974cfc5e

url=$(osascript -e 'tell app "brave" to get the url of the active tab of window 1')
open "craftdocs://createblock?parentBlockId=$parentBlockId&spaceId=$spaceId&content=$url&index=0"

#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Restore Recently Closed File
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ../assets/cleanshot/restore.png
# @raycast.packageName CleanShot X

# Documentation:
# @raycast.author CleanShot X
# @raycast.authorURL https://twitter.com/CleanShot_app
# @raycast.description Restore the recently closed file.

open "cleanshot://restore-recently-closed"

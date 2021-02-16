#!/usr/bin/osascript

# @raycast.schemaVersion 1
# @raycast.title Shutdown
# @raycast.mode silent
# @raycast.packageName System
# @raycast.icon ⚙️
# @raycast.description Shuts down computer.
# @raycast.needsConfirmation true

tell application "Finder" to shut down

#!/usr/bin/swift

# From: https://github.com/raycast/script-commands/blob/master/commands/system/quit-all-apps.swift

# @raycast.schemaVersion 1
# @raycast.title Quit All Applications
# @raycast.mode silent
# @raycast.packageName System
# @raycast.icon ⚙️
# @raycast.needsConfirmation true
# @raycast.description Quits all applications.

import AppKit

let finderBundleIdentifier = "com.apple.finder"

NSWorkspace.shared.runningApplications
  .filter { $0 != NSRunningApplication.current }
  .filter { $0.activationPolicy == .regular }
  .filter { $0.bundleIdentifier != finderBundleIdentifier }
  .forEach { $0.terminate() }

print("Quit all applications")

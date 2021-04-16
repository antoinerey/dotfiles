#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Open Pull Requests
# @raycast.mode silent
# @raycast.author Antoine Rey
# @raycast.icon ../assets/github-dark.png
# @raycast.iconDark ../assets/github-light.png
# @raycast.packageName Github

open "https://github.com/pulls?utf8=%E2%9C%93&q=is%3Apr+is%3Aopen+archived%3Afalse+sort%3Aupdated-desc+assignee%3Aantoinerey+-label%3A%22Outrigger+-+Queued+for+release%22"

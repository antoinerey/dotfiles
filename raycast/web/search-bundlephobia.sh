#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Bundlephobia
# @raycast.mode compact
# @raycast.author Antoine Rey
# @raycast.icon 📦
# @raycast.packageName Web Searches
# @raycast.argument1 { "type": "text", "placeholder": "package" }

function convert {
  local value=$1

  if [ $value -gt 1000 ]; then
    value=$(echo "scale=2; $value/1000" | bc);
    value=$(echo "$value kB")
  else
    value=$(echo "$value bytes")
  fi

  echo $value
}

response=$(curl https://bundlephobia.com/api/size?package=${1}&record=true)

minified=$(echo $response | jq .assets[0].size)
gzip=$(echo $response | jq .assets[0].gzip)

echo "Gzip: $(convert $gzip), Min: $(convert $minified)"

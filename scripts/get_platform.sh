#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname $0)" || exit; pwd)

DOCKERFILE="$1"

EXT="${DOCKERFILE##*.}"
PLATFORM=$( yq "to_entries[] | select(.value[] == \"$EXT\") | .key" "$SCRIPT_DIR/../platforms.yaml" )
echo "$PLATFORM"

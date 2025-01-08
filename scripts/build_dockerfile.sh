#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname $0)" || exit; pwd)

DOCKERFILE="$1"
DIRNAME=$(dirname "$DOCKERFILE")
BUILD_CONTEXT="$DIRNAME"

EXT="${DOCKERFILE##*.}"
PLATFORM=$( yq "to_entries[] | select(.value[] == \"$EXT\") | .key" "$SCRIPT_DIR/../platforms.yaml" )
echo "PLATFORM: $PLATFORM"

echo "Building image: from $DOCKERFILE"
docker buildx build --platform "$PLATFORM" -f "$DOCKERFILE" "$BUILD_CONTEXT"
if [ $? -ne 0 ]; then
    echo "Error building image: from $DOCKERFILE" >&2
    exit 1
fi

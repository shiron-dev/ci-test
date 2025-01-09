#!/bin/bash

set -e

renovate-config-validator --strict

RENOVATE_CONFIG_FILE=.github/renovate.json

RENOVATE_BASE_BRANCHES="$(git branch --show-current)"

# export RENOVATE_TOKEN="${RENOVATE_TOKEN:-$(read -p -r "環境変数 'RENOVATE_TOKEN' が設定されていません。値を入力してください: " input_value; echo "$input_value")}"

RENOVATE_BASE_BRANCHES="$RENOVATE_BASE_BRANCHES" \
 RENOVATE_CONFIG_FILE="$RENOVATE_CONFIG_FILE" \
 LOG_LEVEL=debug \
 renovate \
 --platform=local \
 --dry-run=full --require-config=ignored \
 --schedule="" --onboarding=false \
#  shiron-dev/images

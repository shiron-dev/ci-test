#!/bin/bash

set -e

renovate-config-validator --strict

export RENOVATE_CONFIG_FILE=.github/renovate.json

export RENOVATE_TOKEN="${RENOVATE_TOKEN:-$(read -p -r "環境変数 'RENOVATE_TOKEN' が設定されていません。値を入力してください: " input_value; echo "$input_value")}"

LOG_LEVEL=debug renovate shiron-dev/images --dry-run=full --require-config=ignored --schedule=""

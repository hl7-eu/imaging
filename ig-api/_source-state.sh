#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"
{
  find input ig-template -type f ! -name '*.db' ! -name '*index.json' -print0
  printf '%s\0' .gitignore LICENSE ig.ini sushi-config.yaml \
    _build.sh _build.bat _genonce.sh _genonce.bat \
    _gencontinuous.sh _gencontinuous.bat _updatePublisher.sh _updatePublisher.bat \
    _source-state.sh
} | sort -z | xargs -0 sha256sum | sha256sum

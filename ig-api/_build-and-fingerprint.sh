#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"
source_state="$(bash ./_source-state.sh)"
rm -f .build-source.sha256
build_started="$(mktemp)"
trap 'rm -f "$build_started"' EXIT

bash ./_genonce.sh "$@"

for evidence in output/qa.json output/package.tgz; do
  if [[ ! -s "$evidence" || ! "$evidence" -nt "$build_started" ]]; then
    echo "Missing or stale Publisher build evidence: $evidence" >&2
    exit 1
  fi
done
if [[ "$source_state" != "$(bash ./_source-state.sh)" ]]; then
  echo "API sources changed during the build; rebuild before synchronization." >&2
  exit 1
fi
printf '%s\n' "$source_state" > .build-source.sha256

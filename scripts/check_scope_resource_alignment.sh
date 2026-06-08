#!/usr/bin/env bash
set -euo pipefail

include_related=false
if [[ ${1:-} == "--include-related" ]]; then
  include_related=true
fi

provider_file="ig-src/input/fsh/api/CapabilityStatementResourceAccessProvider.liquid.fsh"
consumer_file="ig-src/input/fsh/api/CapabilityStatementResourceConsumer.fsh"

if [[ ! -f "$provider_file" || ! -f "$consumer_file" ]]; then
  echo "ERROR: Expected capability statement source files were not found."
  echo "- $provider_file"
  echo "- $consumer_file"
  exit 1
fi

status=0
warn_count=0

check_alignment() {
  local file="$1"
  local actor="$2"
  local resource="$3"

  local has_decl=0
  local has_read_scope=0
  local has_search_scope=0

  if grep -q "insert ${resource}Resource(" "$file"; then
    has_decl=1
  fi

  if grep -q "system/${resource}\.read" "$file"; then
    has_read_scope=1
  fi

  if grep -q "system/${resource}\.search" "$file"; then
    has_search_scope=1
  fi

  if [[ $has_decl -eq 1 ]]; then
    if [[ $has_read_scope -eq 1 && $has_search_scope -eq 1 ]]; then
      echo "PASS [$actor/$resource] declaration and read/search scopes are aligned"
    else
      echo "FAIL [$actor/$resource] declaration exists but missing scopes: read=$has_read_scope search=$has_search_scope"
      status=1
    fi
  else
    echo "INFO [$actor/$resource] no declaration found; skipping"
  fi
}

check_related_warning() {
  local file="$1"
  local actor="$2"
  local resource="$3"

  local has_decl=0
  local has_read_scope=0
  local has_search_scope=0

  if grep -q "insert ${resource}Resource(" "$file"; then
    has_decl=1
  fi

  if grep -q "system/${resource}\.read" "$file"; then
    has_read_scope=1
  fi

  if grep -q "system/${resource}\.search" "$file"; then
    has_search_scope=1
  fi

  if [[ $has_decl -eq 1 && $has_read_scope -eq 1 && $has_search_scope -eq 0 ]]; then
    echo "WARN [$actor/$resource] declaration present with read scope but search scope missing (related consistency check)"
    warn_count=$((warn_count + 1))
  else
    echo "INFO [$actor/$resource] related consistency check: no warning"
  fi
}

for file in "$provider_file" "$consumer_file"; do
  actor="provider"
  if [[ "$file" == "$consumer_file" ]]; then
    actor="consumer"
  fi

  check_alignment "$file" "$actor" "ImagingStudy"
  check_alignment "$file" "$actor" "Device"
  check_alignment "$file" "$actor" "ServiceRequest"
done

if [[ "$include_related" == true ]]; then
  for file in "$provider_file" "$consumer_file"; do
    actor="provider"
    if [[ "$file" == "$consumer_file" ]]; then
      actor="consumer"
    fi

    check_related_warning "$file" "$actor" "Procedure"
    check_related_warning "$file" "$actor" "Provenance"
  done
fi

if [[ $status -eq 0 ]]; then
  echo "Alignment status: IN SYNC"
else
  echo "Alignment status: NOT IN SYNC"
fi

if [[ "$include_related" == true ]]; then
  echo "Related warnings: $warn_count"
fi

exit $status

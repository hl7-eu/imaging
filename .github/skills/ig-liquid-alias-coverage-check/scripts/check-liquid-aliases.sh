#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 [4.0.1|5.0.0]" >&2
}

if [[ $# -gt 1 ]]; then
  usage
  exit 1
fi

if [[ $# -eq 1 ]]; then
  case "$1" in
    4.0.1|5.0.0)
      versions=("$1")
      ;;
    *)
      usage
      exit 1
      ;;
  esac
else
  versions=("4.0.1" "5.0.0")
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
cd "$repo_root"

if ! command -v npx >/dev/null 2>&1; then
  echo "ERROR: npx is required to run liquidjs rendering checks." >&2
  exit 1
fi

has_rg=0
if command -v rg >/dev/null 2>&1; then
  has_rg=1
fi

if [[ ! -d "ig-src" ]]; then
  echo "ERROR: Run this script from within the imaging repository." >&2
  exit 1
fi

failures=0

normalize_file() {
  local in_file="$1"
  local out_file="$2"

  # Normalize line endings, trim right-side whitespace, and ignore trailing blank lines.
  awk '{ sub(/[ \t\r]+$/, "", $0); lines[NR]=$0 } END { last=NR; while (last>0 && lines[last]=="") last--; for (i=1; i<=last; i++) print lines[i] }' "$in_file" > "$out_file"
}

find_unresolved_placeholders() {
  local file="$1"
  local out_file="$2"

  if [[ $has_rg -eq 1 ]]; then
    rg -n '\\{\\{[^}]+\\}\\}' "$file" > "$out_file" || true
  else
    grep -nE '\\{\\{[^}]+\\}\\}' "$file" > "$out_file" || true
  fi
}

check_version() {
  local version="$1"
  local context_file
  local build_dir

  if [[ "$version" == "4.0.1" ]]; then
    context_file="context-R4.json"
    build_dir="igs/imaging-r4"
  else
    context_file="context-R5.json"
    build_dir="igs/imaging-r5"
  fi

  if [[ ! -f "$context_file" ]]; then
    echo "ERROR: Missing $context_file" >&2
    failures=$((failures + 1))
    return
  fi

  echo "=== Preprocess $version ==="
  if ! bash ./_preprocessMultiVersion.sh "$version"; then
    echo "ERROR: _preprocessMultiVersion.sh failed for $version" >&2
    failures=$((failures + 1))
    return
  fi

  if [[ ! -d "$build_dir" ]]; then
    echo "ERROR: Missing build directory $build_dir" >&2
    failures=$((failures + 1))
    return
  fi

  local tmp_expected tmp_unresolved
  tmp_expected="$(mktemp)"
  tmp_unresolved="$(mktemp)"

  while IFS= read -r -d '' src; do
    local rel expected generated rendered_file normalized_rendered normalized_generated diff_file

    rel="${src#ig-src/}"
    expected="${rel/.liquid./.}"
    generated="$build_dir/$expected"

    if [[ ! -f "$generated" ]]; then
      echo "MISSING [$version]: $generated (from $src)"
      failures=$((failures + 1))
      continue
    fi

    rendered_file="$(mktemp)"
    normalized_rendered="$(mktemp)"
    normalized_generated="$(mktemp)"
    diff_file="$(mktemp)"

    if ! npx --yes liquidjs -t @"$src" --context @"$context_file" > "$rendered_file"; then
      echo "RENDER-ERROR [$version]: $src"
      failures=$((failures + 1))
      rm -f "$rendered_file" "$normalized_rendered" "$normalized_generated" "$diff_file"
      continue
    fi

    normalize_file "$rendered_file" "$normalized_rendered"
    normalize_file "$generated" "$normalized_generated"

    if ! diff -u "$normalized_rendered" "$normalized_generated" > "$diff_file"; then
      echo "MISMATCH [$version]: $generated differs from rendered $src"
      head -n 40 "$diff_file"
      failures=$((failures + 1))
    fi

    # Catch unresolved placeholders that indicate skipped or partial Liquid processing.
    find_unresolved_placeholders "$generated" "$tmp_unresolved"
    if [[ -s "$tmp_unresolved" ]]; then
      echo "UNRESOLVED [$version]: $generated still contains {{...}} placeholders"
      head -n 20 "$tmp_unresolved"
      failures=$((failures + 1))
    fi

    printf '%s\n' "$build_dir/$rel" >> "$tmp_expected"

    rm -f "$rendered_file" "$normalized_rendered" "$normalized_generated" "$diff_file"
  done < <(find ig-src -type f -name "*.liquid.*" -print0)

  # Any .liquid.* file left in build_dir means preprocessing skipped it.
  if find "$build_dir" -type f -name "*.liquid.*" -print -quit | grep -q .; then
    echo "SKIPPED [$version]: Found leftover .liquid.* files in $build_dir"
    find "$build_dir" -type f -name "*.liquid.*" | head -n 20
    failures=$((failures + 1))
  fi

  rm -f "$tmp_expected" "$tmp_unresolved"
}

for version in "${versions[@]}"; do
  check_version "$version"
done

if [[ $failures -gt 0 ]]; then
  echo "FAILED: Found $failures issue(s)." >&2
  exit 1
fi

echo "PASS: Liquid alias coverage and preprocess parity checks passed."

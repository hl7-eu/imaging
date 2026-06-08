#!/usr/bin/env bash

set -u

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
cd "$ROOT_DIR" || exit 1

VERSION="${1:-}"
if [[ -n "$VERSION" && "$VERSION" != "4.0.1" && "$VERSION" != "5.0.0" ]]; then
  echo "Usage: $0 [4.0.1|5.0.0]"
  exit 1
fi

WORK_DIR="$(mktemp -d "${TMPDIR:-/tmp}/imaging-build-check.XXXXXX")"
SUMMARY_FILE="$WORK_DIR/summary.md"

STEP_IDS=()
STEP_TITLES=()
STEP_STATUS=()
STEP_LOGS=()

add_step_result() {
  local id="$1"
  local title="$2"
  local status="$3"
  local log="$4"
  STEP_IDS+=("$id")
  STEP_TITLES+=("$title")
  STEP_STATUS+=("$status")
  STEP_LOGS+=("$log")
}

run_step() {
  local id="$1"
  local title="$2"
  shift 2

  local log="$WORK_DIR/${id}.log"
  echo ""
  echo "============================================================"
  echo "STEP: $title"
  echo "============================================================"

  "$@" > >(tee "$log") 2>&1
  local rc=$?

  if [[ $rc -eq 0 ]]; then
    add_step_result "$id" "$title" "OK" "$log"
  else
    add_step_result "$id" "$title" "FAILED($rc)" "$log"
  fi
}

add_skipped_step() {
  local id="$1"
  local title="$2"
  local reason="$3"
  local log="$WORK_DIR/${id}.log"

  printf '%s\n' "$reason" > "$log"
  add_step_result "$id" "$title" "SKIPPED" "$log"
}

ensure_publisher_for_ig() {
  local ig_dir="$1"
  local local_publisher="$ig_dir/input-cache/publisher.jar"
  local parent_publisher
  parent_publisher="$(dirname "$ig_dir")/publisher.jar"

  if [[ -f "$local_publisher" || -f "$parent_publisher" ]]; then
    echo "IG Publisher FOUND for $ig_dir"
    return 0
  fi

  echo "IG Publisher NOT FOUND for $ig_dir. Running _updatePublisher..."
  (
    cd "$ig_dir" || exit 1
    ./_updatePublisher.sh -y
  )

  if [[ -f "$local_publisher" || -f "$parent_publisher" ]]; then
    echo "IG Publisher ready for $ig_dir"
    return 0
  fi

  echo "IG Publisher still missing for $ig_dir after update. Aborting..."
  return 1
}

suggest_fix() {
  local error_text="$1"

  case "$error_text" in
    *"Usage: "*"_preprocessMultiVersion.sh"*)
      echo "Use only supported versions: run with no argument, 4.0.1, or 5.0.0."
      ;;
    *"Unknown parameter passed:"*)
      echo "Only pass 4.0.1 or 5.0.0 to _preprocessMultiVersion.sh."
      ;;
    *"IG Publisher NOT FOUND"*|*"IG Publisher still missing"*)
      echo "Run _updatePublisher.sh -y in the failing IG folder and verify internet access plus write permission to input-cache."
      ;;
    *"Offline"*|*"Could not resolve host"*|*"Failed to connect"*|*"Connection timed out"*)
      echo "Check network/proxy settings. If terminology access is blocked, rerun _genonce.sh with offline terminology option (-tx n/a)."
      ;;
    *"java: command not found"*|*"Unable to access jarfile"*)
      echo "Install a compatible Java runtime (typically Java 17+) and ensure publisher.jar exists in input-cache or parent folder."
      ;;
    *"npx: command not found"*|*"npm: command not found"*)
      echo "Install Node.js and npm, then rerun preprocessing (npx liquidjs is required)."
      ;;
    *"liquidjs"*"not found"*|*"Cannot find module 'liquidjs'"*)
      echo "Verify npm registry access; if needed, run npx --yes liquidjs manually to confirm package download works."
      ;;
    *"Permission denied"*)
      echo "Grant execute/write permissions: chmod +x on scripts and chmod -R a+w on working IG folders."
      ;;
    *"No such file or directory"*)
      echo "Run the command from repository root and verify required paths exist (ig-src, context-R4.json, context-R5.json, igs/*)."
      ;;
    *"OutOfMemoryError"*|*"Java heap space"*)
      echo "Increase Java heap for publisher, for example: export JAVA_TOOL_OPTIONS='-Xms1g -Xmx4g -Dfile.encoding=UTF-8'."
      ;;
    *"FAILED"*|*"Error:"*|*"ERROR"*)
      echo "Inspect the step log for the first upstream failure; fix that root cause before re-running dependent steps."
      ;;
    *)
      echo "Review the full log and fix the earliest error line first; later errors are often follow-on failures."
      ;;
  esac
}

collect_error_lines() {
  local log_file="$1"
  if ! command -v rg >/dev/null 2>&1; then
    grep -nEi "(ERROR|Error|Exception|FAILED|Aborting|not found|No such file|Usage:)" "$log_file" | head -n 12 || true
    return
  fi

  rg -n -i "(ERROR|Error|Exception|FAILED|Aborting|not found|No such file|Usage:|Permission denied|Offline|Unable to access jarfile|command not found|OutOfMemoryError|Java heap space)" "$log_file" | head -n 12 || true
}

build_summary() {
  {
    echo "# Imaging Build Check Summary"
    echo ""
    echo "- Workspace: $ROOT_DIR"
    if [[ -n "$VERSION" ]]; then
      echo "- Requested version: $VERSION"
    else
      echo "- Requested version: all (4.0.1 and 5.0.0)"
    fi
    echo "- Temp report dir: $WORK_DIR"
    echo ""
    echo "## Step Results"
    echo ""
    echo "| Step | Status | Log |"
    echo "|---|---|---|"

    local i
    for i in "${!STEP_IDS[@]}"; do
      echo "| ${STEP_TITLES[$i]} | ${STEP_STATUS[$i]} | ${STEP_LOGS[$i]} |"
    done

    echo ""
    echo "## Errors And Proposed Fixes"
    echo ""

    local failures=0
    for i in "${!STEP_IDS[@]}"; do
      if [[ "${STEP_STATUS[$i]}" == FAILED* ]]; then
        failures=$((failures + 1))
        echo "### ${STEP_TITLES[$i]}"
        echo ""

        local matches
        matches="$(collect_error_lines "${STEP_LOGS[$i]}")"

        if [[ -z "$matches" ]]; then
          echo "No explicit error keyword matched. Review log: ${STEP_LOGS[$i]}"
          echo ""
          continue
        fi

        while IFS= read -r line; do
          [[ -z "$line" ]] && continue
          local line_number
          line_number="${line%%:*}"
          local message
          message="${line#*:}"
          echo "- Error (line $line_number): $message"
          echo "- Proposed fix: $(suggest_fix "$message")"
        done <<< "$matches"

        echo ""
      fi
    done

    if [[ $failures -eq 0 ]]; then
      echo "No build errors detected in executed steps."
    fi
  } > "$SUMMARY_FILE"
}

run_step "preprocess" "Preprocess multi-version IG" bash ./_preprocessMultiVersion.sh ${VERSION:+"$VERSION"}
run_step "publisher-r4" "Ensure publisher for imaging-r4" ensure_publisher_for_ig "igs/imaging-r4"
run_step "publisher-r5" "Ensure publisher for imaging-r5" ensure_publisher_for_ig "igs/imaging-r5"

if [[ -z "$VERSION" || "$VERSION" == "4.0.1" ]]; then
  run_step "build-r4" "Build imaging-r4 (_genonce.sh)" bash -lc "cd igs/imaging-r4 && ./_genonce.sh"
else
  add_skipped_step "build-r4" "Build imaging-r4 (_genonce.sh)" "Skipped because version filter is $VERSION"
fi

if [[ -z "$VERSION" || "$VERSION" == "5.0.0" ]]; then
  run_step "build-r5" "Build imaging-r5 (_genonce.sh)" bash -lc "cd igs/imaging-r5 && ./_genonce.sh"
else
  add_skipped_step "build-r5" "Build imaging-r5 (_genonce.sh)" "Skipped because version filter is $VERSION"
fi

build_summary

echo ""
echo "Summary written to: $SUMMARY_FILE"
cat "$SUMMARY_FILE"

FAILED_COUNT=0
for status in "${STEP_STATUS[@]}"; do
  if [[ "$status" == FAILED* ]]; then
    FAILED_COUNT=$((FAILED_COUNT + 1))
  fi
done

if [[ $FAILED_COUNT -gt 0 ]]; then
  exit 1
fi

exit 0

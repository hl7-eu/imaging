#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$repo_dir"

timestamp="$(date +%Y%m%d-%H%M%S)"
log_dir="$repo_dir/build-logs"
mkdir -p "$log_dir"
run_log="$log_dir/build-$timestamp.log"
touch "$run_log"
run_start_epoch="$(date +%s)"

# Mirror all script output to a timestamped build log for post-failure inspection.
exec > >(tee -a "$run_log") 2>&1
echo "Build run log: $run_log"
echo "Build run started: $(date -Iseconds)"

log_step() {
  echo ""
  echo "==== $1 ===="
}

on_exit() {
  local exit_code="$?"
  local run_end_epoch
  run_end_epoch="$(date +%s)"
  local duration_sec=$((run_end_epoch - run_start_epoch))

  echo ""
  echo "Build run ended: $(date -Iseconds)"
  echo "Build duration: ${duration_sec}s"
  if [ "$exit_code" -eq 0 ]; then
    echo "Build result: COMPLETED"
  else
    echo "Build result: FAILED (exit=$exit_code)"
  fi
}

trap on_exit EXIT

source_dir="ig-src"
versions=("r4" "r5")

publisher_image="${PUBLISHER_IMAGE:-hl7fhir/ig-publisher-base:latest}"
cache_mode="${PUBLISHER_FHIR_CACHE_MODE:-volume}"
cache_dir="${PUBLISHER_FHIR_CACHE_DIR:-$HOME/.fhir}"

latest_file_in_dir() {
  local dir="$1"
  find "$dir" -type f -printf '%T@ %p\n' 2>/dev/null | sort -nr | sed -n '1{s/^[^ ]* //;p;}'
}

source_changes_under_ig_src() {
  git status --porcelain=1 --untracked-files=normal -- "$source_dir" |
    cut -c4- |
    grep -vE '(^|/)(input-cache|temp|fsh-generated|output)(/|$)' || true
}

needs_rebuild=false

if [ ! -d "$source_dir" ]; then
  echo "Source directory not found: $source_dir"
  exit 1
fi

log_step "Checking whether rebuild is needed"
source_changes="$(source_changes_under_ig_src)"
if [ -n "$source_changes" ]; then
  echo "Source changes detected under $source_dir:"
  echo "$source_changes" | sed 's/^/  /'
  needs_rebuild=true
else
  echo "No source changes detected under $source_dir."
fi

for version in "${versions[@]}"; do
  ig_dir="igs/imaging-${version}"
  output_dir="$ig_dir/output"

  if [ ! -d "$output_dir" ]; then
    echo "Missing output directory for imaging-${version}: $output_dir"
    needs_rebuild=true
    continue
  fi

  output_file_count="$(find "$output_dir" -type f | wc -l)"
  if [ "$output_file_count" -eq 0 ]; then
    echo "No build output files found for imaging-${version}: $output_dir"
    needs_rebuild=true
    continue
  fi
done

if [ "$needs_rebuild" = true ]; then
  log_step "Preprocessing"
  echo "Rebuild required. Running _preprocessMultiVersion.sh..."
  ./_preprocessMultiVersion.sh
else
  echo "No preprocess needed: build outputs are present and newer than ig-src."
fi

ensure_publisher_for_ig() {
  local ig_dir="$1"
  local local_publisher="$ig_dir/input-cache/publisher.jar"
  local parent_publisher
  parent_publisher="$(dirname "$ig_dir")/publisher.jar"

  if [ -f "$local_publisher" ] || [ -f "$parent_publisher" ]; then
    echo "IG Publisher found for $ig_dir"
    return 0
  fi

  echo "IG Publisher missing for $ig_dir. Running _updatePublisher.sh..."
  (
    cd "$ig_dir"
    ./_updatePublisher.sh -y
  )

  if [ -f "$local_publisher" ] || [ -f "$parent_publisher" ]; then
    echo "IG Publisher ready for $ig_dir"
    return 0
  fi

  echo "IG Publisher still missing for $ig_dir after update"
  return 1
}

run_build_in_docker() {
  local version="$1"
  local instance_name="ig-publisher-imaging-${version}-$(date +%s%N | cut -b1-13)"
  local ig_container_dir="/home/publisher/ig/igs/imaging-${version}"
  local version_log="$log_dir/build-${version}-$timestamp.log"

  local cache_args=()
  if [ "$cache_mode" = "volume" ]; then
    mkdir -p "$cache_dir"
    cache_args=(-v "$cache_dir:/home/publisher/.fhir")
  else
    cache_args=(--tmpfs "/home/publisher/.fhir")
  fi

  echo "Starting docker build for imaging-${version} (container: $instance_name)"
  echo "Version build log: $version_log"
  docker run \
    --name "$instance_name" \
    --rm \
    -v "$repo_dir:/home/publisher/ig" \
    "${cache_args[@]}" \
    "$publisher_image" \
    bash -lc "cd '$ig_container_dir' && ./_genonce.sh" 2>&1 | tee -a "$version_log" | sed -u "s/^/[${version}] /"
}

run_build_locally() {
  local version="$1"
  local ig_dir="$repo_dir/igs/imaging-${version}"
  local version_log="$log_dir/build-${version}-$timestamp.log"

  echo "Starting local build for imaging-${version}"
  echo "Version build log: $version_log"
  (
    cd "$ig_dir"
    ./_genonce.sh
  ) 2>&1 | tee -a "$version_log" | sed -u "s/^/[${version}] /"
}

print_qa_summary() {
  local version="$1"
  local qa_file="$repo_dir/igs/imaging-${version}/output/qa.txt"

  if [ ! -f "$qa_file" ]; then
    echo "imaging-${version} QA summary: missing $qa_file"
    return 0
  fi

  local qa_line
  qa_line="$(grep -m1 '^err =' "$qa_file" || true)"
  if [ -n "$qa_line" ]; then
    echo "imaging-${version} QA summary: $qa_line"
  else
    echo "imaging-${version} QA summary: no err/warn/info line found in $qa_file"
  fi
}

publisher_image_has_java() {
  docker run --rm "$publisher_image" bash -lc "command -v java >/dev/null 2>&1" >/dev/null 2>&1
}

if [ "$needs_rebuild" = true ]; then
  ensure_publisher_for_ig "igs/imaging-r4"
  ensure_publisher_for_ig "igs/imaging-r5"

  build_runner="docker"
  if ! command -v docker >/dev/null 2>&1; then
    echo "Docker not found in PATH; switching to local build mode."
    build_runner="local"
  elif ! publisher_image_has_java; then
    echo "Publisher image '$publisher_image' does not provide java for _genonce.sh; switching to local build mode."
    build_runner="local"
  fi

  log_step "Running parallel builds"
  if [ "$build_runner" = "docker" ]; then
    run_build_in_docker "r4" &
  else
    run_build_locally "r4" &
  fi
  pid_r4=$!
  if [ "$build_runner" = "docker" ]; then
    run_build_in_docker "r5" &
  else
    run_build_locally "r5" &
  fi
  pid_r5=$!

  echo "Waiting for imaging-r4 and imaging-r5 builds to finish (blocking)..."

  set +e
  wait "$pid_r4"
  status_r4=$?
  echo "imaging-r4 build finished with exit code $status_r4"
  wait "$pid_r5"
  status_r5=$?
  echo "imaging-r5 build finished with exit code $status_r5"
  set -e

  if [ "$status_r4" -ne 0 ] || [ "$status_r5" -ne 0 ]; then
    echo "Parallel build failed: r4 exit=$status_r4, r5 exit=$status_r5"
    echo "Inspect logs:"
    echo "- Run log: $run_log"
    echo "- R4 log:  $log_dir/build-r4-$timestamp.log"
    echo "- R5 log:  $log_dir/build-r5-$timestamp.log"
    print_qa_summary "r4"
    print_qa_summary "r5"
    exit 1
  fi

  print_qa_summary "r4"
  print_qa_summary "r5"
  echo "Parallel build completed successfully for imaging-r4 and imaging-r5."
  echo "Inspect logs:"
  echo "- Run log: $run_log"
  echo "- R4 log:  $log_dir/build-r4-$timestamp.log"
  echo "- R5 log:  $log_dir/build-r5-$timestamp.log"
else
  print_qa_summary "r4"
  print_qa_summary "r5"
  echo "No version rebuild needed: source tree is clean and build outputs are present."
  echo "Inspect logs:"
  echo "- Run log: $run_log"
  echo "- R4 log:  $log_dir/build-r4-$timestamp.log"
  echo "- R5 log:  $log_dir/build-r5-$timestamp.log"
fi

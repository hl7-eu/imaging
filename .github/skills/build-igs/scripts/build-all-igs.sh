#!/usr/bin/env bash
# Build the HL7 Europe Imaging IG for all FHIR versions in parallel,
# writing one timestamped build log per version into build-logs/.
#
# Usage:
#   build-all-igs.sh                # builds r4 r5 r6
#   build-all-igs.sh r4 r5          # builds only the listed versions
set -euo pipefail

# Resolve repo root as two levels up from .github/skills/build-igs/scripts.
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_dir="$(cd "$script_dir/../../../.." && pwd)"
cd "$repo_dir"

versions=("$@")
if [ "${#versions[@]}" -eq 0 ]; then
  versions=("r4" "r5" "r6")
fi

timestamp="$(date +%Y%m%d-%H%M%S)"
log_dir="$repo_dir/build-logs"
mkdir -p "$log_dir"
run_log="$log_dir/build-$timestamp.log"
touch "$run_log"

exec > >(tee -a "$run_log") 2>&1
echo "Build run log: $run_log"
echo "Building versions: ${versions[*]}"
echo "Build run started: $(date -Iseconds)"

publisher_image="${PUBLISHER_IMAGE:-hl7fhir/ig-publisher-base:latest}"
cache_mode="${PUBLISHER_FHIR_CACHE_MODE:-volume}"
cache_dir="${PUBLISHER_FHIR_CACHE_DIR:-$HOME/.fhir}"

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
  ( cd "$ig_dir" && ./_updatePublisher.sh -y )

  if [ -f "$local_publisher" ] || [ -f "$parent_publisher" ]; then
    echo "IG Publisher ready for $ig_dir"
    return 0
  fi
  echo "IG Publisher still missing for $ig_dir after update"
  return 1
}

run_build_locally() {
  local version="$1"
  local ig_dir="$repo_dir/igs/imaging-${version}"
  local version_log="$log_dir/build-${version}-$timestamp.log"
  echo "Starting local build for imaging-${version} (log: $version_log)"
  ( cd "$ig_dir" && ./_genonce.sh ) 2>&1 | tee -a "$version_log" | sed -u "s/^/[${version}] /"
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

  echo "Starting docker build for imaging-${version} (container: $instance_name, log: $version_log)"
  docker run \
    --name "$instance_name" \
    --rm \
    -v "$repo_dir:/home/publisher/ig" \
    "${cache_args[@]}" \
    "$publisher_image" \
    bash -lc "cd '$ig_container_dir' && ./_genonce.sh" 2>&1 | tee -a "$version_log" | sed -u "s/^/[${version}] /"
}

publisher_image_has_java() {
  docker run --rm "$publisher_image" bash -lc "command -v java >/dev/null 2>&1" >/dev/null 2>&1
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
  echo "imaging-${version} QA summary: ${qa_line:-no err/warn/info line found}"
}

echo "==== Preprocessing (ig-src -> igs/imaging-*) ===="
./_preprocessMultiVersion.sh

echo "==== Ensuring IG Publisher jars ===="
for version in "${versions[@]}"; do
  ensure_publisher_for_ig "igs/imaging-${version}" || true
done

build_runner="docker"
if ! command -v docker >/dev/null 2>&1; then
  echo "Docker not found in PATH; switching to local build mode."
  build_runner="local"
elif ! publisher_image_has_java; then
  echo "Publisher image '$publisher_image' does not provide java; switching to local build mode."
  build_runner="local"
fi

echo "==== Running parallel builds ($build_runner) ===="
declare -A pids
for version in "${versions[@]}"; do
  if [ "$build_runner" = "docker" ]; then
    run_build_in_docker "$version" &
  else
    run_build_locally "$version" &
  fi
  pids["$version"]=$!
done

overall_status=0
for version in "${versions[@]}"; do
  set +e
  wait "${pids[$version]}"
  status=$?
  set -e
  echo "imaging-${version} build finished with exit code $status"
  [ "$status" -ne 0 ] && overall_status=1
done

echo "==== QA summaries ===="
for version in "${versions[@]}"; do
  print_qa_summary "$version"
done

echo "Build run ended: $(date -Iseconds)"
if [ "$overall_status" -eq 0 ]; then
  echo "Build result: COMPLETED for ${versions[*]}"
else
  echo "Build result: FAILED for one or more versions. Inspect build-logs/build-<version>-$timestamp.log"
fi
exit "$overall_status"

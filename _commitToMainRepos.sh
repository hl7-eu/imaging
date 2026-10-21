#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$repo_dir"

targets=(r4 r5)
[[ ! -f ig-api/sushi-config.yaml ]] || targets+=(api)
push_changes=true
for argument in "$@"; do
  case "$argument" in
    --api-only) targets=(api) ;;
    --no-push) push_changes=false ;;
    *) echo "Usage: $0 [--api-only] [--no-push]" >&2; exit 2 ;;
  esac
done

fail() { echo "ERROR: $*" >&2; exit 1; }
for command in git rsync sha256sum; do
  command -v "$command" >/dev/null || fail "Required command not found: $command"
done

current_branch="$(git symbolic-ref --quiet --short HEAD || true)"
current_branch="${current_branch:-${GITHUB_REF_NAME:-}}"
[[ -n "$current_branch" ]] || fail "Cannot determine source branch."
git check-ref-format --branch "$current_branch" >/dev/null
source_commit="$(git rev-parse HEAD)"
source_subject="$(git log -1 --format=%s)"

# Use the token only through Git's credential protocol, never in stored URLs.
if [[ -n "${DEPLOY_TOKEN:-}" ]]; then
  export GIT_CONFIG_COUNT=2
  export GIT_CONFIG_KEY_0=credential.helper GIT_CONFIG_VALUE_0=
  export GIT_CONFIG_KEY_1=credential.helper
  export GIT_CONFIG_VALUE_1='!f() { if [ "$1" = get ]; then printf "username=x-access-token\npassword=%s\n" "$DEPLOY_TOKEN"; fi; }; f'
fi

source_for() {
  if [[ "$1" == api ]]; then printf '%s/ig-api\n' "$repo_dir"
  else printf '%s/igs/imaging-%s\n' "$repo_dir" "$1"; fi
}

check_build() {
  local target="$1" source="$2" file evidence
  for evidence in output/qa.json output/package.tgz; do
    [[ -s "$source/$evidence" ]] || fail "Missing build evidence: $source/$evidence. Rebuild $target first."
  done
  if [[ "$target" == api ]]; then
    [[ -f "$source/.build-source.sha256" ]] || fail "Missing API source fingerprint; run ig-api/_genonce.sh."
    [[ "$(bash "$source/_source-state.sh")" == "$(cat "$source/.build-source.sha256")" ]] ||
      fail "API sources changed since the successful build; run ig-api/_genonce.sh."
  else
    [[ -d ig-src ]] || fail "Missing ig-src."
    while IFS= read -r -d '' file; do
      [[ ! "$file" -nt "$source/output/qa.json" && ! "$file" -nt "$source/output/package.tgz" ]] ||
        fail "Imaging $target build is older than $file. Rebuild first."
    done < <(find ig-src -type f -print0)
  fi
}

check_origin() {
  local target="$1" checkout="$2" url fetch_url push_url
  # Check both fetch and push destinations before modifying a child checkout.
  fetch_url="$(git -C "$checkout" config --get-all remote.origin.url)"
  push_url="$(git -C "$checkout" config --get-all remote.origin.pushurl || true)"
  for url in "$fetch_url" "${push_url:-$fetch_url}"; do
    case "$url" in
      "git@github.com:hl7-eu/imaging-$target.git"|"https://github.com/hl7-eu/imaging-$target.git"|"https://github.com/hl7-eu/imaging-$target") ;;
      *) fail "Unexpected origin for imaging-$target; expected hl7-eu/imaging-$target." ;;
    esac
  done
}

echo "Synchronizing source branch $current_branch at $source_commit"
# Preflight every target before any child content is changed or pushed.
for target in "${targets[@]}"; do
  source="$(source_for "$target")"
  check_build "$target" "$source"
  checkout="$repo_dir/subigs/imaging-$target"
  if [[ -e "$checkout" ]]; then
    [[ "$(git -C "$checkout" rev-parse --show-toplevel)" == "$checkout" ]] ||
      fail "$checkout is not an independent Git checkout."
    [[ -z "$(git -C "$checkout" status --porcelain)" ]] || fail "Dirty child checkout: $checkout"
    check_origin "$target" "$checkout"
  fi
done

for target in "${targets[@]}"; do
  checkout="$repo_dir/subigs/imaging-$target"
  if [[ ! -e "$checkout" ]]; then
    url="git@github.com:hl7-eu/imaging-$target.git"
    [[ -z "${DEPLOY_TOKEN:-}" ]] || url="https://github.com/hl7-eu/imaging-$target.git"
    git clone "$url" "$checkout"
  fi
  git -C "$checkout" fetch origin --prune
  remote_ref="refs/remotes/origin/$current_branch"
  local_ref="refs/heads/$current_branch"
  if git -C "$checkout" show-ref --verify --quiet "$local_ref"; then
    if git -C "$checkout" show-ref --verify --quiet "$remote_ref"; then
      if git -C "$checkout" merge-base --is-ancestor "$remote_ref" "$local_ref"; then
        effective_ref="$local_ref"
      elif git -C "$checkout" merge-base --is-ancestor "$local_ref" "$remote_ref"; then
        effective_ref="$remote_ref"
      else
        fail "Diverged branch in imaging-$target. Reconcile it before syncing."
      fi
    else
      effective_ref="$local_ref"
    fi
  elif git -C "$checkout" show-ref --verify --quiet "$remote_ref"; then
    effective_ref="$remote_ref"
  else
    effective_ref="$(git -C "$checkout" symbolic-ref refs/remotes/origin/HEAD)"
  fi
  if [[ "$target" == api ]] &&
     git -C "$checkout" cat-file -e "$effective_ref:LICENSE" 2>/dev/null; then
    cmp -s "$repo_dir/ig-api/LICENSE" <(git -C "$checkout" show "$effective_ref:LICENSE") ||
      fail "API destination LICENSE differs; review it before syncing."
  fi
done

completed=()
trap 'rc=$?; if [[ $rc != 0 ]]; then echo "Sync failed (exit $rc). Completed targets: ${completed[*]:-none}. Inspect child status before retrying." >&2; fi' EXIT
for target in "${targets[@]}"; do
  source="$(source_for "$target")"
  checkout="$repo_dir/subigs/imaging-$target"
  remote_ref="refs/remotes/origin/$current_branch"
  if git -C "$checkout" show-ref --verify --quiet "refs/heads/$current_branch"; then
    git -C "$checkout" switch "$current_branch"
  elif git -C "$checkout" show-ref --verify --quiet "$remote_ref"; then
    git -C "$checkout" switch --track -c "$current_branch" "origin/$current_branch"
  else
    default_ref="$(git -C "$checkout" symbolic-ref refs/remotes/origin/HEAD)"
    git -C "$checkout" switch -c "$current_branch" "$default_ref"
  fi
  if git -C "$checkout" show-ref --verify --quiet "$remote_ref"; then
    if git -C "$checkout" merge-base --is-ancestor HEAD "$remote_ref"; then
      git -C "$checkout" merge --ff-only "$remote_ref"
    fi
  fi

  # Own input/template trees and project root files, not destination README/history.
  filters=(--exclude='/.git' --exclude='/README.md' --exclude='/LICENSE'
    --exclude='/output/' --exclude='/temp/' --exclude='/input-cache/'
    --exclude='/fsh-generated/' --exclude='/template/' --exclude='/translations/'
    --exclude='/publisher.jar' --exclude='/Requirements-fromNarrative.json'
    --exclude='/FHIR-eu-imaging-api.xml' --exclude='/.build-source.sha256'
    --exclude='*.db' --exclude='*index.json')
  if [[ "$target" == api ]]; then
    filters+=(--include='/input/***' --include='/ig-template/***'
      --include='/.gitignore' --include='/ig.ini' --include='/sushi-config.yaml'
      --include='/_build.sh' --include='/_build.bat'
      --include='/_genonce.sh' --include='/_genonce.bat'
      --include='/_gencontinuous.sh' --include='/_gencontinuous.bat'
      --include='/_updatePublisher.sh' --include='/_updatePublisher.bat'
      --include='/_source-state.sh' --exclude='/*')
  fi
  rsync -a --delete "${filters[@]}" "$source/" "$checkout/"
  if [[ ! -e "$checkout/LICENSE" && -f "$source/LICENSE" ]]; then
    cp "$source/LICENSE" "$checkout/LICENSE"
  fi
  # The preflight clean check ensures these are exclusively synchronization edits.
  git -C "$checkout" add -A
  if ! git -C "$checkout" diff --cached --quiet; then
    git -C "$checkout" commit -m "$source_subject" \
      -m "Sync imaging-$target from hl7-eu/imaging commit $source_commit." \
      --trailer 'Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>'
  else
    echo "No content changes for imaging-$target."
  fi
  # Always push: an earlier attempt may have committed but failed to push.
  if [[ "$push_changes" == true ]]; then
    git -C "$checkout" push -u origin "HEAD:refs/heads/$current_branch"
  else
    echo "Local commit prepared for imaging-$target; push skipped (--no-push)."
  fi
  completed+=("imaging-$target")
done

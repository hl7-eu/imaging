#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
work="$(mktemp -d "${TMPDIR:-/tmp}/imaging-sync-test.XXXXXX")"
echo "Test artifacts: $work"
export GIT_CONFIG_GLOBAL="$work/gitconfig" GIT_CONFIG_NOSYSTEM=1
export GIT_AUTHOR_NAME="Sync Test" GIT_AUTHOR_EMAIL="sync-test@example.invalid"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME" GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global protocol.file.allow always

source="$work/source with spaces"
mkdir -p "$source/ig-api" "$source/ig-src"
cp "$root/_commitToMainRepos.sh" "$source/"
rsync -a --exclude='/output/' --exclude='/temp/' --exclude='/input-cache/' \
  --exclude='/fsh-generated/' --exclude='/template/' --exclude='/translations/' \
  --exclude='/.build-source.sha256' "$root/ig-api/" "$source/ig-api/"
git -C "$source" init -b api-spin-off
git -C "$source" add _commitToMainRepos.sh ig-api
git -C "$source" commit -m 'Test API synchronization'

for target in r4 r5 api; do
  remote="$work/imaging-$target.git"
  git init --bare -b master "$remote"
  seed="$work/seed-$target"
  git clone "$remote" "$seed"
  printf 'Keep destination README\n' > "$seed/README.md"
  cp "$root/ig-api/LICENSE" "$seed/LICENSE"
  git -C "$seed" add .
  git -C "$seed" commit -m 'Initial destination'
  git -C "$seed" push origin master
  git config --global "url.$remote.insteadOf" "git@github.com:hl7-eu/imaging-$target.git"
done

refresh() {
  mkdir -p "$source/ig-api/output"
  printf '{}\n' > "$source/ig-api/output/qa.json"
  printf 'test package\n' > "$source/ig-api/output/package.tgz"
  bash "$source/ig-api/_source-state.sh" > "$source/ig-api/.build-source.sha256"
}
run_sync() { bash "$source/_commitToMainRepos.sh" --api-only "$@"; }
expect_failure() {
  local message="$1"
  shift
  if "$@" > "$work/failure.log" 2>&1; then
    echo "Expected failure: $message" >&2; exit 1
  fi
  grep -q "$message" "$work/failure.log"
}

# Exercise build fingerprint recording for each Publisher lookup path.
mkdir -p "$work/bin" "$source/ig-api/input-cache" "$work/publisher-home"
printf '#!/bin/sh\nexit 0\n' > "$work/bin/curl"
cat > "$work/bin/java" <<'EOF'
#!/bin/sh
if [ "${SYNC_TEST_JAVA_FAIL:-}" = true ]; then exit 1; fi
mkdir -p output
printf '{}\n' > output/qa.json
printf 'test package\n' > output/package.tgz
EOF
chmod +x "$work/bin/curl" "$work/bin/java"
touch "$source/ig-api/input-cache/publisher.jar"
PATH="$work/bin:$PATH" bash "$source/ig-api/_genonce.sh"
test -s "$source/ig-api/.build-source.sha256"
if PATH="$work/bin:$PATH" SYNC_TEST_JAVA_FAIL=true bash "$source/ig-api/_genonce.sh"; then
  echo 'Failed Publisher must fail the build' >&2; exit 1
fi
test ! -f "$source/ig-api/.build-source.sha256"
mv "$source/ig-api/input-cache/publisher.jar" "$source/publisher.jar"
PATH="$work/bin:$PATH" bash "$source/ig-api/_genonce.sh"
test -s "$source/ig-api/.build-source.sha256"
mv "$source/publisher.jar" "$work/publisher-home/publisher.jar"
PATH="$work/bin:$PATH" FHIR_PUBLISHER_HOME="$work/publisher-home" bash "$source/ig-api/_genonce.sh"
test -s "$source/ig-api/.build-source.sha256"
expect_failure 'Publisher NOT FOUND' env PATH="$work/bin:$PATH" FHIR_PUBLISHER_HOME="$work/missing-publisher" bash "$source/ig-api/_genonce.sh"
test ! -f "$source/ig-api/.build-source.sha256"

refresh
run_sync
child="$source/subigs/imaging-api"
test "$(git -C "$child" branch --show-current)" = api-spin-off
grep -q 'Keep destination README' "$child/README.md"
cmp "$child/LICENSE" "$root/ig-api/LICENSE"
test ! -e "$child/output"
test ! -e "$child/ig-src"
test ! -e "$child/.build-source.sha256"
test -f "$child/ig-template/package/package.json"
first="$(git -C "$child" rev-parse HEAD)"
run_sync
test "$(git -C "$child" rev-parse HEAD)" = "$first"

# Missing later-target evidence must not create or push earlier children.
expect_failure 'Missing build evidence' bash "$source/_commitToMainRepos.sh"
test ! -e "$source/subigs/imaging-r4"
for version in r4 r5; do
  mkdir -p "$source/igs/imaging-$version/output"
  printf 'source\n' > "$source/ig-src/source.txt"
done
for version in r4 r5; do
  printf '{}\n' > "$source/igs/imaging-$version/output/qa.json"
  printf 'package\n' > "$source/igs/imaging-$version/output/package.tgz"
  mkdir -p "$source/igs/imaging-$version/input"
  printf 'report\n' > "$source/igs/imaging-$version/input/report.txt"
done
bash "$source/_commitToMainRepos.sh"
for version in r4 r5; do
  test -f "$source/subigs/imaging-$version/input/report.txt"
  test ! -e "$source/subigs/imaging-$version/output"
done
printf 'obsolete\n' > "$source/igs/imaging-r4/input/remove.txt"
bash "$source/_commitToMainRepos.sh"
rm "$source/igs/imaging-r4/input/remove.txt"
bash "$source/_commitToMainRepos.sh"
test ! -e "$source/subigs/imaging-r4/input/remove.txt"

printf 'changed\n' > "$source/ig-api/input/sync-test.txt"
expect_failure 'API sources changed' run_sync
refresh
run_sync --no-push
test "$(git --git-dir="$work/imaging-api.git" rev-parse api-spin-off)" = "$first"
run_sync
test "$(git --git-dir="$work/imaging-api.git" rev-parse api-spin-off)" = "$(git -C "$child" rev-parse HEAD)"
rm "$source/ig-api/input/sync-test.txt"
expect_failure 'API sources changed' run_sync
refresh
run_sync
test ! -e "$child/input/sync-test.txt"

printf 'dirty\n' > "$child/input/local.txt"
expect_failure 'Dirty child checkout' run_sync
rm "$child/input/local.txt"
git -C "$child" config remote.origin.pushurl 'git@github.com:someone/unexpected.git'
expect_failure 'Unexpected origin' run_sync
git -C "$child" config --unset remote.origin.pushurl
mv "$source/ig-api/.build-source.sha256" "$work/fingerprint"
expect_failure 'Missing API source fingerprint' run_sync
mv "$work/fingerprint" "$source/ig-api/.build-source.sha256"
mv "$source/ig-api/output/package.tgz" "$work/package.tgz"
expect_failure 'Missing build evidence' run_sync
mv "$work/package.tgz" "$source/ig-api/output/package.tgz"

# Failed push leaves a local commit; an unchanged rerun must deliver it.
printf '#!/bin/sh\nexit 1\n' > "$work/imaging-api.git/hooks/pre-receive"
chmod +x "$work/imaging-api.git/hooks/pre-receive"
printf 'retry\n' > "$source/ig-api/input/sync-test.txt"
refresh
expect_failure 'Sync failed' run_sync
rm "$work/imaging-api.git/hooks/pre-receive"
run_sync
test "$(git --git-dir="$work/imaging-api.git" rev-parse api-spin-off)" = "$(git -C "$child" rev-parse HEAD)"

# A worktree has a .git file rather than directory.
git -C "$child" switch master
git -C "$child" worktree add "$work/api-worktree" api-spin-off
mv "$child" "$work/main-checkout"
git -C "$work/main-checkout" worktree repair "$work/api-worktree"
mv "$work/api-worktree" "$child"
git -C "$work/main-checkout" worktree repair "$child"
run_sync
test -f "$child/.git"

# Divergence and fetch failure must abort before applying source edits.
git -C "$work/seed-api" fetch origin
git -C "$work/seed-api" switch -c api-spin-off origin/api-spin-off
printf 'remote\n' > "$work/seed-api/remote.txt"
git -C "$work/seed-api" add remote.txt
git -C "$work/seed-api" commit -m 'Remote update'
git -C "$work/seed-api" push origin api-spin-off
run_sync
test -f "$child/remote.txt"
printf 'second remote\n' >> "$work/seed-api/remote.txt"
git -C "$work/seed-api" commit -am 'Another remote update'
git -C "$work/seed-api" push origin api-spin-off
printf 'local\n' > "$child/local.txt"
git -C "$child" add local.txt
git -C "$child" commit -m 'Local divergence'
expect_failure 'Diverged branch' run_sync
mv "$work/imaging-api.git" "$work/unavailable-api.git"
expect_failure 'does not appear to be a git repository' run_sync
mv "$work/unavailable-api.git" "$work/imaging-api.git"

echo "PASS: clone/new and existing branch, no-op, edits/deletions, exclusions,"
echo "README/LICENSE, source freshness, dirty/wrong targets, no-push/retry,"
echo "worktree checkout, divergence, fetch/push failures and paths with spaces."
echo "PASS: all three targets, fast-forward, managed deletion and all-target preflight."
echo "Artifacts retained for inspection at $work"

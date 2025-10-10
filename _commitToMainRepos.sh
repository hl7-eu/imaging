#!/bin/bash

# Check if we're inside a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "Not inside a git repository."
  exit 1
fi

# Get and print the current branch name
current_branch=$(git rev-parse --abbrev-ref HEAD)
echo "Current branch: $current_branch"

src_dir="igs/"
subrepo_dir="subigs/"

versions=("r4" "r5" )

if [ ! -d "${src_dir}" ]; then
  mkdir -p "${src_dir}"
  echo "Created directory ${src_dir}aa."
fi

for version in "${versions[@]}"; do

  if [ ! -d "${src_dir}${version}" ]; then
    mkdir -p "${src_dir}${version}"
    echo "Created directory ${src_dir}${version}."
  fi

  echo Ensure $subrepo_dir$version is a git repo and on the same branch
  if [ -d "$subrepo_dir$version/.git" ]; then
    pushd "$subrepo_dir$version" > /dev/null

    if git show-ref --verify --quiet "refs/heads/$current_branch"; then
      git checkout "$current_branch"
      git pull origin "$current_branch" || true
    else
      git checkout -b "$current_branch"
    fi

    popd > /dev/null
  else
    echo "Directory $subrepo_dir$version is not a git repository."
    # git clone https://github.com/hl7-eu/imaging-r4 "$subrepo_dir$version"
    git clone git@github.com:hl7-eu/imaging-$version.git "$subrepo_dir$version"
  fi

  # Copy contents from igs/r4 to the current directory
  if [ -d "$src_dir/$version" ]; then
    cp -r "$src_dir/$version"/. $subrepo_dir$version
    echo "Copied contents from $src_dir/$version to $subrepo_dir$version."
  else
    echo "Source directory $src_dir/$version does not exist."
    exit 1
  fi

  # Get the current commit hash of the main repo
  main_repo_commit=$(git rev-parse HEAD)
  echo "Current commit hash of main repo: $main_repo_commit"

  # Commit content
  pushd "$subrepo_dir$version" > /dev/null
  git add .
  if git diff --cached --quiet; then
    echo "No changes to commit in $subrepo_dir$version."
  else
    git commit -m "Sync from https://github.com/hl7-eu/imaging for commit  $main_repo_commit"
    git push origin "$current_branch"
    echo "Committed and pushed changes in $subrepo_dir$version."
  fi
  popd > /dev/null
done

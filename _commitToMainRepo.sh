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

for version in "${versions[@]}"; do

  # Ensure subigs/r4 is a git repo and on the same branch
  if [ -d "$subrepo_dir/$version/.git" ]; then
    pushd "$subrepo_dir/$version" > /dev/null

    if git show-ref --verify --quiet "refs/heads/$current_branch"; then
      git checkout "$current_branch"
      git pull origin "$current_branch" || true
    else
      git checkout -b "$current_branch"
    fi

    popd > /dev/null
  else
    echo "Directory $subrepo_dir/$version is not a git repository."
    exit 1
  fi

  # Copy contents from igs/r4 to the current directory

  if [ -d "$src_dir/$version" ]; then
    cp -a "$src_dir/$version"/. .
    echo "Copied contents from $src_dir/$version to current directory."
  else
    echo "Source directory $src_dir/$version does not exist."
    exit 1
  fi

done
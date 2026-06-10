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
source_dir="ig-src"

versions=("r4" "r5" )

# Validate that imaging-r4 and imaging-r5 were built after latest ig-src change.
if [ ! -d "$source_dir" ]; then
  echo "Source directory $source_dir does not exist."
  exit 1
fi

latest_source_file=$(find "$source_dir" -type f -print0 | xargs -0 ls -1t 2>/dev/null | head -n 1)
if [ -z "$latest_source_file" ]; then
  echo "No files found under $source_dir. Cannot validate build freshness."
  exit 1
fi
latest_source_ts=$(stat -c %Y "$latest_source_file")
echo "Latest source file: $latest_source_file"

for version in "${versions[@]}"; do
  full_src_dir=${src_dir}imaging-${version}
  output_dir=${full_src_dir}/output

  if [ ! -d "$output_dir" ]; then
    echo "Build output directory missing: $output_dir"
    echo "Please build imaging-${version} first."
    exit 1
  fi

  output_file_count=$(find "$output_dir" -type f | wc -l)
  if [ "$output_file_count" -eq 0 ]; then
    echo "Build output directory is empty: $output_dir"
    echo "Please build imaging-${version} first."
    exit 1
  fi

  latest_build_file=$(find "$full_src_dir" -type f -print0 | xargs -0 ls -1t 2>/dev/null | head -n 1)
  if [ -z "$latest_build_file" ]; then
    echo "No files found under $full_src_dir. Cannot validate build freshness."
    exit 1
  fi
  latest_build_ts=$(stat -c %Y "$latest_build_file")

  if [ "$latest_build_ts" -lt "$latest_source_ts" ]; then
    echo "imaging-${version} appears outdated."
    echo "Latest build file:  $latest_build_file"
    echo "Latest source file: $latest_source_file"
    echo "Please rebuild imaging-${version} after latest ig-src changes."
    exit 1
  fi

  echo "Build freshness check passed for imaging-${version}."
done

if [ ! -d "${src_dir}" ]; then
  mkdir -p "${src_dir}"
  echo "Created directory ${src_dir}aa."
fi

for version in "${versions[@]}"; do

  full_src_dir=${src_dir}imaging-${version}
  full_tgt_dir=${subrepo_dir}imaging-${version}

  if [ ! -d "$full_src_dir" ]; then
    mkdir -p "$full_src_dir"
    echo "Created directory $full_src_dir."
  fi

  echo Ensure $full_tgt_dir is a git repo and on the same branch
  if [ -d "$full_tgt_dir/.git" ]; then
    pushd "$full_tgt_dir" > /dev/null

    if git show-ref --verify --quiet "refs/heads/$current_branch"; then
      git checkout "$current_branch"
      git pull origin "$current_branch" || true
    else
      git checkout -b "$current_branch"
    fi

    popd > /dev/null
  else
    echo "Directory $full_tgt_dir is not a git repository."
    # git clone https://github.com/hl7-eu/imaging-r4 "$subrepo_dir$version"
    git clone git@github.com:hl7-eu/imaging-$version.git "$full_tgt_dir"
  fi

  # Copy contents from igs/r4 to the current directory
  if [ -d "$full_src_dir" ]; then
    rm -Rf $full_tgt_dir/ig-template
    rm -Rf $full_tgt_dir/input
    cp -r "$full_src_dir"/. $full_tgt_dir
    echo "Copied contents from $full_src_dir to $full_tgt_dir."
  else
    echo "Source directory $full_src_dir does not exist."
    exit 1
  fi

  # Get the current commit hash of the main repo
  main_repo_commit=$(git rev-parse HEAD)
  echo "Current commit hash of main repo: $main_repo_commit"

  main_repo_url=$(git config --get remote.origin.url)
  echo "Main repo URL: $main_repo_url"

  # Commit content
  pushd "$full_tgt_dir" > /dev/null
  git add .
  if git diff --cached --quiet; then
    echo "No changes to commit in $full_tgt_dir."
  else
    last_commit_message=$(git log -1 --pretty=%B)

    git commit -m "$last_commit_message" -m "Sync from https://github.com/hl7-eu/imaging for commit $main_repo_commit from $main_repo_url."
    git push origin "$current_branch"
    echo "Committed and pushed changes in $full_tgt_dir."
  fi
  popd > /dev/null
done

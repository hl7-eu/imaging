#!/bin/bash

# Optional CLI usage:
#   ./_preprocessMultiVersion.sh                 -> build 4.0.1, 5.0.0 and 6.0.0-ballot3
#   ./_preprocessMultiVersion.sh 4.0.1           -> build only 4.0.1
#   ./_preprocessMultiVersion.sh 5.0.0           -> build only 5.0.0
#   ./_preprocessMultiVersion.sh 6.0.0-ballot3   -> build only 6.0.0-ballot3
if [ "$#" -eq 0 ]; then
    versions=("4.0.1" "5.0.0" "6.0.0-ballot3")
elif [ "$#" -eq 1 ]; then
    versions=("$1")
else
    echo "Usage: $0 [4.0.1|5.0.0|6.0.0-ballot3]"
    exit 1
fi

ig_base="imaging"

# Warm the liquidjs package into the npx cache once, serially, before the
# parallel processing loop below. On a cold cache (e.g. CI), multiple concurrent
# `npx --yes liquidjs` calls race to install the package and some fail silently,
# producing empty output and thus an invalid (empty) sushi-config.yaml.
echo "Ensuring liquidjs is available (warming npx cache)"
npx --yes liquidjs --help >/dev/null 2>&1 || true

for version in "${versions[@]}"; do
    if [ "$version" = "4.0.1" ]; then
        context_version="R4"
        build_dir="igs/${ig_base}-r4"
    elif [ "$version" = "5.0.0" ]; then
        context_version="R5"
        build_dir="igs/${ig_base}-r5"
    elif [ "$version" = "6.0.0-ballot3" ]; then
        context_version="R6"
        build_dir="igs/${ig_base}-r6"
    fi

    # In CI, generated directories might not be tracked in git checkout.
    mkdir -p "$build_dir"

    echo remove all files from $build_dir
    # rm -Rf $build_dir/*
    echo Setting read-only permissions on $build_dir
    chmod -R a+w "$build_dir"
    find "$build_dir" -maxdepth 1 -type f -exec rm -f {} +
    rm -Rf "$build_dir/input"
    rm -Rf "$build_dir/output"
    rm -Rf "$build_dir/ig-template"
    
    echo copy all files to  $build_dir
    find ig-src/ -maxdepth 1 -type f -exec cp {} "$build_dir" \;
    cp -R ig-src/input "$build_dir"
    cp -R ig-src/ig-template "$build_dir"

    echo "Ensuring liquidjs is available (warming npx cache)..."
    if ! npx --yes liquidjs --help >/dev/null 2>&1; then
        echo "ERROR: unable to install/run liquidjs via npx" >&2
        exit 1
    fi

    # Process all liquid files
    echo Processing liquid files
    pids=()
    while IFS= read -r -d '' file; do
        if [ -f "$file" ]; then
            (
                file_path=${file}
                clean_file_path=${file_path/\.liquid\./\.}
                echo "- $file_path --> $clean_file_path"

                # Process liquid template and inline version tags
                if ! content=$(npx --yes liquidjs -t @"$file" --context @"context-${context_version}.json"); then
                    echo "ERROR: liquidjs failed processing $file_path" >&2
                    exit 1
                fi
                printf '%s\n' "$content" > "$clean_file_path"
                rm -f "$file"
            ) &
            pids+=("$!")
        fi
    done < <(find "$build_dir" -type f -name "*.liquid.*" -print0)

    fail=0
    for pid in "${pids[@]}"; do
        wait "$pid" || fail=1
    done
    if [ "$fail" -ne 0 ]; then
        echo "ERROR: one or more liquid files failed to process for $build_dir" >&2
        exit 1
    fi

    # # make readonly
    # echo Setting read-only permissions on $build_dir
    # chmod -R a-w $build_dir
done

#!/bin/bash

versions=("4.0.1" "5.0.0" )

for version in "${versions[@]}"; do
    if [ "$version" = "4.0.1" ]; then
        context_version="R4"
        build_dir="igs/r4"
    elif [ "$version" = "5.0.0" ]; then
        context_version="R5"
        build_dir="igs/r5"
    elif [ "$version" = "base" ]; then
        context_version="base"
        build_dir="igs/base"
    fi

    echo remove all files from $build_dir
    rm -Rf $build_dir 
    
    echo copy all files to  $build_dir
    cp -R ig-src $build_dir 
    
    # Process all liquid files
    echo Processing liquid files
    find $build_dir -type f -name "*.liquid.*" | while read file; do
        if [ -f "$file" ]; then
            file_path=${file}
            clean_file_path=${file_path/\.liquid\./\.}
            echo "- $file_path --> $clean_file_path"

            # Process liquid template and inline version tags
            content=$(npx --yes liquidjs -t @"$file" --context @"context-${context_version}.json")
            echo "$content" > "$clean_file_path"
            rm -f $file
        fi
    done
done

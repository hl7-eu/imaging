#!/bin/bash

versions=("4.0.1" "5.0.0" )

for version in "${versions[@]}"; do
    if [ "$version" = "4.0.1" ]; then
        context_version="R4"
        build_dir="igs/imaging-r4"
    elif [ "$version" = "5.0.0" ]; then
        context_version="R5"
        build_dir="igs/imaging-r5"
    fi

    echo remove all files from $build_dir
    # rm -Rf $build_dir/*
    find $build_dir -maxdepth 1 -type f -exec rm -f {} +
    rm -Rf $build_dir/input
    rm -Rf $build_dir/ig-template
    
    echo copy all files to  $build_dir
    find ig-src/ -maxdepth 1 -type f -exec cp {} $build_dir \;
    cp -R ig-src/input $build_dir 
    cp -R ig-src/ig-template $build_dir 
    
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

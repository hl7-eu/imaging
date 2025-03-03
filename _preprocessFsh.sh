#!/bin/bash

version=$1

if [ "$version" != "4.0.1" ] && [ "$version" != "5.0.0" ]; then
    echo "Please specify version as R4 or R5"
    exit 1
fi

# Map version numbers to R4/R5 for context files and directory names
if [ "$version" = "4.0.1" ]; then
    context_version="R4"
    build_dir="R4-build"
elif [ "$version" = "5.0.0" ]; then
    context_version="R5"
    build_dir="R5-build"
fi

# Check if version-specific directory exists
if [ ! -d "$build_dir/input/fsh" ]; then
    echo "Error: Directory $build_dir/input/fsh does not exist"
    exit 1
fi

# Process sushi-config
echo "Processing sushi-config.yaml.liquid..."
# Create temporary config in base directory
npx --yes liquidjs -t @"IG-base/sushi-config.yaml.liquid" --context @"context-${context_version}.json" > "sushi-config.yaml"
# Copy to build directory
cp sushi-config.yaml "$build_dir/sushi-config.yaml"
# Remove from base directory
rm sushi-config.yaml

# Process all liquid FSH files
find IG-base/input/fsh -type f -name "*.liquid.fsh" | while read file; do
    if [ -f "$file" ]; then
        relative_path=${file#IG-base/input/fsh/}
        dir_path=$(dirname "$relative_path")
        base_name=$(basename "$file")
        
        echo "Debug: Processing file $file"
        
        # Create directory structure if it doesn't exist
        mkdir -p "$build_dir/input/fsh/$dir_path"
        echo "Debug: Created directory: $build_dir/input/fsh/$dir_path"
        
        output_file="$build_dir/input/fsh/$dir_path/${base_name%.liquid.fsh}.fsh"
        echo "Debug: Will write to: $output_file"
        
        echo "Processing $base_name for $version..."
        
        # Process liquid template and inline version tags
        content=$(npx --yes liquidjs -t @"$file" --context @"context-${context_version}.json")
        echo "$content" > "$output_file"
        
        # Check if file was created
        if [ -f "$output_file" ]; then
            echo "Debug: Successfully created $output_file"
            ls -l "$output_file"
        else
            echo "Debug: Failed to create $output_file"
        fi
    fi
done

# Remove empty files (where no version matched)
find "$build_dir/input/fsh" -type f -name "*.fsh" -size 0 -delete

echo "FSH files processed and moved to $build_dir/input/fsh/"
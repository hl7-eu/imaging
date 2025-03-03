#!/bin/bash
version=$1

if [ "$version" = "R4" ]; then
    version="4.0.1"
elif [ "$version" = "R5" ]; then
    version="5.0.0"
elif [ "$version" != "4.0.1" ] && [ "$version" != "5.0.0" ]; then
    echo "Please specify version as 4 or 5 (or 4.0.1 or 5.0.0)"
    exit 1
fi

# Determine build directory
build_dir="${version}-build"
if [ "$version" = "5.0.0" ]; then
    build_dir="R5-build"
else
    build_dir="R4-build"
fi

# Clean up previous build
echo "Cleaning up previous build in $build_dir..."
rm -rf "$build_dir/input/fsh"/*
rm -rf "$build_dir/fsh-generated"/*
rm -rf "$build_dir/output"/*
mkdir -p "$build_dir/input/fsh"

echo "Copying common files to $build_dir..."

# Create input-cache directory if it doesn't exist
mkdir -p "$build_dir/input-cache"

# Copy publisher.jar and other input-cache files from IG-base/input-cache
if [ -d "IG-base/input-cache" ]; then
    cp IG-base/input-cache/* "$build_dir/input-cache/" 2>/dev/null || :
fi

#copy files at root IG-base
echo "Copying top-level files from IG-base to $build_dir/..."
mkdir -p "$build_dir"

find IG-base -maxdepth 1 -type f | while read file; do
    cp "$file" "$build_dir/"
done
# copy ig-template directory
echo "Copying ig-template directory to $build_dir/..."
mkdir -p "$build_dir/ig-template"
cp -r IG-base/ig-template "$build_dir/"


# Copy all non-liquid files from IG-base directory
echo "Copying non-liquid files from IG-base directory..."
cd IG-base

find input -type f ! -name "*.liquid.*" | while read file; do
    relative_path=${file#input/}  # Strip only the first "input/" prefix
    mkdir -p "../$build_dir/input/$(dirname "$relative_path")"
    cp "$file" "../$build_dir/input/$relative_path"
done

cd ..

# Process FSH files AFTER cleanup and copying
echo "Processing FSH files..."
./_preprocessFsh.sh "$version"

echo "Changing to $build_dir directory..."
cd "$build_dir"

# Run SUSHI
echo "Running SUSHI..."
sushi .

# Run the IG Publisher
echo "Running IG Publisher..."
publisher_jar=publisher.jar
input_cache_path=./input-cache/

if ! test -d "$input_cache_path"; then
    mkdir ./input-cache
fi

publisher=$input_cache_path$publisher_jar
if test -f "$publisher"; then
    java -jar $publisher -ig . $txoption
else
    echo "IG Publisher NOT FOUND in input-cache folder. Please run _updatePublisher.sh first."
    exit 1
fi

# Return to original directory
cd ..
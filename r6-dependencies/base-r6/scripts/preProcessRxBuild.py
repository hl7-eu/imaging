"""
Script to process files in a directory, filter content based on a specified flag, and copy transformed files 
to a target directory while preserving the directory structure.

Usage:
    python script.py <flag>

    <flag> - The flag to identify the sections to retain in the format [<flag>-init] and [<flag>-end].

Example:
    python script.py r4

    This will process all files in the root directory and its subdirectories, retaining only lines 
    inside [r4-init] ... [r4-end] sections and lines outside any flagged sections.

Configuration:
    The script reads `root_directory` and `target_directory` from a `config.json` file in the script's directory.
"""

import os
import sys
import re
import json
import shutil

def load_config():
    """Load configuration from a JSON file in the script's directory."""
    script_dir = os.path.dirname(os.path.abspath(__file__))  # Get the script's directory
    config_file = os.path.join(script_dir, "config.json")  # Path to config.json
    if not os.path.exists(config_file):
        print(f"Configuration file not found: {config_file}")
        sys.exit(1)
    with open(config_file, "r") as file:
        return json.load(file)

def is_image_or_script_file(filename):
    allowed_extensions = ['.png', '.jpg', '.jpeg', '.gif', '.bmp', '.py']
    return os.path.splitext(filename)[1].lower() in allowed_extensions

def transform_file(source_file, target_file, flag):
    # Define the separators
    start_sep = f"[{flag}-init]"
    end_sep = f"[{flag}-end]"

    # Ensure the target directory exists
    os.makedirs(os.path.dirname(target_file), exist_ok=True)

    is_md_file = source_file.endswith('.md')

    with open(source_file, 'r', encoding='utf-8', errors='replace') as infile, \
         open(target_file, 'w', encoding='utf-8') as outfile:
        in_section = False  # Track if we are inside the desired section
        ignore_section = False  # Track if we are inside an unrelated section

        for line in infile:
            stripped_line = line.strip()

            if start_sep in stripped_line:
                in_section = True
                ignore_section = False
                continue

            if end_sep in stripped_line:
                in_section = False
                continue

            if re.search(r"\[.*-init\]", stripped_line) and start_sep not in stripped_line:
                ignore_section = True
                continue
            if re.search(r"\[.*-end\]", stripped_line) and end_sep not in stripped_line:
                ignore_section = False
                continue

            if in_section or (not ignore_section and (stripped_line or is_md_file)):
                outfile.write(line)

    print(f"Transformed: {source_file} -> {target_file}")

def process_directory(root_dir, target_dir, flag):
    # Walk through all files and directories in root_dir
    for dirpath, dirnames, filenames in os.walk(root_dir):
        # Modify dirnames in-place to skip directories starting with '.'
        dirnames[:] = [d for d in dirnames if not d.startswith('.')]
        for file in filenames:
            if file.startswith('.'):
                continue  # Skip hidden files
            source_file = os.path.join(dirpath, file)
            # Construct the corresponding target file path
            relative_path = os.path.relpath(source_file, root_dir)
            target_file = os.path.join(target_dir, relative_path)

            # Copy image or script files directly
            if is_image_or_script_file(file):
                os.makedirs(os.path.dirname(target_file), exist_ok=True)
                shutil.copy2(source_file, target_file)
                print(f"Copied: {source_file} -> {target_file}")
            else:
                # Transform the file
                transform_file(source_file, target_file, flag)

if __name__ == "__main__":
    # Check for required flag parameter
    if len(sys.argv) < 2:
        print("Usage: python script.py <flag>")
        print("Example: python script.py r4")
        sys.exit(1)

    flag_to_use = sys.argv[1]  # Get the flag from command-line arguments

    # Load directories from config file
    config = load_config()
    root_directory = config.get("root_directory")
    target_directory = config.get("target_directory")

    if not root_directory or not target_directory:
        print("Error: `root_directory` or `target_directory` is missing in the configuration file.")
        sys.exit(1)

    # Process files
    process_directory(root_directory, target_directory, flag_to_use)

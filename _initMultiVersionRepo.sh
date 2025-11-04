#!/bin/bash

# ==============================================================================
# Multi-Version FHIR IG Repository Initialization Script
# ==============================================================================
# This script initializes a repository structure for managing multiple FHIR
# versions (R4 and R5) from a single source using Liquid templates.
#
# Usage: ./_initMultiVersionRepo.sh [base-dir] [ig-name] [canonical-url]
# ==============================================================================

set -e  # Exit on error

# Configuration
BASE_DIR="${1:-.}"
IG_NAME="${2:-my-imaging-ig}"
CANONICAL="${3:-http://example.org/fhir/ig}"

echo "==========================================================================="
echo "Multi-Version FHIR IG Repository Initialization"
echo "==========================================================================="
echo "Base directory: $BASE_DIR"
echo "IG Name: $IG_NAME"
echo "Canonical URL: $CANONICAL"
echo ""

# Check prerequisites
echo "Checking prerequisites..."
command -v npm >/dev/null 2>&1 || { echo "Error: npm is required but not installed."; exit 1; }
command -v sushi >/dev/null 2>&1 || { echo "Error: SUSHI is required but not installed. Run: npm install -g fsh-sushi"; exit 1; }
command -v git >/dev/null 2>&1 || { echo "Error: git is required but not installed."; exit 1; }
echo "✓ All prerequisites met"
echo ""

# Change to base directory
cd "$BASE_DIR"

# ==============================================================================
# Step 1: Create root IG structure (main working directory)
# ==============================================================================
echo "Step 1: Creating root IG structure..."

# Create root level directories
mkdir -p input/fsh
mkdir -p input/pagecontent
mkdir -p input/images
mkdir -p input/includes
mkdir -p input/resources
mkdir -p input-cache

echo "✓ Root IG structure created"

# ==============================================================================
# Step 1b: Create ig-src structure (source for multi-version builds)
# ==============================================================================
echo "Step 1b: Creating ig-src structure..."
mkdir -p ig-src/input/fsh
mkdir -p ig-src/input/pagecontent
mkdir -p ig-src/input/images
mkdir -p ig-src/input/includes
mkdir -p ig-src/input/resources
mkdir -p ig-src/ig-template/content
mkdir -p ig-src/ig-template/includes
mkdir -p ig-src/ig-template/package
mkdir -p ig-src/ig-template/liquid

echo "✓ ig-src structure created"

# ==============================================================================
# Step 2: Create version-specific build directories
# ==============================================================================
echo ""
echo "Step 2: Creating version-specific build directories..."
mkdir -p igs/imaging-r4
mkdir -p igs/imaging-r5
echo "✓ Created igs/imaging-r4 and igs/imaging-r5"

# ==============================================================================
# Step 3: Create Liquid context files
# ==============================================================================
echo ""
echo "Step 3: Creating Liquid context files..."

cat > context-base.json << 'EOF'
{ 
    "isR4": false,
    "isR5": false,
    "isBase": true,
    "fhirVersion": "4.0.1",
    "r-code": "r4",
    "R4": "",
    "R5": "//R5",
    "R5-yaml": "# R5"
}
EOF

cat > context-R4.json << 'EOF'
{ 
    "isR4": true,
    "isR5": false,
    "fhirVersion": "4.0.1",
    "r-code": "r4",
    "R-code": "R4",
    "eu-core-r-code": "",
    "R4": "",
    "R5": "//R5",
    "R5-yaml": "# R5"
}
EOF

cat > context-R5.json << 'EOF'
{ 
    "isR4": false,
    "isR5": true,
    "fhirVersion": "5.0.0",
    "r-code": "r5",
    "R-code": "R5",
    "eu-core-r-code": "-r5",
    "R4": "//R4",
    "R5": "",
    "R4-yaml": "# R4"
}
EOF

echo "✓ Created context-base.json, context-R4.json, context-R5.json"

# ==============================================================================
# Step 4: Create preprocessing script
# ==============================================================================
echo ""
echo "Step 4: Creating preprocessing script..."

cat > _preprocessMultiVersion.sh << 'EOFSCRIPT'
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
EOFSCRIPT

chmod +x _preprocessMultiVersion.sh
echo "✓ Created _preprocessMultiVersion.sh"

# ==============================================================================
# Step 5: Create preprocess and check script
# ==============================================================================
echo ""
echo "Step 5: Creating preprocess and check script..."

cat > _preProcessAndCheckAll.sh << 'EOFSCRIPT'
#!/bin/bash

echo ==================================================================================
echo Preprocessing - generate FHIR version specific IGs
./_preprocessMultiVersion.sh

echo ==================================================================================
echo checking repos - SUSHI R4
sushi igs/imaging-r4

echo ==================================================================================
echo checking repos - SUSHI R5
sushi igs/imaging-r5

echo ==================================================================================
echo check build R4
cd igs/imaging-r4
./_genonce.sh

echo ==================================================================================
echo check build R5
cd ../imaging-r5
./_genonce.sh

echo ==================================================================================
EOFSCRIPT

chmod +x _preProcessAndCheckAll.sh
echo "✓ Created _preProcessAndCheckAll.sh"

# ==============================================================================
# Step 6: Create template sushi-config and other IG files
# ==============================================================================
echo ""
echo "Step 6: Creating template configuration files..."

# Root level configuration (for direct building)
cat > sushi-config.yaml << EOFCONFIG
# ╭──────────────────────────────────────ImplementationGuide───────────────────────────────────────╮
# │  The properties below are used to create the ImplementationGuide resource. For a list of       │
# │  supported properties, see: https://fshschool.org/sushi/configuration/                         │
# ╰────────────────────────────────────────────────────────────────────────────────────────────────╯
id: ${IG_NAME}
canonical: ${CANONICAL}
name: MultiVersionIG
title: Multi-Version FHIR IG
description: Multi-Version Implementation Guide - Root build
status: draft
version: 0.1.0
fhirVersion: 4.0.1
copyrightYear: 2025+
releaseLabel: ci-build

publisher:
  name: Your Organization
  url: http://example.org

dependencies:
  hl7.fhir.uv.extensions: current

parameters:
  show-inherited-invariants: false
  
pages:
  index.md:
    title: Home
  downloads.md:
    title: Downloads

menu:
  Home: index.html
  Artifacts: artifacts.html
  Downloads: downloads.html
EOFCONFIG

cat > ig.ini << EOFCONFIG
[IG]
ig = fsh-generated/resources/ImplementationGuide-${IG_NAME}.json
template = #hl7.fhir.template#current
EOFCONFIG

# ig-src level configuration (with Liquid templates)
cat > ig-src/sushi-config.liquid.yaml << EOFCONFIG
# ╭──────────────────────────────────────ImplementationGuide───────────────────────────────────────╮
# │  The properties below are used to create the ImplementationGuide resource. For a list of       │
# │  supported properties, see: https://fshschool.org/sushi/configuration/                         │
# ╰────────────────────────────────────────────────────────────────────────────────────────────────╯
id: {{ r-code }}.${IG_NAME}
canonical: ${CANONICAL}
name: MultiVersionIG
title: Multi-Version FHIR IG ({{ R-code }})
description: Example Multi-Version Implementation Guide - {{ R-code }}
status: draft
version: 0.1.0
fhirVersion: {{ fhirVersion }}
copyrightYear: 2025+
releaseLabel: ci-build

publisher:
  name: Your Organization
  url: http://example.org

dependencies:
  hl7.fhir.uv.extensions{{ eu-core-r-code }}: current

parameters:
  show-inherited-invariants: false
  
pages:
  index.md:
    title: Home
  downloads.md:
    title: Downloads

menu:
  Home: index.html
  Artifacts: artifacts.html
  Downloads: downloads.html
EOFCONFIG

cat > ig-src/ig.liquid.ini << EOFCONFIG
[IG]
ig = fsh-generated/resources/ImplementationGuide-{{ r-code }}.${IG_NAME}.json
template = #hl7.fhir.template#current
EOFCONFIG

# Root level pages
cat > input/pagecontent/index.md << 'EOFMD'
# Multi-Version FHIR Implementation Guide

This is a multi-version FHIR Implementation Guide that supports both R4 and R5.

## Structure

This repository maintains multiple versions:
- **Root**: Direct build for development/testing
- **R4**: Generated from ig-src in `igs/imaging-r4/`
- **R5**: Generated from ig-src in `igs/imaging-r5/`

For more information, see the [README](../README.md).
EOFMD

cat > input/pagecontent/downloads.md << 'EOFMD'
# Downloads

Download the full IG package:

- [Full IG Package](full-ig.zip)
EOFMD

# ig-src level pages (with liquid templates)
cat > ig-src/input/pagecontent/index.md << 'EOFMD'
# Multi-Version FHIR Implementation Guide

This is a template for a multi-version FHIR Implementation Guide that supports both R4 and R5.

## How It Works

This IG uses Liquid templates to maintain a single source that generates version-specific content:

- **Source files**: Located in `ig-src/` with `.liquid.*` extensions
- **R4 build**: Generated in `igs/imaging-r4/`
- **R5 build**: Generated in `igs/imaging-r5/`

## Development Workflow

1. Edit source files in `ig-src/`
2. Run `./_preprocessMultiVersion.sh` to generate version-specific files
3. Build and validate with `./_preProcessAndCheckAll.sh`

## Liquid Template Variables

In your `.liquid.*` files, you can use:

- `{% raw %}{% if isR4 %}...{% endif %}{% endraw %}` - R4-specific content
- `{% raw %}{% if isR5 %}...{% endif %}{% endraw %}` - R5-specific content
- `{% raw %}{{ fhirVersion }}{% endraw %}` - The FHIR version (4.0.1 or 5.0.0)
- `{% raw %}{{ r-code }}{% endraw %}` - Version code (r4 or r5)
EOFMD

cat > ig-src/input/pagecontent/downloads.md << 'EOFMD'
# Downloads

Download the full IG package:

- [Full IG Package](full-ig.zip)
EOFMD

echo "✓ Created template configuration files"

# ==============================================================================
# Step 7: Setup IG Publisher scripts
# ==============================================================================
echo ""
echo "Step 7: Setting up IG Publisher scripts..."

# Download to root directory
if [ ! -f "_updatePublisher.sh" ]; then
    echo "Downloading IG Publisher update script to root..."
    curl -L https://raw.githubusercontent.com/HL7/ig-publisher-scripts/main/_updatePublisher.sh -o _updatePublisher.sh
    chmod +x _updatePublisher.sh
fi

if [ ! -f "_genonce.sh" ]; then
    echo "Downloading IG Publisher genonce script to root..."
    curl -L https://raw.githubusercontent.com/HL7/ig-publisher-scripts/main/_genonce.sh -o _genonce.sh
    chmod +x _genonce.sh
fi

# Download to ig-src directory
if [ ! -f "ig-src/_updatePublisher.sh" ]; then
    echo "Downloading IG Publisher update script to ig-src..."
    curl -L https://raw.githubusercontent.com/HL7/ig-publisher-scripts/main/_updatePublisher.sh -o ig-src/_updatePublisher.sh
    chmod +x ig-src/_updatePublisher.sh
fi

if [ ! -f "ig-src/_genonce.sh" ]; then
    echo "Downloading IG Publisher genonce script to ig-src..."
    curl -L https://raw.githubusercontent.com/HL7/ig-publisher-scripts/main/_genonce.sh -o ig-src/_genonce.sh
    chmod +x ig-src/_genonce.sh
fi

echo "✓ IG Publisher scripts ready"

# ==============================================================================
# Step 8: Create .gitignore
# ==============================================================================
echo ""
echo "Step 8: Creating .gitignore..."

cat > .gitignore << 'EOFIGNORE'
# IG Publisher (root level)
input-cache/
output/
temp/
template/
fsh-generated/
*.zip
package-list.json

# IG Publisher (ig-src level)
ig-src/input-cache/
ig-src/output/
ig-src/temp/
ig-src/template/
ig-src/fsh-generated/

# Build artifacts
igs/imaging-r4/input/
igs/imaging-r4/ig-template/
igs/imaging-r4/fsh-generated/
igs/imaging-r4/output/
igs/imaging-r4/temp/
igs/imaging-r4/template/
igs/imaging-r4/*.ini
igs/imaging-r4/*.yaml
igs/imaging-r4/*.md
igs/imaging-r4/*.json
igs/imaging-r4/*.xml

igs/imaging-r5/input/
igs/imaging-r5/ig-template/
igs/imaging-r5/fsh-generated/
igs/imaging-r5/output/
igs/imaging-r5/temp/
igs/imaging-r5/template/
igs/imaging-r5/*.ini
igs/imaging-r5/*.yaml
igs/imaging-r5/*.md
igs/imaging-r5/*.json
igs/imaging-r5/*.xml

# Keep certain files
!igs/imaging-r4/.gitignore
!igs/imaging-r5/.gitignore
!igs/imaging-r4/FHIR-*.xml
!igs/imaging-r5/FHIR-*.xml

# IDE
.vscode/
.idea/

# OS
.DS_Store
Thumbs.db
EOFIGNORE

# Create .gitignore for version directories
echo "# Placeholder to keep directory in git" > igs/imaging-r4/.gitignore
echo "# Placeholder to keep directory in git" > igs/imaging-r5/.gitignore

echo "✓ Created .gitignore files"

# ==============================================================================
# Step 9: Create README
# ==============================================================================
echo ""
echo "Step 9: Creating README..."

cat > README.md << 'EOFREADME'
# Multi-Version FHIR Implementation Guide

This repository implements a multi-version FHIR IG that supports both R4 and R5 from a single source.

## Structure

```
.
├── ig-src/                      # Source files (with .liquid.* templates)
│   ├── input/
│   │   ├── fsh/                # FSH source files
│   │   ├── pagecontent/        # Markdown pages
│   │   └── ...
│   ├── ig-template/            # Template customizations
│   ├── sushi-config.liquid.yaml
│   └── ig.liquid.ini
├── igs/
│   ├── imaging-r4/             # Generated R4 build (not committed)
│   └── imaging-r5/             # Generated R5 build (not committed)
├── context-R4.json             # R4 Liquid variables
├── context-R5.json             # R5 Liquid variables
├── _preprocessMultiVersion.sh  # Generate version-specific files
└── _preProcessAndCheckAll.sh   # Build and validate all versions
```

## Prerequisites

- Node.js and npm
- SUSHI: `npm install -g fsh-sushi`
- Java (for IG Publisher)

## Quick Start

1. **Initialize** (if starting fresh):
   ```bash
   ./_initMultiVersionRepo.sh
   ```

2. **Edit source files** in `ig-src/` (use `.liquid.*` extensions for templated files)

3. **Preprocess and build**:
   ```bash
   ./_preProcessAndCheckAll.sh
   ```

## Liquid Template Syntax

Use Liquid template syntax in your `.liquid.*` files:

### Conditional Content
```liquid
{% if isR4 %}
This content only appears in R4
{% endif %}

{% if isR5 %}
This content only appears in R5
{% endif %}
```

### Variables
```liquid
FHIR Version: {{ fhirVersion }}
Version Code: {{ r-code }}
```

### Available Variables

| Variable | R4 Value | R5 Value | Description |
|----------|----------|----------|-------------|
| `isR4` | `true` | `false` | Boolean for R4 |
| `isR5` | `false` | `true` | Boolean for R5 |
| `fhirVersion` | `4.0.1` | `5.0.0` | FHIR version |
| `r-code` | `r4` | `r5` | Lowercase code |
| `R-code` | `R4` | `R5` | Uppercase code |

## Development Workflow

1. Edit files in `ig-src/`
2. Run `_preprocessMultiVersion.sh` to generate version-specific content
3. Run `_preProcessAndCheckAll.sh` to validate both versions
4. Commit changes to `ig-src/` only (generated files are ignored)

## CI/CD

See `.github/workflows/` for automated validation and deployment workflows.

EOFREADME

echo "✓ Created README.md"

# ==============================================================================
# Step 10: Initialize git repository
# ==============================================================================
echo ""
echo "Step 10: Initializing git repository..."

if [ ! -d ".git" ]; then
    git init
    echo "✓ Git repository initialized"
else
    echo "✓ Git repository already exists"
fi

# ==============================================================================
# Step 11: Create example Liquid template file
# ==============================================================================
echo ""
echo "Step 11: Creating example Liquid template files..."

mkdir -p ig-src/input/fsh
cat > ig-src/input/fsh/example-profile.liquid.fsh << 'EOFFSH'
Profile: ExamplePatient{{ R-code }}
Parent: Patient
Id: example-patient-{{ r-code }}
Title: "Example Patient Profile ({{ R-code }})"
Description: "Example patient profile for FHIR {{ fhirVersion }}"

{% if isR4 %}
// R4-specific constraints
* identifier 1..* MS
{% endif %}

{% if isR5 %}
// R5-specific constraints
* identifier 1..* MS
* deceased[x] MS
{% endif %}

* name 1..* MS
* gender 1..1 MS
EOFFSH

echo "✓ Created example Liquid template files"

# ==============================================================================
# Completion
# ==============================================================================
echo ""
echo "==========================================================================="
echo "✓ Multi-Version FHIR IG Repository Initialization Complete!"
echo "==========================================================================="
echo ""
echo "Next steps:"
echo "1. Review and customize ig-src/sushi-config.liquid.yaml"
echo "2. Add your FSH definitions to ig-src/input/fsh/"
echo "3. Add your pages to ig-src/input/pagecontent/"
echo "4. Run: ./_preprocessMultiVersion.sh"
echo "5. Run: ./_preProcessAndCheckAll.sh"
echo ""
echo "For version-specific content, use .liquid.* file extensions and"
echo "Liquid template syntax ({% if isR4 %}, {% if isR5 %}, etc.)"
echo ""
echo "Happy authoring!"
echo "==========================================================================="

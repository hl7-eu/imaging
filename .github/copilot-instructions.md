# GitHub Copilot Instructions for EHDS Imaging

## Project Context
This is a multi-version FHIR Implementation Guide (IG) for the European Health Data Space (EHDS) Imaging that supports both FHIR R4 and R5 from a single source. The project uses:
- **FHIR Shorthand (FSH)** for defining profiles, extensions, and resources
- **SUSHI** for compiling FSH to FHIR JSON
- **HL7 IG Publisher** for generating the implementation guide
- **Liquid templating** for multi-version content generation
- **Single-source approach** with version-specific builds

## Documentation References
For comprehensive documentation of FHIR resources, profiles, and implementation details:
- **R5 Documentation**: https://build.fhir.org/ig/oijauregui/ehdsimaging-r5/en/llms.txt
- **R4 Documentation**: https://build.fhir.org/ig/oijauregui/ehdsimaging-r4/en/llms.txt

These llms.txt files contain indexed artifacts, pages, and resources for each FHIR version.

## Repository Structure
- `ig-src/` - **Source files with Liquid templates** (this is where you edit)
  - `input/fsh/` - FSH source files for profiles, models, and examples
  - `input/pagecontent/` - Markdown pages with Liquid syntax
  - `sushi-config.liquid.yaml` - Templated SUSHI configuration
  - `ig.liquid.ini` - Templated IG Publisher configuration
- `igs/imaging-r4/` - Generated R4 build (auto-generated, not committed)
  - `output/llms.txt` - Index of all R4 IG artifacts, pages, and resources
- `igs/imaging-r5/` - Generated R5 build (auto-generated, not committed)
  - `output/llms.txt` - Index of all R5 IG artifacts, pages, and resources
- `context-R4.json` - R4 Liquid template variables
- `context-R5.json` - R5 Liquid template variables
- `_preprocessMultiVersion.sh` - Script to generate version-specific files
- `_preProcessAndCheckAll.sh` - Build and validate all versions

## Multi-Version Development Guidelines

### File Editing Rules
1. **ONLY edit files in `ig-src/`** - Never edit generated files in `igs/imaging-r4/` or `igs/imaging-r5/`
2. **Use `.liquid.*` extensions** for files that need version-specific content
3. **Commit only source files** - Generated builds are automatically ignored by git

### Liquid Template Syntax
Use Liquid template syntax for version-specific content:

```liquid
{% if isR4 %}
// R4-specific content
{% endif %}

{% if isR5 %}  
// R5-specific content
{% endif %}

// Variables: {{ fhirVersion }}, {{ r-code }}, {{ R-code }}
```

### Available Template Variables
- `isR4` / `isR5` - Boolean flags for version detection
- `fhirVersion` - "4.0.1" (R4) or "5.0.0" (R5)
- `r-code` - "r4" or "r5" (lowercase)
- `R-code` - "R4" or "R5" (uppercase)

### FSH Coding Guidelines
1. **FSH Files**: Follow FHIR Shorthand syntax and conventions
2. **Profile Names**: Use consistent naming with EHDS Imaging conventions
3. **Extensions**: Place custom extensions in appropriate subdirectories
4. **Examples**: Ensure all examples validate against their profiles
5. **Version-Specific Logic**: Use Liquid conditionals for R4/R5 differences

## Development Workflow

### Making Changes
1. **Edit source files** in `ig-src/` directory only
2. **Use Liquid syntax** for version-specific differences
3. **Run preprocessing**: `./_preprocessMultiVersion.sh`
4. **Build and validate**: `./_preProcessAndCheckAll.sh`
5. **Commit changes** to `ig-src/` files only

### Common Tasks
- **New profiles**: Create in `ig-src/input/fsh/` with version conditionals
- **Documentation**: Edit `.md` files in `ig-src/input/pagecontent/`
- **Configuration**: Modify `sushi-config.liquid.yaml` and `ig.liquid.ini`
- **Testing**: Always validate both R4 and R5 builds before committing

### Build Scripts
- `./_preprocessMultiVersion.sh` - Generate version-specific files from templates
- `./_preProcessAndCheckAll.sh` - Full build and validation of both versions
- Individual version builds available in respective `igs/` subdirectories
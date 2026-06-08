---
name: ig-liquid-alias-coverage-check
description: 'Verify that all ig-src .liquid.* files are processed into igs/imaging-r4 and igs/imaging-r5, that rendered outputs match source templates, and that Jekyll/Liquid placeholders like {{alias}} are populated (not skipped). Use when validating preprocess quality, alias rendering, or build parity against ig-src.'
argument-hint: '[4.0.1|5.0.0] optional version filter'
---

# IG Liquid Alias Coverage Check

Validate that Liquid preprocessing does not skip placeholders and that generated IG files are in sync with `ig-src` templates.

## When To Use
- Confirm that all `*.liquid.*` files under `ig-src` are rendered.
- Verify that rendered files in `igs/imaging-r4` and `igs/imaging-r5` are consistent with source templates.
- Detect unresolved placeholders such as `{{R4}}`, `{{R5}}`, `{{eu-core-r-code}}`, or any `{{...}}` token remaining after preprocessing.

## Procedure
1. Run the checker from repository root.

```bash
bash ./.github/skills/ig-liquid-alias-coverage-check/scripts/check-liquid-aliases.sh
```

2. Optional: run for a single FHIR version.

```bash
bash ./.github/skills/ig-liquid-alias-coverage-check/scripts/check-liquid-aliases.sh 4.0.1
bash ./.github/skills/ig-liquid-alias-coverage-check/scripts/check-liquid-aliases.sh 5.0.0
```

## What The Script Checks
1. Runs `./_preprocessMultiVersion.sh` for the selected version(s).
2. Enumerates all source files matching `ig-src/**/*.liquid.*`.
3. For each source template, computes expected generated path by replacing `.liquid.` with `.` in the build output tree.
4. Re-renders source template using `liquidjs` and the correct `context-R4.json` or `context-R5.json`.
5. Compares rendered output against generated file and reports diffs for mismatches.
6. Flags unresolved `{{...}}` placeholders in generated files.
7. Flags any leftover `.liquid.*` files in build directories, which indicates skipped preprocessing.

## Exit Behavior
- Exits `0` when all checks pass.
- Exits non-zero if any file is missing, mismatched, unresolved, or skipped.

## Notes
- This skill validates preprocess integrity; it does not run the full publisher build.
- Use alongside the existing preprocess build skill when you need full pipeline health checks.

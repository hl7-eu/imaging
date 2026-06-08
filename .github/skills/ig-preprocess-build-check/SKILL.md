---
name: ig-preprocess-build-check
description: 'Check whether the imaging IG build works by running _preprocessMultiVersion.sh, publisher checks, and _genonce.sh for R4/R5. Use when asked to validate build health, troubleshoot build failures, or propose fixes for errors from _preProcessAndCheckAll.sh.'
argument-hint: '[4.0.1|5.0.0] optional version filter'
---

# IG Preprocess Build Check

Run the same build phases as _preProcessAndCheckAll.sh, but with per-step logging and actionable fix proposals.

## When To Use
- Validate whether the project builds correctly.
- Troubleshoot failures in preprocessing, publisher setup, or IG generation.
- Produce a structured failure report with one proposed fix per error.

## Procedure
1. Run the checker script from repository root.

```bash
bash ./.github/skills/ig-preprocess-build-check/scripts/check-preprocess-build.sh
```

2. Optional: run only one FHIR version.

```bash
bash ./.github/skills/ig-preprocess-build-check/scripts/check-preprocess-build.sh 4.0.1
bash ./.github/skills/ig-preprocess-build-check/scripts/check-preprocess-build.sh 5.0.0
```

3. Read the generated summary path printed at the end. The summary includes:
- Step result table.
- Error lines detected per failed step.
- Proposed fix for each error line.

## Notes
- The script executes these phases in order:
  1. _preprocessMultiVersion.sh
  2. ensure publisher for igs/imaging-r4
  3. ensure publisher for igs/imaging-r5
  4. igs/imaging-r4/_genonce.sh (when applicable)
  5. igs/imaging-r5/_genonce.sh (when applicable)
- It continues through all phases to produce a complete report, even if earlier phases fail.
- It exits non-zero if at least one phase fails.

## Error-Fix Playbook
For common errors and rationale, see [references/error-fix-playbook.md](./references/error-fix-playbook.md).

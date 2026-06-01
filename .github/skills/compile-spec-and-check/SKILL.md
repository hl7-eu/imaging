---
name: compile-spec-and-check
description: 'Run IG compile/check workflows and troubleshoot failures. Use for _preProcessAndCheckAll.sh build checks, SUSHI/publisher error triage, and actionable fix suggestions for failed HL7 EU imaging spec builds.'
argument-hint: '[optional focus: r4|r5|all|quick]'
---

# Compile Spec And Check

Run the repository compile/check flow, inspect output, and provide concrete suggestions when errors occur.

## When To Use
- User asks to compile/check the IG specification.
- User asks to run `/_preProcessAndCheckAll.sh` and explain failures.
- Build output shows SUSHI or publisher errors and needs next-step fixes.
- User wants a concise triage summary with likely root causes and commands to try.

## Inputs
- Optional focus argument: `r4`, `r5`, `all`, or `quick`.
- Repository root path.

## Procedure
1. Confirm you are in repository root.
2. Choose command:
   - Default: `bash ./_preProcessAndCheckAll.sh`
   - Quick triage: `bash ./_preprocessMultiVersion.sh`
3. Run command and capture full output.
4. Extract failures from output:
   - First fatal error.
   - Last 100-200 lines.
   - Any `Errors`, `Warnings`, `FAIL`, `Exception`, `ERR_` lines.
5. Classify failures and propose fixes using the matrix below.
6. Report results in this order:
   - Build verdict (pass/fail).
   - Primary blockers (highest impact first).
   - Suggested fixes with exact files/commands.
   - What to re-run next to validate.

## Error Classification And Fix Suggestions

### Dependency or runtime setup
- Pattern: `ERR_MODULE_NOT_FOUND` (for example `xlsx`) when running repository scripts.
- Suggestion:
  - Install missing package in the relevant folder (example: `cd jira && npm install`).
  - Re-run the same command.

- Pattern: `command not found`, Java missing, publisher launch failure.
- Suggestion:
  - Verify required tools (`node`, `java`, `npm`, `bash`).
  - Use repository helper scripts for publisher updates if needed.

### SUSHI authoring errors
- Pattern: SUSHI summary shows non-zero `Errors`.
- Suggestion:
  - Start with the first error listed; it is usually the highest-signal root cause.
  - Check referenced FSH file and line.
  - Validate cardinality, slice names, alias usage, and `InstanceOf` profile conformance.
  - If examples were added under `ig-src`, ensure generated `igs/imaging-r4` and `igs/imaging-r5` remain aligned after preprocess.

### Preprocess / Liquid transformation issues
- Pattern: placeholders not resolved, content divergence between `ig-src` and `igs/imaging-*`.
- Suggestion:
  - Run preprocess again and compare rendered outputs.
  - Verify liquid variables and aliases are valid.
  - Use the `ig-liquid-alias-coverage-check` skill for systematic verification.

### IG Publisher validation errors
- Pattern: QA or publisher constraint failures in generated output (igs/imaging-r4/output/qa.txt, igs/imaging-r5/output/qa.txt).
- Suggestion:
  - Group by resource/profile and fix one resource class at a time.
  - Confirm canonical/profile URLs and bindings match project aliases.
  - Re-run targeted generation after each fix to avoid error cascades.

## Decision Rules
- If setup/runtime fails, fix environment first before inspecting FSH semantics.
- If SUSHI has errors, do not trust downstream publisher errors until SUSHI is clean.
- If many errors exist, fix the first deterministic schema/profile violation and re-run.
- If changes were made in generated folders only, mirror source-of-truth updates under `ig-src`.

## Completion Criteria
- Command exits successfully.
- SUSHI reports zero errors.
- No blocking publisher/QA failures in the final run.
- Output includes a short verification summary and next steps (if any).

## Output Format
- Verdict: `PASS` or `FAIL`.
- Evidence: command run + key error snippets.
- Suggested fixes: numbered, actionable, minimal.
- Recheck plan: exact rerun command.

## Related Skills
- `ig-preprocess-build-check` for full build-health validation.
- `ig-liquid-alias-coverage-check` for liquid/template rendering parity checks.

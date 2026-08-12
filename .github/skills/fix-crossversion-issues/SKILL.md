---
name: fix-crossversion-issues
description: 'Diagnose and fix FHIR cross-version (R4/R5/R6) errors in a version-specific IG. Use when a SUSHI/IG Publisher build fails because FSH written for one FHIR version references elements, types, or paths that changed in another version (e.g. "No element found at path X", "element or path does not exist", "Value does not match element type", "InstanceOf ... not found"). Verifies each delta against the core StructureDefinitions, proposes a fix, applies it, re-runs SUSHI, and records every successful fix in this skill''s memory files so future runs recognize the same delta instantly.'
argument-hint: '[path to version-specific IG folder, e.g. igs/imaging-r6 or r6-dependencies/base-r6]'
---

# Fix FHIR Cross-Version Issues

## When to Use
- A version-specific IG (R4, R5, or R6) fails SUSHI/IG Publisher with errors that stem from FHIR
  version differences, not authoring mistakes. Typical signatures:
  - `No element found at path <p> for ... in <Profile>` (element renamed/removed across versions)
  - `The element or path you referenced does not exist: <p>`
  - `Cannot assign <x> value: ... Value does not match element type: <T>` (type changed across versions)
  - `InstanceOf <url> not found` / `No definition for the type <url>` (dependency package missing for that version)
- Porting an IG or a dependency (e.g. copying `base-r5` → `base-r6`) to a new FHIR version.

## Golden Rules
1. **Verify every delta against the core StructureDefinition** before changing FSH. Do not guess.
   Core packages live at `~/.fhir/packages/hl7.fhir.r4.core#*/package`,
   `hl7.fhir.r5.core#*/package`, `hl7.fhir.r6.core#*/package`.
2. **Edit the source of truth.** If the IG is generated from liquid templates (an `ig-src/` with
   `*.liquid.*` files and `//R4` / `//R5` style conditionals), edit `ig-src` and re-run
   `_preprocessMultiVersion.sh <fhirVersion>`. If it is a standalone repo, edit its FSH directly.
3. **Prefer version-guarded edits** in templated IGs (mirror the existing `//R4`/`//R5` comment-guard
   pattern) so other versions keep building.
4. **Re-run SUSHI after each change** and confirm the error count drops.
5. **Record every successful fix** in the memory files (see below) — this is mandatory.

## Procedure
1. **Determine the target version.** Read `<ig>/sushi-config.yaml` `fhirVersion` (or the repo's
   `context-R*.json`). Note whether the IG is templated (`ig-src/`) or standalone.
2. **Build and collect errors.**
   ```bash
   cd <ig> && sushi . 2>&1 | grep -E "^error" | sed -E 's/[0-9]+//g' | sort | uniq -c | sort -rn
   ```
3. **Consult memory first.** Read [memory/fhir-version-deltas.md](./memory/fhir-version-deltas.md).
   If the error matches a known delta, apply the recorded fix pattern directly.
4. **For unknown errors, verify the delta** against the core StructureDefinitions of BOTH the source
   and target versions. Example (compare an element across versions):
   ```bash
   for v in r4 r5 r6; do P=$(ls -d ~/.fhir/packages/hl7.fhir.$v.core#*/package 2>/dev/null | head -1); \
     [ -n "$P" ] && python3 -c "import json,sys; d=json.load(open('$P/StructureDefinition-Condition.json')); \
     print('$v', [ (e['path'],[t['code'] for t in e.get('type',[])]) for e in d['snapshot']['element'] if e['path'] in ('Condition.recorder','Condition.asserter') ])"; done
   ```
5. **Propose the fix** with the exact FSH change and any semantic caveat (e.g. reference targets that
   the new version's core does not allow). Apply it (source-of-truth per Golden Rule 2).
6. **Re-run SUSHI**; confirm the specific error is gone and the total dropped.
7. **Update memory** for every error that is now resolved (see protocol below).
8. Repeat until only non-cross-version errors remain (report those separately).

## Missing-Dependency Errors
`InstanceOf/No definition for the type http://.../base-<rX>/...` usually means the version-specific
EU/base package is not published/installed. Confirm with `ls ~/.fhir/packages | grep <pkg>`. If it is
genuinely absent, that is **not** a cross-version FSH fix — report it as a blocked dependency and stop
(do not fabricate the package). Record it in memory as a known blocker.

## Memory (self-updating knowledge base)
The skill maintains its accumulated knowledge here:
- [memory/fhir-version-deltas.md](./memory/fhir-version-deltas.md) — resource/element deltas and fix patterns.
- [memory/README.md](./memory/README.md) — index + the exact update protocol and entry template.

**After every successful fix**, append or update an entry in `memory/fhir-version-deltas.md` following
the template in `memory/README.md`. If an existing entry was wrong, correct it. Keep entries short,
factual, and grounded in the core StructureDefinition you verified.

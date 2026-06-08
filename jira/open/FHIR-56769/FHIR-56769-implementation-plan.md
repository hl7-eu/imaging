# Implementation Plan for FHIR-56769

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56769 |
| Issue Type | Technical Correction |
| Status | Submitted |
| Resolution Source | Proposed Resolution File |
| Resolution/Disposition | Recommendation A — Accept As Requested |
| Summary | Editorial: small typo in Section 10.2 ("as" should be "and") |

## Resolution Interpretation

Primary source: `jira/open/FHIR-56769/FHIR-56769-resolution.md`.

The recommended disposition is to apply an editorial correction in Section 10.2 so the sentence reads:

`Note that no display related obligations are used and the variety of {{ConsumerActor}}s makes it very difficult if not impossible to determine a generic rule for this.`

This is implementation-required because the proposed resolution explicitly recommends a concrete text change and current artifacts show a typo/regression (`The the variety`).

## Scope and Impact

### Affected Artifacts
- Obligations narrative text in Section 10.2 — requires editorial correction in authoring source.
- Preprocessed versioned inputs (R4/R5) — must reflect source correction after preprocessing.
- Rendered use-cases pages (R4/R5 markdown + HTML) — must reflect corrected sentence after generation.

### Candidate Files
- `ig-src/input/pagecontent/obligations.md` — apply the authoritative editorial sentence correction.
- `igs/imaging-r4/input/pagecontent/obligations.md` — verify preprocessed R4 input picks up corrected text.
- `igs/imaging-r5/input/pagecontent/obligations.md` — verify preprocessed R5 input picks up corrected text.
- `igs/imaging-r4/output/en/use-cases.md` — verify rendered R4 markdown contains corrected sentence.
- `igs/imaging-r5/output/en/use-cases.md` — verify rendered R5 markdown contains corrected sentence.
- `igs/imaging-r4/output/en/use-cases.html` — verify rendered R4 HTML contains corrected sentence.
- `igs/imaging-r5/output/en/use-cases.html` — verify rendered R5 HTML contains corrected sentence.

### Impact Notes
- R4 impact: Editorial-only wording change in rendered use-cases content.
- R5 impact: Editorial-only wording change in rendered use-cases content.
- Breaking change risk: Low — no profile, cardinality, terminology, or behavior change; narrative correction only.

## Implementation Tasks

1. **Apply authoritative source text correction**
   - File: `ig-src/input/pagecontent/obligations.md`
   - Action: Replace the current typo/drift wording in Section 10.2 with the recommended sentence using `... used and the variety ...`.
   - Acceptance: Source file contains exactly one corrected sentence with no duplicated article (`The the`) and no remaining `... used as the variety ...` form.

2. **Regenerate versioned authoring artifacts**
   - File: `igs/imaging-r4/input/pagecontent/obligations.md`
   - Action: Run preprocessing and confirm R4 input copy reflects the corrected source sentence.
   - Acceptance: R4 preprocessed input contains corrected wording and no typo regression.

3. **Regenerate versioned authoring artifacts**
   - File: `igs/imaging-r5/input/pagecontent/obligations.md`
   - Action: Run preprocessing and confirm R5 input copy reflects the corrected source sentence.
   - Acceptance: R5 preprocessed input contains corrected wording and no typo regression.

4. **Validate rendered outputs for R4**
   - File: `igs/imaging-r4/output/en/use-cases.md`
   - Action: Run generation/build and verify rendered markdown content reflects corrected sentence.
   - Acceptance: R4 output markdown shows corrected sentence and no `The the variety` text.

5. **Validate rendered outputs for R5**
   - File: `igs/imaging-r5/output/en/use-cases.md`
   - Action: Run generation/build and verify rendered markdown content reflects corrected sentence.
   - Acceptance: R5 output markdown shows corrected sentence and no `The the variety` text.

6. **Validate rendered HTML for both versions**
   - File: `igs/imaging-r4/output/en/use-cases.html`
   - Action: Verify final HTML includes corrected sentence after build.
   - Acceptance: R4 HTML contains corrected wording only.

7. **Validate rendered HTML for both versions**
   - File: `igs/imaging-r5/output/en/use-cases.html`
   - Action: Verify final HTML includes corrected sentence after build.
   - Acceptance: R5 HTML contains corrected wording only.

## Validation Plan

- [ ] Source files updated in the correct authoring location
- [ ] Preprocess/build completed for both versions
- [ ] Rendered outputs reflect the intended change
- [ ] No unresolved placeholders or broken links introduced
- [ ] Ticket intent is fully covered by implemented edits

### Repository-Specific Execution Checks

1. Preprocess and regenerate multi-version inputs:
   - `./_preprocessMultiVersion.sh`
2. Run quick generation for editorial verification:
   - `./_genonce.sh`
3. If broader verification is needed in this branch/session:
   - `./_preProcessAndCheckAll.sh`
4. Verify text propagation in generated artifacts:
   - `igs/imaging-r4/`
   - `igs/imaging-r5/`

## Open Questions

- `jira/open/FHIR-56769/FHIR-56769.md` is not present in the workspace. Confirm whether ticket metadata/comment history should be re-synced before final closure documentation.
- Confirm whether workgroup prefers exact Recommendation A wording (`... used and the variety ...`) or the Alternative split-sentence wording before final commit.

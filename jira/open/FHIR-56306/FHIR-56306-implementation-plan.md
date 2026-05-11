# Implementation Plan for FHIR-56306

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56306 |
| Issue Type | Change Request |
| Status | Waiting for Input |
| Resolution Source | Proposed Resolution File (Resolution A requested for planning baseline) |
| Resolution/Disposition | Recommendation A - Accept As Requested |
| Summary | Relationship with IHE MADO needs to be clarified |

## Resolution Interpretation

Implementation should add explicit home-page context that explains how this IG relates to the EHDS IG ecosystem and specifically to IHE MADO / EU Imaging Manifest, including links, version context, and a brief historical rationale for keeping specifications separate.

Based on Resolution A, the new narrative must also include a practical bidirectional use-case explanation:
- Find a manifest from a report
- Find a report from a MADO manifest
- Show use of StudyInstanceUID and accession-number in that flow

## Scope and Impact

### Affected Artifacts
- Home page narrative (`index`) - primary location for new context section and relationship framing.
- Cross-specification relationship narrative (`use-case-other-specs`) - likely source for reusable wording and links.
- Shared link variables - ensure canonical links to IHE MADO and EU Imaging Manifest remain consistent in both R4 and R5 renders.
- Rendered R4/R5 narrative pages - must reflect the new section and relationship text.

### Candidate Files
- `ig-src/input/pagecontent/index.md` - add dedicated "Relationship and Scope" section on home page.
- `ig-src/input/pagecontent/use-case-other-specs.md` - align/extend relationship wording and add explicit bidirectional lookup use-case text.
- `ig-src/input/includes/variable-definitions.md` - verify/update canonical variables/URLs for MADO/manifest references used by templates.
- `ig-src/input/pagecontent/design-considerations-report-and-manifest.md` - optionally align short historical rationale wording if duplicate/conflicting rationale appears.
- `igs/imaging-r4/input/pagecontent/index.md` - verify preprocessing propagated source edits.
- `igs/imaging-r5/input/pagecontent/index.md` - verify preprocessing propagated source edits.
- `igs/imaging-r4/output/en/index.md` - verify rendered R4 home page includes new relationship section.
- `igs/imaging-r5/output/en/index.md` - verify rendered R5 home page includes new relationship section.
- `igs/imaging-r4/output/en/use-cases.md` - verify rendered R4 use-case relationship content and lookup flow text.
- `igs/imaging-r5/output/en/use-cases.md` - verify rendered R5 use-case relationship content and lookup flow text.
- `igs/imaging-r4/output/en/use-cases.html` - verify final R4 HTML mirrors markdown updates.
- `igs/imaging-r5/output/en/use-cases.html` - verify final R5 HTML mirrors markdown updates.

### Impact Notes
- R4 impact: Editorial narrative update in home/use-case pages; no profile constraints expected.
- R5 impact: Editorial narrative update in home/use-case pages; no profile constraints expected.
- Breaking change risk: Low. Changes are explanatory/documentation-focused and should not alter conformance semantics.

## Implementation Tasks

1. **Add home-page relationship section**
   - File: `ig-src/input/pagecontent/index.md`
   - Action: Add a dedicated section that explains IG family context, imaging-specific subset, relationship to IHE MADO and EU Imaging Manifest, and brief history/rationale for separation.
   - Acceptance: Home page source includes links to IHE MADO and EU Imaging Manifest plus explicit scope/boundary text.

2. **Add explicit bidirectional report-manifest lookup use case**
   - File: `ig-src/input/pagecontent/use-case-other-specs.md`
   - Action: Add/expand narrative for two-way lookup (report -> manifest and manifest -> report) and explicitly mention StudyInstanceUID and accession-number as lookup anchors.
   - Acceptance: Source use-case text contains both directions and names both identifiers.

3. **Normalize relationship links via shared variables**
   - File: `ig-src/input/includes/variable-definitions.md`
   - Action: Verify variables used for manifest/MADO/API links are current and referenced by updated narrative sections; correct URLs or labels if needed.
   - Acceptance: Updated sections use shared variables and resolve to valid links in rendered pages.

4. **Resolve rationale duplication/conflict**
   - File: `ig-src/input/pagecontent/design-considerations-report-and-manifest.md`
   - Action: Ensure historical rationale in design considerations does not conflict with newly added home-page explanation; adjust wording minimally if inconsistent.
   - Acceptance: Home page and design-considerations rationale are coherent and non-contradictory.

5. **Regenerate multi-version preprocessed inputs**
   - File: `igs/imaging-r4/input/pagecontent/index.md`
   - Action: Run preprocess to propagate source edits.
   - Acceptance: R4 and R5 preprocessed input pages reflect the new/updated sections.

6. **Validate rendered markdown outputs**
   - File: `igs/imaging-r4/output/en/index.md`
   - Action: Verify rendered R4/R5 markdown pages include new relationship section and use-case lookup text with expected links.
   - Acceptance: `index.md` and `use-cases.md` in both versions contain intended text and no unresolved placeholders.

7. **Validate rendered HTML outputs**
   - File: `igs/imaging-r4/output/en/use-cases.html`
   - Action: Verify final HTML mirrors markdown content in both versions.
   - Acceptance: R4/R5 HTML pages show updated relationship narrative and lookup flow without broken links.

## Validation Plan

- [ ] Source files updated in the correct authoring location
- [ ] Preprocess/build completed for both versions
- [ ] Rendered outputs reflect the intended change
- [ ] No unresolved placeholders or broken links introduced
- [ ] Ticket intent is fully covered by implemented edits

### Repository-Specific Execution Checks

1. Preprocess multi-version source:
   - `./_preprocessMultiVersion.sh`
2. Run full validation when preparing merge-ready changes:
   - `./_preProcessAndCheckAll.sh`
3. For faster editorial verification when full pass is unnecessary:
   - `./_genonce.sh`
4. Verify resulting content in both trees:
   - `igs/imaging-r4/`
   - `igs/imaging-r5/`

## Open Questions

- Confirm the exact list of "other EHDS IGs" and version labels to present on the home page, to avoid stale or disputed references.
- Confirm whether examples/diagrams for the report <-> manifest lookup flow should be textual only or include a new diagram asset.
- Confirm whether the preferred canonical IHE MADO link remains the current variable target or should be switched to the newer RAD.MADO URL.

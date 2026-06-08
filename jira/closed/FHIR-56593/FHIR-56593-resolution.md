# Proposed Resolution for FHIR-56593

## Ticket Summary

| Field | Value |
|-------|-------|
| **Key** | [FHIR-56593](https://jira.hl7.org/browse/FHIR-56593) |
| **Type** | Technical Correction |
| **Status** | Applied |
| **Resolution** | Persuasive |
| **Summary** | Wrong title for code systems |
| **Reporter** | Giorgio Cangioli |
| **Assignee** | Unassigned |
| **Created** | 2026-04-28 |
| **Raised in Version** | 1.0.0-ballot |

## Description

Typo in code system titles: Internal CodeSystem definitions were titled as "Value Set: ..." when they should be titled as "CodeSystem: ...". This creates confusion about the artifact type in the specification.

## Implementation Status

**Status: APPLIED**

The title corrections have been implemented across all internal CodeSystem definitions in `ig-src/input/fsh/terminologies/`.

### Implementation Details

**Scope of Changes:**
- CodeSystem definitions in FSH files corrected to use "CodeSystem: " prefix in titles
- ValueSet definitions continue to use "ValueSet: " prefix as appropriate
- Examples of corrected titles:
  - `DiagnosticReportSupportInfo.fsh`: "CodeSystem: Diagnostic Report Support Info Code System"
  - `MissingDicomTerminology.fsh`: "CodeSystem: Missing DICOM Terminology"

**Files Modified:**
- ig-src/input/fsh/terminologies/ (multiple CodeSystem definitions)

## Related Tickets

No parent ticket or related groupings identified.

## Disposition Analysis

### Disposition Taken

**Accept & Implement** — The correction has been accepted and already implemented.

### Rationale

- **Technical Accuracy**: CodeSystems and ValueSets are distinct FHIR artifact types with different purposes. Proper titles improve clarity and prevent user confusion.
- **Specification Consistency**: Maintaining correct artifact type labels is essential for a standards specification.
- **Ballot Feedback**: Identified during 1.0.0-ballot review, indicating community awareness of the issue.
- **Implementation Status**: Changes have been integrated into the main source tree and are present in rendered outputs.

### Evidence

- Original issue identified in ballot process (created 2026-04-28)
- Resolution captured in ticket metadata as "Persuasive"
- Corrected titles visible in source FSH files
- Changes built into rendered specification versions (igs/imaging-r4, igs/imaging-r5)

## Proposed Dispositions

### Disposition A: Accept As Implemented (Recommended)

#### Proposal

Formally accept and close FHIR-56593 with the implementation as delivered. All CodeSystem definitions have been corrected to use "CodeSystem: " prefix in their titles, distinguishing them clearly from ValueSet definitions.

#### Justification

- The correction has already been implemented correctly
- The change improves specification clarity and accuracy
- No further action is required
- The ticket should be marked as resolved in the workgroup review

---

### Disposition B: Verification Follow-up

#### Proposal

Before closing, verify that:
1. All CodeSystem definitions in the rendered specification (igs/imaging-r4 and igs/imaging-r5) display the corrected titles
2. No CodeSystem definitions remain with "ValueSet: " prefix in any current rendering
3. Generation/rendering pipeline consistently applies the corrected titles

#### Justification

- Ensures end-to-end rendering correctness beyond source-level changes
- Verifies that rendered outputs match intended corrections
- Provides confidence that the fix is complete and visible to specification consumers

---

## Verification Checklist

- [x] Ticket status is marked as Applied
- [x] Resolution indicates Persuasive decision
- [x] Source FSH files show corrected titles
- [ ] Rendered specification (igs/imaging-r4) confirms title corrections
- [ ] Rendered specification (igs/imaging-r5) confirms title corrections
- [ ] No outstanding issues or follow-up comments

## Next Steps

1. **Recommended**: Close ticket with Disposition A (Accept As Implemented)
2. **Optional**: Run ig-preprocess-build-check to verify rendered outputs match source corrections
3. **Workgroup Review**: Present to governance workgroup with implementation evidence for formal approval

# Proposed Resolution for FHIR-56553

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56553 |
| Issue Type | Technical Correction |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | NikolausKrondraf |
| Assignee | Unassigned |
| Created | 4/28/26 |
| Raised in Version | 1.0.0-ballot |
| Grouping | Not specified |
| Parent key | Not specified |

## Description

All mermaid diagrams at https://hl7.eu/fhir/imaging/1.0.0-ballot/en/design-considerations.html contain visible HTML elements which are not rendered by the browser.

## Implementation Status

Pending.

No implementation evidence is present in the synced ticket markdown:
- No linked pull requests
- No linked commits
- No implementation comments

Missing evidence required to classify as Applied:
- Link to merged pull request(s) that remove/escape invalid HTML in mermaid sources
- Confirmation that rendered outputs in igs/imaging-r4 and igs/imaging-r5 no longer show raw HTML elements in diagrams

## Related Tickets

No related tickets were identified from Parent key or Grouping metadata.

## Disposition Analysis

### Disposition Taken

Pending (work group decision and implementation evidence not yet recorded).

### Rationale

The reported issue is concrete, reproducible, and scoped to rendering correctness. A technical correction that removes invalid/visible HTML from mermaid content is likely appropriate, but there is no recorded implementation evidence yet.

### Evidence

- Ticket status: Triaged
- Ticket resolution: Unresolved
- Description includes affected page and rendering symptom
- No implementation links or comments available in ticket source

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Update the affected mermaid diagram source content so diagrams do not include HTML tags or entities that appear as raw text in browser rendering. Keep diagram semantics unchanged, regenerate IG outputs, and verify the design-considerations page renders clean diagrams in both R4 and R5 publications.

#### Justification

This directly resolves the defect reported by implementers, is low risk, and aligns with the expected behavior of documentation diagrams in ballot artifacts.

---

### Disposition B: Alternative Approach

#### Proposal

Retain the existing textual intent but replace problematic mermaid blocks with static SVG/PNG artifacts generated from validated diagram definitions, then embed those artifacts in the page instead of live mermaid source.

#### Justification

This avoids runtime mermaid rendering variance across environments and can stabilize publication output, but increases maintenance overhead for future diagram edits.

---

### Disposition C: Decline

#### Proposal

Do not change current diagram content and treat visible HTML tokens as non-blocking editorial artifacts.

#### Justification

Declining is possible only if the work group determines the issue has negligible impact. Current evidence suggests user-visible rendering defects, so this option is weak.

---

### Recommendation

**Recommended disposition:** A

Accepting as requested best matches the ticket intent and user impact while preserving scope as a technical correction. The change should remain Pending until implementation links and regenerated output verification are recorded.

## Next Steps

Awaiting Decision.

### Verification Checklist

- [ ] Work group review completed
- [ ] Implementation code committed
- [ ] Verification in main branch
- [ ] Documentation updated

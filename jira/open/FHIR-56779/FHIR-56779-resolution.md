# Proposed Resolution for FHIR-56779

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56779 |
| Type | Change Request |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |
| Grouping | Not specified |
| Related Sections | 1 |

## Description

The Functional -> Xt-EHR Model page is linked from a menu in the guide; this is confusing as a way to orient.

Proposed resolution:

It would be valuable to describe cardinalities inline. (E.g., ImagingReport.header -> 1.., legal authentication 0.., comparison study 0..*.)

## Implementation Status

- Current status: Triaged
- Disposition state: Pending governance review
- Implementation evidence in ticket comments: none
- Linked GitHub PR/commit/issue evidence: none found in ticket markdown
- Missing evidence to move beyond pending: work group decision record, implementation PR/commit links

## Related Tickets

- Parent key: Not specified
- Grouping: Not specified
- Thematic relation: FHIR-56563 and FHIR-56564 (introduction/orientation documentation), no explicit Jira grouping field present

## Disposition Analysis

### Disposition Taken

Pending.

### Rationale

This is an editorial clarification request focused on orientation and readability. The ticket is triaged but unresolved, and no implementation evidence is captured yet.

### Evidence

- Jira metadata: Status = Triaged
- Jira metadata: Resolution = Unresolved
- Ticket text includes a concrete request for inline cardinality cues
- No GitHub implementation links are present in the ticket

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Add short inline cardinality hints where readers first encounter the Functional/Xt-EHR orientation content, while retaining links to authoritative profiles for exact constraints.

#### Justification

This directly addresses reader confusion without changing profile semantics. It improves onboarding and keeps normative details in the existing profile artifacts.

---

### Disposition B: Alternative Approach

#### Proposal

Keep the current cross-spec structure, but add an "orientation panel" in Introduction that explains how to use the Xt-EHR Model page and provides a short cardinality quick reference table.

#### Justification

This minimizes duplication and maintenance overhead while still improving navigation and comprehension.

---

### Disposition C: Decline

#### Proposal

Do not add inline cardinalities and keep the current content unchanged.

#### Justification

Declining may be defensible if the work group prefers a single canonical place for all cardinalities and considers additional summaries a source of drift.

---

### Recommendation

**Recommended disposition:** B

Disposition B best balances readability and maintainability. It resolves the orientation problem while reducing risk of duplicated constraints becoming inconsistent with profile definitions.

## Next Steps

Ready for Review

### Verification Checklist

- [ ] Work group review completed
- [ ] Disposition approved
- [ ] Implementation code committed
- [ ] Verification in main branch
- [ ] Documentation updated


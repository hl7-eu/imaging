# Proposed Resolution for FHIR-56563

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56563 |
| Type | Change Request |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | Giorgio Cangioli |
| Assignee | Unassigned |
| Created | 4/28/26 |
| Grouping | Not specified |
| Related Sections | 1 |

## Description

It would be nice to have a kind of "how to read" page describing how to read this guide.
To be put under the Introduction menu item

## Implementation Status

- Current status: Triaged
- Disposition state: Pending governance review
- Implementation evidence in ticket comments: none
- Linked GitHub PR/commit/issue evidence: none found in ticket markdown
- Missing evidence to move beyond pending: work group decision record, implementation PR/commit links

## Related Tickets

- Parent key: Not specified
- Grouping: Not specified
- Thematic relation: FHIR-56564 and FHIR-56779 (intro/orientation improvements), no explicit Jira grouping field present

## Disposition Analysis

### Disposition Taken

Pending.

### Rationale

The request asks for onboarding documentation under Introduction. This is a documentation-level change with low technical risk, but no implementation evidence is currently attached.

### Evidence

- Jira metadata: Status = Triaged
- Jira metadata: Resolution = Unresolved
- Request explicitly asks for a "how to read" page
- No GitHub implementation links are present in the ticket

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Create a dedicated "How to Read This Guide" page under Introduction that explains guide structure, normative vs informative content, profile navigation, and where to find examples and conformance details.

#### Justification

This directly addresses the ticket request and improves discoverability for first-time implementers.

---

### Disposition B: Alternative Approach

#### Proposal

Instead of a separate page, add a concise "How to read" section within the existing Introduction page, with links to deeper sections.

#### Justification

This reduces navigation depth and content maintenance while still improving orientation.

---

### Disposition C: Decline

#### Proposal

Do not add a "how to read" page or section.

#### Justification

Declining could be justified only if the work group determines the current Introduction content already provides sufficient orientation and avoiding additional guidance is preferred.

---

### Recommendation

**Recommended disposition:** A

A standalone page is clearer for newcomers and supports re-use in ballots and presentations. The maintenance cost is small compared with improved onboarding value.

## Next Steps

Ready for Review

### Verification Checklist

- [ ] Work group review completed
- [ ] Disposition approved
- [ ] Implementation code committed
- [ ] Verification in main branch
- [ ] Documentation updated

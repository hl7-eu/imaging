# Proposed Resolution for FHIR-56552

## Ticket Summary

| Field | Value |
|---|---|
| Key | FHIR-56552 |
| Type | Change Request |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | Giorgio Cangioli |
| Assignee | Unassigned |
| Created | 4/28/26 |
| Related Sections | Unknown Section |

## Description

The current text says

"Current approaches within Europe use different approaches to information exchange:

- Document based exchange, the document is represented as a FHIR Document Bundle.
- REST API based access to documents, a and for each document including instances of the referred resources
- REST API based access to resources, as the previous but the (important) resources are harmonized, meaning that all documents point to the same, and other resources."

Notes:
- Not clear the difference between Document based exchange and REST API based access to documents.
- Typo "a and for each document".
- Not clear the difference between REST API based access to documents and REST API based access to resources.

Requested change: improve the explanation and clarify which deployment models the three cases correspond to.

## Implementation Status

Current state: Pending governance disposition.

No implementation evidence was found in the ticket source markdown:
- No linked pull requests
- No linked commits
- No linked issues documenting implementation completion
- No ticket comments with implementation references

Repository outputs exist, but there is no ticket-attributable evidence that this specific narrative change has been applied.

### Implementation Details (if Applied)

No attributable implementation artifact is present. If accepted, implementation should include an updated narrative section that defines each exchange approach with explicit deployment mapping and examples, plus a traceable PR/commit link.

## Related Tickets

No parent key, grouping, or explicit related-ticket references were found in the ticket markdown.

## Disposition Analysis

### Disposition Taken

Pending

### Rationale

The ticket remains in `Triaged` status with `Unresolved` resolution, so no governance decision is recorded yet. The request is editorial and clarifying, focused on reducing ambiguity in a core explanatory paragraph about information-exchange patterns.

### Evidence

- Ticket status marker: `Triaged`
- Ticket resolution marker: `Unresolved`
- No implementation links in ticket content
- No related-ticket references in ticket content

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Revise the problematic paragraph to clearly distinguish three deployment patterns and map each one to a practical deployment model:
- Document-based exchange: full report package exchanged as a FHIR document bundle.
- REST API access to document packages: API retrieves per-document packages (document-oriented retrieval), preserving document boundaries.
- REST API access to harmonized resources: API retrieves normalized/shared resources across reports (resource-oriented retrieval), where common entities are reused.

Also fix typos and add one concise example sentence per pattern.

#### Justification

This directly addresses all reported ambiguities and the typo with minimal risk. It improves implementer comprehension without changing conformance rules or breaking existing implementations.

---

### Disposition B: Alternative Approach

#### Proposal

Keep the existing high-level paragraph brief, but add a dedicated comparison table in the same page (or a linked subsection) with columns for data granularity, retrieval style, resource reuse behavior, and typical deployment scenario.

#### Justification

A table can communicate distinctions more precisely than prose alone and scales better if additional exchange modes are documented later.

---

### Disposition C: Decline

#### Proposal

Decline the wording change and retain current text as-is.

#### Justification

Declining could be justified only if the work group considers the current wording sufficient and prefers to avoid editorial changes before ballot closure. However, this leaves known ambiguity unresolved.

---

### Recommendation

**Recommended disposition:** A

Accept As Requested is recommended because the ticket identifies concrete readability and interpretation issues in foundational explanatory text. The fix is low-cost, non-breaking, and should materially reduce confusion about deployment patterns.

## Next Steps

Ready for Review

### Verification Checklist

- [ ] Work group review completed
- [ ] Decision recorded (A/B/C)
- [ ] Clarified exchange-approach text approved
- [ ] Implementation code committed
- [ ] Verification in main branch
- [ ] Documentation updated in rendered outputs
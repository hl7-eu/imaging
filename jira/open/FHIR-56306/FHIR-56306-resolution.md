# Proposed Resolution for FHIR-56306

## Ticket Summary

| Field | Value |
|---|---|
| Key | FHIR-56306 |
| Type | Change Request |
| Status | Waiting for Input |
| Resolution | Unresolved |
| Reporter | IgnacioJauregui |
| Assignee | Bas van den Heuvel |
| Created | 4/8/26 |
| Related Sections | Unknown Section |

## Description

The specification is closely related to the IHE MADO spec, although this relationship is addressed in the Use case section, the relationship might not be obvious to the less-informed reader.

Please add a section to the IG home page that provides context on where these IGs are used and explains each one's role. This section should also have links to the IHE MADO and the EU imaging Manifest.

Also, please include a brief history of why this differentiation is needed.

Note: when filing this ticket Bas, Ignacio and Marc also discussed the possibility of merging the EU part of the MADO spec into the Imaging Report IG, and decided that maintaining them separately will make things clearer and easier to maintain.

## Implementation Status

Current state: Pending input and governance disposition.

No implementation evidence was found in the ticket source markdown:
- No linked pull requests
- No linked commits
- No linked issues documenting implementation completion

Repository structure confirms rendered outputs are present for both publication streams, but no ticket-attributable implementation artifacts are linked from this ticket:
- R4 rendered workspace exists: `igs/imaging-r4/output/`
- R5 rendered workspace exists: `igs/imaging-r5/output/`

### Implementation Details (if Applied)

No attributable PR or commit reference is present in the ticket content. If accepted, implementation should include explicit home-page narrative updates and traceable commit/PR links.

## Related Tickets

No parent key or grouping references were found in the ticket metadata.

## Disposition Analysis

### Disposition Taken

Pending Input

### Rationale

The ticket remains in `Waiting for Input` with `Unresolved` resolution, so no final governance decision is recorded. The requested change is editorial and structural (IG home page context), intended to improve reader understanding of the relationship and boundaries between this IG and IHE MADO.

### Evidence

- Ticket status marker: `Waiting for Input`
- Ticket resolution marker: `Unresolved`
- No GitHub PR/commit links found in ticket content
- No related ticket references (parent/grouping) found

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Add a dedicated section on the IG home page that:
- Explains how this IG relates to IHE MADO and to the EU Imaging Manifest.
- Clarifies intended scope boundaries and responsibilities of each artifact.
- Includes direct links to IHE MADO and the EU Imaging Manifest.
- Adds a short historical rationale for why the specifications remain separate.

#### Justification

This directly satisfies the ticket request and improves discoverability for less-informed readers. The change is low-risk, editorial, and helps prevent misinterpretation of implementation scope.

---

### Disposition B: Alternative Approach

#### Proposal

Instead of adding a new home-page section, add a compact "Relationship and Scope" subsection under the existing Use Cases chapter, then add a short home-page pointer linking to that subsection. Include external links and a one-paragraph rationale for separation.

#### Justification

This reduces home-page expansion while still making the relationship explicit. It preserves navigation cleanliness and keeps detailed context near the use-case material where readers already seek workflow boundaries.

---

### Disposition C: Decline

#### Proposal

Decline adding additional relationship text on the basis that existing use-case content already covers the relationship adequately.

#### Justification

Declining is possible if the work group determines current narrative is sufficient and prioritizes avoiding duplicated explanations. However, this leaves the explicit discoverability concern unresolved.

---

### Recommendation

**Recommended disposition:** A

Accept As Requested is recommended because the ticket identifies a concrete comprehension gap for less-informed readers, and the requested solution is a straightforward editorial enhancement with minimal maintenance cost. Explicit scope framing and cross-links on the home page will likely reduce onboarding ambiguity and downstream interpretation variance.

## Next Steps

Ready for Review

### Verification Checklist

- [ ] Work group review completed
- [ ] Decision recorded (A/B/C)
- [ ] Home-page/update text approved
- [ ] Implementation code committed
- [ ] Verification in main branch
- [ ] Documentation updated in rendered outputs

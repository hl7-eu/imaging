# Proposed Resolution for FHIR-56750

## Ticket Summary

| Field | Value |
|---|---|
| Key | FHIR-56750 |
| Type | Technical Correction |
| Status | Submitted |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |
| Related Sections | Resource Access Provider + Consumer CapabilityStatements |

## Description

Throughout both the Provider and Consumer CapabilityStatements, there is this statement: "If supported, clients SHALL support...". The ticket notes that this reads as circular and proposes rewriting each occurrence so the trigger for the SHALL is explicit, following the IPA STU1 pattern.

Reporter(s): Matt Hannan, Epic

## Implementation Status

Current state: Pending review and decision.

No implementation evidence was found in the ticket source markdown:
- No linked pull requests
- No linked commits
- No linked issues documenting implementation completion

The likely source surfaces for the wording are the capability statement intro notes in:
- [ig-src/input/intro-notes/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider-intro.md](../../../ig-src/input/intro-notes/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider-intro.md)
- [ig-src/input/intro-notes/CapabilityStatement-EeehrxfImagingReportResourceConsumer-intro.md](../../../ig-src/input/intro-notes/CapabilityStatement-EeehrxfImagingReportResourceConsumer-intro.md)
- [ig-src/input/intro-notes/CapabilityStatement-EehrxfImagingDocumentAccessProvider-intro.md](../../../ig-src/input/intro-notes/CapabilityStatement-EehrxfImagingDocumentAccessProvider-intro.md)
- [ig-src/input/intro-notes/CapabilityStatement-EehrxfImagingReportDocumentConsumer-intro.md](../../../ig-src/input/intro-notes/CapabilityStatement-EehrxfImagingReportDocumentConsumer-intro.md)

### Implementation Details (if Applied)

No implementation details are available yet.

## Related Tickets

No parent key or grouping references were found in the ticket metadata.

## Disposition Analysis

### Disposition Taken

Pending

### Rationale

The ticket is currently in `Submitted` status with `Unresolved` resolution and no recorded implementation artifacts. That means the requested editorial correction has not been approved or merged yet, and the wording change still needs work group review.

### Evidence

- Ticket status marker: `Submitted`
- Ticket resolution marker: `Unresolved`
- No GitHub PR/commit links found in the ticket content
- No related ticket references (parent/grouping) found
- Relevant source pages are the capability statement intro notes listed above

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Rewrite each occurrence of the circular phrasing so the condition that triggers the SHALL is stated explicitly. For each capability statement section, replace generic wording such as "If supported, clients SHALL support..." with a concrete trigger phrase that identifies the specific scenario, feature, or resource use case that activates the requirement. Keep the rest of the conformance requirement intact, but make the antecedent unambiguous.

#### Justification

This matches the ticket intent and aligns with common FHIR editorial practice: a conformance obligation should be tied to a clearly stated condition, not expressed as "supported" twice in the same sentence. It improves clarity for implementers without changing technical behavior.

---

### Disposition B: Alternative Approach

#### Proposal

Keep the capability statement wording largely intact, but move the trigger condition into a short introductory rule statement or note immediately before the conformance sentence. Then keep the SHALL sentence focused only on the obligation itself. This preserves the original content while separating the condition from the requirement.

#### Justification

This approach can reduce edits when multiple similar statements need harmonization and may make the pages easier to scan. The trade-off is that the reader has to connect the rule statement to the obligation sentence, so it is slightly less direct than rewriting each sentence individually.

---

### Disposition C: Decline

#### Proposal

Do not change the wording. Close the ticket as not actionable if the current phrasing is judged sufficiently clear in context or if the scope of the capability statement prose is intentionally generic.

#### Justification

Declining would only be defensible if maintainers believe the existing text is already precise enough and that revising every occurrence would add churn without improving implementer understanding. Based on the ticket description, that is a weaker position than clarifying the trigger explicitly.

### Recommendation

**Recommended disposition:** A

Accept As Requested is the strongest recommendation because the problem statement is specific, editorial, and low risk. The change improves readability and removes ambiguity without altering any resource model, profile, or transaction requirement. If maintainers want a more centralized editorial pattern, B is a viable fallback, but A is the most direct fit for the issue as written.

## Next Steps

Awaiting Decision

### Verification Checklist

- [ ] Work group review completed
- [ ] Implementation code committed
- [ ] Verification in main branch
- [ ] Documentation updated
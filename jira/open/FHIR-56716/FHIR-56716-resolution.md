# Proposed Resolution for FHIR-56716

## Ticket Summary

| Field | Value |
|---|---|
| Key | FHIR-56716 |
| Type | Question |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | HELTONHATORI |
| Assignee | Unassigned |
| Created | 4/30/26 |
| Related Sections | 1 |

## Description

We would like to request clarification on the following points regarding electrocardiogram (ECG) exams:

Are ECG exams considered to be within the scope of this guide?

If yes, what is the expected approach for modeling ECG exams using the profiles defined in the guide?

## Implementation Status

Current state: Pending governance review and disposition.

No implementation evidence was found in the ticket source markdown:
- No linked pull requests
- No linked commits
- No linked issues documenting implementation completion

Repository evidence indicates ECG-related narrative content already exists in the structured report example set (cardiology stress findings), but no explicit normative "ECG scope and modeling" guidance page/section is identified in this ticket context:
- Source template evidence: `ig-src/input/fsh/report-example-structured/composition.liquid.fsh`
- Source template evidence: `ig-src/input/fsh/report-example-structured/diagnostic-report.liquid.fsh`
- Preprocessed R4 evidence: `igs/imaging-r4/input/fsh/report-example-structured/composition.fsh`
- Preprocessed R5 evidence: `igs/imaging-r5/input/fsh/report-example-structured/diagnostic-report.fsh`

### Implementation Details (if Applied)

No attributable PR or commit reference is present in ticket content. If clarification is accepted, implementation should include explicit guidance text in the IG narrative plus at least one traceable example cross-reference.

## Related Tickets

No parent key or grouping references were found in the ticket metadata.

## Disposition Analysis

### Disposition Taken

Pending

### Rationale

The ticket is in `Triaged` status with `Unresolved` resolution, indicating work group review is still needed. The question is about scope and modeling guidance rather than a concrete defect. Existing structured example content includes cardiology findings with ECG-related text, which supports that ECG data can be represented, but this does not by itself provide explicit scope policy or modeling guidance for implementers.

### Evidence

- Ticket status marker: `Triaged`
- Ticket resolution marker: `Unresolved`
- No GitHub PR/commit links found in ticket content
- No related ticket references (parent/grouping) found
- ECG-related narrative appears in structured example source/preprocessed FSH files

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Add explicit guidance that ECG examinations are in scope where they are exchanged as imaging-associated diagnostic content in this IG context, and define the expected modeling approach:
- Clarify when to use `DiagnosticReport` as the report container.
- Clarify how ECG result details are represented using `Observation` resources referenced from the report.
- Clarify relationship boundaries with non-imaging cardiology workflows to avoid over-scoping.
- Add one short ECG-focused modeling example (or a dedicated subsection in the examples page) showing profile usage and references.

#### Justification

This directly answers both reporter questions and reduces implementer ambiguity. It improves consistency and onboarding by turning implicit example evidence into explicit normative guidance while keeping backward compatibility.

---

### Disposition B: Alternative Approach

#### Proposal

Do not add ECG-specific scope text to the IG home/scope sections. Instead:
- Keep scope language modality-agnostic.
- Add an editorial note in the examples chapter that the existing structured cardiology example demonstrates a pattern transferable to ECG reporting contexts.
- Add a cross-reference to general modeling guidance (DiagnosticReport + Observation pattern) rather than introducing new ECG-specific conformance constraints.

#### Justification

This addresses the user need with less specification churn and avoids introducing specialty-specific scope statements that could require broader governance alignment. It preserves flexibility while still improving discoverability.

---

### Disposition C: Decline

#### Proposal

Decline adding ECG-specific clarification, on the basis that current IG patterns already provide sufficient generic modeling mechanisms and the ticket does not yet establish concrete interoperability failures requiring new guidance.

#### Justification

Declining is defensible if the work group concludes that specialty-specific scope clarifications create precedent and maintenance burden without clear implementation gaps. However, this leaves the reporter's ambiguity unresolved and may lead to divergent implementations.

---

### Recommendation

**Recommended disposition:** A

Accept As Requested is recommended because the ticket asks for explicit scope/modeling clarification, and current evidence shows only implicit support via example content. A concise guidance addition plus a focused example reference has low risk, high implementer value, and closes the ambiguity with minimal impact on existing artifacts.

## Next Steps

Ready for Review

### Verification Checklist

- [ ] Work group review completed
- [ ] Clarification text approved
- [ ] Implementation code committed
- [ ] Verification in main branch
- [ ] Documentation/examples updated in rendered outputs

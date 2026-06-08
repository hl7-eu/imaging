# Proposed Resolution for FHIR-56324

## Ticket Summary

| Property | Value |
|----------|-------|
| Key | FHIR-56324 |
| Summary | References to FHIR standard resources |
| Issue Type | Question |
| Status | Waiting for Input |
| Resolution | Unresolved |
| Raised in Version | 1.0.0-ballot |
| Reporter | HELTONHATORI |
| Assignee | Bas van den Heuvel |
| Created | 4/10/26 |

## Description

The submitter questions whether elements that reference standard FHIR resources should instead reference EuCore or other specific (profiled/constrained) resources when available.

Examples cited:
- `DocumentReferenceImagingReport.author`
- `AdverseEventEuImaging.subject`

The underlying concern: Should the specification standardize on using more specific profiles (e.g., EuCore resources) rather than base FHIR resources in profile definitions?

## Implementation Status

**Status**: Pending Governance Review

**Evidence**: No implementation evidence is present. This is a strategic design question requiring work group discussion and consensus on modeling principles.

## Related Tickets

- No directly related parent ticket
- Related design principle questions: Profile scope, reference target constraints, relationship with EuCore

## Disposition Analysis

### Disposition Taken

**Pending Governance Decision**

This is a design and governance question that affects multiple profiles and the overall modeling strategy of the IG. No implementation changes have been made, as the answer requires consensus on:

1. **When to use EuCore** vs. base FHIR resources
2. **Reference target constraints** in profile definitions
3. **Backwards compatibility** with existing FHIR implementations
4. **Dependency strategy** on EuCore

### Rationale

The question raises a fundamental architectural decision that was not fully resolved during the ballot process. The work group needs to clarify:

- Whether references should be narrowed to specific profiles (tighter scope, more constraint)
- Whether EuCore references are mandatory or optional/recommended
- How this strategy aligns with other dependent profiles and implementation expectations

This decision may affect multiple profiles across the specification and should not be made unilaterally in a single ticket.

### Evidence

- Status in Jira: `Waiting for Input` (awaiting work group guidance)
- Issue Type: Question (not a bug or change request)
- No comments or follow-up discussion recorded in the ticket

---

## Proposed Dispositions

### Disposition A: Adopt EuCore References Where Available

#### Proposal

Establish a clear policy: **Profile reference targets should be narrowed to EuCore or other constraint profiles where available**, rather than base FHIR resources. Update affected profiles to:

- Change `author` in `DocumentReferenceImagingReport` from `Reference(Practitioner)` to `Reference(PractitionerEuCore | PractitionerRoleEuCore)` (or equivalent)
- Change `subject` in `AdverseEventEuImaging` from `Reference(Patient)` to `Reference(PatientEuCore)`
- Apply this pattern systematically across all profiles that reference Patient, Practitioner, Organization, etc.

#### Justification

**Strengths**:
- **Consistency**: Aligns the imaging IG with the broader EU ecosystem and EuCore modeling standards
- **Clarity**: Receivers know exactly which profile instances to expect
- **Validation**: Profiles become narrower and easier to validate

**Trade-offs**:
- **Dependency**: Creates a hard dependency on EuCore, which may limit use in non-EU contexts
- **Implementation burden**: Implementers must use EuCore resources; cannot use base FHIR
- **Backwards compatibility**: May break existing integrations that use base FHIR resources

---

### Disposition B: Keep Standard FHIR References + Add Guidance

#### Proposal

**Keep base FHIR references in profile definitions**, but add normative text clarifying the expected practice:

> "While this profile permits any Practitioner resource, implementers in the EU context are strongly recommended to use EuCore-compliant Practitioner profiles to ensure interoperability across EU health systems."

Document in a design considerations or implementation guidance section (e.g., §9 Design Considerations):
- When EuCore resources are preferred vs. optional
- How to profile references to narrower constraints locally if needed
- Examples showing both base FHIR and EuCore usage

#### Justification

**Strengths**:
- **Flexibility**: Wider applicability; works in EU and non-EU contexts
- **Compatibility**: Remains compatible with existing FHIR implementations
- **Guidance without constraint**: Recommends best practice without hard constraint
- **Profiling freedom**: Implementers can tighten constraints in their own profiles

**Trade-offs**:
- **Looser validation**: Base FHIR resources less specific; harder to validate narrowly
- **Potential inconsistency**: Different implementations may use base FHIR vs. EuCore
- **Clarity**: Less explicit about expected resource types

---

### Disposition C: Decline (No Change)

#### Proposal

**Do not adopt a systematic policy change.** Keep current profile definitions as-is. Justify by:

1. The IG is designed to be conformant with FHIR R4/R5 base specifications
2. Narrowing references to EuCore is out of scope for this ballot
3. Individual implementers can profile further if they need tighter constraints
4. No evidence of implementation problems with current approach

#### Justification

**Strengths**:
- **Scope containment**: Avoids large refactoring of multiple profiles
- **FHIR compliance**: Remains faithful to FHIR base resource design
- **Timeline**: Does not delay ballot/publication
- **Flexibility**: Allows regional/organizational variations

**Trade-offs**:
- **Missed opportunity**: Does not align imaging IG with EuCore strategy
- **Unanswered question**: Reporter's concern remains unaddressed
- **Guidance gap**: Future implementers may still be uncertain

---

## Recommendation

**Recommended disposition: B (Keep Standard FHIR References + Add Guidance)**

### Rationale

Disposition A (narrowing all references to EuCore) is a significant architectural decision that affects dependency strategy and scope. While aligning with EuCore is valuable for EU implementations, hard-coding EuCore as a mandatory reference target limits the IG's broader applicability and creates a dependency that may not be appropriate for all use cases.

**Disposition B strikes the right balance**:

- **Preserves flexibility** while **encouraging EU best practices**
- **Adds normative text** that clarifies intent and supports implementers
- **Avoids major refactoring** of existing, ballot-reviewed profiles
- **Allows local profiling** for jurisdictions that want stricter constraints
- **Sets precedent** for how to handle optional vs. required profile dependencies

The work group should approve guidance text (for §9 or implementation notes) that:
1. States when EuCore profiles are preferred for EU implementations
2. Shows example usage patterns
3. Explains how to add stricter constraints in derived profiles if needed

This approach answers the submitter's question (yes, consider EuCore where available) while remaining pragmatic about FHIR design principles.

---

## Next Steps

1. **Work Group Review**: Present this analysis to the imaging work group
2. **Decision**: Choose disposition A, B, or C based on work group consensus
3. **Implementation**:
   - If **A**: Update all affected profile definitions; test with EuCore resources
   - If **B**: Write guidance text for §9 Design Considerations; add example snippets
   - If **C**: Document decision rationale in meeting notes; close ticket
4. **Verification**: If A or B, review rendered specification to confirm guidance is clear
5. **Closure**: Update ticket status to reflect final decision

### Verification Checklist

- [ ] Work group discussed and voted on recommendation
- [ ] Decision rationale recorded in ticket comments
- [ ] Implementation code (if A/B) committed to main branch
- [ ] Guidance text (if B) rendered in specification output
- [ ] Affected profiles reviewed and verified
- [ ] Ticket status updated to Accepted/Applied/Declined

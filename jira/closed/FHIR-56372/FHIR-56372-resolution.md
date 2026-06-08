# Proposed Resolution for FHIR-56372

## Ticket Summary

| Property | Value |
|----------|-------|
| **Key** | FHIR-56372 |
| **Title** | Absence of an Encounter profile in the Imaging Guide |
| **Type** | Question |
| **Status** | Resolved - No Change |
| **Resolution** | Considered - Question answered |
| **Reporter** | HELTONHATORI |
| **Assignee** | Unassigned |
| **Created** | 4/16/26 |
| **Grouping** | Unknown Section |

## Description

The reporter asked why the HL7 Europe Imaging Report guide does not include a profile for the Encounter resource and whether there are plans to add an Encounter profile in future releases.

## Implementation Status

**Status: Resolved as Declined (No Change)**

The ticket has been resolved with the determination that no Encounter profile will be added to the Imaging Guide. The rationale documented in the ticket resolution is:

1. **No definite requirement**: Encounter has not been modelled because there is no definite reason for requiring it in the imaging context.

2. **Not in Xt-EHR model**: The Encounter resource is not part of the Xt-EHR logical model that informs this guide.

3. **Optional but not forbidden**: While FHIR allows adding Encounter information via the `encounter` field on various resources, the guide does not require this nor specifies how it should be done. It is left as an implementation choice.

4. **Hospitalization information handled separately**: The assumption is that hospitalization encounter information will be communicated using the hospital discharge report Implementation Guide, not the imaging report guide.

### Rationale for Declining

The request to add an Encounter profile does not align with the design scope of the imaging report guide:
- The guide focuses on diagnostic imaging reports and related resources (DiagnosticReport, ImagingStudy, Device, etc.)
- The Xt-EHR logical model, which drives the profile requirements, does not include Encounter as a required element
- FHIR's base specification already allows encounter information to be optionally included via existing resource fields
- The guide explicitly permits but does not mandate the use of Encounter, giving implementers flexibility while maintaining scope focus

## Related Tickets

No parent tickets or grouped tickets identified.

## Disposition Analysis

### Disposition Taken

**Decline** — No Encounter profile will be added to the guide.

The ticket asks for the addition of a new profile to support the Encounter resource in imaging reports. This request has been evaluated and declined because:

1. The imaging report guide has a defined scope focused on diagnostic imaging artifacts and actors
2. The underlying Xt-EHR logical model does not require Encounter
3. The FHIR base specification already enables optional encounter linkage via resource fields
4. The guide explicitly allows (but does not require) use of Encounter, providing the necessary flexibility for implementers

## Proposed Dispositions

### Disposition A: Accept as Requested

#### Proposal

Add a formal Encounter profile to the HL7 Europe Imaging Report guide that constrains the Encounter resource for use in imaging scenarios.

#### Justification

- Encounter information is clinically relevant to imaging reports (captures context of when the imaging occurred)
- Provides explicit guidance for implementers on how to represent encounter information
- Makes the guide more comprehensive and self-contained
- Does not conflict with FHIR design principles

#### Drawbacks

- Increases guide scope and maintenance burden
- Adds profiles without clear, demonstrated use cases
- May create guidance that is not aligned with how other FHIR guides handle encounter information
- Not required by the underlying Xt-EHR logical model

---

### Disposition B: Leave as Optional Implementation Detail

#### Proposal

Maintain the current approach: the guide explicitly permits the use of Encounter but does not define a profile or specify mandatory constraints. Implementers may include Encounter information using standard FHIR encounter references if needed for their use case.

#### Justification

- Respects the design principle of not constraining what FHIR's base specification already allows
- Keeps guide scope focused on core imaging artifacts
- Aligns with the Xt-EHR model which does not mandate Encounter
- Provides implementers the flexibility to add encounter information when needed without forcing all implementations to include it
- Encounter information is better handled via the hospital discharge report guide for hospitalization context

#### Trade-offs

- Does not provide explicit guidance for those who do want to use Encounter
- Implementers must refer to FHIR base specification for Encounter constraints
- Slightly reduces guide comprehensiveness

---

### Disposition C: Decline and Document Rationale

#### Proposal

Explicitly decline the addition of an Encounter profile and document the rationale in the guide or in resolution artifacts.

#### Justification

- Makes clear that this was evaluated and intentionally not included
- Provides transparency to the community about design decisions
- Prevents repeated requests for the same functionality
- Documents that encounter information is handled separately via hospitalization reports

#### Drawbacks

- May be perceived as overly restrictive
- Closes the door to future reconsideration if new requirements emerge
- Requires space in documentation for negative design decisions

---

### Recommendation

**Recommended disposition: B (Leave as Optional Implementation Detail)**

The current approach already provides what is needed: FHIR allows Encounter to be referenced from imaging resources if needed, and the guide does not forbid this usage. Formally profiling Encounter would add scope and maintenance burden without a corresponding clear requirement from the Xt-EHR model or demonstrated imaging use cases.

The guide's guidance should be clarified to explicitly state that Encounter information is optional and may be included by implementers using standard FHIR encounter references, but no formal profile is required. Hospitalization context information should be communicated through the hospital discharge report guide.

## Next Steps

- **Status**: Completed
- The ticket has been resolved and the decision is documented
- No further action is required unless new requirements emerge that would justify adding an Encounter profile

## Verification Checklist

- [x] Ticket metadata extracted and confirmed
- [x] Resolution documented in ticket system
- [x] Rationale for declining decision captured
- [x] Disposition analysis completed
- [x] No GitHub implementation expected (question answered; no code change)
- [x] Resolution proposal documented for governance review

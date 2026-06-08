# Proposed Resolution for FHIR-56317

## Ticket Summary

| Field | Value |
|-------|-------|
| **Key** | FHIR-56317 |
| **Summary** | Clarification on the use of fixed values |
| **Type** | Question |
| **Status** | Triaged |
| **Resolution** | Unresolved |
| **Raised in Version** | 1.0.0-ballot |
| **Reporter** | HELTONHATORI |
| **Assignee** | Unassigned |
| **Created** | 4/9/26 |
| **Grouping** | Unknown Section |

## Description

The reporter questions the rationale behind fixed values used throughout the IG and raises two specific concerns:

1. **Terminology Volatility**: Codes may become inactive or deprecated according to the terminology standard over time.
2. **Interoperability Across Regions**: Different coding systems are used across various countries, which may hinder interoperability.

The reporter requests clarification on:
- Why so many values are fixed in the specification
- How the IG plans to mitigate or address these potential issues

## Implementation Status

**Status**: Pending (Question awaiting guidance response)

This is a governance/clarification question, not a change request. No implementation changes have been proposed or approved. The ticket requires a substantive response addressing the terminology concerns and explaining the IG's approach to fixed values.

## Related Tickets

None identified.

## Disposition Analysis

### Disposition Taken

**Pending** — This question requires substantive guidance from the workgroup on:
1. The rationale for fixed values in the IG
2. Governance and maintenance strategy for terminology changes
3. Approach to multi-country interoperability considerations

### Evidence

- **Status**: Triaged (initial review completed, awaiting workgroup decision)
- **No implementation changes or linked evidence**: This is a governance question, not a resolved change

## Proposed Dispositions

### Disposition A: Provide Comprehensive Clarification (Recommended)

#### Proposal

Develop written guidance (to be added to the IG's Design Considerations section) that:

1. **Explains the Fixed Value Rationale**
   - Document why specific elements (e.g., category codes, report types, status codes) are fixed rather than bound
   - Reference binding strength decisions (Fixed vs. Extensible)
   - Cite relevant FHIR design principles

2. **Address Terminology Volatility**
   - Describe the IG's maintenance and versioning process for terminology updates
   - Specify the process for deprecation and sunset of codes
   - Link to the IG's change management policy

3. **Address Multi-Country Interoperability**
   - Clarify which elements allow country-specific extensions (slicing, extensions)
   - Document the distinction between mandatory core codes and jurisdiction-specific variations
   - Provide examples of how jurisdictions can adapt fixed values via profiles

4. **Provide Practical Guidance**
   - Include a FAQ on "Working with Fixed Values Across Jurisdictions"
   - Add migration guidance if codes are deprecated in future versions

#### Justification

- **Directly addresses the reporter's concerns** with concrete explanations
- **Improves IG usability** by making design decisions transparent
- **Establishes governance precedent** for future terminology questions
- **Aligns with FHIR community standards** for specification documentation
- **No content changes required** — purely educational/clarification

---

### Disposition B: Alternative — Add Binding Strength Documentation

#### Proposal

Add a dedicated page or section in the IG (e.g., under §8 Patterns and Guidelines) that:

1. **Distinguishes Fixed vs. Required vs. Extensible** with examples
2. **Explains when and why the IG uses Fixed binding** instead of more flexible options
3. **Provides a matrix** showing:
   - Elements that are truly fixed (no variation allowed)
   - Elements that are fixed but allow extensions
   - Elements that could be made extensible in future versions

4. **Document the maintenance process** for reviewing and updating fixed values in new releases

#### Justification

- **Educational approach** that improves IG documentation
- **Separates binding design from implementation**: Readers understand the rationale without needing implementation changes
- **Supports future governance decisions** by documenting the current approach
- **Less prescriptive** than Disposition A — focuses on documentation rather than defining new guidance

---

### Disposition C: Decline to Change

#### Proposal

Respond to the ticket that:
1. Fixed values are intentional design choices to ensure data consistency across the EU
2. The IG's change management process (via ballot cycles) is the appropriate mechanism for addressing terminology updates
3. Jurisdictions can adapt via country-specific profiles and extensions (as permitted by the IG)
4. No specification changes or additional guidance are required

#### Justification

- **Fixed values serve a purpose**: Ensuring semantic consistency for cross-border healthcare data exchange
- **Governance process exists**: Ballot cycles and versioning provide the mechanism for handling code deprecation
- **Profile-based adaptation is available**: Jurisdictions can create country-specific profiles
- **Avoids scope creep**: Treating this as a specification design question rather than requiring additional guidance

---

## Recommendation

**Proposed Disposition: A (Provide Comprehensive Clarification)**

**Rationale**:
- The question is substantive and reflects legitimate concerns about terminology governance
- Addressing it directly improves IG usability and workgroup transparency
- Clarification requires no specification changes (purely educational)
- Establishes helpful precedent for future terminology questions
- Provides practical guidance for implementers working across multiple jurisdictions

**Next Steps**:
1. Workgroup review and consensus on the approach to fixed values
2. Assign owner to draft clarification guidance
3. Target addition to Design Considerations section (§9) for next ballot cycle
4. Update relevant sections with binding strength rationale and multi-jurisdiction guidance

## Verification Checklist

- [ ] Workgroup consensus obtained on which disposition to adopt
- [ ] If Disposition A or B: Clarification content drafted and reviewed
- [ ] Updated IG section(s) include binding strength rationale
- [ ] Documentation addresses both terminology volatility and multi-country interoperability
- [ ] Changes tested in ballot preview or build
- [ ] Ticket status updated to reflect adopted disposition

# Proposed Resolution for FHIR-56315

## Ticket Summary

| Field | Value |
|-------|-------|
| **Key** | FHIR-56315 |
| **Type** | Technical Correction |
| **Status** | Applied |
| **Resolution** | Persuasive |
| **Reporter** | HELTONHATORI |
| **Assignee** | Unassigned |
| **Created** | 4/9/26 |
| **Raised in Version** | 1.0.0-ballot |

## Description

Two broken links in the HL7 Europe Imaging Report documentation:

1. **DiagnosticReportEuImaging profile page**: Broken link to "IHE-RAD-HL7IDR"  
   URL: `https://build.fhir.org/ig/IHE/RAD.HL7IDR/branches/master/StructureDefinition-imaging-diagnosticreport.html`

2. **imaging-report.html, section "Comparison"**: Broken link to "ImagingSelection"  
   URL: `https://www.hl7.org/fhir/R4/ImagingSelection.html`

## Implementation Status

### Current State
- **Ticket Status**: Applied
- **Technical Corrections Tracking**: Not Started (as of 2026-05-08)
- **External Dependencies Registry**: In Progress

### Issues Identified

**ImagingSelection Reference (R4)**:
- ImagingSelection was introduced in FHIR R5, not R4
- URL `https://www.hl7.org/fhir/R4/ImagingSelection.html` returns a 404 error
- Specification uses template variables (`{{ImagingSelection}}`) which correctly point to:
  - R4: Local profile `[ImagingSelectionEuImaging](StructureDefinition-ImagingSelectionEuImaging.html)`
  - R5: FHIR core resource `https://www.hl7.org/fhir/R5/ImagingSelection.html`
- **Current rendering state**: Template variables are properly resolved in both R4 and R5 builds

**IHE-RAD-HL7IDR Reference**:
- URL uses outdated `/branches/master/` path structure
- IHE repositories have migrated to `/branches/main/` naming convention
- Need to verify current stable URL with IHE-RAD team
- No direct reference found in current page content; may be in comments or external references

## Related Tickets

No parent or grouped tickets identified.

## Disposition Analysis

### Disposition Taken

**Accept & Implement** (Status: Applied, Resolution: Persuasive)

The ticket has been marked as applied with a persuasive resolution, indicating that the work group determined this correction should be accepted and implemented.

### Rationale

1. **Standards Compliance**: FHIR R4 links must point to valid R4 resources. ImagingSelection is R5-only, requiring appropriate documentation and cross-version references.

2. **Link Maintenance**: The IHE-RAD-HL7IDR link uses outdated branch naming convention; this should be updated to reflect current repository structure.

3. **Documentation Quality**: Broken links undermine specification credibility and user experience. Fixing them is essential for a published implementation guide.

### Evidence

- **Status Classification**: Applied with Persuasive resolution (4/9/26)
- **External Dependencies Registry** (2026-05-08): Lists both broken links with mitigation strategies
- **Source Code Review**: Template variables in `ig-src/input/includes/fhir-resources.md` are correctly configured for R4/R5 divergence
- **Specification Tracking**: Identified in Technical Corrections list created 2026-05-08

## Proposed Dispositions

### Disposition A: Accept & Implement (Recommended)

#### Proposal

Fix both broken links:

1. **ImagingSelection in imaging-report.html (Comparison section)**:
   - Remove or replace direct link to `https://www.hl7.org/fhir/R4/ImagingSelection.html`
   - Use existing template variable reference: `{{ImagingSelection}}`
   - This automatically renders to:
     - R4: Local `ImagingSelectionEuImaging` profile
     - R5: FHIR R5 core resource
   - Add clarifying note: "In FHIR R4, comparison studies using ImagingSelection are represented via the `ImagingSelectionEuImaging` profile on a Basic resource; in R5, the native `ImagingSelection` resource is available."

2. **IHE-RAD-HL7IDR reference**:
   - Verify current URL with IHE-RAD project (likely `/branches/main/` instead of `/branches/master/`)
   - Update link to stable IHE build URL or documented stable reference
   - If URL is still unavailable, document reason and use cached reference if available
   - Alternative: Link to IHE-IDR (which is currently linked via `iheIDR` variable) if it includes the same resource

#### Justification

This approach:
- Resolves both broken links identified in the ticket
- Maintains consistency with existing template variable system
- Preserves cross-version compatibility (R4/R5)
- Documents version-specific behavior for implementers
- Aligns with external-dependencies-registry mitigation strategy

---

### Disposition B: Alternative — Document as Version-Specific Limitation

#### Proposal

Instead of fixing links, add explicit documentation:

1. Create a new section "Cross-Version Link References" in the specification explaining:
   - ImagingSelection is R5-only in FHIR core
   - R4 implementations use `ImagingSelectionEuImaging` profile (on Basic resource)
   - External IG links to ongoing projects (like IHE-RAD) may have unstable URLs and should be verified independently

2. Replace direct links with conditional text:
   - "See [ImagingSelection resource](appropriate-link) documentation for current details"
   - Use footnote or cross-reference rather than embedded link

3. Maintain external-dependencies-registry as the source of truth for link verification

#### Justification

- Reduces fragility of external references
- Acknowledges cross-version complexity explicitly
- Shifts responsibility for verification to specification users
- Reduces maintenance burden for link updates

---

### Disposition C: Decline

#### Proposal

Take no action on broken links beyond what is documented in the external-dependencies-registry.

Rationale: Links are documented as broken with mitigation strategies; the registry serves as the definitive tracking mechanism. Once FHIR R4 ImagingSelection availability changes or IHE repository structure stabilizes, links can be updated in bulk as part of a comprehensive link audit.

#### Justification

- External-dependencies-registry already provides detailed tracking and resolution strategies
- FHIR ImagingSelection status (R5-only) is expected to remain stable
- IHE-RAD repository structure may change again; delaying fixes prevents rework
- Current template variables already mitigate most practical issues for implementers

---

## Recommendation

**Recommended disposition: A — Accept & Implement**

**Rationale**:

FHIR-56315 identifies genuine broken links that affect specification quality and user experience. Since the work group has already approved this correction (Status: Applied, Resolution: Persuasive), implementation should proceed promptly.

**Implementation approach**:

1. **Verify IHE-RAD-HL7IDR stable URL** by consulting IHE-RAD project documentation or stable build endpoint
2. **Update template variable** in `ig-src/input/includes/fhir-resources.md` if needed to ensure R4/R5 correct rendering
3. **Review imaging-report.md** to confirm `{{ImagingSelection}}` template variable is used (appears already correct)
4. **Add clarifying note** (per Disposition A) explaining cross-version behavior
5. **Verify in rendered builds**: Run `_preprocessMultiVersion.sh` and check both R4 and R5 outputs to confirm links resolve correctly
6. **Update external-dependencies-registry.md**: Mark both links as "Valid" once fixes are verified

**Timeline**: Can be completed within a single maintenance cycle (recommend prioritizing due to ballot feedback visibility)

## Next Steps

**Status**: Ready for Implementation

### Verification Checklist

- [ ] IHE-RAD-HL7IDR stable URL verified and documented
- [ ] Source template variables reviewed and confirmed correct
- [ ] R4 and R5 builds executed successfully
- [ ] Rendered output HTML verified: links are functional and point to correct resources
- [ ] External-dependencies-registry updated with verification status
- [ ] Clarifying note added to imaging-report.html section if needed
- [ ] Technical Corrections tracking updated from "Not Started" to "Complete & Verified"
- [ ] Changes committed to main branch
- [ ] Work group notified of completion

# External Dependencies Registry

## Purpose

This registry tracks all external links and resources referenced in the HL7 Europe Imaging Implementation Guide specification. It enables systematic monitoring, maintenance, and quality assurance of documentation links.

**Last Updated**: 2026-05-08  
**Next Audit**: 2026-08-08

---

## FHIR Core Resources (Category 1: High Stability)

| URL | Resource | Category | Owner | Last Verified | Status | Notes |
|-----|----------|----------|-------|---|--------|-------|
| https://www.hl7.org/fhir/R4/bundle.html | FHIR R4 Bundle | FHIR Core | HL7 | 2026-05-08 | Valid | Standard FHIR resource |
| https://www.hl7.org/fhir/R4/composition.html | FHIR R4 Composition | FHIR Core | HL7 | 2026-05-08 | Valid | Standard FHIR resource |
| https://www.hl7.org/fhir/R4/diagnosticreport.html | FHIR R4 DiagnosticReport | FHIR Core | HL7 | 2026-05-08 | Valid | Standard FHIR resource |
| https://www.hl7.org/fhir/R4/imaging-selection.html | FHIR R4 ImagingSelection | FHIR Core | HL7 | 2026-05-08 | **BROKEN** | **Issue FHIR-56315**: Resource does not exist in R4 release; proposed for future version |
| https://www.hl7.org/fhir/R4/imagingstudy.html | FHIR R4 ImagingStudy | FHIR Core | HL7 | 2026-05-08 | Valid | Standard FHIR resource |
| https://www.hl7.org/fhir/R4/observation.html | FHIR R4 Observation | FHIR Core | HL7 | 2026-05-08 | Valid | Standard FHIR resource |
| https://www.hl7.org/fhir/R5/imagingselection.html | FHIR R5 ImagingSelection | FHIR Core | HL7 | 2026-05-08 | Valid | Available in R5 |
| https://www.hl7.org/fhir/R5/imagingstudy.html | FHIR R5 ImagingStudy | FHIR Core | HL7 | 2026-05-08 | Valid | Standard FHIR resource |

---

## External Implementation Guides (Category 2: Medium Stability)

| URL | IG Name | Owner | Last Verified | Status | Notes |
|-----|---------|-------|---|--------|-------|
| https://build.fhir.org/ig/IHE/RAD.HL7IDR/branches/master/StructureDefinition-imaging-diagnosticreport.html | IHE RAD.HL7IDR | IHE | 2026-05-08 | **BROKEN** | **Issue FHIR-56315**: Uses `/branches/master/` path; check if resource moved to `/main/` branch |
| https://hl7.eu/fhir/base-r4/ | EU Base R4 | EU | 2026-05-08 | Valid | Reference IG |
| https://hl7.eu/fhir/base-r5/ | EU Base R5 | EU | 2026-05-08 | Valid | Reference IG |
| https://build.fhir.org/ig/hl7eu/base/ | EU Base Build | EU | 2026-05-08 | Valid | Latest build version |

---

## Standards and Technical Documentation (Category 3: Medium-Low Stability)

| URL | Resource | Owner | Last Verified | Status | Notes |
|-----|----------|-------|---|--------|-------|
| http://dicom.nema.org/resources/ontology/DCM | DICOM Ontology | DICOM NEMA | 2026-05-08 | Valid | External reference |
| https://www.dicomstandard.org/ | DICOM Standard | DICOM NEMA | 2026-05-08 | Valid | Informational |
| http://cancerstaging.org | Cancer Staging | External | 2026-05-08 | Valid | Clinical reference |

---

## Issue Tracking & Broken Links

### Current Broken Links (To Fix)

| Issue Ticket | Link | Problem | Category | Fix Strategy | Status |
|--------------|------|---------|----------|--------------|--------|
| **FHIR-56315** | https://www.hl7.org/fhir/R4/ImagingSelection.html | Resource does not exist in FHIR R4 | FHIR Core | Remove R4 link; add note that this is R5 resource | **In Progress** |
| **FHIR-56315** | https://build.fhir.org/ig/IHE/RAD.HL7IDR/branches/master/StructureDefinition-imaging-diagnosticreport.html | Outdated `/branches/master/` path; verify current URL | External IG | Update to `/branches/main/` or find stable URL | **In Progress** |

### Resolution Strategy

**For ImagingSelection Reference**:
- ImagingSelection was introduced in FHIR R5, not R4
- Specification should note this is R5 resource when referencing in R4 context
- Or remove R4 reference and keep only R5 reference

**For IHE-RAD-HL7IDR Reference**:
- Update branch path from `/branches/master/` to current stable branch
- Verify with IHE repository if URL has changed
- Use persistent URL format when available

---

## Link Verification Checklist

Use this checklist during quarterly audits:

- [ ] FHIR Core links: All redirect to valid FHIR resources
- [ ] External IG links: Test accessibility and redirect status
- [ ] Standards links: Confirm up-to-date and accessible
- [ ] R4 vs R5 links: Verify version-appropriate references
- [ ] Build links: Use stable paths (not `/branches/master/`)
- [ ] No duplicate or redundant links

---

## Maintenance Schedule

**Weekly**: Automated CI/CD link checking on each build
**Monthly**: Manual spot-check of high-risk links (draft resources, external IGs)
**Quarterly**: Comprehensive audit of all links; update registry
**Annually**: Policy review and process improvements

---

## Contact & Ownership

- **Registry Steward**: Documentation lead (to be assigned)
- **FHIR Standards Liaison**: For HL7 resource reference issues
- **IHE Liaison**: For IHE implementation guide coordinate contact
- **Work Group**: Approves major link changes and policy updates

---

*Registry Version 1.0 - Generated 2026-05-08*
*For implementation details, see .github/documentation-maintenance-policy.md*

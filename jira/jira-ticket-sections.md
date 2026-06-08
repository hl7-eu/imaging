# Jira Ticket Sections Report

- Generated: 2026-05-11
- Source: jira/FHIR-*/FHIR-*.md
- Cutoff: 2026-03-30 (inclusive)
- Section strategy: Related Sections (→ title lookup from pages.json) → Related Artifact fallback
- Included tickets: 136
- Excluded by date: 141
- Excluded for data quality: 0

## Sections

- §1 Home (5)
- §1.1 Changes (3)
- §1.2 Dependencies (1)
- §1.3 References (1)
- §1.4 Adapting Guidelines for Country use (1)
- §1.5 Authors and contributors (1)
- §2 System actors (1)
- §3 Use Cases (3)
- 3.2 (2)
- 3.3.2 (2)
- §3.3.2 (Imaging Manifest IHE MADO) (1)
- §4 Data formats (3)
- 5 examples (1)
- §6 EU Health Data API for Imaging Reports (2)
- §7 Xt-EHR mapping (2)
- §7.1.1 (Xt-EHR mapping) (1)
- §8 Patterns and Guidelines (1)
- 8.01 (Patterns and Guidelines) (1)
- §8.01 (1)
- 8.8 (1)
- 8.10 + DiagnosticReportEuImaging (1)
- 8.13 (1)
- §9 Design considerations (5)
- §9.8 / §9.9 (1)
- §10.2 Obligations (4)
- 10.2.1.2.2 (1)
- §10.2.1.2.2 (1)
- §10.3 Imaging Report (2)
- 11 (1)
- §11.3 EEHRxF Imaging Report Document Access Provider CapabilityStatement (2)
- §11.5 EEHRxF Imaging Report Resource Access Provider CapabilityStatement (2)
- §11.5.3.3, §11.6.3.4.1 (1)
- §11.5.3.4.1, §11.6.3.4.1 (1)
- §11.7 OperationDefinition: $document on DiagnosticReport (1)
- §11.10 AdverseEvent: Imaging Adverse Event (1)
- §11.13 Bundle: Imaging Report (1)
- §11.15 Composition: Imaging Report (7)
- §11.16 Composition: Imaging Report: Obligations (3)
- 11.16.1 Composition obligation profile (1)
- 11.16.1 Composition obligation profile — category slices (1)
- §11.16.1.1 (Composition obligation Key Elements) (1)
- §11.16.1.1 (1)
- §11.17 Device: Imaging Device (3)
- §11.20 DiagnosticReport: Imaging Report: Obligations (2)
- 11.20.1 DiagnosticReport obligation profile (1)
- §11.21 DocumentReference: Key Image (3)
- §11.23 EuCarePlan: Obligations (1)
- 11.23.1 CarePlan obligation profile (1)
- §11.24 ImagingStudy: General (2)
- §11.25 ImagingStudy: General: Obligations (4)
- 11.25.1.1 ImagingStudy obligation profile (1)
- 11.30.1.1 (1)
- §11.33 Procedure: Imaging Acquisition (1)
- §11.35 ServiceRequest: Imaging Order (1)
- §11.51 Extension: Number of Frames (2)
- §11.54 ValueSet: DiagnosticReport supportInfo codes (1)
- §11.56 ValueSet: Imaging Procedure Type (1)
- §11.58 ValueSet: Radiology Report Types (1)
- §11.59 ValueSet: Reasons a section in an imaging report is empty. (1)
- AdverseEvent: Imaging Adverse Event (1)
- All (1)
- artifacts-structural — Identifier description (2)
- Composition obligation profile (1)
- Composition: Imaging Report (1)
- DiagnosticReportEuImaging (2)
- DocumentReferenceImagingReport (1)
- EhrxfImagingDocumentAccessProvider (1)
- Identifier: Accession Number (1)
- ImagingStudy obligation profile (1)
- ImagingStudyEuImaging (1)
- IP statements (2)
- MedicationAdministration obligation profile (1)
- Navigation (2)
- Obligations (2)
- Resource Access Provider + Consumer CapabilityStatements (2)
- ServiceRequestOrderEuImaging + ObservationFindingEuImaging (1)
- Unknown Section (12)

## §1 Home (5)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/index.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/index.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/index.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/index.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56716](https://jira.hl7.org/browse/FHIR-56716) | Scope and modeling of electrocardiogram (ECG) examinations | Triaged | Question | 4/30/26 | [proposal](./open/FHIR-56716/FHIR-56716-resolution.md) |  | Pending (recommended: A) |
| [FHIR-56765](https://jira.hl7.org/browse/FHIR-56765) | Editorial: TOC should be linked in a menu | Triaged | Change Request | 4/30/26 | [proposal](./open/FHIR-56765/FHIR-56765-resolution.md) |  | Pending (recommended: A) |
| [FHIR-56779](https://jira.hl7.org/browse/FHIR-56779) | Editorial: cross-spec link to xt-ehr-common is confusing as an orientation page; | Triaged | Change Request | 4/30/26 | [proposal](./open/FHIR-56779/FHIR-56779-resolution.md) |  | Pending (recommended: B) |
| [FHIR-56563](https://jira.hl7.org/browse/FHIR-56563) | How to read page | Triaged | Change Request | 4/28/26 | [proposal](./open/FHIR-56563/FHIR-56563-resolution.md) |  | Pending (recommended: A) |
| [FHIR-56564](https://jira.hl7.org/browse/FHIR-56564) | Add a kind of background page | Triaged | Change Request | 4/28/26 | [proposal](./open/FHIR-56564/FHIR-56564-resolution.md) |  | Pending (recommended: B) |

## §1.1 Changes (3)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/changes.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/changes.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/changes.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/changes.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56763](https://jira.hl7.org/browse/FHIR-56763) | Editorial: Xt-EHR link in §1.1 is broken | Applied | Technical Correction | 4/30/26 |  |  |  |
| [FHIR-56764](https://jira.hl7.org/browse/FHIR-56764) | Editorial: §1.1 Scope is incomplete on current European approaches; mention XDS, | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56560](https://jira.hl7.org/browse/FHIR-56560) | move changes page | Triaged | Change Request | 4/28/26 |  |  |  |

## §1.2 Dependencies (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/dependencies.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/dependencies.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/dependencies.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/dependencies.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56561](https://jira.hl7.org/browse/FHIR-56561) | Move dependencies page under About | Triaged | Change Request | 4/28/26 |  |  |  |

## §1.3 References (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/references.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/references.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/references.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/references.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56559](https://jira.hl7.org/browse/FHIR-56559) | Move some of the home page content under the about menu | Triaged | Change Request | 4/28/26 |  |  |  |

## §1.4 Adapting Guidelines for Country use (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/adapting.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/adapting.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/adapting.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/adapting.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56562](https://jira.hl7.org/browse/FHIR-56562) | Remove adapting guidelines page | Triaged | Change Request | 4/28/26 |  |  |  |

## §1.5 Authors and contributors (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/contributors.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/contributors.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/contributors.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/contributors.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56585](https://jira.hl7.org/browse/FHIR-56585) | revise contributors page | Triaged | Change Request | 4/28/26 |  |  |  |

## §2 System actors (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/actors-and-transactions.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/actors-and-transactions.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/actors-and-transactions.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/actors-and-transactions.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56571](https://jira.hl7.org/browse/FHIR-56571) | Revise System actor page | Triaged | Change Request | 4/28/26 |  |  |  |

## §3 Use Cases (3)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/use-cases.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/use-cases.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/use-cases.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/use-cases.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56767](https://jira.hl7.org/browse/FHIR-56767) | Editorial: §3 Use Cases — multiple small typos and wording fixes | Applied | Technical Correction | 4/30/26 |  |  |  |
| [FHIR-56777](https://jira.hl7.org/browse/FHIR-56777) | Future: add a way to identify AI-generated or CAD-assisted findings | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56566](https://jira.hl7.org/browse/FHIR-56566) | Add a minimal description of the business actors listed in the use cases | Triaged | Change Request | 4/28/26 |  |  |  |

## 3.2 (2)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56567](https://jira.hl7.org/browse/FHIR-56567) | Links should not point to non-released artefacts | Triaged | Change Request | 4/28/26 |  |  |  |
| [FHIR-56568](https://jira.hl7.org/browse/FHIR-56568) | revise §3.2 Obligations | Triaged | Change Request | 4/28/26 |  |  |  |

## 3.3.2 (2)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56724](https://jira.hl7.org/browse/FHIR-56724) | §3.3.2 flow assumes RIS↔PACS matching by DICOM Study Instance UID; in practice s | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56570](https://jira.hl7.org/browse/FHIR-56570) | Revise §3.3.2 Imaging Manifest (IHE-MADO) | Triaged | Change Request | 4/28/26 |  |  |  |

## §3.3.2 (Imaging Manifest IHE MADO) (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56723](https://jira.hl7.org/browse/FHIR-56723) | 3.3.2 sequence diagram should also list the clinician's own systems, or scope cr | Triaged | Change Request | 4/30/26 |  |  |  |

## §4 Data formats (3)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/data-formats.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/data-formats.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/data-formats.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/data-formats.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56722](https://jira.hl7.org/browse/FHIR-56722) | The IG offers two paths to the same imaging report data (DocumentReference searc | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56738](https://jira.hl7.org/browse/FHIR-56738) | §4 defines three data-format levels (minimal-metadata Collection bundle, section | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56574](https://jira.hl7.org/browse/FHIR-56574) | Revise data formats page | Triaged | Change Request | 4/28/26 |  |  |  |

## 5 examples (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56755](https://jira.hl7.org/browse/FHIR-56755) | Sole structured example is cardiology stress echo; add a radiology structured ex | Triaged | Change Request | 4/30/26 |  |  |  |

## §6 EU Health Data API for Imaging Reports (2)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/api.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/api.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/api.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/api.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56578](https://jira.hl7.org/browse/FHIR-56578) | Revise API page | Triaged | Change Request | 4/28/26 |  |  |  |
| [FHIR-56590](https://jira.hl7.org/browse/FHIR-56590) | Revise MHD DocRef | Triaged | Change Request | 4/28/26 |  |  |  |

## §7 Xt-EHR mapping (2)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/xtehr-mapping.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/xtehr-mapping.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/xtehr-mapping.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/xtehr-mapping.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56754](https://jira.hl7.org/browse/FHIR-56754) | DocumentReference-KeyImage and ImagingSelection-KeyImage are parallel; HL7IDR Fi | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56572](https://jira.hl7.org/browse/FHIR-56572) | Revise xtehr mapping page | Triaged | Change Request | 4/28/26 |  |  |  |

## §7.1.1 (Xt-EHR mapping) (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56720](https://jira.hl7.org/browse/FHIR-56720) | Clarify that document bundles may be generated on demand and that Bundle.meta.la | Triaged | Change Request | 4/30/26 |  |  |  |

## §8 Patterns and Guidelines (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/patterns-and-guidelines.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/patterns-and-guidelines.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/patterns-and-guidelines.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/patterns-and-guidelines.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56538](https://jira.hl7.org/browse/FHIR-56538) | Use of fullUrl, oid, and meta.profile in the provided examples | Triaged | Question | 4/27/26 |  |  |  |

## 8.01 (Patterns and Guidelines) (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56725](https://jira.hl7.org/browse/FHIR-56725) | Clarify that dictated / free-text result data belongs in Observation, not Diagno | Triaged | Change Request | 4/30/26 |  |  |  |

## §8.01 (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56770](https://jira.hl7.org/browse/FHIR-56770) | Editorial: §8.01 page section numbers are duplicated (page is in draft status) | Resolved - No Change | Technical Correction | 4/30/26 |  |  |  |

## 8.8 (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56565](https://jira.hl7.org/browse/FHIR-56565) | Add a handling missing data page | Triaged | Change Request | 4/28/26 |  |  |  |

## 8.10 + DiagnosticReportEuImaging (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56746](https://jira.hl7.org/browse/FHIR-56746) | Specify how DR.status correlates with addenda; consider reducing the amended/cor | Triaged | Change Request | 4/30/26 |  |  |  |

## 8.13 (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56481](https://jira.hl7.org/browse/FHIR-56481) | Inconsistent handling of image references in DiagnosticReportEuImaging | Triaged | Change Request | 4/24/26 |  |  |  |

## §9 Design considerations (5)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/design-considerations.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/design-considerations.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/design-considerations.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/design-considerations.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56721](https://jira.hl7.org/browse/FHIR-56721) | Composition need not be signed by a single radiologist; allow Organization as at | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56739](https://jira.hl7.org/browse/FHIR-56739) | §9 says all resources reachable via reference chains "should be included in the  | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56771](https://jira.hl7.org/browse/FHIR-56771) | Editorial: design-considerations §9.6, §9.9.1, §9.9.2, §9.10 — typos / incomplet | Applied | Technical Correction | 4/30/26 |  |  |  |
| [FHIR-56583](https://jira.hl7.org/browse/FHIR-56583) | Revise design considerations | Triaged | Change Request | 4/28/26 |  |  |  |
| [FHIR-56265](https://jira.hl7.org/browse/FHIR-56265) | typo in design consideration adverse event diagram | Triaged | Change Request | 4/2/26 |  |  |  |

## §9.8 / §9.9 (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56772](https://jira.hl7.org/browse/FHIR-56772) | Editorial: §9.9 lists three resources as alternatives while §9.8 recommends usin | Applied | Technical Correction | 4/30/26 |  |  |  |

## §10.2 Obligations (4)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/artifacts-obligations.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/artifacts-obligations.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/artifacts-obligations.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/artifacts-obligations.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56719](https://jira.hl7.org/browse/FHIR-56719) | CompositionEuImaging - section:report slice | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56769](https://jira.hl7.org/browse/FHIR-56769) | Editorial: small typo in §10.2 ("as" should be "and") | Applied | Technical Correction | 4/30/26 |  |  |  |
| [FHIR-56573](https://jira.hl7.org/browse/FHIR-56573) | Revise Imaging report page | Triaged | Change Request | 4/28/26 |  |  |  |
| [FHIR-56251](https://jira.hl7.org/browse/FHIR-56251) | Please revert the overview picture | Triaged | Change Request | 4/1/26 |  |  |  |

## 10.2.1.2.2 (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56726](https://jira.hl7.org/browse/FHIR-56726) | §10.2.1.2.2 implies a single accession per DR; clarify that one DR may serve mul | Triaged | Change Request | 4/30/26 |  |  |  |

## §10.2.1.2.2 (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56737](https://jira.hl7.org/browse/FHIR-56737) | Add guidance for handling generic orderables vs specific performables; clarify w | Triaged | Change Request | 4/30/26 |  |  |  |

## §10.3 Imaging Report (2)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/imaging-report.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/imaging-report.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/imaging-report.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/imaging-report.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56753](https://jira.hl7.org/browse/FHIR-56753) | Identical elements (history / findings / comparison / recommendation) carry diff | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56768](https://jira.hl7.org/browse/FHIR-56768) | Editorial: report-profiles table focuses on images; should reference DiagnosticR | Waiting for Input | Change Request | 4/30/26 |  |  |  |

## 11 (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56780](https://jira.hl7.org/browse/FHIR-56780) | Derivation of EuImaging resources from EuCore profiles | Triaged | Question | 4/30/26 |  |  |  |

## §11.3 EEHRxF Imaging Report Document Access Provider CapabilityStatement (2)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/CapabilityStatement-EehrxfImagingDocumentAccessProvider.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/CapabilityStatement-EehrxfImagingDocumentAccessProvider.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/CapabilityStatement-EehrxfImagingDocumentAccessProvider.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/CapabilityStatement-EehrxfImagingDocumentAccessProvider.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56579](https://jira.hl7.org/browse/FHIR-56579) | Revise capabilityStatement pages | Triaged | Change Request | 4/28/26 |  |  |  |
| [FHIR-56582](https://jira.hl7.org/browse/FHIR-56582) | Check search parameters | Triaged | Change Request | 4/28/26 |  |  |  |

## §11.5 EEHRxF Imaging Report Resource Access Provider CapabilityStatement (2)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/CapabilityStatement-EeehrxfImagingReportResourceAccessProvider.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56775](https://jira.hl7.org/browse/FHIR-56775) | Editorial: small fixes to Resource Access Provider / Consumer CapabilityStatemen | Applied | Technical Correction | 4/30/26 |  |  |  |
| [FHIR-56580](https://jira.hl7.org/browse/FHIR-56580) | revise text about  IHE-mXDE | Triaged | Change Request | 4/28/26 |  |  |  |

## §11.5.3.3, §11.6.3.4.1 (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56748](https://jira.hl7.org/browse/FHIR-56748) | Provider scopes omit ImagingStudy, Device, and ServiceRequest, but those resourc | Applied | Technical Correction | 4/30/26 |  |  |  |

## §11.5.3.4.1, §11.6.3.4.1 (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56747](https://jira.hl7.org/browse/FHIR-56747) | Procedure, ServiceRequest, and Provenance entries on Resource Access Provider/Co | Applied | Technical Correction | 4/30/26 |  |  |  |

## §11.7 OperationDefinition: $document on DiagnosticReport (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/OperationDefinition-DiagnosticReport-fhir-report.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/OperationDefinition-DiagnosticReport-fhir-report.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/OperationDefinition-DiagnosticReport-fhir-report.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/OperationDefinition-DiagnosticReport-fhir-report.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56614](https://jira.hl7.org/browse/FHIR-56614) | Suggest remove $document operation | Triaged | Change Request | 4/29/26 |  |  |  |

## §11.10 AdverseEvent: Imaging Adverse Event (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/StructureDefinition-AdverseEventEuImaging.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/StructureDefinition-BundleReportMinimalMetadataEuImaging.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/StructureDefinition-AdverseEventEuImaging.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/StructureDefinition-BundleReportMinimalMetadataEuImaging.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56591](https://jira.hl7.org/browse/FHIR-56591) | Revise AdverseEvent profile | Triaged | Change Request | 4/28/26 |  |  |  |

## §11.13 Bundle: Imaging Report (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/StructureDefinition-BundleReportEuImaging.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/StructureDefinition-DeviceEuImaging.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/StructureDefinition-BundleReportEuImaging.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/StructureDefinition-DeviceEuImaging.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56485](https://jira.hl7.org/browse/FHIR-56485) | References to "EU Base" profiles instead of "EU Core" equivalents | Triaged | Change Request | 4/24/26 |  |  |  |

## §11.15 Composition: Imaging Report (7)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/StructureDefinition-CompositionEuImaging.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/StructureDefinition-DiagnosticReportEuImagingMinimalMetadata.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/StructureDefinition-CompositionEuImaging.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/StructureDefinition-DiagnosticReportEuImagingMinimalMetadata.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56735](https://jira.hl7.org/browse/FHIR-56735) | Radiation dose is duplicated as both an extension and an entry pointing at gener | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56778](https://jira.hl7.org/browse/FHIR-56778) | Clarification on Composition.type and Composition.category | Triaged | Question | 4/30/26 |  |  |  |
| [FHIR-56588](https://jira.hl7.org/browse/FHIR-56588) | Revise composition Imaging report notes | Triaged | Change Request | 4/28/26 |  |  |  |
| [FHIR-56482](https://jira.hl7.org/browse/FHIR-56482) | Findings and Impressions sections of CompositionEuImaging | Triaged | Question | 4/24/26 |  |  |  |
| [FHIR-56490](https://jira.hl7.org/browse/FHIR-56490) | Slicing of .category between DiagnosticReportEuImaging and DiagnosticReportEuLab | Triaged | Question | 4/24/26 |  |  |  |
| [FHIR-56500](https://jira.hl7.org/browse/FHIR-56500) | Scope of interventional radiology procedures | Triaged | Question | 4/24/26 |  |  |  |
| [FHIR-56248](https://jira.hl7.org/browse/FHIR-56248) | Finding section should allow for impressions as well | Triaged | Change Request | 4/1/26 |  |  |  |

## §11.16 Composition: Imaging Report: Obligations (3)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/StructureDefinition-composition-obligation-eu-imaging.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/StructureDefinition-diagnostic-report-obligation-eu-imaging.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/StructureDefinition-composition-obligation-eu-imaging.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/StructureDefinition-diagnostic-report-obligation-eu-imaging.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56744](https://jira.hl7.org/browse/FHIR-56744) | Device.status 1..1 forces a current-status snapshot into reconstructed bundles | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56781](https://jira.hl7.org/browse/FHIR-56781) | Expand Imaging Device Type ValueSet to SNOMED 303607000 | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56592](https://jira.hl7.org/browse/FHIR-56592) | Device: use type instead of the extension | Triaged | Change Request | 4/28/26 |  |  |  |

## 11.16.1 Composition obligation profile (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56759](https://jira.hl7.org/browse/FHIR-56759) | Profile says SHOULD populate a narrative for the composition as a whole; how doe | Triaged | Change Request | 4/30/26 |  |  |  |

## 11.16.1 Composition obligation profile — category slices (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56760](https://jira.hl7.org/browse/FHIR-56760) | Two categories with the same description and value-set binding; explain or colla | Triaged | Change Request | 4/30/26 |  |  |  |

## §11.16.1.1 (Composition obligation Key Elements) (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56751](https://jira.hl7.org/browse/FHIR-56751) | Several CompositionObligation elements have MAY:able-to-populate redundant with  | Submitted | Change Request | 4/30/26 |  |  |  |

## §11.16.1.1 (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56752](https://jira.hl7.org/browse/FHIR-56752) | category:diagnostic-service is marked both SHALL:able-to-populate and SHOULD:abl | Triaged | Change Request | 4/30/26 |  |  |  |

## §11.17 Device: Imaging Device (3)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/StructureDefinition-DeviceEuImaging.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/StructureDefinition-DocumentReferenceKeyImageEuImaging.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/StructureDefinition-DeviceEuImaging.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/StructureDefinition-DocumentReferenceKeyImageEuImaging.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56741](https://jira.hl7.org/browse/FHIR-56741) | Imaging Report Provider is often downstream of the resulting system and may not  | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56742](https://jira.hl7.org/browse/FHIR-56742) | Not all RIS support discrete history capture; making patientHistory MS forces a  | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56503](https://jira.hl7.org/browse/FHIR-56503) | Binding to DiagnosticServiceSectionCodes ValueSet in category:imaging-report and | Triaged | Change Request | 4/24/26 |  |  |  |

## §11.20 DiagnosticReport: Imaging Report: Obligations (2)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/StructureDefinition-diagnostic-report-obligation-eu-imaging.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/StructureDefinition-patient-obligation-eu-imaging.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/StructureDefinition-diagnostic-report-obligation-eu-imaging.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/StructureDefinition-patient-obligation-eu-imaging.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56782](https://jira.hl7.org/browse/FHIR-56782) | ValueSet for DocumentReference.status | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56783](https://jira.hl7.org/browse/FHIR-56783) | Inclusion of IPS in the IHE FormatCode ValueSet used for imaging reports | Triaged | Question | 4/30/26 |  |  |  |

## 11.20.1 DiagnosticReport obligation profile (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56731](https://jira.hl7.org/browse/FHIR-56731) | Comparison obligation requires a full ImagingStudy resource for prior comparison | Triaged | Change Request | 4/30/26 |  |  |  |

## §11.21 DocumentReference: Key Image (3)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/StructureDefinition-DocumentReferenceKeyImageEuImaging.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/StructureDefinition-SrInstanceImagingSelectionEuImaging.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/StructureDefinition-DocumentReferenceKeyImageEuImaging.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/StructureDefinition-SrInstanceImagingSelectionEuImaging.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56761](https://jira.hl7.org/browse/FHIR-56761) | SHALL populate a description for every instance and series, but content expectat | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56784](https://jira.hl7.org/browse/FHIR-56784) | Imaging Procedure Type ValueSet does not cover Endoscopy (procedure) | Triaged | Question | 4/30/26 |  |  |  |
| [FHIR-56785](https://jira.hl7.org/browse/FHIR-56785) | Replace RadLex Playbook ValueSet with SNOMED CT for ImagingStudy.procedureCode | Triaged | Change Request | 4/30/26 |  |  |  |

## §11.23 EuCarePlan: Obligations (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/StructureDefinition-care-plan-obligation-eu-imaging.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/StructureDefinition-ImagingSelectionKeyImageEuImaging.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/StructureDefinition-care-plan-obligation-eu-imaging.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/StructureDefinition-ImagingSelectionKeyImageEuImaging.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56316](https://jira.hl7.org/browse/FHIR-56316) | Should the Observation Gestational Age profile use the same coding approach acro | Triaged | Question | 4/9/26 |  |  |  |

## 11.23.1 CarePlan obligation profile (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56758](https://jira.hl7.org/browse/FHIR-56758) | CarePlan obligation profile is sparse; not obvious what it represents in imaging | Triaged | Change Request | 4/30/26 |  |  |  |

## §11.24 ImagingStudy: General (2)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/StructureDefinition-ImagingStudyEuImaging.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/StructureDefinition-ImagingStudyEuImaging.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/StructureDefinition-ImagingStudyEuImaging.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/StructureDefinition-ImagingStudyEuImaging.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56729](https://jira.hl7.org/browse/FHIR-56729) | Extend ObservationFindingEuImaging value set with OBX-3-style codes (Impression, | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56594](https://jira.hl7.org/browse/FHIR-56594) | Check identifier:observationUid | Triaged | Change Request | 4/28/26 |  |  |  |

## §11.25 ImagingStudy: General: Obligations (4)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/StructureDefinition-imaging-study-obligation-eu-imaging.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/StructureDefinition-imaging-study-obligation-eu-imaging.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/StructureDefinition-imaging-study-obligation-eu-imaging.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/StructureDefinition-imaging-study-obligation-eu-imaging.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56715](https://jira.hl7.org/browse/FHIR-56715) | Modeling and use of the Observation: Radiation Dose profile | Triaged | Question | 4/30/26 |  |  |  |
| [FHIR-56727](https://jira.hl7.org/browse/FHIR-56727) | Profile requires dicomSrInstance 1..1 and derivedFrom 1..*; relax both to 0..* | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56612](https://jira.hl7.org/browse/FHIR-56612) | Revise Radiation Dose Observation | Triaged | Change Request | 4/29/26 |  |  |  |
| [FHIR-56406](https://jira.hl7.org/browse/FHIR-56406) | Two extensions for radiation dose | Triaged | Change Request | 4/21/26 |  |  |  |

## 11.25.1.1 ImagingStudy obligation profile (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56733](https://jira.hl7.org/browse/FHIR-56733) | ImagingStudy obligations on the Imaging Report Provider include image-level data | Triaged | Change Request | 4/30/26 |  |  |  |

## 11.30.1.1 (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56762](https://jira.hl7.org/browse/FHIR-56762) | SHOULD:able-to-populate on derivedFrom is unclear; remove or specify a narrower  | Triaged | Change Request | 4/30/26 |  |  |  |

## §11.33 Procedure: Imaging Acquisition (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/StructureDefinition-ProcedureEuImaging.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/StructureDefinition-ServiceRequestOrderEuImaging.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/StructureDefinition-ProcedureEuImaging.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/StructureDefinition-ServiceRequestOrderEuImaging.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56730](https://jira.hl7.org/browse/FHIR-56730) | HL7IDRCommunication is a bare 0..1 Reference with no target type; cannot carry m | Triaged | Change Request | 4/30/26 |  |  |  |

## §11.35 ServiceRequest: Imaging Order (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/StructureDefinition-ServiceRequestOrderEuImaging.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/StructureDefinition-AccessionNumberIdentifierEuImaging.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/StructureDefinition-ServiceRequestOrderEuImaging.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/StructureDefinition-AccessionNumberIdentifierEuImaging.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56728](https://jira.hl7.org/browse/FHIR-56728) | Extensible SNOMED binding on Procedure.code requires extensive mapping; allow LO | Triaged | Change Request | 4/30/26 |  |  |  |

## §11.51 Extension: Number of Frames (2)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/StructureDefinition-NumberOfFrames.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/ValueSet-valueset-diagnosticreport-report-support-info.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/StructureDefinition-NumberOfFrames.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/ValueSet-valueset-diagnosticreport-report-support-info.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56757](https://jira.hl7.org/browse/FHIR-56757) | 11-code CodeSystem for DICOM concepts duplicates fhir.dicom; remove duplicates | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56613](https://jira.hl7.org/browse/FHIR-56613) | Clarify the usage of the DICOM missing terms | Triaged | Change Request | 4/29/26 |  |  |  |

## §11.54 ValueSet: DiagnosticReport supportInfo codes (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/ValueSet-valueset-diagnosticreport-report-support-info.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/ValueSet-im-imaging-study-performer-type.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/ValueSet-valueset-diagnosticreport-report-support-info.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/ValueSet-im-imaging-study-performer-type.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56586](https://jira.hl7.org/browse/FHIR-56586) | Revise Imaging Report Bundle | Triaged | Change Request | 4/28/26 |  |  |  |

## §11.56 ValueSet: Imaging Procedure Type (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/ValueSet-im-procedure-type.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/ValueSet-SectionEmptyReasonEuImaging.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/ValueSet-im-procedure-type.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/ValueSet-SectionEmptyReasonEuImaging.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56740](https://jira.hl7.org/browse/FHIR-56740) | informationRecipient on Composition is ambiguous; tie it to a specific clinical  | Triaged | Change Request | 4/30/26 |  |  |  |

## §11.58 ValueSet: Radiology Report Types (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/ValueSet-ImagingReportTypesEuVSEuImaging.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/CodeSystem-codesystem-diagnostic-report-support-info.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/ValueSet-ImagingReportTypesEuVSEuImaging.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/CodeSystem-codesystem-diagnostic-report-support-info.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56589](https://jira.hl7.org/browse/FHIR-56589) | Revise the Diagnostic Report profile | Triaged | Change Request | 4/28/26 |  |  |  |

## §11.59 ValueSet: Reasons a section in an imaging report is empty. (1)

[R4 ballot](https://hl7.eu/fhir/imaging/1.0.0-ballot/en/ValueSet-SectionEmptyReasonEuImaging.html) | [R5 ballot](https://hl7.eu/fhir/imaging-r5/1.0.0-ballot/en/CodeSystem-codesystem-missing-dicom-terminology.html) | [R4 build](https://build.fhir.org/ig/hl7-eu/imaging-r4/en/ValueSet-SectionEmptyReasonEuImaging.html) | [R5 build](https://build.fhir.org/ig/hl7-eu/imaging-r5/en/CodeSystem-codesystem-missing-dicom-terminology.html)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56587](https://jira.hl7.org/browse/FHIR-56587) | Please revise composition profile | Triaged | Change Request | 4/28/26 |  |  |  |

## AdverseEvent: Imaging Adverse Event (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56325](https://jira.hl7.org/browse/FHIR-56325) | Remaining TODOs in AdverseEventEuImaging profile | Waiting for Input | Change Request | 4/10/26 |  |  |  |

## All (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56576](https://jira.hl7.org/browse/FHIR-56576) | Number the figures | Triaged | Change Request | 4/28/26 |  |  |  |

## artifacts-structural — Identifier description (2)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56743](https://jira.hl7.org/browse/FHIR-56743) | Identifier.value description states "the value that is unique"; accession is not | Submitted | Technical Correction | 4/30/26 |  |  |  |
| [FHIR-56743](https://jira.hl7.org/browse/FHIR-56743) | Identifier.value description states "the value that is unique"; accession is not | Applied | Technical Correction | 4/30/26 |  |  |  |

## Composition obligation profile (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56776](https://jira.hl7.org/browse/FHIR-56776) | Editorial: section:comparison description text is "History"; should be "Comparis | Applied | Technical Correction | 4/30/26 |  |  |  |

## Composition: Imaging Report (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56355](https://jira.hl7.org/browse/FHIR-56355) | Mandatory sections in the Composition | Triaged | Change Request | 4/15/26 |  |  |  |

## DiagnosticReportEuImaging (2)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56773](https://jira.hl7.org/browse/FHIR-56773) | Editorial: DiagnosticReportEuImaging profile uses MS rather than the obligation  | Triaged | Change Request | 4/30/26 |  |  |  |
| [FHIR-56774](https://jira.hl7.org/browse/FHIR-56774) | Editorial: DR.basedOn includes ImmunizationRecommendation, MedicationRequest, Nu | Triaged | Change Request | 4/30/26 |  |  |  |

## DocumentReferenceImagingReport (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56756](https://jira.hl7.org/browse/FHIR-56756) | Modality extension is 1..1; relax to 1..* for PET-CT, SPECT-CT, PET-MR | Submitted | Change Request | 4/30/26 |  |  |  |

## EhrxfImagingDocumentAccessProvider (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56749](https://jira.hl7.org/browse/FHIR-56749) | EhrxfImagingDocumentAccessProvider mixes SHALL and SHOULD inconsistently | Waiting for Input | Technical Correction | 4/30/26 |  |  |  |

## Identifier: Accession Number (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56289](https://jira.hl7.org/browse/FHIR-56289) | Further refinement needed (in alignment with MADO) on imaging order | Triaged | Change Request | 4/7/26 |  |  |  |

## ImagingStudy obligation profile (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56732](https://jira.hl7.org/browse/FHIR-56732) | ImagingStudy.status has a MAY obligation but cardinality 1..1; align them | Triaged | Change Request | 4/30/26 |  |  |  |

## ImagingStudyEuImaging (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56745](https://jira.hl7.org/browse/FHIR-56745) | Combination procedures involve multiple imaging sets; cardinality should be 0..* | Triaged | Change Request | 4/30/26 |  |  |  |

## IP statements (2)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56554](https://jira.hl7.org/browse/FHIR-56554) | Page "About --> Copyright" empty | Submitted | Technical Correction | 4/28/26 |  |  |  |
| [FHIR-56554](https://jira.hl7.org/browse/FHIR-56554) | Page "About --> Copyright" empty | Applied | Technical Correction | 4/28/26 |  |  |  |

## MedicationAdministration obligation profile (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56734](https://jira.hl7.org/browse/FHIR-56734) | partOf accepts MedicationAdministration as a target and is conformant; clarify w | Submitted | Change Request | 4/30/26 |  |  |  |

## Navigation (2)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56766](https://jira.hl7.org/browse/FHIR-56766) | Editorial: menu ordering doesn't match IG-builder ordering | Submitted | Technical Correction | 4/30/26 | [proposal](./open/FHIR-56766/FHIR-56766-resolution.md) |  | Pending (recommended: A) |
| [FHIR-56766](https://jira.hl7.org/browse/FHIR-56766) | Editorial: menu ordering doesn't match IG-builder ordering | Applied | Technical Correction | 4/30/26 |  |  |  |

## Obligations (2)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56551](https://jira.hl7.org/browse/FHIR-56551) | Profile reference not resolved | Submitted | Technical Correction | 4/28/26 |  |  |  |
| [FHIR-56551](https://jira.hl7.org/browse/FHIR-56551) | Profile reference not resolved | Applied | Technical Correction | 4/28/26 |  |  |  |

## Resource Access Provider + Consumer CapabilityStatements (2)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56750](https://jira.hl7.org/browse/FHIR-56750) | Phrasing is circular ("if supported, must support"); rewrite to specify what tri | Submitted | Technical Correction | 4/30/26 | [proposal](./open/FHIR-56750/FHIR-56750-resolution.md) | [implementation](./open/FHIR-56750/FHIR-56750-implementation-plan.md) | Pending (recommended: A) |
| [FHIR-56750](https://jira.hl7.org/browse/FHIR-56750) | Phrasing is circular ("if supported, must support"); rewrite to specify what tri | Applied | Technical Correction | 4/30/26 |  |  |  |

## ServiceRequestOrderEuImaging + ObservationFindingEuImaging (1)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56736](https://jira.hl7.org/browse/FHIR-56736) | Observation.basedOn accession.identifier is 1..1 but ServiceRequestOrder doesn't | Submitted | Change Request | 4/30/26 |  |  |  |

## Unknown Section (12)

| Key | Summary | Status | Issue Type | Created | Proposal | Implementation | Result |
|-----|---------|--------|------------|---------|----------|----------------|--------|
| [FHIR-56552](https://jira.hl7.org/browse/FHIR-56552) | Improve explanation about exchange approaches | Triaged | Change Request | 4/28/26 | [proposal](./open/FHIR-56552/FHIR-56552-resolution.md) |  | Pending (recommended: A) |
| [FHIR-56553](https://jira.hl7.org/browse/FHIR-56553) | Diagrams contain HTML elements | Triaged | Technical Correction | 4/28/26 | [proposal](./open/FHIR-56553/FHIR-56553-resolution.md) |  | Pending (recommended: A) |
| [FHIR-56557](https://jira.hl7.org/browse/FHIR-56557) | Suggested editorial changes | Submitted | Technical Correction | 4/28/26 | [proposal](./closed/FHIR-56557/FHIR-56557-resolution.md) |  | Superseded by Applied row (recommended: B) |
| [FHIR-56557](https://jira.hl7.org/browse/FHIR-56557) | Suggested editorial changes | Applied | Technical Correction | 4/28/26 | [proposal](./closed/FHIR-56557/FHIR-56557-resolution.md) |  | Pending (Applied in Jira; evidence missing; recommended: B) |
| [FHIR-56569](https://jira.hl7.org/browse/FHIR-56569) | typo in §3.3.1 | Submitted | Technical Correction | 4/28/26 | [proposal](./open/FHIR-56569/FHIR-56569-resolution.md) |  | Pending (recommended: A) |
| [FHIR-56569](https://jira.hl7.org/browse/FHIR-56569) | typo in §3.3.1 | Applied | Technical Correction | 4/28/26 | [proposal](./closed/FHIR-56569/FHIR-56569-resolution.md) |  | Applied (Persuasive; recommended: A) |
| [FHIR-56593](https://jira.hl7.org/browse/FHIR-56593) | wrong title for code systems | Applied | Technical Correction | 4/28/26 | [proposal](./closed/FHIR-56593/FHIR-56593-resolution.md) |  | Applied (Persuasive; recommended: A) |
| [FHIR-56372](https://jira.hl7.org/browse/FHIR-56372) | Absence of an Encounter profile in the Imaging Guide | Resolved - No Change | Question | 4/16/26 | [proposal](./closed/FHIR-56372/FHIR-56372-resolution.md) |  | Declined (question answered; no profile required) |
| [FHIR-56324](https://jira.hl7.org/browse/FHIR-56324) | References to FHIR standard resources | Waiting for Input | Question | 4/10/26 | [proposal](./open/FHIR-56324/FHIR-56324-resolution.md) |  | Pending (recommended: B) |
| [FHIR-56315](https://jira.hl7.org/browse/FHIR-56315) | Broken links in the HL7 Europe Imaging Report documentation | Applied | Technical Correction | 4/9/26 | [proposal](./closed/FHIR-56315/FHIR-56315-resolution.md) |  | Applied (Persuasive; recommended: A) |
| [FHIR-56317](https://jira.hl7.org/browse/FHIR-56317) | Clarification on the use of fixed values | Triaged | Question | 4/9/26 | [proposal](./open/FHIR-56317/FHIR-56317-resolution.md) |  | Pending (recommended: A) |
| [FHIR-56306](https://jira.hl7.org/browse/FHIR-56306) | Relationship with IHE MADO needs to be clarified | Waiting for Input | Change Request | 4/8/26 | [proposal](./open/FHIR-56306/FHIR-56306-resolution.md) |  | Pending (recommended: A) |

## Appendix: Excluded Tickets

### Excluded by Date (141)
Tickets with Created date before 2026-03-30.


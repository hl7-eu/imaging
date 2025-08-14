<!--
  Generated file. Do not edit.
-->

---
title: EHDSAllergyIntolerance Mapping
---

### EHDSAllergyIntolerance

The following table shows the mapping from EHDSAllergyIntolerance logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| agentOrAllergen | EuAllergyIntolerance.code ; EuAllergyIntolerance.reaction.substance |  |
| [authorEHDSDevice](#ehdsdevice) |  |  |
| [authorEHDSHealthProfessional](#ehdshealthprofessional) |  |  |
| [authorEHDSOrganisation](#ehdsorganisation) |  |  |
| certainty | EuAllergyIntolerance.verificationStatus |  |
| criticality | EuAllergyIntolerance.criticality |  |
| description | EuAllergyIntolerance.text |  |
| endDate | EuAllergyIntolerance.extension[abatement].valueDateTime |  |
| header |  |  |
| header.authorship |  |  |
| header.authorship.datetime | EuAllergyIntolerance.recordedDate |  |
| header.identifier | EuAllergyIntolerance.identifier |  |
| header.language | EuAllergyIntolerance.language |  |
| header.lastUpdate | EuAllergyIntolerance.meta.lastUpdated |  |
| header.status | EuAllergyIntolerance.verificationStatus |  |
| header.statusReasonCodeableConcept | EuAllergyIntolerance.verificationStatus.coding |  |
| header.statusReasonString |  |  |
| [header.subject](#ehdspatient) | EuAllergyIntolerance.patient |  |
| header.version | EuAllergyIntolerance.meta.versionId |  |
| onsetDate | EuAllergyIntolerance.onsetPeriod ; EuAllergyIntolerance.onsetDateTime |  |
| [presentedForm](#ehdsattachment) | EuAllergyIntolerance.text |  |
| reaction | EuAllergyIntolerance.reaction |  |
| reaction.date | EuAllergyIntolerance.reaction.onset |  |
| reaction.manifestation | EuAllergyIntolerance.reaction.manifestation |  |
| reaction.onsetDate |  |  |
| reaction.severity | EuAllergyIntolerance.reaction.severity |  |
| status | EuAllergyIntolerance.clinicalStatus |  |
| typeOfPropensity | EuAllergyIntolerance.type |  |


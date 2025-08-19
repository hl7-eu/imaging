<!--
  Generated file. Do not edit.
-->

#### EHDSAllergyIntolerance

The following table shows the mapping from EHDSAllergyIntolerance logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSAllergyIntolerance.header |  |  |
| EHDSAllergyIntolerance.[header.subject](#ehdspatient) | EuAllergyIntolerance.patient |  |
| EHDSAllergyIntolerance.header.identifier | EuAllergyIntolerance.identifier |  |
| EHDSAllergyIntolerance.header.authorship |  |  |
| EHDSAllergyIntolerance.[authorEHDSHealthProfessional](#ehdshealthprofessional) |  |  |
| EHDSAllergyIntolerance.[authorEHDSOrganisation](#ehdsorganisation) |  |  |
| EHDSAllergyIntolerance.[authorEHDSDevice](#ehdsdevice) |  |  |
| EHDSAllergyIntolerance.header.authorship.datetime | EuAllergyIntolerance.recordedDate |  |
| EHDSAllergyIntolerance.header.lastUpdate | EuAllergyIntolerance.meta.lastUpdated |  |
| EHDSAllergyIntolerance.header.status | EuAllergyIntolerance.verificationStatus |  |
| EHDSAllergyIntolerance.header.statusReasonCodeableConcept | EuAllergyIntolerance.verificationStatus.coding |  |
| EHDSAllergyIntolerance.header.statusReasonString |  |  |
| EHDSAllergyIntolerance.header.language | EuAllergyIntolerance.language |  |
| EHDSAllergyIntolerance.header.version | EuAllergyIntolerance.meta.versionId |  |
| EHDSAllergyIntolerance.[presentedForm](#ehdsattachment) | EuAllergyIntolerance.text |  |
| EHDSAllergyIntolerance.agentOrAllergen | EuAllergyIntolerance.code ; EuAllergyIntolerance.reaction.substance |  |
| EHDSAllergyIntolerance.typeOfPropensity | EuAllergyIntolerance.type |  |
| EHDSAllergyIntolerance.description | EuAllergyIntolerance.text |  |
| EHDSAllergyIntolerance.criticality | EuAllergyIntolerance.criticality |  |
| EHDSAllergyIntolerance.certainty | EuAllergyIntolerance.verificationStatus |  |
| EHDSAllergyIntolerance.status | EuAllergyIntolerance.clinicalStatus |  |
| EHDSAllergyIntolerance.onsetDate | EuAllergyIntolerance.onsetPeriod ; EuAllergyIntolerance.onsetDateTime |  |
| EHDSAllergyIntolerance.endDate | EuAllergyIntolerance.extension[abatement].valueDateTime |  |
| EHDSAllergyIntolerance.reaction | EuAllergyIntolerance.reaction |  |
| EHDSAllergyIntolerance.reaction.manifestation | EuAllergyIntolerance.reaction.manifestation |  |
| EHDSAllergyIntolerance.reaction.date | EuAllergyIntolerance.reaction.onset |  |
| EHDSAllergyIntolerance.reaction.severity | EuAllergyIntolerance.reaction.severity |  |
| EHDSAllergyIntolerance.reaction.onsetDate |  |  |


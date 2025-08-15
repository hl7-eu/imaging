<!--
  Generated file. Do not edit.
-->

#### EHDSAllergyIntolerance

The following table shows the mapping from EHDSAllergyIntolerance logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| header |  |  |
| [header.subject](#ehdspatient) | EuAllergyIntolerance.patient |  |
| header.identifier | EuAllergyIntolerance.identifier |  |
| header.authorship |  |  |
| [authorEHDSHealthProfessional](#ehdshealthprofessional) |  |  |
| [authorEHDSOrganisation](#ehdsorganisation) |  |  |
| [authorEHDSDevice](#ehdsdevice) |  |  |
| header.authorship.datetime | EuAllergyIntolerance.recordedDate |  |
| header.lastUpdate | EuAllergyIntolerance.meta.lastUpdated |  |
| header.status | EuAllergyIntolerance.verificationStatus |  |
| header.statusReasonCodeableConcept | EuAllergyIntolerance.verificationStatus.coding |  |
| header.statusReasonString |  |  |
| header.language | EuAllergyIntolerance.language |  |
| header.version | EuAllergyIntolerance.meta.versionId |  |
| [presentedForm](#ehdsattachment) | EuAllergyIntolerance.text |  |
| agentOrAllergen | EuAllergyIntolerance.code ; EuAllergyIntolerance.reaction.substance |  |
| typeOfPropensity | EuAllergyIntolerance.type |  |
| description | EuAllergyIntolerance.text |  |
| criticality | EuAllergyIntolerance.criticality |  |
| certainty | EuAllergyIntolerance.verificationStatus |  |
| status | EuAllergyIntolerance.clinicalStatus |  |
| onsetDate | EuAllergyIntolerance.onsetPeriod ; EuAllergyIntolerance.onsetDateTime |  |
| endDate | EuAllergyIntolerance.extension[abatement].valueDateTime |  |
| reaction | EuAllergyIntolerance.reaction |  |
| reaction.manifestation | EuAllergyIntolerance.reaction.manifestation |  |
| reaction.date | EuAllergyIntolerance.reaction.onset |  |
| reaction.severity | EuAllergyIntolerance.reaction.severity |  |
| reaction.onsetDate |  |  |


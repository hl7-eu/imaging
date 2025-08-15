<!--
  Generated file. Do not edit.
-->

#### EHDSCondition

The following table shows the mapping from EHDSCondition logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| header |  |  |
| [header.subject](#ehdspatient) | EuCondition.subject |  |
| header.identifier | EuCondition.identifier |  |
| header.authorship |  |  |
| header.authorship.author[x] ([EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSDevice](#ehdsdevice)) | EuCondition.participant |  |
| header.authorship.datetime | EuCondition.recordedDate |  |
| header.lastUpdate | EuCondition.meta.lastUpdated |  |
| header.status |  | The status of the information is covered by the mapping of ProblemStatus and DiagnosticAssertionStatus. The resource instance status is handled by the server and is opaque to the information modeling. |
| header.statusReason[x] | EuCondition.extension[status-reason] ; EuCondition.extension[status-reason].valueCodeableConcept.text |  |
| header.language | EuCondition.language |  |
| header.version | EuCondition.meta.versionId |  |
| [presentedForm](#ehdsattachment) | EuCondition.text |  |
| problem | EuCondition.code |  |
| onsetDate | EuCondition.onset[x] |  |
| endDate | EuCondition.abatement[x] |  |
| category | EuCondition.category |  |
| problemStatus | EuCondition.clinicalStatus |  |
| resolutionCircumstances | EuCondition.evidence.concept |  |
| severity | EuCondition.severity |  |
| [anatomicLocation](StructureDefinition-EHDSBodyStructure.html) | EuCondition.bodySite |  |
| stage | EuCondition.stage |  |
| diagnosisAssertionStatus | EuCondition.verificationStatus |  |
| [asserter](#ehdshealthprofessional) |  | The meaning of this field is not clear. If it's the author it is mapped in the participant element |
| assertedDate |  |  |
| [specialistContact](#ehdshealthprofessional) | EuCondition.participant.extension[specialist-contact] |  |
| externalResource | EuCondition.evidence |  |


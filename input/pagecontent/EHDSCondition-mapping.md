<!--
  Generated file. Do not edit.
-->

#### EHDSCondition

The following table shows the mapping from EHDSCondition logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSCondition.header |  |  |
| EHDSCondition.[header.subject](#ehdspatient) | EuCondition.subject |  |
| EHDSCondition.header.identifier | EuCondition.identifier |  |
| EHDSCondition.header.authorship |  |  |
| EHDSCondition.header.authorship.author[x] ([EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSDevice](#ehdsdevice)) | EuCondition.participant |  |
| EHDSCondition.header.authorship.datetime | EuCondition.recordedDate |  |
| EHDSCondition.header.lastUpdate | EuCondition.meta.lastUpdated |  |
| EHDSCondition.header.status |  | The status of the information is covered by the mapping of ProblemStatus and DiagnosticAssertionStatus. The resource instance status is handled by the server and is opaque to the information modeling. |
| EHDSCondition.header.statusReason[x] | EuCondition.extension[status-reason] ; EuCondition.extension[status-reason].valueCodeableConcept.text |  |
| EHDSCondition.header.language | EuCondition.language |  |
| EHDSCondition.header.version | EuCondition.meta.versionId |  |
| EHDSCondition.[presentedForm](#ehdsattachment) | EuCondition.text |  |
| EHDSCondition.problem | EuCondition.code |  |
| EHDSCondition.onsetDate | EuCondition.onset[x] |  |
| EHDSCondition.endDate | EuCondition.abatement[x] |  |
| EHDSCondition.category | EuCondition.category |  |
| EHDSCondition.problemStatus | EuCondition.clinicalStatus |  |
| EHDSCondition.resolutionCircumstances | EuCondition.evidence.concept |  |
| EHDSCondition.severity | EuCondition.severity |  |
| EHDSCondition.[anatomicLocation](StructureDefinition-EHDSBodyStructure.html) | EuCondition.bodySite |  |
| EHDSCondition.stage | EuCondition.stage |  |
| EHDSCondition.diagnosisAssertionStatus | EuCondition.verificationStatus |  |
| EHDSCondition.[asserter](#ehdshealthprofessional) |  | The meaning of this field is not clear. If it's the author it is mapped in the participant element |
| EHDSCondition.assertedDate |  |  |
| EHDSCondition.[specialistContact](#ehdshealthprofessional) | EuCondition.participant.extension[specialist-contact] |  |
| EHDSCondition.externalResource | EuCondition.evidence |  |


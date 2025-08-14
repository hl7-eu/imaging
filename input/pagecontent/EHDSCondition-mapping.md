<!--
  Generated file. Do not edit.
-->

---
title: EHDSCondition Mapping
---

### EHDSCondition

The following table shows the mapping from EHDSCondition logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| [anatomicLocation](#ehdsbodystructure) | EuCondition.bodySite |  |
| assertedDate |  |  |
| [asserter](#ehdshealthprofessional) |  | The meaning of this field is not clear. If it's the author it is mapped in the participant element |
| category | EuCondition.category |  |
| diagnosisAssertionStatus | EuCondition.verificationStatus |  |
| endDate | EuCondition.abatement[x] |  |
| externalResource | EuCondition.evidence |  |
| header |  |  |
| header.authorship |  |  |
| [header.authorship.author[x]](#ehdsdevice) | EuCondition.participant |  |
| header.authorship.datetime | EuCondition.recordedDate |  |
| header.identifier | EuCondition.identifier |  |
| header.language | EuCondition.language |  |
| header.lastUpdate | EuCondition.meta.lastUpdated |  |
| header.status |  | The status of the information is covered by the mapping of ProblemStatus and DiagnosticAssertionStatus. The resource instance status is handled by the server and is opaque to the information modeling. |
| header.statusReason[x] | EuCondition.extension[status-reason] ; EuCondition.extension[status-reason].valueCodeableConcept.text |  |
| [header.subject](#ehdspatient) | EuCondition.subject |  |
| header.version | EuCondition.meta.versionId |  |
| onsetDate | EuCondition.onset[x] |  |
| [presentedForm](#ehdsattachment) | EuCondition.text |  |
| problem | EuCondition.code |  |
| problemStatus | EuCondition.clinicalStatus |  |
| resolutionCircumstances | EuCondition.evidence.concept |  |
| severity | EuCondition.severity |  |
| [specialistContact](#ehdshealthprofessional) | EuCondition.participant.extension[specialist-contact] |  |
| stage | EuCondition.stage |  |


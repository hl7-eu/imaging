<!--
  Generated file. Do not edit.
-->

#### EHDSServiceRequest

The following table shows the mapping from EHDSServiceRequest logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| header |  |  |
| [header.subject](#ehdspatient) | EuServiceRequest.subject |  |
| header.identifier | EuServiceRequest.identifier |  |
| header.authorship | EuServiceRequest.requester |  |
| header.authorship.author[x] ([EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSDevice](#ehdsdevice)) | EuServiceRequest.performer |  |
| header.authorship.datetime | EuServiceRequest.occurrenceDateTime |  |
| header.lastUpdate | EuServiceRequest.meta.lastUpdated |  |
| header.status | EuServiceRequest.status |  |
| header.statusReason[x] | EuServiceRequest.extension[status-reason] ; EuServiceRequest.extension[status-reason].valueCodeableConcept.text |  |
| header.language | EuServiceRequest.language |  |
| header.version | EuServiceRequest.meta.versionId |  |
| [presentedForm](#ehdsattachment) | EuServiceRequest.text |  |
| serviceText | EuServiceRequest.text |  |
| serviceCode | EuServiceRequest.code.concept |  |
| reasonCode | EuServiceRequest.reason.concept |  |
| quantity | EuServiceRequest.quantityQuantity |  |
| [anatomicLocation](#ehdsbodystructure) | EuServiceRequest.bodySite |  |
| reasonReference[x] ([EHDSObservation](#ehdsobservation), [EHDSCondition](#ehdscondition), [EHDSMedication](#ehdsmedication)) | EuServiceRequest.reason.reference |  |
| priority | EuServiceRequest.priority |  |
| supportingInformation[x] ([EHDSObservation](#ehdsobservation), [EHDSCondition](#ehdscondition), [EHDSProcedure](#ehdsprocedure), [EHDSMedicationAdministration](#ehdsmedicationadministration)) | EuServiceRequest.supportingInfo |  |
| [specimen](#ehdsspecimen) | EuServiceRequest.specimen |  |
| [encounter](#ehdsencounter) | EuServiceRequest.encounter |  |
| occurrence[x] | EuServiceRequest.occurrenceDateTime ; EuServiceRequest.occurrencePeriod |  |
| patientInstructions | EuServiceRequest.patientInstruction.instructionMarkdown |  |
| [coverage](#ehdscoverage) | EuServiceRequest.insurance |  |


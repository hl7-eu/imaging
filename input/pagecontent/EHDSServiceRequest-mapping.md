<!--
  Generated file. Do not edit.
-->

#### EHDSServiceRequest

The following table shows the mapping from EHDSServiceRequest logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSServiceRequest.header |  |  |
| EHDSServiceRequest.[header.subject](#ehdspatient) | EuServiceRequest.subject |  |
| EHDSServiceRequest.header.identifier | EuServiceRequest.identifier |  |
| EHDSServiceRequest.header.authorship | EuServiceRequest.requester |  |
| EHDSServiceRequest.header.authorship.author[x] ([EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSDevice](#ehdsdevice)) | EuServiceRequest.performer |  |
| EHDSServiceRequest.header.authorship.datetime | EuServiceRequest.occurrenceDateTime |  |
| EHDSServiceRequest.header.lastUpdate | EuServiceRequest.meta.lastUpdated |  |
| EHDSServiceRequest.header.status | EuServiceRequest.status |  |
| EHDSServiceRequest.header.statusReason[x] | EuServiceRequest.extension[status-reason] ; EuServiceRequest.extension[status-reason].valueCodeableConcept.text |  |
| EHDSServiceRequest.header.language | EuServiceRequest.language |  |
| EHDSServiceRequest.header.version | EuServiceRequest.meta.versionId |  |
| EHDSServiceRequest.[presentedForm](#ehdsattachment) | EuServiceRequest.text |  |
| EHDSServiceRequest.serviceText | EuServiceRequest.text |  |
| EHDSServiceRequest.serviceCode | EuServiceRequest.code.concept |  |
| EHDSServiceRequest.reasonCode | EuServiceRequest.reason.concept |  |
| EHDSServiceRequest.quantity | EuServiceRequest.quantityQuantity |  |
| EHDSServiceRequest.[anatomicLocation](StructureDefinition-EHDSBodyStructure.html) | EuServiceRequest.bodySite |  |
| EHDSServiceRequest.reasonReference[x] ([EHDSObservation](#ehdsobservation), [EHDSCondition](#ehdscondition), [EHDSMedication](StructureDefinition-EHDSMedication.html)) | EuServiceRequest.reason.reference |  |
| EHDSServiceRequest.priority | EuServiceRequest.priority |  |
| EHDSServiceRequest.supportingInformation[x] ([EHDSObservation](#ehdsobservation), [EHDSCondition](#ehdscondition), [EHDSProcedure](#ehdsprocedure), [EHDSMedicationAdministration](#ehdsmedicationadministration)) | EuServiceRequest.supportingInfo |  |
| EHDSServiceRequest.[specimen](StructureDefinition-EHDSSpecimen.html) | EuServiceRequest.specimen |  |
| EHDSServiceRequest.[encounter](#ehdsencounter) | EuServiceRequest.encounter |  |
| EHDSServiceRequest.occurrence[x] | EuServiceRequest.occurrenceDateTime ; EuServiceRequest.occurrencePeriod |  |
| EHDSServiceRequest.patientInstructions | EuServiceRequest.patientInstruction.instructionMarkdown |  |
| EHDSServiceRequest.[coverage](#ehdscoverage) | EuServiceRequest.insurance |  |


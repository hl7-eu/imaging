<!--
  Generated file. Do not edit.
-->

---
title: EHDSServiceRequest Mapping
---

### EHDSServiceRequest

The following table shows the mapping from EHDSServiceRequest logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| [anatomicLocation](#ehdsbodystructure) | EuServiceRequest.bodySite |  |
| [coverage](#ehdscoverage) | EuServiceRequest.insurance |  |
| [encounter](#ehdsencounter) | EuServiceRequest.encounter |  |
| header |  |  |
| header.authorship | EuServiceRequest.requester |  |
| [header.authorship.author[x]](#ehdsdevice) | EuServiceRequest.performer |  |
| header.authorship.datetime | EuServiceRequest.occurrenceDateTime |  |
| header.identifier | EuServiceRequest.identifier |  |
| header.language | EuServiceRequest.language |  |
| header.lastUpdate | EuServiceRequest.meta.lastUpdated |  |
| header.status | EuServiceRequest.status |  |
| header.statusReason[x] | EuServiceRequest.extension[status-reason] ; EuServiceRequest.extension[status-reason].valueCodeableConcept.text |  |
| [header.subject](#ehdspatient) | EuServiceRequest.subject |  |
| header.version | EuServiceRequest.meta.versionId |  |
| occurrence[x] | EuServiceRequest.occurrenceDateTime ; EuServiceRequest.occurrencePeriod |  |
| patientInstructions | EuServiceRequest.patientInstruction.instructionMarkdown |  |
| [presentedForm](#ehdsattachment) | EuServiceRequest.text |  |
| priority | EuServiceRequest.priority |  |
| quantity | EuServiceRequest.quantityQuantity |  |
| reasonCode | EuServiceRequest.reason.concept |  |
| [reasonReference[x]](#ehdsmedication) | EuServiceRequest.reason.reference |  |
| serviceCode | EuServiceRequest.code.concept |  |
| serviceText | EuServiceRequest.text |  |
| [specimen](#ehdsspecimen) | EuServiceRequest.specimen |  |
| [supportingInformation[x]](#ehdsmedicationadministration) | EuServiceRequest.supportingInfo |  |


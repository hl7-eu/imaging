<!--
  Generated file. Do not edit.
-->

---
title: EHDSEncounter Mapping
---

### EHDSEncounter

The following table shows the mapping from EHDSEncounter logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| actualPeriod | EuEncounter.actualPeriod |  |
| admission | EuEncounter.admission |  |
| admission.admitSource | EuEncounter.admission.admitSource |  |
| [admission.admitter](#ehdshealthprofessional) | EuEncounter.participant[admitter].actor |  |
| admission.legalStatus |  |  |
| admission.reasonComment |  |  |
| [admission.reason[x]](#ehdsobservation) | EuEncounter.reason.value.reference |  |
| [admission.referringProfessional](#ehdshealthprofessional) | EuEncounter.participant[referrer].actor |  |
| [basedOn[x]](#ehdsservicerequest) | EuEncounter.basedOn |  |
| discharge | EuEncounter.admission.dischargeDisposition |  |
| [discharge.destinationLocation[x]](#ehdslocation) | EuEncounter.admission.destination |  |
| discharge.destinationType | EuEncounter.admission.dischargeDisposition |  |
| [episodeOfCare](#ehdsepisodeofcare) | EuEncounter.episodeOfCare |  |
| header |  |  |
| header.authorship |  |  |
| [header.authorship.author[x]](#ehdsdevice) |  | Not a clear mapping for this element, as encounters are not documents, and don't have an author. |
| header.authorship.datetime |  | Not a clear mapping, will need an extension |
| header.identifier | EuEncounter.identifier |  |
| header.language | EuEncounter.language |  |
| header.lastUpdate | EuEncounter.meta.lastUpdated |  |
| header.status | EuEncounter.status |  |
| header.statusReason[x] | EuEncounter.extension[status-reason] ; EuEncounter.extension[status-reason].valueCodeableConcept.text |  |
| [header.subject](#ehdspatient) | EuEncounter.subject |  |
| header.version | EuEncounter.meta.versionId |  |
| location | EuEncounter.location |  |
| [location.organisationPart[x]](#ehdslocation) | EuEncounter.location.location |  |
| location.period | EuEncounter.location.period |  |
| note | EuEncounter.extension[note] |  |
| [partOf](#ehdsencounter) | EuEncounter.partOf |  |
| plannedEndDate | EuEncounter.plannedEndDate |  |
| plannedStartDate | EuEncounter.plannedStartDate |  |
| [presentedForm](#ehdsattachment) | EuEncounter.text |  |
| priority | EuEncounter.priority |  |
| [serviceProvider](#ehdsorganisation) | EuEncounter.serviceProvider |  |
| type | EuEncounter.type |  |


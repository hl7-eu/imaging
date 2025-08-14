<!--
  Generated file. Do not edit.
-->

---
title: EHDSProcedure Mapping
---

### EHDSProcedure

The following table shows the mapping from EHDSProcedure logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| [bodySite](#ehdsbodystructure) | EuProcedure.bodySite |  |
| code | EuProcedure.code |  |
| complication | EuProcedure.complication.concept |  |
| date[x] | EuProcedure.occurrenceDateTime ; EuProcedure.occurrencePeriod |  |
| [deviceUsed](#ehdsdevice) | EuProcedure.used[device] |  |
| [focalDevice](#ehdsdevice) | EuProcedure.focalDevice.manipulated |  |
| header |  |  |
| header.authorship | EuProcedure.performer |  |
| [header.authorship.author[x]](#ehdsdevice) | EuProcedure.performer.actor |  |
| header.authorship.datetime | EuProcedure.occurrenceDateTime |  |
| header.identifier | EuProcedure.identifier |  |
| header.language | EuProcedure.language |  |
| header.lastUpdate | EuProcedure.meta.lastUpdated |  |
| header.status | EuProcedure.status |  |
| header.statusReason[x] | EuProcedure.statusReason.coding ; EuProcedure.statusReason.text |  |
| [header.subject](#ehdspatient) | EuProcedure.subject |  |
| header.version | EuProcedure.meta.versionId |  |
| note | EuProcedure.note |  |
| outcome | EuProcedure.outcome |  |
| [performer](#ehdshealthprofessional) | EuProcedure.performer.actor |  |
| [presentedForm](#ehdsattachment) | EuProcedure.text | No element to map this. Will require an extension. |
| [reason[x]](#ehdsprocedure) | EuProcedure.reason |  |


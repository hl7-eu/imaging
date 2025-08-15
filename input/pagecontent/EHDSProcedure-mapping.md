<!--
  Generated file. Do not edit.
-->

#### EHDSProcedure

The following table shows the mapping from EHDSProcedure logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| header |  |  |
| [header.subject](#ehdspatient) | EuProcedure.subject |  |
| header.identifier | EuProcedure.identifier |  |
| header.authorship | EuProcedure.performer |  |
| header.authorship.author[x] ([EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSDevice](#ehdsdevice)) | EuProcedure.performer.actor |  |
| header.authorship.datetime | EuProcedure.occurrenceDateTime |  |
| header.lastUpdate | EuProcedure.meta.lastUpdated |  |
| header.status | EuProcedure.status |  |
| header.statusReason[x] | EuProcedure.statusReason.coding ; EuProcedure.statusReason.text |  |
| header.language | EuProcedure.language |  |
| header.version | EuProcedure.meta.versionId |  |
| [presentedForm](#ehdsattachment) | EuProcedure.text | No element to map this. Will require an extension. |
| code | EuProcedure.code |  |
| date[x] | EuProcedure.occurrenceDateTime ; EuProcedure.occurrencePeriod |  |
| [performer](#ehdshealthprofessional) | EuProcedure.performer.actor |  |
| [bodySite](StructureDefinition-EHDSBodyStructure.html) | EuProcedure.bodySite |  |
| reason[x] ([EHDSCondition](#ehdscondition), [EHDSObservation](#ehdsobservation), [EHDSProcedure](#ehdsprocedure)) | EuProcedure.reason |  |
| outcome | EuProcedure.outcome |  |
| complication | EuProcedure.complication.concept |  |
| [deviceUsed](#ehdsdevice) | EuProcedure.used[device] |  |
| [focalDevice](#ehdsdevice) | EuProcedure.focalDevice.manipulated |  |
| note | EuProcedure.note |  |


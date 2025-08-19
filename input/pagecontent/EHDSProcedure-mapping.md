<!--
  Generated file. Do not edit.
-->

#### EHDSProcedure

The following table shows the mapping from EHDSProcedure logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSProcedure.header |  |  |
| EHDSProcedure.[header.subject](#ehdspatient) | EuProcedure.subject |  |
| EHDSProcedure.header.identifier | EuProcedure.identifier |  |
| EHDSProcedure.header.authorship | EuProcedure.performer |  |
| EHDSProcedure.header.authorship.author[x] ([EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSDevice](#ehdsdevice)) | EuProcedure.performer.actor |  |
| EHDSProcedure.header.authorship.datetime | EuProcedure.occurrenceDateTime |  |
| EHDSProcedure.header.lastUpdate | EuProcedure.meta.lastUpdated |  |
| EHDSProcedure.header.status | EuProcedure.status |  |
| EHDSProcedure.header.statusReason[x] | EuProcedure.statusReason.coding ; EuProcedure.statusReason.text |  |
| EHDSProcedure.header.language | EuProcedure.language |  |
| EHDSProcedure.header.version | EuProcedure.meta.versionId |  |
| EHDSProcedure.[presentedForm](#ehdsattachment) | EuProcedure.text | No element to map this. Will require an extension. |
| EHDSProcedure.code | EuProcedure.code |  |
| EHDSProcedure.date[x] | EuProcedure.occurrenceDateTime ; EuProcedure.occurrencePeriod |  |
| EHDSProcedure.[performer](#ehdshealthprofessional) | EuProcedure.performer.actor |  |
| EHDSProcedure.[bodySite](StructureDefinition-EHDSBodyStructure.html) | EuProcedure.bodySite |  |
| EHDSProcedure.reason[x] ([EHDSCondition](#ehdscondition), [EHDSObservation](#ehdsobservation), [EHDSProcedure](#ehdsprocedure)) | EuProcedure.reason |  |
| EHDSProcedure.outcome | EuProcedure.outcome |  |
| EHDSProcedure.complication | EuProcedure.complication.concept |  |
| EHDSProcedure.[deviceUsed](#ehdsdevice) | EuProcedure.used[device] |  |
| EHDSProcedure.[focalDevice](#ehdsdevice) | EuProcedure.focalDevice.manipulated |  |
| EHDSProcedure.note | EuProcedure.note |  |


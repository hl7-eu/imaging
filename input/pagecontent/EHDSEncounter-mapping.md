<!--
  Generated file. Do not edit.
-->

#### EHDSEncounter

The following table shows the mapping from EHDSEncounter logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSEncounter.header |  |  |
| EHDSEncounter.[header.subject](#ehdspatient) | EuEncounter.subject |  |
| EHDSEncounter.header.identifier | EuEncounter.identifier |  |
| EHDSEncounter.header.authorship |  |  |
| EHDSEncounter.header.authorship.author[x] ([EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSDevice](#ehdsdevice)) |  | Not a clear mapping for this element, as encounters are not documents, and don't have an author. |
| EHDSEncounter.header.authorship.datetime |  | Not a clear mapping, will need an extension |
| EHDSEncounter.header.lastUpdate | EuEncounter.meta.lastUpdated |  |
| EHDSEncounter.header.status | EuEncounter.status |  |
| EHDSEncounter.header.statusReason[x] | EuEncounter.extension[status-reason] ; EuEncounter.extension[status-reason].valueCodeableConcept.text |  |
| EHDSEncounter.header.language | EuEncounter.language |  |
| EHDSEncounter.header.version | EuEncounter.meta.versionId |  |
| EHDSEncounter.[presentedForm](#ehdsattachment) | EuEncounter.text |  |
| EHDSEncounter.priority | EuEncounter.priority |  |
| EHDSEncounter.type | EuEncounter.type |  |
| EHDSEncounter.note | EuEncounter.extension[note] |  |
| EHDSEncounter.[episodeOfCare](StructureDefinition-EHDSEpisodeOfCare.html) | EuEncounter.episodeOfCare |  |
| EHDSEncounter.basedOn[x] ([EHDSCarePlan](#ehdscareplan), [EHDSServiceRequest](#ehdsservicerequest)) | EuEncounter.basedOn |  |
| EHDSEncounter.[partOf](#ehdsencounter) | EuEncounter.partOf |  |
| EHDSEncounter.[serviceProvider](#ehdsorganisation) | EuEncounter.serviceProvider |  |
| EHDSEncounter.actualPeriod | EuEncounter.actualPeriod |  |
| EHDSEncounter.plannedStartDate | EuEncounter.plannedStartDate |  |
| EHDSEncounter.plannedEndDate | EuEncounter.plannedEndDate |  |
| EHDSEncounter.admission | EuEncounter.admission |  |
| EHDSEncounter.[admission.admitter](#ehdshealthprofessional) | EuEncounter.participant[admitter].actor |  |
| EHDSEncounter.admission.admitSource | EuEncounter.admission.admitSource |  |
| EHDSEncounter.[admission.referringProfessional](#ehdshealthprofessional) | EuEncounter.participant[referrer].actor |  |
| EHDSEncounter.admission.reason[x] ([EHDSCondition](#ehdscondition), [EHDSProcedure](#ehdsprocedure), [EHDSObservation](#ehdsobservation)) | EuEncounter.reason.value.reference |  |
| EHDSEncounter.admission.reasonComment |  |  |
| EHDSEncounter.admission.legalStatus |  |  |
| EHDSEncounter.discharge | EuEncounter.admission.dischargeDisposition |  |
| EHDSEncounter.discharge.destinationType | EuEncounter.admission.dischargeDisposition |  |
| EHDSEncounter.discharge.destinationLocation[x] ([EHDSOrganisation](#ehdsorganisation), [EHDSLocation](StructureDefinition-EHDSLocation.html)) | EuEncounter.admission.destination |  |
| EHDSEncounter.location | EuEncounter.location |  |
| EHDSEncounter.location.period | EuEncounter.location.period |  |
| EHDSEncounter.location.organisationPart[x] ([EHDSOrganisation](#ehdsorganisation), [EHDSLocation](StructureDefinition-EHDSLocation.html)) | EuEncounter.location.location |  |


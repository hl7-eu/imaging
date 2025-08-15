<!--
  Generated file. Do not edit.
-->

#### EHDSEncounter

The following table shows the mapping from EHDSEncounter logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| header |  |  |
| [header.subject](#ehdspatient) | EuEncounter.subject |  |
| header.identifier | EuEncounter.identifier |  |
| header.authorship |  |  |
| header.authorship.author[x] ([EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSDevice](#ehdsdevice)) |  | Not a clear mapping for this element, as encounters are not documents, and don't have an author. |
| header.authorship.datetime |  | Not a clear mapping, will need an extension |
| header.lastUpdate | EuEncounter.meta.lastUpdated |  |
| header.status | EuEncounter.status |  |
| header.statusReason[x] | EuEncounter.extension[status-reason] ; EuEncounter.extension[status-reason].valueCodeableConcept.text |  |
| header.language | EuEncounter.language |  |
| header.version | EuEncounter.meta.versionId |  |
| [presentedForm](#ehdsattachment) | EuEncounter.text |  |
| priority | EuEncounter.priority |  |
| type | EuEncounter.type |  |
| note | EuEncounter.extension[note] |  |
| [episodeOfCare](#ehdsepisodeofcare) | EuEncounter.episodeOfCare |  |
| basedOn[x] ([EHDSCarePlan](#ehdscareplan), [EHDSServiceRequest](#ehdsservicerequest)) | EuEncounter.basedOn |  |
| [partOf](#ehdsencounter) | EuEncounter.partOf |  |
| [serviceProvider](#ehdsorganisation) | EuEncounter.serviceProvider |  |
| actualPeriod | EuEncounter.actualPeriod |  |
| plannedStartDate | EuEncounter.plannedStartDate |  |
| plannedEndDate | EuEncounter.plannedEndDate |  |
| admission | EuEncounter.admission |  |
| [admission.admitter](#ehdshealthprofessional) | EuEncounter.participant[admitter].actor |  |
| admission.admitSource | EuEncounter.admission.admitSource |  |
| [admission.referringProfessional](#ehdshealthprofessional) | EuEncounter.participant[referrer].actor |  |
| admission.reason[x] ([EHDSCondition](#ehdscondition), [EHDSProcedure](#ehdsprocedure), [EHDSObservation](#ehdsobservation)) | EuEncounter.reason.value.reference |  |
| admission.reasonComment |  |  |
| admission.legalStatus |  |  |
| discharge | EuEncounter.admission.dischargeDisposition |  |
| discharge.destinationType | EuEncounter.admission.dischargeDisposition |  |
| discharge.destinationLocation[x] ([EHDSOrganisation](#ehdsorganisation), [EHDSLocation](#ehdslocation)) | EuEncounter.admission.destination |  |
| location | EuEncounter.location |  |
| location.period | EuEncounter.location.period |  |
| location.organisationPart[x] ([EHDSOrganisation](#ehdsorganisation), [EHDSLocation](#ehdslocation)) | EuEncounter.location.location |  |


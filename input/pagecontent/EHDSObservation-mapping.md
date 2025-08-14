<!--
  Generated file. Do not edit.
-->

---
title: EHDSObservation Mapping
---

### EHDSObservation

The following table shows the mapping from EHDSObservation logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| [anatomicLocation](#ehdsbodystructure) | EuObservation.bodySite |  |
| code | EuObservation.code |  |
| component | EuObservation.component |  |
| component.code | EuObservation.code |  |
| component.dataAbsentReason |  |  |
| component.interpretation | EuObservation.component.interpretation |  |
| component.referenceRange | EuObservation.component.referenceRange |  |
| component.result |  |  |
| component.result.uncertainty | EuQuantity.extension[uncertainty] ; EuQuantity.extension[uncertaintyType] ; EuSimpleQuantity.extension[uncertainty] ; EuSimpleQuantity.extension[uncertaintyType] |  |
| component.result.value[x] | EuObservation.valueString ; EuObservation.valueQuantity ; EuObservation.valueRange ; EuObservation.valueCodeableConcept |  |
| dataAbsentReason | EuObservation.value[x].extension[dataAbsentReason] |  |
| [derivedFrom[x]](#ehdsimagingstudy) | EuObservation.derivedFrom |  |
| [hasMember[x]](#ehdsobservation) | EuObservation.hasMember |  |
| header |  |  |
| header.authorship | EuObservation.performer |  |
| [header.authorship.author[x]](#ehdsdevice) | EuObservation.performer |  |
| header.authorship.datetime | EuObservation.issued |  |
| [header.directSubject[x]](#ehdsprocedure) | EuObservation.focus |  |
| header.identifier | EuObservation.identifier |  |
| header.language | EuObservation.language |  |
| header.lastUpdate | EuObservation.meta.lastUpdated |  |
| header.status | EuObservation.status |  |
| header.statusReason[x] | EuObservation.extension[status-reason] ; EuObservation.extension[status-reason].valueCodeableConcept.text |  |
| [header.subject](#ehdspatient) | EuObservation.subject |  |
| header.version | EuObservation.meta.versionId |  |
| interpretation | EuObservation.interpretation |  |
| method | EuObservation.method |  |
| observationDate[x] | EuObservation.effectiveDateTime ; EuObservation.effectivePeriod |  |
| [order](#ehdsservicerequest) | EuObservation.basedOn |  |
| originalName |  |  |
| [performer](#ehdshealthprofessional) | EuObservation.performer ; EuObservation.performer.extension[performerFunction] |  |
| [presentedForm](#ehdsattachment) | EuObservation.text |  |
| referenceRange | EuObservation.referenceRange |  |
| result |  | Mapping provided for each .value data type |
| result.uncertainty | EuQuantity.extension[uncertainty] |  |
| result.value[x] | EuObservation.valueString ; EuObservation.valueQuantity ; EuObservation.valueRange ; EuObservation.valueCodeableConcept |  |
| resultDescription | EuObservation.note |  |
| [triggeredBy[x]](#ehdsobservation) | EuObservation.triggeredBy.observation ; EuObservation.triggeredBy.type |  |


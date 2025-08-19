<!--
  Generated file. Do not edit.
-->

#### EHDSObservation

The following table shows the mapping from EHDSObservation logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSObservation.header |  |  |
| EHDSObservation.[header.subject](#ehdspatient) | EuObservation.subject |  |
| EHDSObservation.header.identifier | EuObservation.identifier |  |
| EHDSObservation.header.authorship | EuObservation.performer |  |
| EHDSObservation.header.authorship.author[x] ([EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSDevice](#ehdsdevice)) | EuObservation.performer |  |
| EHDSObservation.header.authorship.datetime | EuObservation.issued |  |
| EHDSObservation.header.lastUpdate | EuObservation.meta.lastUpdated |  |
| EHDSObservation.header.status | EuObservation.status |  |
| EHDSObservation.header.statusReason[x] | EuObservation.extension[status-reason] ; EuObservation.extension[status-reason].valueCodeableConcept.text |  |
| EHDSObservation.header.language | EuObservation.language |  |
| EHDSObservation.header.version | EuObservation.meta.versionId |  |
| EHDSObservation.[presentedForm](#ehdsattachment) | EuObservation.text |  |
| EHDSObservation.header.directSubject[x] ([EHDSPatient](#ehdspatient), [EHDSPatientAnimal](StructureDefinition-EHDSPatientAnimal.html), [EHDSLocation](StructureDefinition-EHDSLocation.html), [EHDSDevice](#ehdsdevice), [EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSProcedure](#ehdsprocedure)) | EuObservation.focus |  |
| EHDSObservation.observationDate[x] | EuObservation.effectiveDateTime ; EuObservation.effectivePeriod |  |
| EHDSObservation.code | EuObservation.code |  |
| EHDSObservation.originalName |  |  |
| EHDSObservation.method | EuObservation.method |  |
| EHDSObservation.[order](#ehdsservicerequest) | EuObservation.basedOn |  |
| EHDSObservation.[performer](#ehdshealthprofessional) | EuObservation.performer ; EuObservation.performer.extension[performerFunction] |  |
| EHDSObservation.[anatomicLocation](StructureDefinition-EHDSBodyStructure.html) | EuObservation.bodySite |  |
| EHDSObservation.result |  | Mapping provided for each .value data type |
| EHDSObservation.result.value[x] | EuObservation.valueString ; EuObservation.valueQuantity ; EuObservation.valueRange ; EuObservation.valueCodeableConcept |  |
| EHDSObservation.result.uncertainty | EuQuantity.extension[uncertainty] |  |
| EHDSObservation.dataAbsentReason | EuObservation.value[x].extension[dataAbsentReason] |  |
| EHDSObservation.referenceRange | EuObservation.referenceRange |  |
| EHDSObservation.interpretation | EuObservation.interpretation |  |
| EHDSObservation.resultDescription | EuObservation.note |  |
| EHDSObservation.component | EuObservation.component |  |
| EHDSObservation.component.code | EuObservation.code |  |
| EHDSObservation.component.result |  |  |
| EHDSObservation.component.result.value[x] | EuObservation.valueString ; EuObservation.valueQuantity ; EuObservation.valueRange ; EuObservation.valueCodeableConcept |  |
| EHDSObservation.component.result.uncertainty | EuQuantity.extension[uncertainty] ; EuQuantity.extension[uncertaintyType] ; EuSimpleQuantity.extension[uncertainty] ; EuSimpleQuantity.extension[uncertaintyType] |  |
| EHDSObservation.component.dataAbsentReason |  |  |
| EHDSObservation.component.referenceRange | EuObservation.component.referenceRange |  |
| EHDSObservation.component.interpretation | EuObservation.component.interpretation |  |
| EHDSObservation.derivedFrom[x] ([EHDSObservation](#ehdsobservation), [EHDSLaboratoryObservation](StructureDefinition-EHDSLaboratoryObservation.html), [EHDSImagingStudy](#ehdsimagingstudy)) | EuObservation.derivedFrom |  |
| EHDSObservation.triggeredBy[x] ([EHDSLaboratoryObservation](StructureDefinition-EHDSLaboratoryObservation.html), [EHDSObservation](#ehdsobservation)) | EuObservation.triggeredBy.observation ; EuObservation.triggeredBy.type |  |
| EHDSObservation.hasMember[x] ([EHDSLaboratoryObservation](StructureDefinition-EHDSLaboratoryObservation.html), [EHDSObservation](#ehdsobservation)) | EuObservation.hasMember |  |


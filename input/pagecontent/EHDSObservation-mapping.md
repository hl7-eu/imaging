<!--
  Generated file. Do not edit.
-->

#### EHDSObservation

The following table shows the mapping from EHDSObservation logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| header |  |  |
| [header.subject](#ehdspatient) | EuObservation.subject |  |
| header.identifier | EuObservation.identifier |  |
| header.authorship | EuObservation.performer |  |
| header.authorship.author[x] ([EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSDevice](#ehdsdevice)) | EuObservation.performer |  |
| header.authorship.datetime | EuObservation.issued |  |
| header.lastUpdate | EuObservation.meta.lastUpdated |  |
| header.status | EuObservation.status |  |
| header.statusReason[x] | EuObservation.extension[status-reason] ; EuObservation.extension[status-reason].valueCodeableConcept.text |  |
| header.language | EuObservation.language |  |
| header.version | EuObservation.meta.versionId |  |
| [presentedForm](#ehdsattachment) | EuObservation.text |  |
| header.directSubject[x] ([EHDSPatient](#ehdspatient), [EHDSPatientAnimal](StructureDefinition-EHDSPatientAnimal.html), [EHDSLocation](StructureDefinition-EHDSLocation.html), [EHDSDevice](#ehdsdevice), [EHDSHealthProfessional](#ehdshealthprofessional), [EHDSOrganisation](#ehdsorganisation), [EHDSProcedure](#ehdsprocedure)) | EuObservation.focus |  |
| observationDate[x] | EuObservation.effectiveDateTime ; EuObservation.effectivePeriod |  |
| code | EuObservation.code |  |
| originalName |  |  |
| method | EuObservation.method |  |
| [order](#ehdsservicerequest) | EuObservation.basedOn |  |
| [performer](#ehdshealthprofessional) | EuObservation.performer ; EuObservation.performer.extension[performerFunction] |  |
| [anatomicLocation](StructureDefinition-EHDSBodyStructure.html) | EuObservation.bodySite |  |
| result |  | Mapping provided for each .value data type |
| result.value[x] | EuObservation.valueString ; EuObservation.valueQuantity ; EuObservation.valueRange ; EuObservation.valueCodeableConcept |  |
| result.uncertainty | EuQuantity.extension[uncertainty] |  |
| dataAbsentReason | EuObservation.value[x].extension[dataAbsentReason] |  |
| referenceRange | EuObservation.referenceRange |  |
| interpretation | EuObservation.interpretation |  |
| resultDescription | EuObservation.note |  |
| component | EuObservation.component |  |
| component.code | EuObservation.code |  |
| component.result |  |  |
| component.result.value[x] | EuObservation.valueString ; EuObservation.valueQuantity ; EuObservation.valueRange ; EuObservation.valueCodeableConcept |  |
| component.result.uncertainty | EuQuantity.extension[uncertainty] ; EuQuantity.extension[uncertaintyType] ; EuSimpleQuantity.extension[uncertainty] ; EuSimpleQuantity.extension[uncertaintyType] |  |
| component.dataAbsentReason |  |  |
| component.referenceRange | EuObservation.component.referenceRange |  |
| component.interpretation | EuObservation.component.interpretation |  |
| derivedFrom[x] ([EHDSObservation](#ehdsobservation), [EHDSLaboratoryObservation](StructureDefinition-EHDSLaboratoryObservation.html), [EHDSImagingStudy](StructureDefinition-EHDSImagingStudy.html)) | EuObservation.derivedFrom |  |
| triggeredBy[x] ([EHDSLaboratoryObservation](StructureDefinition-EHDSLaboratoryObservation.html), [EHDSObservation](#ehdsobservation)) | EuObservation.triggeredBy.observation ; EuObservation.triggeredBy.type |  |
| hasMember[x] ([EHDSLaboratoryObservation](StructureDefinition-EHDSLaboratoryObservation.html), [EHDSObservation](#ehdsobservation)) | EuObservation.hasMember |  |


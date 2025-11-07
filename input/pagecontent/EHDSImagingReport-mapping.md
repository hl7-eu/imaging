<!--
  Generated file. Do not edit.
-->

#### EHDSImagingReport

The following table shows the mapping from EHDSImagingReport logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header |  | N/A |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[header.subject](StructureDefinition-EHDSPatient.html) | CompositionEuImaging.subject ; DiagnosticReportEuImaging.subject |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.identifier | CompositionEuImaging.identifier ; DiagnosticReportEuImaging.identifier |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.authorship | CompositionEuImaging.author |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.authorship.author[x] ([EHDSHealthProfessional](StructureDefinition-EHDSHealthProfessional.html), [EHDSOrganisation](StructureDefinition-EHDSOrganisation.html), [EHDSDevice](StructureDefinition-EHDSDevice.html)) | CompositionEuImaging.author[author] ; CompositionEuImaging.author[organization] ; DiagnosticReportEuImaging.performer[organization] ; DiagnosticReportEuImaging.resultsInterpreter[author] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.authorship.datetime | CompositionEuImaging.date ; DiagnosticReportEuImaging.issued |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.lastUpdate | CompositionEuImaging.date ; DiagnosticReportEuImaging.meta.lastUpdated | meta.lastUpdated represents the time at which the instance of the resource was last modified by the server that hosts it. |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.status | CompositionEuImaging.status ; DiagnosticReportEuImaging.status |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.statusReason[x] |  |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.language | CompositionEuImaging.language ; DiagnosticReportEuImaging.language |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.version | CompositionEuImaging.version |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[presentedForm](StructureDefinition-EHDSAttachment.html) | DiagnosticReportEuImaging.presentedForm ; CompositionEuImaging.text | For all the resources that don't have a .presentedForm element, the .text is the default element to map this requirement. |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.documentType | CompositionEuImaging.category[imaging] ; DiagnosticReportEuImaging.category[imaging] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.documentTitle | CompositionEuImaging.title |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.documentStatus | CompositionEuImaging.status ; DiagnosticReportEuImaging.status |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.period | CompositionEuImaging.event.period ; DiagnosticReportEuImaging.effectivePeriod |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.attestation | CompositionEuImaging.attester[resultValidator] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[header.attestation.attester](StructureDefinition-EHDSHealthProfessional.html) | CompositionEuImaging.attester[resultValidator].party |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.attestation.datetime | CompositionEuImaging.attester[resultValidator].time |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.legalAuthentication | CompositionEuImaging.attester[legalAuthenticator] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[header.legalAuthentication.legalAuthenticator](StructureDefinition-EHDSHealthProfessional.html) | CompositionEuImaging.attester[legalAuthenticator].party |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.legalAuthentication.datetime | CompositionEuImaging.attester[legalAuthenticator].time |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.eventType | CompositionEuImaging.event[imagingstudy] ; ProcedureEuImaging.location ; CompositionEuImaging.event[procedure] ; [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series ; [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).modality |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.authorSpecialty | CompositionEuImaging.author[author] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[header.custodian](StructureDefinition-EHDSOrganisation.html) | CompositionEuImaging.custodian |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.documentFormat | CompositionEuImaging.type | Could be extended with list of approved templates as a separate category in the future. |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.confidentiality | CompositionEuImaging.meta.security ; DiagnosticReportEuImaging.meta.security |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.accessionNumber | ServiceRequestOrderEuImaging.identifier[accessionNumber] ; CompositionEuImaging.extension[basedOn] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[header.healthInsuranceAndPaymentInformation](StructureDefinition-EHDSCoverage.html) | CompositionEuImaging.extension[basedOn] ; DiagnosticReportEuImaging.basedOn ; ServiceRequestOrderEuImaging.insurance |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[header.intendedRecipient[x]](StructureDefinition-EHDSPatient.html) | CompositionEuImaging.extension[informationRecipient] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body |  | N/A |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation | CompositionEuImaging.section[order] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.orderId | CompositionEuImaging.identifier ; CompositionEuImaging.section[order].entry[order] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.orderDateAndTime | ServiceRequestOrderEuImaging.authoredOn |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.orderInformation.orderPlacer](StructureDefinition-EHDSHealthProfessional.html) | ServiceRequestOrderEuImaging.requester |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.orderReasonText | CompositionEuImaging.section[order].extension[note] ; ServiceRequestOrderEuImaging.reason.concept.text |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.orderReason | ServiceRequestOrderEuImaging.reason.concept | orderReason and clinicalQuestion map to the same element as a design choice |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.clinicalQuestion | ServiceRequestOrderEuImaging.reason.concept |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.supportingInformation | CompositionEuImaging.section[history].entry ; ServiceRequestOrderEuImaging.supportingInfo |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.orderInformation.supportingInformation.observation](StructureDefinition-EHDSObservation.html) | CompositionEuImaging.section[history].entry ; ServiceRequestOrderEuImaging.supportingInfo |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.orderInformation.supportingInformation.condition](StructureDefinition-EHDSCondition.html) | CompositionEuImaging.section[history].entry ; ServiceRequestOrderEuImaging.supportingInfo |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.orderInformation.supportingInformation.medicationAdministration](StructureDefinition-EHDSMedicationAdministration.html) | CompositionEuImaging.section[history].entry ; ServiceRequestOrderEuImaging.reason |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.orderInformation.supportingInformation.devices](StructureDefinition-EHDSDevice.html) | CompositionEuImaging.section[history].entry ; ServiceRequestOrderEuImaging.supportingInfo | Refer to device, might be replaced by a more constraint reference. |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.orderInformation.supportingInformation.pregnancyStatus](StructureDefinition-EHDSCurrentPregnancy.html) | CompositionEuImaging.section[history].entry ; ServiceRequestOrderEuImaging.supportingInfo[pregnancy] | Code in supporting info, could be a observation as well |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.supportingInformation.sexForClinicalUse | CompositionEuImaging.subject ; EuPatient.extension[sex-for-clinical-use] ; EuPatient.extension[sex-for-clinical-use].extension[value].valueCodeableConcept ; EuPatient.extension[sex-for-clinical-use].extension[period].valuePeriod |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.supportingInformation.otherSupportingInformation | CompositionEuImaging.section[history].entry |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.specimen](StructureDefinition-EHDSSpecimen.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.serviceRequest](StructureDefinition-EHDSServiceRequest.html) | CompositionEuImaging.section[order].entry[order] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.exposureInformation |  |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.exposureInformation.effectiveDose | ObservationRadiationDoseEuImaging.component.value[x] | Mapping to a defined slice is needed in the future |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.exposureInformation.equivalentDoseInformation | ObservationRadiationDoseEuImaging.component.value[x] | Mapping to a defined slice is needed in the future |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.exposureInformation.equivalentDoseInformation.equivalentDose | ObservationRadiationDoseEuImaging.component.value[x] | Mapping to a defined slice is needed in the future |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.exposureInformation.equivalentDoseInformation.tissueType | ObservationRadiationDoseEuImaging.bodySite |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.examinationReport |  |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.examinationReport.modality | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.examinationReport.bodyPart](StructureDefinition-EHDSBodyStructure.html) |  |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).examinationReport.bodyPart.bodyLocation | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series ; EuBodyStructure.morphology ; EuBodyStructure.includedStructure.structure |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).examinationReport.bodyPart.laterality | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series ; EuBodyStructure.includedStructure.laterality |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.examinationReport.imagingProcedures](StructureDefinition-EHDSProcedure.html) | CompositionEuImaging.section[procedure].entry[procedure] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.examinationReport.medication](StructureDefinition-EHDSMedicationAdministration.html) | CompositionEuImaging.section[procedure].entry[procedure] ; EuMedicationAdministration.partOf |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.examinationReport.adverseReaction](StructureDefinition-EHDSAllergyIntolerance.html) | [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).suspectEntity[procedure] ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).contributingFactor[allergy] ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).status ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).code ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).subject |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.examinationReport.resultData | CompositionEuImaging.section[findings] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.examinationReport.resultData.resultText | CompositionEuImaging.section[findings].extension[note] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.examinationReport.resultData.observationResults](StructureDefinition-EHDSObservation.html) | CompositionEuImaging.section[findings].entry[ObservationFindingEuImaging] ; DiagnosticReportEuImaging.result |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.examinationReport.conclusion | CompositionEuImaging.section[impression] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.examinationReport.conclusion.impression | DiagnosticReportEuImaging.conclusion |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.examinationReport.conclusion.conditionOrFinding[x] ([EHDSCondition](StructureDefinition-EHDSCondition.html), [EHDSObservation](StructureDefinition-EHDSObservation.html)) | CompositionEuImaging.section[impression].entry[ObservationFindingEuImaging] ; CompositionEuImaging.section[impression].entry[impression] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.recommendation | CompositionEuImaging.section[recommendation] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.recommendation.description | EuCarePlan.description |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.recommendation.carePlan](StructureDefinition-EHDSCarePlan.html) | CompositionEuImaging.section[recommendation].entry[suggestion] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.comparisonStudy](#ehdsimagingreport) | CompositionEuImaging.section[comparison].entry[comparedstudy] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[dicomStudyMetadata](#ehdsimagingstudy) | [ImagingStudyEuImagingManifest](StructureDefinition-ImagingStudyEuImagingManifest.html).entry[imagingstudy] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).attachments[x] ([EHDSAttachment](StructureDefinition-EHDSAttachment.html), [EHDSMedia](StructureDefinition-EHDSMedia.html)) | CompositionEuImaging.section[comparison].entry[comparedstudy] ; DiagnosticReportEuImaging.media ; ObservationFindingEuImaging.derivedFrom |  |


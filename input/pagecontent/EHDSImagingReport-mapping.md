<!--
  Generated file. Do not edit.
-->

#### EHDSImagingReport

The following table shows the mapping from EHDSImagingReport logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSImagingReport.header |  | N/A |
| EHDSImagingReport.[header.subject](StructureDefinition-EHDSPatient.html) | CompositionEuImaging.subject ; DiagnosticReportEuImaging.subject |  |
| EHDSImagingReport.header.identifier | CompositionEuImaging.identifier ; DiagnosticReportEuImaging.identifier |  |
| EHDSImagingReport.header.authorship | CompositionEuImaging.author |  |
| EHDSImagingReport.header.authorship.author[x] ([EHDSHealthProfessional](StructureDefinition-EHDSHealthProfessional.html), [EHDSOrganisation](StructureDefinition-EHDSOrganisation.html), [EHDSDevice](StructureDefinition-EHDSDevice.html)) | CompositionEuImaging.author[author] ; CompositionEuImaging.author[organization] ; DiagnosticReportEuImaging.performer[organization] ; DiagnosticReportEuImaging.resultsInterpreter[author] |  |
| EHDSImagingReport.header.authorship.datetime | CompositionEuImaging.date ; DiagnosticReportEuImaging.issued |  |
| EHDSImagingReport.header.lastUpdate | CompositionEuImaging.date ; DiagnosticReportEuImaging.meta.lastUpdated | meta.lastUpdated represents the time at which the instance of the resource was last modified by the server that hosts it. |
| EHDSImagingReport.header.status | CompositionEuImaging.status ; DiagnosticReportEuImaging.status |  |
| EHDSImagingReport.header.statusReason[x] |  |  |
| EHDSImagingReport.header.language | CompositionEuImaging.language ; DiagnosticReportEuImaging.language |  |
| EHDSImagingReport.header.version | CompositionEuImaging.version |  |
| EHDSImagingReport.[presentedForm](StructureDefinition-EHDSAttachment.html) | DiagnosticReportEuImaging.presentedForm ; CompositionEuImaging.text | For all the resources that don't have a .presentedForm element, the .text is the default element to map this requirement. |
| EHDSImagingReport.header.documentType | CompositionEuImaging.category[imaging] ; DiagnosticReportEuImaging.category[imaging] |  |
| EHDSImagingReport.header.documentTitle | CompositionEuImaging.title |  |
| EHDSImagingReport.header.documentStatus | CompositionEuImaging.status ; DiagnosticReportEuImaging.status |  |
| EHDSImagingReport.header.period | CompositionEuImaging.event.period ; DiagnosticReportEuImaging.effectivePeriod |  |
| EHDSImagingReport.header.attestation | CompositionEuImaging.attester[resultValidator] |  |
| EHDSImagingReport.[header.attestation.attester](StructureDefinition-EHDSHealthProfessional.html) | CompositionEuImaging.attester[resultValidator].party |  |
| EHDSImagingReport.header.attestation.datetime | CompositionEuImaging.attester[resultValidator].time |  |
| EHDSImagingReport.header.legalAuthentication | CompositionEuImaging.attester[legalAuthenticator] |  |
| EHDSImagingReport.[header.legalAuthentication.legalAuthenticator](StructureDefinition-EHDSHealthProfessional.html) | CompositionEuImaging.attester[legalAuthenticator].party |  |
| EHDSImagingReport.header.legalAuthentication.datetime | CompositionEuImaging.attester[legalAuthenticator].time |  |
| EHDSImagingReport.header.eventType | CompositionEuImaging.event[imagingstudy] ; ProcedureEuImaging.location ; CompositionEuImaging.event[procedure] ; [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series ; [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).modality |  |
| EHDSImagingReport.header.authorSpecialty | CompositionEuImaging.author[author] |  |
| EHDSImagingReport.[header.custodian](StructureDefinition-EHDSOrganisation.html) | CompositionEuImaging.custodian |  |
| EHDSImagingReport.header.documentFormat | CompositionEuImaging.type | Could be extended with list of approved templates as a separate category in the future. |
| EHDSImagingReport.header.confidentiality | CompositionEuImaging.meta.security ; DiagnosticReportEuImaging.meta.security |  |
| EHDSImagingReport.header.accessionNumber | ServiceRequestOrderEuImaging.identifier[accessionNumber] ; CompositionEuImaging.extension[basedOn] |  |
| EHDSImagingReport.[header.healthInsuranceAndPaymentInformation](StructureDefinition-EHDSCoverage.html) | CompositionEuImaging.extension[basedOn] ; DiagnosticReportEuImaging.basedOn ; ServiceRequestOrderEuImaging.insurance |  |
| EHDSImagingReport.[header.intendedRecipient[x]](StructureDefinition-EHDSPatient.html) | CompositionEuImaging.extension[informationRecipient] |  |
| EHDSImagingReport.body |  | N/A |
| EHDSImagingReport.body.orderInformation | CompositionEuImaging.section[order] |  |
| EHDSImagingReport.body.orderInformation.orderId | CompositionEuImaging.identifier ; CompositionEuImaging.section[order].entry[order] |  |
| EHDSImagingReport.body.orderInformation.orderDateAndTime | ServiceRequestOrderEuImaging.authoredOn |  |
| EHDSImagingReport.[body.orderInformation.orderPlacer](StructureDefinition-EHDSHealthProfessional.html) | ServiceRequestOrderEuImaging.requester |  |
| EHDSImagingReport.body.orderInformation.orderReasonText | CompositionEuImaging.section[order].extension[note] ; ServiceRequestOrderEuImaging.reason.concept.text |  |
| EHDSImagingReport.body.orderInformation.orderReason | ServiceRequestOrderEuImaging.reason.concept | orderReason and clinicalQuestion map to the same element as a design choice |
| EHDSImagingReport.body.orderInformation.clinicalQuestion | ServiceRequestOrderEuImaging.reason.concept |  |
| EHDSImagingReport.body.orderInformation.supportingInformation | CompositionEuImaging.section[history].entry ; ServiceRequestOrderEuImaging.supportingInfo |  |
| EHDSImagingReport.[body.orderInformation.supportingInformation.observation](StructureDefinition-EHDSObservation.html) | CompositionEuImaging.section[history].entry ; ServiceRequestOrderEuImaging.supportingInfo |  |
| EHDSImagingReport.[body.orderInformation.supportingInformation.condition](StructureDefinition-EHDSCondition.html) | CompositionEuImaging.section[history].entry ; ServiceRequestOrderEuImaging.supportingInfo |  |
| EHDSImagingReport.[body.orderInformation.supportingInformation.medicationAdministration](StructureDefinition-EHDSMedicationAdministration.html) | CompositionEuImaging.section[history].entry ; ServiceRequestOrderEuImaging.reason |  |
| EHDSImagingReport.[body.orderInformation.supportingInformation.devices](StructureDefinition-EHDSDevice.html) | CompositionEuImaging.section[history].entry ; ServiceRequestOrderEuImaging.supportingInfo | Refer to device, might be replaced by a more constraint reference. |
| EHDSImagingReport.[body.orderInformation.supportingInformation.pregnancyStatus](StructureDefinition-EHDSCurrentPregnancy.html) | CompositionEuImaging.section[history].entry ; ServiceRequestOrderEuImaging.supportingInfo[pregnancy] | Code in supporting info, could be a observation as well |
| EHDSImagingReport.body.orderInformation.supportingInformation.sexForClinicalUse | CompositionEuImaging.subject ; EuPatient.extension[sex-for-clinical-use] ; EuPatient.extension[sex-for-clinical-use].extension[value].valueCodeableConcept ; EuPatient.extension[sex-for-clinical-use].extension[period].valuePeriod |  |
| EHDSImagingReport.body.orderInformation.supportingInformation.otherSupportingInformation | CompositionEuImaging.section[history].entry |  |
| EHDSImagingReport.[body.specimen](StructureDefinition-EHDSSpecimen.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingReport.[body.serviceRequest](StructureDefinition-EHDSServiceRequest.html) | CompositionEuImaging.section[order].entry[order] |  |
| EHDSImagingReport.body.exposureInformation |  |  |
| EHDSImagingReport.body.exposureInformation.effectiveDose | ObservationRadiationDoseEuImaging.component.value[x] | Mapping to a defined slice is needed in the future |
| EHDSImagingReport.body.exposureInformation.equivalentDoseInformation | ObservationRadiationDoseEuImaging.component.value[x] | Mapping to a defined slice is needed in the future |
| EHDSImagingReport.body.exposureInformation.equivalentDoseInformation.equivalentDose | ObservationRadiationDoseEuImaging.component.value[x] | Mapping to a defined slice is needed in the future |
| EHDSImagingReport.body.exposureInformation.equivalentDoseInformation.tissueType | ObservationRadiationDoseEuImaging.bodySite |  |
| EHDSImagingReport.body.examinationReport |  |  |
| EHDSImagingReport.body.examinationReport.modality | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingReport.[body.examinationReport.bodyPart](StructureDefinition-EHDSBodyStructure.html) |  |  |
| EHDSImagingReport.examinationReport.bodyPart.bodyLocation | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series ; EuBodyStructure.morphology ; EuBodyStructure.includedStructure.structure |  |
| EHDSImagingReport.examinationReport.bodyPart.laterality | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series ; EuBodyStructure.includedStructure.laterality |  |
| EHDSImagingReport.[body.examinationReport.imagingProcedures](StructureDefinition-EHDSProcedure.html) | CompositionEuImaging.section[procedure].entry[procedure] |  |
| EHDSImagingReport.[body.examinationReport.medication](StructureDefinition-EHDSMedicationAdministration.html) | CompositionEuImaging.section[procedure].entry[procedure] ; EuMedicationAdministration.partOf |  |
| EHDSImagingReport.[body.examinationReport.adverseReaction](StructureDefinition-EHDSAllergyIntolerance.html) | AdverseEventEuImaging.suspectEntity[procedure] ; AdverseEventEuImaging.contributingFactor[allergy] ; AdverseEventEuImaging.status ; AdverseEventEuImaging.code ; AdverseEventEuImaging.subject |  |
| EHDSImagingReport.body.examinationReport.resultData | CompositionEuImaging.section[findings] |  |
| EHDSImagingReport.body.examinationReport.resultData.resultText | CompositionEuImaging.section[findings].extension[note] |  |
| EHDSImagingReport.[body.examinationReport.resultData.observationResults](StructureDefinition-EHDSObservation.html) | CompositionEuImaging.section[findings].entry[ObservationFindingEuImaging] ; DiagnosticReportEuImaging.result |  |
| EHDSImagingReport.body.examinationReport.conclusion | CompositionEuImaging.section[impression] |  |
| EHDSImagingReport.body.examinationReport.conclusion.impression | DiagnosticReportEuImaging.conclusion |  |
| EHDSImagingReport.body.examinationReport.conclusion.conditionOrFinding[x] ([EHDSCondition](StructureDefinition-EHDSCondition.html), [EHDSObservation](StructureDefinition-EHDSObservation.html)) | CompositionEuImaging.section[impression].entry[ObservationFindingEuImaging] ; CompositionEuImaging.section[impression].entry[impression] |  |
| EHDSImagingReport.body.recommendation | CompositionEuImaging.section[recommendation] |  |
| EHDSImagingReport.body.recommendation.description | EuCarePlan.description |  |
| EHDSImagingReport.[body.recommendation.carePlan](StructureDefinition-EHDSCarePlan.html) | CompositionEuImaging.section[recommendation].entry[suggestion] |  |
| EHDSImagingReport.[body.comparisonStudy](#ehdsimagingreport) | CompositionEuImaging.section[comparison].entry[comparedstudy] |  |
| EHDSImagingReport.[dicomStudyMetadata](#ehdsimagingstudy) | [ImagingStudyEuImagingManifest](StructureDefinition-ImagingStudyEuImagingManifest.html).entry[imagingstudy] |  |
| EHDSImagingReport.attachments[x] ([EHDSAttachment](StructureDefinition-EHDSAttachment.html), [EHDSMedia](StructureDefinition-EHDSMedia.html)) | CompositionEuImaging.section[comparison].entry[comparedstudy] ; DiagnosticReportEuImaging.media ; ObservationFindingEuImaging.derivedFrom |  |


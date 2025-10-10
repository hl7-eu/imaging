<!--
  Generated file. Do not edit.
-->

#### EHDSImagingReport

The following table shows the mapping from EHDSImagingReport logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSImagingReport.header |  | N/A |
| EHDSImagingReport.[header.subject](StructureDefinition-EHDSPatient.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).subject ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).subject |  |
| EHDSImagingReport.header.identifier | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).identifier ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).identifier |  |
| EHDSImagingReport.header.authorship | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).author |  |
| EHDSImagingReport.header.authorship.author[x] ([EHDSHealthProfessional](StructureDefinition-EHDSHealthProfessional.html), [EHDSOrganisation](StructureDefinition-EHDSOrganisation.html), [EHDSDevice](StructureDefinition-EHDSDevice.html)) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).author[author] ; [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).author[organization] ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).performer[organization] ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).resultsInterpreter[author] |  |
| EHDSImagingReport.header.authorship.datetime | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).date ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).issued |  |
| EHDSImagingReport.header.lastUpdate | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).date ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).meta | meta.lastUpdated represents the time at which the instance of the resource was last modified by the server that hosts it. |
| EHDSImagingReport.header.status | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).status ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).status |  |
| EHDSImagingReport.header.statusReason[x] |  |  |
| EHDSImagingReport.header.language | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).language ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).language |  |
| EHDSImagingReport.header.version | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).version |  |
| EHDSImagingReport.[presentedForm](StructureDefinition-EHDSAttachment.html) | [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).presentedForm ; [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).text | For all the resources that don't have a .presentedForm element, the .text is the default element to map this requirement. |
| EHDSImagingReport.header.documentType | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).category[imaging] ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).category[imaging] |  |
| EHDSImagingReport.header.documentTitle | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).title |  |
| EHDSImagingReport.header.documentStatus | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).status ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).status |  |
| EHDSImagingReport.header.period | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).event ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).effectivePeriod |  |
| EHDSImagingReport.header.attestation | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).attester[resultValidator] |  |
| EHDSImagingReport.[header.attestation.attester](StructureDefinition-EHDSHealthProfessional.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).attester[resultValidator] |  |
| EHDSImagingReport.header.attestation.datetime | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).attester[resultValidator] |  |
| EHDSImagingReport.header.legalAuthentication | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).attester[legalAuthenticator] |  |
| EHDSImagingReport.[header.legalAuthentication.legalAuthenticator](StructureDefinition-EHDSHealthProfessional.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).attester[legalAuthenticator] |  |
| EHDSImagingReport.header.legalAuthentication.datetime | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).attester[legalAuthenticator] |  |
| EHDSImagingReport.header.eventType | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).event[imagingstudy] ; [ProcedureEuImaging](StructureDefinition-ProcedureEuImaging.html).location ; [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).event[procedure] ; [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series ; [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).modality |  |
| EHDSImagingReport.header.authorSpecialty | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).author[author] |  |
| EHDSImagingReport.[header.custodian](StructureDefinition-EHDSOrganisation.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).custodian |  |
| EHDSImagingReport.header.documentFormat | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).type | Could be extended with list of approved templates as a separate category in the future. |
| EHDSImagingReport.header.confidentiality | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).meta ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).meta |  |
| EHDSImagingReport.header.accessionNumber | [ServiceRequestOrderEuImaging](StructureDefinition-ServiceRequestOrderEuImaging.html).identifier[accessionNumber] ; [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).extension[basedOn] |  |
| EHDSImagingReport.[header.healthInsuranceAndPaymentInformation](StructureDefinition-EHDSCoverage.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).extension[basedOn] ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).basedOn ; [ServiceRequestOrderEuImaging](StructureDefinition-ServiceRequestOrderEuImaging.html).insurance |  |
| EHDSImagingReport.[header.intendedRecipient[x]](StructureDefinition-EHDSPatient.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).extension[informationRecipient] |  |
| EHDSImagingReport.body |  | N/A |
| EHDSImagingReport.body.orderInformation | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[order] |  |
| EHDSImagingReport.body.orderInformation.orderId | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).identifier ; [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[order] |  |
| EHDSImagingReport.body.orderInformation.orderDateAndTime | [ServiceRequestOrderEuImaging](StructureDefinition-ServiceRequestOrderEuImaging.html).authoredOn |  |
| EHDSImagingReport.[body.orderInformation.orderPlacer](StructureDefinition-EHDSHealthProfessional.html) | [ServiceRequestOrderEuImaging](StructureDefinition-ServiceRequestOrderEuImaging.html).requester |  |
| EHDSImagingReport.body.orderInformation.orderReasonText | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[order] ; [ServiceRequestOrderEuImaging](StructureDefinition-ServiceRequestOrderEuImaging.html).reason |  |
| EHDSImagingReport.body.orderInformation.orderReason | [ServiceRequestOrderEuImaging](StructureDefinition-ServiceRequestOrderEuImaging.html).reason | orderReason and clinicalQuestion map to the same element as a design choice |
| EHDSImagingReport.body.orderInformation.clinicalQuestion | [ServiceRequestOrderEuImaging](StructureDefinition-ServiceRequestOrderEuImaging.html).reason |  |
| EHDSImagingReport.body.orderInformation.supportingInformation | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[history] ; [ServiceRequestOrderEuImaging](StructureDefinition-ServiceRequestOrderEuImaging.html).supportingInfo |  |
| EHDSImagingReport.[body.orderInformation.supportingInformation.observation](StructureDefinition-EHDSObservation.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[history] ; [ServiceRequestOrderEuImaging](StructureDefinition-ServiceRequestOrderEuImaging.html).supportingInfo |  |
| EHDSImagingReport.[body.orderInformation.supportingInformation.condition](StructureDefinition-EHDSCondition.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[history] ; [ServiceRequestOrderEuImaging](StructureDefinition-ServiceRequestOrderEuImaging.html).supportingInfo |  |
| EHDSImagingReport.[body.orderInformation.supportingInformation.medicationAdministration](StructureDefinition-EHDSMedicationAdministration.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[history] ; [ServiceRequestOrderEuImaging](StructureDefinition-ServiceRequestOrderEuImaging.html).reason |  |
| EHDSImagingReport.[body.orderInformation.supportingInformation.devices](StructureDefinition-EHDSDevice.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[history] ; [ServiceRequestOrderEuImaging](StructureDefinition-ServiceRequestOrderEuImaging.html).supportingInfo | Refer to device, might be replaced by a more constraint reference. |
| EHDSImagingReport.[body.orderInformation.supportingInformation.pregnancyStatus](StructureDefinition-EHDSCurrentPregnancy.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[history] ; [ServiceRequestOrderEuImaging](StructureDefinition-ServiceRequestOrderEuImaging.html).supportingInfo[pregnancy] | Code in supporting info, could be a observation as well |
| EHDSImagingReport.body.orderInformation.supportingInformation.sexForClinicalUse | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).subject ; EuPatient.extension[sex-for-clinical-use] ; EuPatient.extension[sex-for-clinical-use].extension[value].valueCodeableConcept ; EuPatient.extension[sex-for-clinical-use].extension[period].valuePeriod |  |
| EHDSImagingReport.body.orderInformation.supportingInformation.otherSupportingInformation | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[history] |  |
| EHDSImagingReport.[body.specimen](StructureDefinition-EHDSSpecimen.html) | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingReport.[body.serviceRequest](StructureDefinition-EHDSServiceRequest.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[order] |  |
| EHDSImagingReport.body.exposureInformation |  |  |
| EHDSImagingReport.body.exposureInformation.effectiveDose | [ObservationRadiationDoseEuImaging](StructureDefinition-ObservationRadiationDoseEuImaging.html).component | Mapping to a defined slice is needed in the future |
| EHDSImagingReport.body.exposureInformation.equivalentDoseInformation | [ObservationRadiationDoseEuImaging](StructureDefinition-ObservationRadiationDoseEuImaging.html).component | Mapping to a defined slice is needed in the future |
| EHDSImagingReport.body.exposureInformation.equivalentDoseInformation.equivalentDose | [ObservationRadiationDoseEuImaging](StructureDefinition-ObservationRadiationDoseEuImaging.html).component | Mapping to a defined slice is needed in the future |
| EHDSImagingReport.body.exposureInformation.equivalentDoseInformation.tissueType | [ObservationRadiationDoseEuImaging](StructureDefinition-ObservationRadiationDoseEuImaging.html).bodySite |  |
| EHDSImagingReport.body.examinationReport |  |  |
| EHDSImagingReport.body.examinationReport.modality | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| EHDSImagingReport.[body.examinationReport.bodyPart](StructureDefinition-EHDSBodyStructure.html) |  |  |
| EHDSImagingReport.examinationReport.bodyPart.bodyLocation | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series ; EuBodyStructure.morphology ; EuBodyStructure.includedStructure.structure |  |
| EHDSImagingReport.examinationReport.bodyPart.laterality | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series ; EuBodyStructure.includedStructure.laterality |  |
| EHDSImagingReport.[body.examinationReport.imagingProcedures](StructureDefinition-EHDSProcedure.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[procedure] |  |
| EHDSImagingReport.[body.examinationReport.medication](StructureDefinition-EHDSMedicationAdministration.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[procedure] ; EuMedicationAdministration.partOf |  |
| EHDSImagingReport.[body.examinationReport.adverseReaction](StructureDefinition-EHDSAllergyIntolerance.html) | [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).suspectEntity[procedure] ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).contributingFactor[allergy] ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).status ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).code ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).subject |  |
| EHDSImagingReport.body.examinationReport.resultData | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[findings] |  |
| EHDSImagingReport.body.examinationReport.resultData.resultText | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[findings] |  |
| EHDSImagingReport.[body.examinationReport.resultData.observationResults](StructureDefinition-EHDSObservation.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[findings] ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).result |  |
| EHDSImagingReport.body.examinationReport.conclusion | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[impression] |  |
| EHDSImagingReport.body.examinationReport.conclusion.impression | [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).conclusion |  |
| EHDSImagingReport.body.examinationReport.conclusion.conditionOrFinding[x] ([EHDSCondition](StructureDefinition-EHDSCondition.html), [EHDSObservation](StructureDefinition-EHDSObservation.html)) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[impression] ; [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[impression] |  |
| EHDSImagingReport.body.recommendation | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[recommendation] |  |
| EHDSImagingReport.body.recommendation.description | EuCarePlan.description |  |
| EHDSImagingReport.[body.recommendation.carePlan](StructureDefinition-EHDSCarePlan.html) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[recommendation] |  |
| EHDSImagingReport.[body.comparisonStudy](#ehdsimagingreport) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[comparison] |  |
| EHDSImagingReport.[dicomStudyMetadata](#ehdsimagingstudy) | [ImagingStudyEuImagingManifest](https://build.fhir.org/ig/hl7-eu/imaging-manifest/) |  |
| EHDSImagingReport.attachments[x] ([EHDSAttachment](StructureDefinition-EHDSAttachment.html), [EHDSMedia](StructureDefinition-EHDSMedia.html)) | [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html).section[comparison] ; [DiagnosticReportEuImaging](StructureDefinition-DiagnosticReportEuImaging.html).media ; [ObservationFindingEuImaging](StructureDefinition-ObservationFindingEuImaging.html).derivedFrom |  |


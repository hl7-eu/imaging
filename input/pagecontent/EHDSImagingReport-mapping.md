<!--
  Generated file. Do not edit.
-->

#### EHDSImagingReport

The following table shows the mapping from EHDSImagingReport logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| EHDSImagingReport.header |  | N/A |
| EHDSImagingReport.[header.subject](StructureDefinition-EHDSPatient.html) | [ImComposition](StructureDefinition-ImComposition.html).subject ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).subject |  |
| EHDSImagingReport.header.identifier | [ImComposition](StructureDefinition-ImComposition.html).identifier ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).identifier |  |
| EHDSImagingReport.header.authorship | [ImComposition](StructureDefinition-ImComposition.html).author |  |
| EHDSImagingReport.header.authorship.author[x] ([EHDSHealthProfessional](StructureDefinition-EHDSHealthProfessional.html), [EHDSOrganisation](StructureDefinition-EHDSOrganisation.html), [EHDSDevice](StructureDefinition-EHDSDevice.html)) | [ImComposition](StructureDefinition-ImComposition.html).author[author] ; [ImComposition](StructureDefinition-ImComposition.html).author[authoringDevice] ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).resultsInterpreter[author] |  |
| EHDSImagingReport.header.authorship.datetime | [ImComposition](StructureDefinition-ImComposition.html).date ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).issued |  |
| EHDSImagingReport.header.lastUpdate | [ImComposition](StructureDefinition-ImComposition.html).date ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).meta | meta.lastUpdated represents the time at which the instance of the resource was last modified by the server that hosts it. |
| EHDSImagingReport.header.status | [ImComposition](StructureDefinition-ImComposition.html).status ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).status |  |
| EHDSImagingReport.header.statusReason[x] |  |  |
| EHDSImagingReport.header.language | [ImComposition](StructureDefinition-ImComposition.html).language ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).language |  |
| EHDSImagingReport.header.version | [ImComposition](StructureDefinition-ImComposition.html).version |  |
| EHDSImagingReport.[presentedForm](StructureDefinition-EHDSAttachment.html) | [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).presentedForm ; [ImComposition](StructureDefinition-ImComposition.html).text | For all the resources that don't have a .presentedForm element, the .text is the default element to map this requirement. |
| EHDSImagingReport.header.documentType | [ImComposition](StructureDefinition-ImComposition.html).category[imaging] ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).category[imaging] |  |
| EHDSImagingReport.header.documentTitle | [ImComposition](StructureDefinition-ImComposition.html).title |  |
| EHDSImagingReport.header.documentStatus | [ImComposition](StructureDefinition-ImComposition.html).status ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).status |  |
| EHDSImagingReport.header.period | [ImComposition](StructureDefinition-ImComposition.html).event ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).effectivePeriod |  |
| EHDSImagingReport.header.attestation | [ImComposition](StructureDefinition-ImComposition.html).attester[resultValidator] |  |
| EHDSImagingReport.[header.attestation.attester](StructureDefinition-EHDSHealthProfessional.html) | [ImComposition](StructureDefinition-ImComposition.html).attester[resultValidator] |  |
| EHDSImagingReport.header.attestation.datetime | [ImComposition](StructureDefinition-ImComposition.html).attester[resultValidator] |  |
| EHDSImagingReport.header.legalAuthentication | [ImComposition](StructureDefinition-ImComposition.html).attester[legalAuthenticator] |  |
| EHDSImagingReport.[header.legalAuthentication.legalAuthenticator](StructureDefinition-EHDSHealthProfessional.html) | [ImComposition](StructureDefinition-ImComposition.html).attester[legalAuthenticator] |  |
| EHDSImagingReport.header.legalAuthentication.datetime | [ImComposition](StructureDefinition-ImComposition.html).attester[legalAuthenticator] |  |
| EHDSImagingReport.header.eventType | [ImComposition](StructureDefinition-ImComposition.html).event[imagingstudy] ; [ImProcedure](StructureDefinition-ImProcedure.html).location ; [ImComposition](StructureDefinition-ImComposition.html).event[procedure] ; [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series ; [ImImagingStudy](StructureDefinition-ImImagingStudy.html).modality |  |
| EHDSImagingReport.header.authorSpecialty | [ImComposition](StructureDefinition-ImComposition.html).author[author] |  |
| EHDSImagingReport.[header.custodian](StructureDefinition-EHDSOrganisation.html) | [ImComposition](StructureDefinition-ImComposition.html).custodian |  |
| EHDSImagingReport.header.documentFormat | [ImComposition](StructureDefinition-ImComposition.html).type | Could be extended with list of approved templates as a separate category in the future. |
| EHDSImagingReport.header.confidentiality | [ImComposition](StructureDefinition-ImComposition.html).meta ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).meta |  |
| EHDSImagingReport.header.accessionNumber | [ImOrder](StructureDefinition-ImOrder.html).identifier[accessionNumber] ; [ImComposition](StructureDefinition-ImComposition.html).extension[basedOn] |  |
| EHDSImagingReport.[header.healthInsuranceAndPaymentInformation](StructureDefinition-EHDSCoverage.html) | [ImComposition](StructureDefinition-ImComposition.html).extension[basedOn] ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).basedOn ; [ImOrder](StructureDefinition-ImOrder.html).insurance |  |
| EHDSImagingReport.[header.intendedRecipient[x]](StructureDefinition-EHDSPatient.html) | [ImComposition](StructureDefinition-ImComposition.html).extension[informationRecipient] |  |
| EHDSImagingReport.body |  | N/A |
| EHDSImagingReport.body.orderInformation | [ImComposition](StructureDefinition-ImComposition.html).section[order] |  |
| EHDSImagingReport.body.orderInformation.orderId | [ImComposition](StructureDefinition-ImComposition.html).identifier ; [ImComposition](StructureDefinition-ImComposition.html).section[order] |  |
| EHDSImagingReport.body.orderInformation.orderDateAndTime | [ImOrder](StructureDefinition-ImOrder.html).authoredOn |  |
| EHDSImagingReport.[body.orderInformation.orderPlacer](StructureDefinition-EHDSHealthProfessional.html) | [ImOrder](StructureDefinition-ImOrder.html).requester |  |
| EHDSImagingReport.body.orderInformation.orderReasonText | [ImComposition](StructureDefinition-ImComposition.html).section[order] ; [ImOrder](StructureDefinition-ImOrder.html).reason |  |
| EHDSImagingReport.body.orderInformation.orderReason | [ImOrder](StructureDefinition-ImOrder.html).reason | orderReason and clinicalQuestion map to the same element as a design choice |
| EHDSImagingReport.body.orderInformation.clinicalQuestion | [ImOrder](StructureDefinition-ImOrder.html).reason |  |
| EHDSImagingReport.body.orderInformation.supportingInformation | [ImComposition](StructureDefinition-ImComposition.html).section[history] ; [ImOrder](StructureDefinition-ImOrder.html).supportingInfo |  |
| EHDSImagingReport.[body.orderInformation.supportingInformation.observation](StructureDefinition-EHDSObservation.html) | [ImComposition](StructureDefinition-ImComposition.html).section[history] ; [ImOrder](StructureDefinition-ImOrder.html).supportingInfo |  |
| EHDSImagingReport.[body.orderInformation.supportingInformation.condition](StructureDefinition-EHDSCondition.html) | [ImComposition](StructureDefinition-ImComposition.html).section[history] ; [ImOrder](StructureDefinition-ImOrder.html).supportingInfo |  |
| EHDSImagingReport.[body.orderInformation.supportingInformation.medicationAdministration](StructureDefinition-EHDSMedicationAdministration.html) | [ImComposition](StructureDefinition-ImComposition.html).section[history] ; [ImOrder](StructureDefinition-ImOrder.html).reason |  |
| EHDSImagingReport.[body.orderInformation.supportingInformation.devices](StructureDefinition-EHDSDevice.html) | [ImComposition](StructureDefinition-ImComposition.html).section[history] ; [ImOrder](StructureDefinition-ImOrder.html).supportingInfo | Refer to device, might be replaced by a more constraint reference. |
| EHDSImagingReport.[body.orderInformation.supportingInformation.pregnancyStatus](StructureDefinition-EHDSCurrentPregnancy.html) | [ImComposition](StructureDefinition-ImComposition.html).section[history] ; [ImOrder](StructureDefinition-ImOrder.html).supportingInfo[pregnancy] | Code in supporting info, could be a observation as well |
| EHDSImagingReport.body.orderInformation.supportingInformation.sexForClinicalUse | [ImComposition](StructureDefinition-ImComposition.html).subject ; [ImPatient](StructureDefinition-ImPatient.html).extension[sex-for-clinical-use] ; [ImPatient](StructureDefinition-ImPatient.html).extension[sex-for-clinical-use] ; [ImPatient](StructureDefinition-ImPatient.html).extension[sex-for-clinical-use] |  |
| EHDSImagingReport.body.orderInformation.supportingInformation.otherSupportingInformation | [ImComposition](StructureDefinition-ImComposition.html).section[history] |  |
| EHDSImagingReport.[body.specimen](StructureDefinition-EHDSSpecimen.html) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingReport.[body.serviceRequest](StructureDefinition-EHDSServiceRequest.html) | [ImComposition](StructureDefinition-ImComposition.html).section[order] |  |
| EHDSImagingReport.body.exposureInformation |  |  |
| EHDSImagingReport.body.exposureInformation.effectiveDose | [ImRadiationDoseObservation](StructureDefinition-ImRadiationDoseObservation.html).component | Mapping to a defined slice is needed in the future |
| EHDSImagingReport.body.exposureInformation.equivalentDoseInformation | [ImRadiationDoseObservation](StructureDefinition-ImRadiationDoseObservation.html).component | Mapping to a defined slice is needed in the future |
| EHDSImagingReport.body.exposureInformation.equivalentDoseInformation.equivalentDose | [ImRadiationDoseObservation](StructureDefinition-ImRadiationDoseObservation.html).component | Mapping to a defined slice is needed in the future |
| EHDSImagingReport.body.exposureInformation.equivalentDoseInformation.tissueType | [ImRadiationDoseObservation](StructureDefinition-ImRadiationDoseObservation.html).bodySite |  |
| EHDSImagingReport.body.examinationReport |  |  |
| EHDSImagingReport.body.examinationReport.modality | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| EHDSImagingReport.[body.examinationReport.bodyPart](StructureDefinition-EHDSBodyStructure.html) |  |  |
| EHDSImagingReport.examinationReport.bodyPart.bodyLocation | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series ; EuBodyStructure.morphology ; EuBodyStructure.includedStructure.structure |  |
| EHDSImagingReport.examinationReport.bodyPart.laterality | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series ; EuBodyStructure.includedStructure.laterality |  |
| EHDSImagingReport.[body.examinationReport.imagingProcedures](StructureDefinition-EHDSProcedure.html) | [ImComposition](StructureDefinition-ImComposition.html).section[procedure] |  |
| EHDSImagingReport.[body.examinationReport.medication](StructureDefinition-EHDSMedicationAdministration.html) | [ImComposition](StructureDefinition-ImComposition.html).section[procedure] ; EuMedicationAdministration.partOf |  |
| EHDSImagingReport.[body.examinationReport.adverseReaction](StructureDefinition-EHDSAllergyIntolerance.html) | [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).suspectEntity[procedure] ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).contributingFactor[allergy] ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).status ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).code ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).subject |  |
| EHDSImagingReport.body.examinationReport.resultData | [ImComposition](StructureDefinition-ImComposition.html).section[findings] |  |
| EHDSImagingReport.body.examinationReport.resultData.resultText | [ImComposition](StructureDefinition-ImComposition.html).section[findings] |  |
| EHDSImagingReport.[body.examinationReport.resultData.observationResults](StructureDefinition-EHDSObservation.html) | [ImComposition](StructureDefinition-ImComposition.html).section[findings] ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).result |  |
| EHDSImagingReport.body.examinationReport.conclusion | [ImComposition](StructureDefinition-ImComposition.html).section[impression] |  |
| EHDSImagingReport.body.examinationReport.conclusion.impression | [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).conclusion |  |
| EHDSImagingReport.body.examinationReport.conclusion.conditionOrFinding[x] ([EHDSCondition](StructureDefinition-EHDSCondition.html), [EHDSObservation](StructureDefinition-EHDSObservation.html)) | [ImComposition](StructureDefinition-ImComposition.html).section[impression] ; [ImComposition](StructureDefinition-ImComposition.html).section[impression] |  |
| EHDSImagingReport.body.recommendation | [ImComposition](StructureDefinition-ImComposition.html).section[recommendation] |  |
| EHDSImagingReport.body.recommendation.description | EuCarePlan.description |  |
| EHDSImagingReport.[body.recommendation.carePlan](StructureDefinition-EHDSCarePlan.html) | [ImComposition](StructureDefinition-ImComposition.html).section[recommendation] |  |
| EHDSImagingReport.[body.comparisonStudy](#ehdsimagingreport) | [ImComposition](StructureDefinition-ImComposition.html).section[comparison] |  |
| EHDSImagingReport.[dicomStudyMetadata](#ehdsimagingstudy) | [ImImagingStudyManifest](StructureDefinition-ImImagingStudyManifest.html).entry[imagingstudy] |  |
| EHDSImagingReport.attachments[x] ([EHDSAttachment](StructureDefinition-EHDSAttachment.html), [EHDSMedia](StructureDefinition-EHDSMedia.html)) | [ImComposition](StructureDefinition-ImComposition.html).section[comparison] ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).media ; [ImFinding](StructureDefinition-ImFinding.html).derivedFrom |  |


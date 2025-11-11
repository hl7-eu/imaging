<!--
  Generated file. Do not edit.
-->

#### EHDSImagingReport

The following table shows the mapping from EHDSImagingReport logical model elements to FHIR profiles.

The source data for the mapping to other FHIR versions of this Implementation Guide can be found in the [Google spreadsheet](https://docs.google.com/spreadsheets/d/1-Eo2eh8iEj5PgzoiWoJdifhlkvXJDXdn5RwaS4-iq-Y/edit?usp=sharing).



| Element | Target | Comments |
| ------- | ------ | -------- |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header |  | N/A |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[header.subject](StructureDefinition-EHDSPatient.html) | CompositionEuImaging.subject;<br/>DiagnosticReportEuImaging.subject |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.identifier | CompositionEuImaging.identifier;<br/>DiagnosticReportEuImaging.identifier |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.authorship | CompositionEuImaging.author |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.authorship.author[x] | CompositionEuImaging.author[author];<br/>CompositionEuImaging.author[organization];<br/>DiagnosticReportEuImaging.performer[organization];<br/>DiagnosticReportEuImaging.resultsInterpreter[author] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.authorship.datetime | CompositionEuImaging.date;<br/>DiagnosticReportEuImaging.issued |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.lastUpdate | CompositionEuImaging.date;<br/>DiagnosticReportEuImaging.meta.lastUpdated | meta.lastUpdated represents the time at which the instance of the resource was last modified by the server that hosts it. |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.status | CompositionEuImaging.status;<br/>DiagnosticReportEuImaging.status |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.statusReason[x] |  |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.language | CompositionEuImaging.language;<br/>DiagnosticReportEuImaging.language |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.version | CompositionEuImaging.extension[version] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[presentedForm](StructureDefinition-EHDSAttachment.html) | DiagnosticReportEuImaging.presentedForm;<br/>CompositionEuImaging.text | For all the resources that don't have a .presentedForm element, the .text is the default element to map this requirement. |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.documentType | CompositionEuImaging.category[diagnostic-service];<br/>DiagnosticReportEuImaging.category[diagnostic-service] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.documentTitle | CompositionEuImaging.title |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.documentStatus | CompositionEuImaging.status;<br/>DiagnosticReportEuImaging.status |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.period | CompositionEuImaging.event.period;<br/>DiagnosticReportEuImaging.effectivePeriod |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.attestation | CompositionEuImaging.attester[resultValidator] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[header.attestation.attester](StructureDefinition-EHDSHealthProfessional.html) | CompositionEuImaging.attester[resultValidator].party |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.attestation.datetime | CompositionEuImaging.attester[resultValidator].time |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.legalAuthentication | CompositionEuImaging.attester[legalAuthenticator] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[header.legalAuthentication.legalAuthenticator](StructureDefinition-EHDSHealthProfessional.html) | CompositionEuImaging.attester[legalAuthenticator].party |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.legalAuthentication.datetime | CompositionEuImaging.attester[legalAuthenticator].time |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.eventType | CompositionEuImaging.category[diagnostic-service];<br/>ProcedureEuImaging.code;<br/>[ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series;<br/>[ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).modality |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.authorSpecialty | CompositionEuImaging.author[author];<br/>DiagnosticReportEuImaging.resultIntepreter[author] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[header.custodian](StructureDefinition-EHDSOrganisation.html) | CompositionEuImaging.custodian |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.documentFormat | BundleReportEuImagingDocumentReference.content..extension[profile] | Could be extended with list of approved templates as a separate category in the future. |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.confidentiality | CompositionEuImaging.meta.security;<br/>DiagnosticReportEuImaging.meta.security |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).header.accessionNumber | ServiceRequestOrderEuImaging.identifier[accessionNumber];<br/>CompositionEuImaging.extension[basedOn] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[header.healthInsuranceAndPaymentInformation](StructureDefinition-EHDSCoverage.html) | CompositionEuImaging.extension[basedOn];<br/>DiagnosticReportEuImaging.basedOn;<br/>ServiceRequestOrderEuImaging.insurance |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[header.intendedRecipient[x]](StructureDefinition-EHDSPatient.html) | CompositionEuImaging.extension[informationRecipient] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body |  | N/A |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation | CompositionEuImaging.section[order] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.orderId | CompositionEuImaging.identifier;<br/>CompositionEuImaging.section[order].entry[order];<br/>DiagnosticReportEuImaging.basedOn |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.orderDateAndTime | ServiceRequestOrderEuImaging.authoredOn;<br/>DiagnosticReportEuImaging.basedOn |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.orderInformation.orderPlacer](StructureDefinition-EHDSHealthProfessional.html) | ServiceRequestOrderEuImaging.requester;<br/>DiagnosticReportEuImaging.basedOn |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.orderReasonText | CompositionEuImaging.section[order].extension[note];<br/>ServiceRequestOrderEuImaging.extension[reason].extension[concept].valueCodeableConcept.text |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.orderReason | ServiceRequestOrderEuImaging.extension[reason].extension[concept].valueCodeableConcept | orderReason and clinicalQuestion map to the same element as a design choice |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.clinicalQuestion | ServiceRequestOrderEuImaging.extension[reason].extension[concept].valueCodeableConcept |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.supportingInformation | CompositionEuImaging.section[history].entry;<br/>ServiceRequestOrderEuImaging.supportingInfo;<br/>DiagnosticReportEuImaging.extension[patientHistory] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.orderInformation.supportingInformation.observation](StructureDefinition-EHDSObservation.html) | CompositionEuImaging.section[history].entry;<br/>ServiceRequestOrderEuImaging.supportingInfo;<br/>DiagnosticReportEuImaging.extension[patientHistory] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.orderInformation.supportingInformation.condition](StructureDefinition-EHDSCondition.html) | CompositionEuImaging.section[history].entry;<br/>ServiceRequestOrderEuImaging.supportingInfo;<br/>DiagnosticReportEuImaging.extension[patientHistory] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.orderInformation.supportingInformation.medicationAdministration](StructureDefinition-EHDSMedicationAdministration.html) | CompositionEuImaging.section[history].entry;<br/>ServiceRequestOrderEuImaging.extension[reason];<br/>DiagnosticReportEuImaging.extension[patientHistory] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.orderInformation.supportingInformation.devices](StructureDefinition-EHDSDevice.html) | CompositionEuImaging.section[history].entry;<br/>ServiceRequestOrderEuImaging.supportingInfo;<br/>DiagnosticReportEuImaging.extension[patientHistory] | Refer to device, might be replaced by a more constraint reference. |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.orderInformation.supportingInformation.pregnancyStatus](StructureDefinition-EHDSCurrentPregnancy.html) | CompositionEuImaging.section[history].entry;<br/>ServiceRequestOrderEuImaging.supportingInfo;<br/>DiagnosticReportEuImaging.extension[patientHistory] | Code in supporting info, could be a observation as well |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.orderInformation.supportingInformation.sexForClinicalUse | CompositionEuImaging.subject;<br/>EuPatient.extension[sex-for-clinical-use];<br/>EuPatient.extension[sex-for-clinical-use].extension[value].valueCodeableConcept;<br/>EuPatient.extension[sex-for-clinical-use].extension[period].valuePeriod |  |
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
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).examinationReport.bodyPart.bodyLocation | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series;<br/>EuBodyStructure.morphology |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).examinationReport.bodyPart.laterality | [ImagingStudyEuImaging](StructureDefinition-ImagingStudyEuImaging.html).series |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.examinationReport.imagingProcedures](StructureDefinition-EHDSProcedure.html) | CompositionEuImaging.section[procedure].entry[procedure] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.examinationReport.medication](StructureDefinition-EHDSMedicationAdministration.html) | CompositionEuImaging.section[procedure].entry[procedure];<br/>EuMedicationAdministration.partOf |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.examinationReport.adverseReaction](StructureDefinition-EHDSAllergyIntolerance.html) | [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).suspectEntity[procedure];<br/>[ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).subjectMedicalHistory[allergy];<br/>[ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).status;<br/>[ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).code;<br/>[ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).subject |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.examinationReport.resultData | CompositionEuImaging.section[findings];<br/>DiagnosticReportEuImaging.result |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.examinationReport.resultData.resultText | CompositionEuImaging.section[findings].extension[note];<br/>DiagnosticReportEuImaging.result |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.examinationReport.resultData.observationResults](StructureDefinition-EHDSObservation.html) | CompositionEuImaging.section[findings].entry[ObservationFindingEuImaging];<br/>DiagnosticReportEuImaging.result |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.examinationReport.conclusion | CompositionEuImaging.section[impression];<br/>DiagnosticReportEuImaging..extension[impression] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.examinationReport.conclusion.impression | CompositionEuImaging.section[impression];<br/>DiagnosticReportEuImaging..extension[impression] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.examinationReport.conclusion.conditionOrFinding[x] | CompositionEuImaging.section[impression].entry[ObservationFindingEuImaging];<br/>CompositionEuImaging.section[impression].entry[impression] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.recommendation | CompositionEuImaging.section[recommendation];<br/>DiagnosticReportEuImaging.extension[recommendation] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).body.recommendation.description | EuCarePlan.description |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.recommendation.carePlan](StructureDefinition-EHDSCarePlan.html) | CompositionEuImaging.section[recommendation].entry[suggestion] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[body.comparisonStudy](#ehdsimagingreport) | CompositionEuImaging.section[comparison].entry[comparedstudy];<br/>DiagnosticReportEuImaging.extension[comparison |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).[dicomStudyMetadata](#ehdsimagingstudy) | [ImagingStudyEuImagingManifest](StructureDefinition-ImagingStudyEuImagingManifest.html).entry[imagingstudy] |  |
| [EHDSImagingReport](StructureDefinition-EHDSImagingReport.html).attachments[x] | CompositionEuImaging.section[comparison].entry[comparedstudy];<br/>DiagnosticReportEuImaging.media;<br/>ObservationFindingEuImaging.derivedFrom |  |
{:.table-bordered .table-striped .thead-light}

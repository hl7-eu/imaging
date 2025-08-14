<!--
  Generated file. Do not edit.
-->

---
title: EHDSImagingReport Mapping
---

### EHDSImagingReport

The following table shows the mapping from EHDSImagingReport logical model elements to FHIR profiles.

{:.grid}
| Element | Target FHIR resource.element | Comments |
| ------- | ---------------------------- | -------- |
| [attachments[x]](#ehdsmedia) | [ImComposition](StructureDefinition-ImComposition.html).section[comparison] ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).media ; [ImFinding](StructureDefinition-ImFinding.html).derivedFrom | supporting info and key images |
| body |  |  |
| [body.comparisonStudy](#ehdsimagingreport) | [ImComposition](StructureDefinition-ImComposition.html).section[comparison] |  |
| body.examinationReport |  |  |
| [body.examinationReport.adverseReaction](#ehdsallergyintolerance) | [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).suspectEntity[procedure] ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).contributingFactor[allergy] ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).status ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).code ; [ImAdverseEvent](StructureDefinition-ImAdverseEvent.html).subject |  |
| [body.examinationReport.bodyPart](#ehdsbodystructure) |  |  |
| body.examinationReport.conclusion | [ImComposition](StructureDefinition-ImComposition.html).section[impression] |  |
| [body.examinationReport.conclusion.conditionOrFinding[x]](#ehdsobservation) | [ImComposition](StructureDefinition-ImComposition.html).section[impression] ; [ImComposition](StructureDefinition-ImComposition.html).section[impression] |  |
| body.examinationReport.conclusion.impression | [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).conclusion | In which resource is this documented besides DiagnosticReport? None. DiagnosticReport is the correct place. |
| [body.examinationReport.imagingProcedures](#ehdsprocedure) | [ImComposition](StructureDefinition-ImComposition.html).section[procedure] |  |
| [body.examinationReport.medication](#ehdsmedicationadministration) | [ImComposition](StructureDefinition-ImComposition.html).section[procedure] ; EuMedicationAdministration.partOf |  |
| body.examinationReport.modality | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| body.examinationReport.resultData | [ImComposition](StructureDefinition-ImComposition.html).section[findings] |  |
| [body.examinationReport.resultData.observationResults](#ehdsobservation) | [ImComposition](StructureDefinition-ImComposition.html).section[findings] ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).result |  |
| body.examinationReport.resultData.resultText | [ImComposition](StructureDefinition-ImComposition.html).section[findings] |  |
| body.exposureInformation |  |  |
| body.exposureInformation.effectiveDose | [ImRadiationDoseObservation](StructureDefinition-ImRadiationDoseObservation.html).component | Mapping to slice needed |
| body.exposureInformation.equivalentDoseInformation | [ImRadiationDoseObservation](StructureDefinition-ImRadiationDoseObservation.html).component | Mapping to slice needed |
| body.exposureInformation.equivalentDoseInformation.equivalentDose | [ImRadiationDoseObservation](StructureDefinition-ImRadiationDoseObservation.html).component | Mapping to slice needed |
| body.exposureInformation.equivalentDoseInformation.tissueType | [ImRadiationDoseObservation](StructureDefinition-ImRadiationDoseObservation.html).bodySite |  |
| body.orderInformation | [ImComposition](StructureDefinition-ImComposition.html).section[order] |  |
| body.orderInformation.clinicalQuestion | [ImOrder](StructureDefinition-ImOrder.html).reason |  |
| body.orderInformation.orderDateAndTime | [ImOrder](StructureDefinition-ImOrder.html).authoredOn |  |
| body.orderInformation.orderId | [ImComposition](StructureDefinition-ImComposition.html).identifier ; [ImComposition](StructureDefinition-ImComposition.html).section[order] |  |
| [body.orderInformation.orderPlacer](#ehdshealthprofessional) | [ImOrder](StructureDefinition-ImOrder.html).requester |  |
| body.orderInformation.orderReason | [ImOrder](StructureDefinition-ImOrder.html).reason |  |
| body.orderInformation.orderReasonText | [ImComposition](StructureDefinition-ImComposition.html).section[order] ; [ImOrder](StructureDefinition-ImOrder.html).reason |  |
| body.orderInformation.supportingInformation | [ImComposition](StructureDefinition-ImComposition.html).section[history] ; [ImOrder](StructureDefinition-ImOrder.html).supportingInfo |  |
| [body.orderInformation.supportingInformation.condition](#ehdscondition) | [ImComposition](StructureDefinition-ImComposition.html).section[history] ; [ImOrder](StructureDefinition-ImOrder.html).supportingInfo |  |
| [body.orderInformation.supportingInformation.devices](#ehdsdevice) | [ImComposition](StructureDefinition-ImComposition.html).section[history] ; [ImOrder](StructureDefinition-ImOrder.html).supportingInfo |  |
| [body.orderInformation.supportingInformation.medicationAdministration](#ehdsmedicationadministration) | [ImComposition](StructureDefinition-ImComposition.html).section[history] ; [ImOrder](StructureDefinition-ImOrder.html).reason |  |
| [body.orderInformation.supportingInformation.observation](#ehdsobservation) | [ImComposition](StructureDefinition-ImComposition.html).section[history] ; [ImOrder](StructureDefinition-ImOrder.html).supportingInfo |  |
| body.orderInformation.supportingInformation.otherSupportingInformation | [ImComposition](StructureDefinition-ImComposition.html).section[history] |  |
| [body.orderInformation.supportingInformation.pregnancyStatus](#ehdscurrentpregnancy) | [ImComposition](StructureDefinition-ImComposition.html).section[history] ; [ImOrder](StructureDefinition-ImOrder.html).supportingInfo[pregnancy] |  |
| body.orderInformation.supportingInformation.sexForClinicalUse | [ImComposition](StructureDefinition-ImComposition.html).subject ; [ImPatient](StructureDefinition-ImPatient.html).extension[sex-for-clinical-use] ; [ImPatient](StructureDefinition-ImPatient.html).extension[sex-for-clinical-use] ; [ImPatient](StructureDefinition-ImPatient.html).extension[sex-for-clinical-use] |  |
| body.recommendation | [ImComposition](StructureDefinition-ImComposition.html).section[recommendation] |  |
| [body.recommendation.carePlan](#ehdscareplan) | [ImComposition](StructureDefinition-ImComposition.html).section[recommendation] |  |
| body.recommendation.description | EuCarePlan.description |  |
| [body.serviceRequest](#ehdsservicerequest) | [ImComposition](StructureDefinition-ImComposition.html).section[order] |  |
| [body.specimen](#ehdsspecimen) | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series |  |
| [dicomStudyMetadata](#ehdsimagingstudy) | [ImImagingStudyManifest](StructureDefinition-ImImagingStudyManifest.html).entry[imagingstudy] |  |
| examinationReport.bodyPart.bodyLocation | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series ; EuBodyStructure.morphology ; EuBodyStructure.includedStructure.structure |  |
| examinationReport.bodyPart.laterality | [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series ; EuBodyStructure.includedStructure.laterality |  |
| header |  |  |
| header.accessionNumber | [ImOrder](StructureDefinition-ImOrder.html).identifier[accessionNumber] ; [ImComposition](StructureDefinition-ImComposition.html).extension[basedOn] |  |
| header.attestation | [ImComposition](StructureDefinition-ImComposition.html).attester[resultValidator] |  |
| [header.attestation.attester](#ehdshealthprofessional) | [ImComposition](StructureDefinition-ImComposition.html).attester[resultValidator] |  |
| header.attestation.datetime | [ImComposition](StructureDefinition-ImComposition.html).attester[resultValidator] |  |
| header.authorSpecialty | [ImComposition](StructureDefinition-ImComposition.html).event[procedure] ; [ImComposition](StructureDefinition-ImComposition.html).event[imagingstudy] ; [ImImagingStudy](StructureDefinition-ImImagingStudy.html).location ; [ImProcedure](StructureDefinition-ImProcedure.html).location |  |
| header.authorship | [ImComposition](StructureDefinition-ImComposition.html).author |  |
| [header.authorship.author[x]](#ehdsdevice) | [ImComposition](StructureDefinition-ImComposition.html).author[author] ; [ImComposition](StructureDefinition-ImComposition.html).author[authoringDevice] ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).resultsInterpreter[author] |  |
| header.authorship.datetime | [ImComposition](StructureDefinition-ImComposition.html).date ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).issued |  |
| header.confidentiality | [ImComposition](StructureDefinition-ImComposition.html).meta ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).meta | also all other resources? |
| [header.custodian](#ehdsorganisation) | [ImComposition](StructureDefinition-ImComposition.html).custodian |  |
| header.documentFormat | [ImComposition](StructureDefinition-ImComposition.html).type |  |
| header.documentStatus | [ImComposition](StructureDefinition-ImComposition.html).status ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).status |  |
| header.documentTitle | [ImComposition](StructureDefinition-ImComposition.html).title |  |
| header.documentType | [ImComposition](StructureDefinition-ImComposition.html).category[imaging] ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).category[imaging] |  |
| header.eventType | [ImComposition](StructureDefinition-ImComposition.html).event[imagingstudy] ; [ImProcedure](StructureDefinition-ImProcedure.html).location ; [ImComposition](StructureDefinition-ImComposition.html).event[procedure] ; [ImImagingStudy](StructureDefinition-ImImagingStudy.html).series ; [ImImagingStudy](StructureDefinition-ImImagingStudy.html).modality | lab -> category |
| [header.healthInsuranceAndPaymentInformation](#ehdscoverage) | [ImComposition](StructureDefinition-ImComposition.html).extension[basedOn] ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).basedOn ; [ImOrder](StructureDefinition-ImOrder.html).insurance |  |
| header.identifier | [ImComposition](StructureDefinition-ImComposition.html).identifier ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).identifier |  |
| [header.intendedRecipient[x]](#ehdspatient) | [ImComposition](StructureDefinition-ImComposition.html).extension[informationRecipient] |  |
| header.language | [ImComposition](StructureDefinition-ImComposition.html).language ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).language |  |
| header.lastUpdate |  |  |
| header.legalAuthentication | [ImComposition](StructureDefinition-ImComposition.html).attester[legalAuthenticator] |  |
| header.legalAuthentication.datetime | [ImComposition](StructureDefinition-ImComposition.html).attester[legalAuthenticator] |  |
| [header.legalAuthentication.legalAuthenticator](#ehdshealthprofessional) | [ImComposition](StructureDefinition-ImComposition.html).attester[legalAuthenticator] |  |
| header.period | [ImComposition](StructureDefinition-ImComposition.html).event ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).effectivePeriod |  |
| header.status | [ImComposition](StructureDefinition-ImComposition.html).status ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).status |  |
| header.statusReason[x] |  |  |
| [header.subject](#ehdspatient) | [ImComposition](StructureDefinition-ImComposition.html).subject ; [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).subject |  |
| header.version | [ImComposition](StructureDefinition-ImComposition.html).version |  |
| [presentedForm](#ehdsattachment) | [ImDiagnosticReport](StructureDefinition-ImDiagnosticReport.html).presentedForm |  |


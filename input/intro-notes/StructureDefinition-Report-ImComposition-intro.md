{% include variable-definitions.md %}
For report creators, this page provides guidance on how to populate the narrative of each section, which is encoded in the `Composition.section.text` element of each section slice of this profile.

The table below suggests the data points that SHOULD be included, and the source of those data. Those data points can be in a first order resource, referenced directly from the Composition (e.g. ImOrder), or they can live in a second,third order resource (e.g. Medication). For the later, a second query or a FHIR path (resolve) expression is required to fetch them.

NOTE: Structural concerns and rationale on the ImComposition profile can be found in the [ImComposition](StructureDefinition-ImComposition.html), which is the parent type of this Report-ImComposition profile.

## Elements to include in sections narratives

### Imaging Study

The following table lists the elements that should be included in the narrative of the Imaging Study section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field | Comments |
| -------- | ------- | -------------- | --------------------- | -------- |
| EuDevice | type |  | EHDSDevice.type |  |
| ImagingStudyEuImaging | series.specimen | EuSpecimen | EHDSImagingReportBody.specimen |  |
| ImagingStudyEuImaging | series.modality |  | EHDSImagingReportBody.examinationReport.modality |  |
| ImagingStudyEuImaging | series.bodySite | EuBodyStructure | EHDSImagingReportBody.examinationReport.bodyPart.bodyLocation |  |
| ImagingStudyEuImaging | series.bodySite | EuBodyStructure | EHDSImagingReportBody.examinationReport.bodyPart.laterality |  |
| EuBodyStructure | includedStructure.laterality |  | EHDSImagingReportBody.examinationReport.bodyPart.laterality |  |
| ImagingStudyEuImaging | identifier[studyInstanceUid] |  | EHDSImagingStudy.identifier |  |
| ImagingStudyEuImaging | modality |  | EHDSImagingStudy.modality |  |
| ImagingStudyEuImaging | numberOfSeries |  | EHDSImagingStudy.numberOfSeries |  |
| ImagingStudyEuImaging | description |  | EHDSImagingStudy.description |  |
| ImagingStudyEuImaging | series.bodySite | EuBodyStructure | EHDSImagingStudy.series.bodySite |  |
| ImagingStudyEuImaging | series.laterality |  | EHDSImagingStudy.series.laterality |  |
| ImagingStudyEuImaging | series.specimen | EuSpecimen | EHDSImagingStudy.series.specimen |  |
| ImagingStudyEuImaging | series.started |  | EHDSImagingStudy.series.started |  |
| ObservationRadiationDoseEuImaging | component.value[x] | - | EHDSImagingStudy.series.instancesInTheSeries.radiationDoseInformation.kap | Mapping to slice needed |
| EuDevice | name |  | EHDSMedia.deviceName |  |

### Order

The following table lists the elements that should be included in the narrative of the Order section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| ServiceRequestOrderEuImaging | authoredOn |  | EHDSImagingReportBody.orderInformation.orderDateAndTime |
| ServiceRequestOrderEuImaging | requester | EuPractitionerRole | EHDSImagingReportBody.orderInformation.orderPlacer |
| CompositionEuImaging | section[order].extension[note] |  | EHDSImagingReportBody.orderInformation.orderReasonText |
| ServiceRequestOrderEuImaging | reason.concept |  | EHDSImagingReportBody.orderInformation.orderReason |
| ServiceRequestOrderEuImaging | reason.concept |  | EHDSImagingReportBody.orderInformation.clinicalQuestion |
| ServiceRequestOrderEuImaging | identifier[accessionNumber] |  | EHDSImagingReportHeader.documentMetadata.accessionNumber |

### History

The following table lists the elements that should be included in the narrative of the History section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| ServiceRequestOrderEuImaging | supportingInfo | EuObservation | EHDSImagingReportBody.orderInformation.supportingInformation.observation |
| ServiceRequestOrderEuImaging | supportingInfo | EuCondition | EHDSImagingReportBody.orderInformation.supportingInformation.condition |
| ServiceRequestOrderEuImaging | reason | EuMedicationAdministration | EHDSImagingReportBody.orderInformation.supportingInformation.medicationAdministration |
| ServiceRequestOrderEuImaging | supportingInfo[pregnancy] |  | EHDSImagingReportBody.orderInformation.supportingInformation.pregnancyStatus |
| ObservationGestationalAgeEuImaging | value[x] | - | EHDSImagingReportBody.orderInformation.supportingInformation.gestationalAge |
| PatientEuImaging | extension[sex-for-clinical-use] |  | EHDSImagingReportBody.orderInformation.supportingInformation.sexForClinicalUse |
| PatientEuImaging | extension[sex-for-clinical-use].extension[value].valueCodeableConcept |  | EHDSImagingReportBody.orderInformation.supportingInformation.sexForClinicalUse |
| PatientEuImaging | extension[sex-for-clinical-use].extension[period].valuePeriod |  | EHDSImagingReportBody.orderInformation.supportingInformation.sexForClinicalUse |

### Procedure

The following table lists the elements that should be included in the narrative of the Procedure section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field | Comments |
| -------- | ------- | -------------- | --------------------- | -------- |
| EuAllergyIntolerance | text |  | EHDSAllergyIntolerance.allergyDescription |  |
| EuAllergyIntolerance | reaction |  | EHDSAllergyIntolerance.allergyManifestation |  |
| EuAllergyIntolerance | reaction.severity |  | EHDSAllergyIntolerance.allergyManifestation.severity |  |
| EuAllergyIntolerance | reaction.description |  | EHDSAllergyIntolerance.allergyManifestation.description |  |
| EuAllergyIntolerance | reaction.manifestation |  | EHDSAllergyIntolerance.allergyManifestation.manifestation |  |
| EuAllergyIntolerance | criticality |  | EHDSAllergyIntolerance.criticality |  |
| EuAllergyIntolerance | onsetPeriod |  | EHDSAllergyIntolerance.onsetDate |  |
| EuAllergyIntolerance | onsetDateTime |  | EHDSAllergyIntolerance.onsetDate |  |
| EuDevice | type |  | EHDSDevice.type |  |
| ObservationRadiationDoseEuImaging | component.value[x] | - | EHDSImagingReportBody.exposureInformation.effectiveDose | Mapping to slice needed |
| CompositionEuImaging | section[procedure].entry[procedure] | EuProcedure | EHDSImagingReportBody.examinationReport.medication |  |
| EuMedicationAdministration | partOf | ProcedureEuImaging | EHDSImagingReportBody.examinationReport.medication |  |
| AdverseEventEuImaging | status |  | EHDSImagingReportBody.examinationReport.adverseReaction |  |
| AdverseEventEuImaging | code |  | EHDSImagingReportBody.examinationReport.adverseReaction |  |
| EuDevice | name |  | EHDSMedia.deviceName |  |
| EuMedicationAdministration | reason |  | EHDSMedicationAdministration.reason |  |
| EuMedicationAdministration | note |  | EHDSMedicationAdministration.note |  |
| EuMedicationAdministration | dosage.text |  | EHDSMedicationAdministration.dosage.dosageDescription |  |
| EuMedicationAdministration | dosage.site |  | EHDSMedicationAdministration.dosage.site |  |
| EuMedicationAdministration | dosage.route |  | EHDSMedicationAdministration.dosage.route |  |
| EuMedicationAdministration | dosage.dose |  | EHDSMedicationAdministration.dosage.dose | Quantity-> SimpleQuantity |

### Comparison

The following table lists the elements that should be included in the narrative of the Comparison section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| CompositionEuImaging | section[comparison].entry[comparedstudy] | ImagingStudyEuImaging | EHDSImagingReportBody.comparisonStudy |

### Findings

The following table lists the elements that should be included in the narrative of the Findings section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| CompositionEuImaging | section[findings].extension[note] |  | EHDSImagingReportBody.examinationReport.resultData.resultText |
| DiagnosticReportEuImaging | result | ObservationFindingEuImaging, ObservationRadiationDoseEuImaging | EHDSImagingReportBody.examinationReport.resultData.observationResults |

### Impression

The following table lists the elements that should be included in the narrative of the Impression section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field | Comments |
| -------- | ------- | -------------- | --------------------- | -------- |
| EuCondition | note |  | EHDSCondition.description |  |
| EuCondition | code |  | EHDSCondition.code |  |
| EuCondition | clinicalStatus |  | EHDSCondition.clinicalStatus |  |
| EuCondition | severity |  | EHDSCondition.severity |  |
| EuCondition | bodySite |  | EHDSCondition.anatomicLocation |  |
| DiagnosticReportEuImaging | conclusion |  | EHDSImagingReportBody.examinationReport.conclusion.impression | In which resource is this documented besides DiagnosticReport? None. DiagnosticReport is the correct place. |
| CompositionEuImaging | section[impression].entry[ObservationFindingEuImaging] | ObservationFindingEuImaging | EHDSImagingReportBody.examinationReport.conclusion.conditionOrFinding[x] |  |

### Recommendation

The following table lists the elements that should be included in the narrative of the Recommendation section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| EuCarePlan | status |  | EHDSCarePlan.status |
| EuCarePlan | title |  | EHDSCarePlan.title |
| EuCarePlan | description |  | EHDSCarePlan.description |
| EuCarePlan | goal | EuGoal | EHDSCarePlan.goal |
| EuCarePlan | activity |  | EHDSCarePlan.activity |
| EuCarePlan | note |  | EHDSCarePlan.note |
| EuCarePlan | description |  | EHDSImagingReportBody.recommendation.description |


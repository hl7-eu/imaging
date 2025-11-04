{% include variable-definitions.md %}
For report creators, this page provides guidance on how to populate the narrative of each section, which is encoded in the `Composition.section.text` element of each section slice of this profile.

The table below suggests the data points that SHOULD be included, and the source of those data. Those data points can be in a first order resource, referenced directly from the Composition (e.g. ServiceRequestOrderEuImaging), or they can live in a second,third order resource (e.g. Medication). For the later, a second query or a FHIR path (resolve) expression is required to fetch them.

NOTE: Structural concerns and rationale on the CompositionEuImaging profile can be found in the [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html), which is the parent type of this Report-CompositionEuImaging profile.

## Elements to include in sections narratives

### Imaging Study

The following table lists the elements that should be included in the narrative of the Imaging Study section.

{:.grid}
| First order resource       | Element            | Referenced resource |
| -------------------------- | ------------------ | ------------------- |
| EuDevice                   | type               |                     |
| ImagingStudyEuImaging             | series.specimen    | EuSpecimen          |
| ObservationRadiationDoseEuImaging | component.value[x] | -                   |
| ImagingStudyEuImaging             | series.modality    |                     |
| ImagingStudyEuImaging             | series.bodySite    | EuBodyStructure     |
| ImagingStudyEuImaging             | series.bodySite    | EuBodyStructure     |
| EuBodyStructure            | includedStructure.laterality |           |
| ImagingStudyEuImaging             | series.performer   |                     |
| ImagingStudyEuImaging             | status             |                     |
| ImagingStudyEuImaging             | modality           |                     |
| ImagingStudyEuImaging             | started            |                     |
| ImagingStudyEuImaging             | description        |                     |
| EuDevice                   | name               |                     |

### Order

The following table lists the elements that should be included in the narrative of the Order section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field | Comments |
| -------- | ------- | -------------- | --------------------- | -------- |
| ServiceRequestOrderEuImaging | identifier[accessionNumber] |  | EHDSImagingReport.header.accessionNumber |  |
| ServiceRequestOrderEuImaging | authoredOn |  | EHDSImagingReport.body.orderInformation.orderDateAndTime |  |
| ServiceRequestOrderEuImaging | requester | EuPractitionerRole | EHDSImagingReport.body.orderInformation.orderPlacer |  |
| CompositionEuImaging | section[order].extension[note] |  | EHDSImagingReport.body.orderInformation.orderReasonText |  |
| ServiceRequestOrderEuImaging | reason.concept |  | EHDSImagingReport.body.orderInformation.orderReason | orderReason and clinicalQuestion map to the same element as a design choice |
| ServiceRequestOrderEuImaging | reason.concept |  | EHDSImagingReport.body.orderInformation.clinicalQuestion |  |

### History

The following table lists the elements that should be included in the narrative of the History section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field | Comments |
| -------- | ------- | -------------- | --------------------- | -------- |
| ServiceRequestOrderEuImaging | supportingInfo | EuObservation | EHDSImagingReport.body.orderInformation.supportingInformation.observation |  |
| ServiceRequestOrderEuImaging | supportingInfo | EuCondition | EHDSImagingReport.body.orderInformation.supportingInformation.condition |  |
| ServiceRequestOrderEuImaging | reason | EuMedicationAdministration | EHDSImagingReport.body.orderInformation.supportingInformation.medicationAdministration |  |
| ServiceRequestOrderEuImaging | supportingInfo[pregnancy] |  | EHDSImagingReport.body.orderInformation.supportingInformation.pregnancyStatus | Code in supporting info, could be an observation as well |
| EuPatient | extension[sex-for-clinical-use] |  | EHDSImagingReport.body.orderInformation.supportingInformation.sexForClinicalUse |  |
| EuPatient | extension[sex-for-clinical-use].extension[value].valueCodeableConcept |  | EHDSImagingReport.body.orderInformation.supportingInformation.sexForClinicalUse |  |
| EuPatient | extension[sex-for-clinical-use].extension[period].valuePeriod |  | EHDSImagingReport.body.orderInformation.supportingInformation.sexForClinicalUse |  |

### Procedure

The following table lists the elements that should be included in the narrative of the Procedure section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| EuAllergyIntolerance | text |  | EHDSAllergyIntolerance.description |
| EuAllergyIntolerance | criticality |  | EHDSAllergyIntolerance.criticality |
| EuAllergyIntolerance | onsetPeriod |  | EHDSAllergyIntolerance.onsetDate |
| EuAllergyIntolerance | onsetDateTime |  | EHDSAllergyIntolerance.onsetDate |
| EuAllergyIntolerance | reaction |  | EHDSAllergyIntolerance.reaction |
| EuAllergyIntolerance | reaction.manifestation |  | EHDSAllergyIntolerance.reaction.manifestation |
| EuAllergyIntolerance | reaction.severity |  | EHDSAllergyIntolerance.reaction.severity |
| EuDevice | type |  | EHDSDevice.type |
| CompositionEuImaging | section[procedure].entry[procedure] | EuProcedure | EHDSImagingReport.body.examinationReport.medication |
| EuMedicationAdministration | partOf | ProcedureEuImaging | EHDSImagingReport.body.examinationReport.medication |
| ImAdverseEvent | status |  | EHDSImagingReport.body.examinationReport.adverseReaction |
| ImAdverseEvent | code |  | EHDSImagingReport.body.examinationReport.adverseReaction |
| EuDevice | name |  | EHDSMedia.deviceName |
| EuMedicationAdministration | reason |  | EHDSMedicationAdministration.reason[x] |
| EuMedicationAdministration | note |  | EHDSMedicationAdministration.note |

### Comparison

The following table lists the elements that should be included in the narrative of the Comparison section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| CompositionEuImaging | section[comparison].entry[comparedstudy] | ImagingStudyEuImaging | EHDSImagingReport.body.comparisonStudy |

### Findings

The following table lists the elements that should be included in the narrative of the Findings section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| CompositionEuImaging | section[findings].extension[note] |  | EHDSImagingReport.body.examinationReport.resultData.resultText |
| DiagnosticReportEuImaging | result | ObservationFindingEuImaging, ObservationRadiationDoseEuImaging | EHDSImagingReport.body.examinationReport.resultData.observationResults |

### Impression

The following table lists the elements that should be included in the narrative of the Impression section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| EuCondition | code |  | EHDSCondition.problem |
| EuCondition | clinicalStatus |  | EHDSCondition.problemStatus |
| EuCondition | severity |  | EHDSCondition.severity |
| EuCondition | bodySite |  | EHDSCondition.anatomicLocation |
| DiagnosticReportEuImaging | conclusion |  | EHDSImagingReport.body.examinationReport.conclusion.impression |
| CompositionEuImaging | section[impression].entry[ObservationFindingEuImaging] | ObservationFindingEuImaging | EHDSImagingReport.body.examinationReport.conclusion.conditionOrFinding[x] |

### Recommendation

The following table lists the elements that should be included in the narrative of the Recommendation section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| EuCarePlan | status |  | EHDSCarePlan.header.status |
| EuCarePlan | title |  | EHDSCarePlan.title |
| EuCarePlan | description |  | EHDSCarePlan.description |
| EuCarePlan | activity |  | EHDSCarePlan.activity[x] |
| EuCarePlan | description |  | EHDSImagingReport.body.recommendation.description |


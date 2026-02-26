{% include variable-definitions.md %}
For report creators, this page provides guidance on how to populate the narrative of each section, which is encoded in the `Composition.section.text` element of each section slice of this profile.

The table below suggests the data points that SHOULD be included, and the source of those data. Those data points can be in a first order resource, referenced directly from the Composition (e.g. ImOrder), or they can live in a second,third order resource (e.g. Medication). For the later, a second query or a FHIR path (resolve) expression is required to fetch them.

NOTE: Structural concerns and rationale on the ImComposition profile can be found in the [ImComposition](StructureDefinition-ImComposition.html), which is the parent type of this Report-ImComposition profile.

## Elements to include in sections narratives

### Imaging Study

The following table lists the elements that should be included in the narrative of the Imaging Study section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| EuDevice | type |  | EHDSDevice.type |
| ImagingStudyEuImaging | series.specimen | EuSpecimen | EHDSImagingReport.body.specimen |
| ImagingStudyEuImaging | series.modality |  | EHDSImagingReport.body.examinationReport.modality |
| ImagingStudyEuImaging | series.bodySite |  | EHDSImagingReport.body.examinationReport.bodySite |
| ImagingStudyEuImaging | status |  | EHDSImagingStudy.header.status |
| ImagingStudyEuImaging | series.modality |  | EHDSImagingStudy.modality |
| ImagingStudyEuImaging | started |  | EHDSImagingStudy.started |
| ImagingStudyEuImaging | description |  | EHDSImagingStudy.description |

### Order

The following table lists the elements that should be included in the narrative of the Order section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field | Comments |
| -------- | ------- | -------------- | --------------------- | -------- |
| ServiceRequestOrderEuImaging | identifier[accessionNumber] |  | EHDSImagingReport.header.accessionNumber |  |
<<<<<<< HEAD
| CompositionEuImaging | extension[informationRecipient] |  | EHDSImagingReport.header.intendedRecipient[x] |  |
| ServiceRequestOrderEuImaging | authoredOn |  | EHDSImagingReport.body.orderInformation.orderDateAndTime |  |
| ServiceRequestOrderEuImaging | requester |  | EHDSImagingReport.body.orderInformation.orderPlacer[x] |  |
| ServiceRequestOrderEuImaging | reason.concept |  | EHDSImagingReport.body.orderInformation.orderReason[x] |  |
| ServiceRequestOrderEuImaging | reason.concept |  | EHDSImagingReport.body.orderInformation.clinicalQuestion | Order reason and clinical question map to the same element by design choice |
=======
| ServiceRequestOrderEuImaging | authoredOn |  | EHDSImagingReport.body.orderInformation.orderDateAndTime |  |
| ServiceRequestOrderEuImaging | requester | EuPractitionerRole | EHDSImagingReport.body.orderInformation.orderPlacer |  |
| CompositionEuImaging | section[order].extension[note] |  | EHDSImagingReport.body.orderInformation.orderReasonText |  |
| ServiceRequestOrderEuImaging | reason.concept |  | EHDSImagingReport.body.orderInformation.orderReason | orderReason and clinicalQuestion map to the same element as a design choice |
| ServiceRequestOrderEuImaging | reason.concept |  | EHDSImagingReport.body.orderInformation.clinicalQuestion |  |
>>>>>>> 2acc27aad6d65f9fd478b7017ed3c7dd4ca2aed2

### History

The following table lists the elements that should be included in the narrative of the History section.

{:.grid}
<<<<<<< HEAD
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| CompositionEuImaging | section[history].entry |  | EHDSImagingReport.body.supportingInformation.observation |
| CompositionEuImaging | section[history].entry |  | EHDSImagingReport.body.supportingInformation.condition |
| CompositionEuImaging | section[history].entry |  | EHDSImagingReport.body.supportingInformation.priorMedicationAdministration |
| CompositionEuImaging | section[history].entry |  | EHDSImagingReport.body.supportingInformation.device |
| CompositionEuImaging | section[history].entry |  | EHDSImagingReport.body.supportingInformation.pregnancyStatus |
| EuPatient | extension[sex-for-clinical-use] |  | EHDSImagingReport.body.supportingInformation.sexForClinicalUse |
=======
| First order resource | Element | Referenced resource | Logical model resource.field | Comments |
| -------- | ------- | -------------- | --------------------- | -------- |
| ServiceRequestOrderEuImaging | supportingInfo | EuObservation | EHDSImagingReport.body.orderInformation.supportingInformation.observation |  |
| ServiceRequestOrderEuImaging | supportingInfo | EuCondition | EHDSImagingReport.body.orderInformation.supportingInformation.condition |  |
| ServiceRequestOrderEuImaging | reason | EuMedicationAdministration | EHDSImagingReport.body.orderInformation.supportingInformation.medicationAdministration |  |
| ServiceRequestOrderEuImaging | supportingInfo[pregnancy] |  | EHDSImagingReport.body.orderInformation.supportingInformation.pregnancyStatus | Code in supporting info, could be an observation as well |
| EuPatient | extension[sex-for-clinical-use] |  | EHDSImagingReport.body.orderInformation.supportingInformation.sexForClinicalUse |  |
| EuPatient | extension[sex-for-clinical-use].extension[value].valueCodeableConcept |  | EHDSImagingReport.body.orderInformation.supportingInformation.sexForClinicalUse |  |
| EuPatient | extension[sex-for-clinical-use].extension[period].valuePeriod |  | EHDSImagingReport.body.orderInformation.supportingInformation.sexForClinicalUse |  |
>>>>>>> 2acc27aad6d65f9fd478b7017ed3c7dd4ca2aed2

### Procedure

The following table lists the elements that should be included in the narrative of the Procedure section.

{:.grid}
<<<<<<< HEAD
| First order resource | Element | Referenced resource | Logical model resource.field | Comments |
| -------- | ------- | -------------- | --------------------- | -------- |
| EuAllergyIntolerance | criticality |  | EHDSAllergyIntolerance.criticality |  |
| EuAllergyIntolerance | onsetPeriod |  | EHDSAllergyIntolerance.onsetDate |  |
| EuAllergyIntolerance | onsetDateTime |  | EHDSAllergyIntolerance.onsetDate |  |
| EuAllergyIntolerance | reaction |  | EHDSAllergyIntolerance.reaction |  |
| EuAllergyIntolerance | reaction.manifestation |  | EHDSAllergyIntolerance.reaction.manifestation |  |
| EuAllergyIntolerance | reaction.severity |  | EHDSAllergyIntolerance.reaction.severity |  |
| EuDevice | type |  | EHDSDevice.type |  |
| DiagnosticReportEuImaging | extension[radiationDose] |  | EHDSImagingReport.body.exposureInformation | Comments in this issue https://github.com/Xt-EHR/xt-ehr-common/issues/365 |
| CompositionEuImaging | section[procedure].entry[procedure] | EuProcedure | EHDSImagingReport.body.examinationReport.imagingProcedures |  |
| EuMedicationAdministration | reason |  | EHDSMedicationAdministration.reason[x] |  |
| EuMedicationAdministration | note |  | EHDSMedicationAdministration.note |  |
=======
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
>>>>>>> 2acc27aad6d65f9fd478b7017ed3c7dd4ca2aed2

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
<<<<<<< HEAD
| CompositionEuImaging | section[findings].extension[note] |  | EHDSImagingReport.body.examinationReport.results[x] |
| DiagnosticReportEuImaging | note |  | EHDSImagingReport.body.examinationReport.results[x] |
=======
| CompositionEuImaging | section[findings].extension[note] |  | EHDSImagingReport.body.examinationReport.resultData.resultText |
| DiagnosticReportEuImaging | result | ObservationFindingEuImaging, ObservationRadiationDoseEuImaging | EHDSImagingReport.body.examinationReport.resultData.observationResults |
>>>>>>> 2acc27aad6d65f9fd478b7017ed3c7dd4ca2aed2

### Impression

The following table lists the elements that should be included in the narrative of the Impression section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| EuCondition | code |  | EHDSCondition.problem |
<<<<<<< HEAD
| EuCondition | severity |  | EHDSCondition.severity |
| CompositionEuImaging | section[impression].extension[note] |  | EHDSImagingReport.body.examinationReport.conclusion.impression |
| CompositionEuImaging | section[impression].entry[impression] | ObservationFindingEuImaging | EHDSImagingReport.body.examinationReport.conclusion.conditionOrFinding[x] |
=======
| EuCondition | clinicalStatus |  | EHDSCondition.problemStatus |
| EuCondition | severity |  | EHDSCondition.severity |
| EuCondition | bodySite |  | EHDSCondition.anatomicLocation |
| DiagnosticReportEuImaging | conclusion |  | EHDSImagingReport.body.examinationReport.conclusion.impression |
| CompositionEuImaging | section[impression].entry[ObservationFindingEuImaging] | ObservationFindingEuImaging | EHDSImagingReport.body.examinationReport.conclusion.conditionOrFinding[x] |
>>>>>>> 2acc27aad6d65f9fd478b7017ed3c7dd4ca2aed2

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
<<<<<<< HEAD
| CompositionEuImaging | section[recommendation].entry[suggestion] | EuCarePlan | EHDSImagingReport.body.recommendation.carePlan |

### R5 Composition section

The following table lists the elements that should be included in the narrative of the R5 Composition section section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field | Comments |
| -------- | ------- | -------------- | --------------------- | -------- |
| R5 Mapped Resource | R5 Mapped Field |  | Xt-EHR resource.Xt-EHR field | R5 Comments |
=======
>>>>>>> 2acc27aad6d65f9fd478b7017ed3c7dd4ca2aed2


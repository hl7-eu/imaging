{% include variable-definitions.md %}
For report creators, this page provides guidance on how to populate the narrative of each section, which is encoded in the `Composition.section.text` element of each section slice of this profile.

The table below suggests the data points that SHOULD be included, and the source of those data. Those data points can be in a first order resource, referenced directly from the Composition (e.g. ImOrder), or they can live in a second,third order resource (e.g. Medication). For the later, a second query or a FHIR path (resolve) expression is required to fetch them.

NOTE: Structural concerns and rationale on the ImComposition profile can be found in the [CompositionEuImaging](StructureDefinition-CompositionEuImaging.html), which is the parent type of this Report-ImComposition profile.

## Elements to include in sections narratives

### Imaging Study

The following table lists the elements that should be included in the narrative of the Imaging Study section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
<<<<<<< HEAD
| EuDevice | type |  | EHDSDevice.type |
| ImagingStudyEuImaging | series.specimen | EuSpecimen | EHDSImagingReport.body.specimen |
| ImagingStudyEuImaging | series.modality |  | EHDSImagingReport.body.examinationReport.modality |
| ImagingStudyEuImaging | series.bodySite |  | EHDSImagingReport.body.examinationReport.bodySite |
| ImagingStudyEuImaging | status |  | EHDSImagingStudy.header.status |
| ImagingStudyEuImaging | series.modality |  | EHDSImagingStudy.modality |
| ImagingStudyEuImaging | started |  | EHDSImagingStudy.started |
| ImagingStudyEuImaging | description |  | EHDSImagingStudy.description |
=======
| EuDevice | type |  | [EHDSDevice](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSDevice.html).type |
| ImagingStudyEuImaging | series.specimen | EuSpecimen | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.specimen |
| ImagingStudyEuImaging | series.modality |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.examinationReport.modality |
| ImagingStudyEuImaging | series.bodySite |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.examinationReport.bodySite |
| ImagingStudyEuImaging | status |  | [EHDSImagingStudy](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingStudy.html).header.status |
| ImagingStudyEuImaging | series.modality |  | [EHDSImagingStudy](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingStudy.html).modality |
| ImagingStudyEuImaging | started |  | [EHDSImagingStudy](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingStudy.html).started |
| ImagingStudyEuImaging | description |  | [EHDSImagingStudy](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingStudy.html).description |
>>>>>>> ef235599693bd2c92151068e2c44ffc2a79b503b

### Order

The following table lists the elements that should be included in the narrative of the Order section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field | Comments |
| -------- | ------- | -------------- | --------------------- | -------- |
<<<<<<< HEAD
| ServiceRequestOrderEuImaging | identifier[accessionNumber] |  | EHDSImagingReport.header.accessionNumber |  |
| CompositionEuImaging | extension[informationRecipient] |  | EHDSImagingReport.header.intendedRecipient[x] |  |
| ServiceRequestOrderEuImaging | authoredOn |  | EHDSImagingReport.body.orderInformation.orderDateAndTime |  |
| ServiceRequestOrderEuImaging | requester |  | EHDSImagingReport.body.orderInformation.orderPlacer[x] |  |
| ServiceRequestOrderEuImaging | reason.concept |  | EHDSImagingReport.body.orderInformation.orderReason[x] |  |
| ServiceRequestOrderEuImaging | reason.concept |  | EHDSImagingReport.body.orderInformation.clinicalQuestion | Order reason and clinical question map to the same element by design choice |
=======
| ServiceRequestOrderEuImaging | identifier[accessionNumber] |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).header.accessionNumber |  |
| CompositionEuImaging | extension[informationRecipient] |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).header.intendedRecipient[x] |  |
| ServiceRequestOrderEuImaging | authoredOn |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.orderInformation.orderDateAndTime |  |
| ServiceRequestOrderEuImaging | requester |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.orderInformation.orderPlacer[x] |  |
| ServiceRequestOrderEuImaging | reason.concept |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.orderInformation.orderReason[x] |  |
| ServiceRequestOrderEuImaging | reason.concept |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.orderInformation.clinicalQuestion | Order reason and clinical question map to the same element by design choice |
>>>>>>> ef235599693bd2c92151068e2c44ffc2a79b503b

### History

The following table lists the elements that should be included in the narrative of the History section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
<<<<<<< HEAD
| CompositionEuImaging | section[history].entry |  | EHDSImagingReport.body.supportingInformation.observation |
| CompositionEuImaging | section[history].entry |  | EHDSImagingReport.body.supportingInformation.condition |
| CompositionEuImaging | section[history].entry |  | EHDSImagingReport.body.supportingInformation.priorMedicationAdministration |
| CompositionEuImaging | section[history].entry |  | EHDSImagingReport.body.supportingInformation.device |
| CompositionEuImaging | section[history].entry |  | EHDSImagingReport.body.supportingInformation.pregnancyStatus |
| EuPatient | extension[sex-for-clinical-use] |  | EHDSImagingReport.body.supportingInformation.sexForClinicalUse |
=======
| CompositionEuImaging | section[history].entry |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.supportingInformation.observation |
| CompositionEuImaging | section[history].entry |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.supportingInformation.condition |
| CompositionEuImaging | section[history].entry |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.supportingInformation.priorMedicationAdministration |
| CompositionEuImaging | section[history].entry |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.supportingInformation.device |
| CompositionEuImaging | section[history].entry |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.supportingInformation.pregnancyStatus |
| EuPatient | extension[sex-for-clinical-use] |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.supportingInformation.sexForClinicalUse |
>>>>>>> ef235599693bd2c92151068e2c44ffc2a79b503b

### Procedure

The following table lists the elements that should be included in the narrative of the Procedure section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field | Comments |
| -------- | ------- | -------------- | --------------------- | -------- |
<<<<<<< HEAD
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
| EuAllergyIntolerance | criticality |  | [EHDSAllergyIntolerance](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSAllergyIntolerance.html).criticality |  |
| EuAllergyIntolerance | onsetPeriod |  | [EHDSAllergyIntolerance](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSAllergyIntolerance.html).onsetDate |  |
| EuAllergyIntolerance | onsetDateTime |  | [EHDSAllergyIntolerance](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSAllergyIntolerance.html).onsetDate |  |
| EuAllergyIntolerance | reaction |  | [EHDSAllergyIntolerance](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSAllergyIntolerance.html).reaction |  |
| EuAllergyIntolerance | reaction.manifestation |  | [EHDSAllergyIntolerance](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSAllergyIntolerance.html).reaction.manifestation |  |
| EuAllergyIntolerance | reaction.severity |  | [EHDSAllergyIntolerance](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSAllergyIntolerance.html).reaction.severity |  |
| EuDevice | type |  | [EHDSDevice](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSDevice.html).type |  |
| DiagnosticReportEuImaging | extension[radiationDose] |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.exposureInformation | Comments in this issue https://github.com/Xt-EHR/xt-ehr-common/issues/365 |
| CompositionEuImaging | section[procedure].entry[procedure] | EuProcedure | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.examinationReport.imagingProcedures |  |
| EuMedicationAdministration | reason |  | [EHDSMedicationAdministration](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSMedicationAdministration.html).reason[x] |  |
| EuMedicationAdministration | note |  | [EHDSMedicationAdministration](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSMedicationAdministration.html).note |  |
>>>>>>> ef235599693bd2c92151068e2c44ffc2a79b503b

### Comparison

The following table lists the elements that should be included in the narrative of the Comparison section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
| CompositionEuImaging | section[comparison].entry[comparedstudy] | ImagingStudyEuImaging | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.comparisonStudy |

### Findings

The following table lists the elements that should be included in the narrative of the Findings section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
<<<<<<< HEAD
| CompositionEuImaging | section[findings].extension[note] |  | EHDSImagingReport.body.examinationReport.results[x] |
| DiagnosticReportEuImaging | note |  | EHDSImagingReport.body.examinationReport.results[x] |
=======
| CompositionEuImaging | section[findings].extension[note] |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.examinationReport.results[x] |
| DiagnosticReportEuImaging | note |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.examinationReport.results[x] |
>>>>>>> ef235599693bd2c92151068e2c44ffc2a79b503b

### Impression

The following table lists the elements that should be included in the narrative of the Impression section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
<<<<<<< HEAD
| EuCondition | code |  | EHDSCondition.problem |
| EuCondition | severity |  | EHDSCondition.severity |
| CompositionEuImaging | section[impression].extension[note] |  | EHDSImagingReport.body.examinationReport.conclusion.impression |
| CompositionEuImaging | section[impression].entry[impression] | ObservationFindingEuImaging | EHDSImagingReport.body.examinationReport.conclusion.conditionOrFinding[x] |
=======
| EuCondition | code |  | [EHDSCondition](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSCondition.html).problem |
| EuCondition | severity |  | [EHDSCondition](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSCondition.html).severity |
| CompositionEuImaging | section[impression].extension[note] |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.examinationReport.conclusion.impression |
| CompositionEuImaging | section[impression].entry[impression] | ObservationFindingEuImaging | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.examinationReport.conclusion.conditionOrFinding[x] |
>>>>>>> ef235599693bd2c92151068e2c44ffc2a79b503b

### Recommendation

The following table lists the elements that should be included in the narrative of the Recommendation section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field |
| -------- | ------- | -------------- | --------------------- |
<<<<<<< HEAD
| EuCarePlan | status |  | EHDSCarePlan.header.status |
| EuCarePlan | title |  | EHDSCarePlan.title |
| EuCarePlan | description |  | EHDSCarePlan.description |
| EuCarePlan | activity |  | EHDSCarePlan.activity[x] |
| EuCarePlan | description |  | EHDSImagingReport.body.recommendation.description |
| CompositionEuImaging | section[recommendation].entry[suggestion] | EuCarePlan | EHDSImagingReport.body.recommendation.carePlan |
=======
| EuCarePlan | status |  | [EHDSCarePlan](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSCarePlan.html).header.status |
| EuCarePlan | title |  | [EHDSCarePlan](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSCarePlan.html).title |
| EuCarePlan | description |  | [EHDSCarePlan](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSCarePlan.html).description |
| EuCarePlan | activity |  | [EHDSCarePlan](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSCarePlan.html).activity[x] |
| EuCarePlan | description |  | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.recommendation.description |
| CompositionEuImaging | section[recommendation].entry[suggestion] | EuCarePlan | [EHDSImagingReport](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-EHDSImagingReport.html).body.recommendation.carePlan |
>>>>>>> ef235599693bd2c92151068e2c44ffc2a79b503b

### R5 Composition section

The following table lists the elements that should be included in the narrative of the R5 Composition section section.

{:.grid}
| First order resource | Element | Referenced resource | Logical model resource.field | Comments |
| -------- | ------- | -------------- | --------------------- | -------- |
<<<<<<< HEAD
| R5 Mapped Resource | R5 Mapped Field |  | Xt-EHR resource.Xt-EHR field | R5 Comments |
=======
| R5 Mapped Resource | R5 Mapped Field |  | [Xt-EHR resource](https://www.xt-ehr.eu/fhir/models/0.3.0/StructureDefinition-Xt-EHR resource.html).Xt-EHR field | R5 Comments |
>>>>>>> ef235599693bd2c92151068e2c44ffc2a79b503b


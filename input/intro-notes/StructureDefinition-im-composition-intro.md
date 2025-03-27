The composition resource represents the core of the document. 

It is divided into different sections, each sections relates to a specific aspect of an imaging study report. 

* Note: Only first-order resources are expected to be included in the `section.entry`. To populate the `section.text` element with data from non-first-order resources (e.g., `MedicationAdministration` or `AdverseEvent`), queries must be executed using identifiers derived from the first-order resources.

#### Imaging Study Section

This section holds information related to the imaging studies covered by this report.

The narrative (`section.text`) SHALL contain the data elements indicated in the table below:

| Field | Description | Source |
| ----- | ----------- | ------ |
| StudyInstanceUID | The study instance UID | `entry[imagingstudy].identifier` |
| Status           | The study status       | `entry[imagingstudy].status` |
| Date             | When the study commenced | `entry[imagingstudy].started` |
| Performer        | The performer of the study | `entry[imagingstudy].performer[performer]` |
| Modality         | The modality | `entry[imagingstudy].modality` |
| Device           | The device on which the study was done | `entry[imagingstudy].performer[device].name` |
| Custodian        | The custodian of the study | `entry[imagingstudy].performer[custodian].name` |

#### Order Section

This section holds information related to the order for the imaging study.

The narrative (`section.text`) SHALL contain the data elements indicated in the table below:

| Field | Description | Source |
| ----- | ----------- | ------ |
| Order identifiers | The identifiers for the order                  | `entry[order].identifier` |
| Order status      | The status of the order                        | `entry[order].status` |
| Orderer           | The healthcare professional ordering the study | `entry[order].requester` |
| Order date        | When the study was ordered                     | `entry[order].authoredOn` |
| Order reason      | Why the order was ordered                      | `entry[order].reason` |
| Insurance         | Insurance information                          | `entry[order].insurance` |

#### History Section
///////////////////////////////// HISTORY SECTION ///////////////////////////////////////

#### Procedure Section

  | Field                  | Description                                                                                     | Source                                                              |
  |------------------------|-------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|
  | **Procedure**          |                                                                                                 |                                                                     |
  | Modality               | Imaging modality                                                                               | `entry[procedure].partOf[imagingstudy].series.modality`             |
  | Procedure date         | Date and time of the procedure or interval of its performance                                  | `entry[procedure].occurenceDateTime` or `entry[procedure].occurancePreiod` |
  | Procedure text         | Detailed textual description of the procedure.                                                 | `entry[procedure].note`                                             |
  | Procedure code         | Code representing the procedure.                                                               | `entry[procedure].code`                                             |
  | Procedure name         | Full name of the procedure according to the used procedure coding standard.                    | `entry[procedure].code.display`                                     |
  | Body location          | Localization on/in the body (part of the body focused during the procedure).                   | `entry[procedure].bodySite`                                         |
  | Performer              | The healthcare professional performing the study.                                              | `entry[procedure].performer[performer]`                             |
  | Performer Id           | Identifier of the healthcare professional performing the study.                                | `entry[procedure].performer[performer].actor.practitioner.id`       |
  | Performer Name         | Name of the healthcare professional performing the study.                                      | `entry[procedure].performer[performer].actor.practitioner.name`     |
  | Performer Organisation | The healthcare provider organization information.                                              | `entry[procedure].performer[performer].actor.organization`          |
  | Laterality             | Body side of the body location, if needed to distinguish from a similar location on the other side of the body. | `entry[imagingstudy].series.laterality`                            |
  | Device ID              | Normalized identifier of the acquisition modality equipment instance such as UDI.              | `entry[procedure].performer[imaging-device].identifier`             |
  | Additional procedure details | Uncoded information related to the procedure.                                            | `entry[procedure].note`                                             |
  | **Medication**         |                                                                                                 |                                                                     |
  | Brand name             | Name of the medication administered during the procedure.                                       | `MedicationAdministration.extension[productName]`                   |
  | Medication code        | Code representing the medication.                                                              | `MedicationAdministration.code.coding`                              |
  | Active ingredient list | Administered substance that produces the biological effect.                                     | `MedicationAdministration.ingredient`                               |
  | Strength               | The content of the active ingredient expressed quantifiably per dosage unit.                   | `MedicationAdministration.ingredient.strenght`                      |
  | Dose form              | The form in which a pharmaceutical product is presented in the medicinal product package.       | `MedicationAdministration.doseForm`                                 |
  | Route of administration| Path by which the pharmaceutical product is taken into or makes contact with the body.          | `MedicationAdministration.dosage.route`                             |
  | Date and time          | Timing of the medication administration.                                                       | `MedicationAdministration.occurance`                                |
  | **Adverse Event**      |                                                                                                 |                                                                     |
  | Allergy description    | Textual description of the allergy or intolerance.                                             | `AdverseEvent.code.text` or `AdverseEvenet.note`                    |
  | Type of propensity     | This element describes whether this condition refers to an allergy, non-allergy intolerance, or unknown class of intolerance (not known to be allergy or intolerance). | `AdverseEvent.category`                                            |
  | Allergy manifestation  | Description of the clinical manifestation of the allergic reaction.                            | `AdverseEvent.resultingEffect` or `AllergyIntolerance.reaction.manifestation` |
  | Severity               | Severity of the clinical manifestation of the allergic reaction.                               | `AdverseEvent.seriousness` or `AllergyIntolerance.reaction.severity` |
  | Criticality            | Potential risk for future life-threatening adverse reactions when exposed to a substance known to cause an adverse reaction. | `AdverseEvent.extension[criticality]` or `AllergyIntolerance.criticallity` |
  | Onset date             | Date of the observation of the reaction.                                                       | `AdverseEvent.occurance[dateTime]` or `AllergyIntolerance.reacton.onset` |
  | Certainty              | Assertion about the certainty associated with a propensity, or potential risk, of a reaction to the identified substance. | `AdverseEvent.causality.entityRelatedness` or `AllergyIntolerance.extension.allergyCertainty` |
  | Agent or Allergen      | A specific allergen or other agent/substance (drug, food, chemical agent, etc.) to which the patient has an adverse reaction propensity. | `AdverseEvent.instance:medicationAdministered` or `AllergyIntolerance.reaction.substance` |

#### TBD Sections
////////////////// COMPARISON SECTION //////////////////////////


/////////////////// FINDINGS SECTION //////////////////////////


/////////////////// IMPRESSION SECTION //////////////////////////


/////////////////// RECOMMENDATION SECTION //////////////////////////


/////////////////// COMMUNICATION SECTION //////////////////////////

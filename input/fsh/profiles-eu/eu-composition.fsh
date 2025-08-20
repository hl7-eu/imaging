Profile: CompositionEu
Parent: http://hl7.org/fhir/StructureDefinition/clinicaldocument
Title: "Composition: EU Composition"
Description: "Clinical document used to represent a report for the scope of the HL7 Europe project."
* insert SetFmmAndStatusRule( 1, draft )

* identifier 
  * ^short = "Report identifier"
  * ^definition = "Identifiers assigned to this report by the performer or other systems. It shall be common to several report versions"
  * ^comment = "Composition.identifier SHALL be equal to one of the DiagnosticReport.identifier, if at least one exists"


* extension contains 
    $event-basedOn-url          named basedOn 0..* and
    $information-recipient-url  named informationRecipient 0..*

* category 1..*
  * insert SliceElement( #value, $this )

// * category /* obeys labRpt-category */
//   * ^short = "Report Category"
//   * ^definition = "Specifies the Report Category"
//   * ^comment = "DiagnosticReport.category and Composition.category shall be aligned"
// * category only $CodeableConcept-uv-ips
// * category ^slicing.discriminator.type = #pattern
// * category ^slicing.discriminator.path = "$this"
// * category ^slicing.rules = #open
// * category ^definition = "A code that classifies this laboratory report. Two basic categories has been selected in this guide: laboratory specialty and Study type. Laboratory specialty is characteristic of the laboratory that produced the test result while Study type is an arbitrary classification of the test type."
// * category contains studyType 0..*
// * category[studyType] only $CodeableConcept-uv-ips
// * category[studyType] from LabStudyTypesEuVs
// * category[studyType]
//   * ^short = "The way of grouping of the test results into clinically meaningful domains (e.g. hematology study, microbiology study, etc.)"
//   * ^definition = "Laboratory services, i.e., results of tests performed, could be characterized using typology of services, commonly called study types. Study type could be seen as an attribute or grouping mechanism that assigns a common clinical sense to certain types of laboratory test results., e.g., Hemoglobin, Platelet count, etc. belongs to 'Hematology study'."
//   * ^comment = "In comparison to the laboratory specialty which is an attribute of laboratory, study type is a categorization of laboratory service. It needs to be mentioned that classification of test to study types in not standardized."

// // "The way of grouping of the test results into clinically meaningful domains (e.g. hematology study, microbiology study, etc.)"

// * category contains specialty 0..*
// * category[specialty] only $CodeableConcept-uv-ips
// * category[specialty] from LabSpecialtyEuVs
// * category[specialty]
//   * ^short = "The clinical domain of the laboratory performing the observation (e.g. microbiology, toxicology, chemistry)"
//   * ^definition = "Laboratory specialty is an attribute of any laboratory setting representing professional qualification of the laboratory to execute certain kind of laboratory tests."
//   * ^comment = "Specialty could be used as parameter for searching/querying of laboratory test results."
// // previous description
// // "The clinical domain of the laboratory performing the observation (e.g. microbiology, toxicology, chemistry)"
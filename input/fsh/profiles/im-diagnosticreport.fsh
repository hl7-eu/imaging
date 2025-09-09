Profile: ImDiagnosticReport
Parent: DiagnosticReport
Title: "DiagnosticReport: Imaging Report"
Description: """
DiagnosticReport profile for Imaging Reports. This document represents the report of an imaging study. It is the anchor resource that refers to all structured data as well as the `Composition` resource that contains the narrative text of the report.   
The structure of the modelled has been aligned with the DiagnosticResource as defined by [IHE-RAD-HL7IDR](https://build.fhir.org/ig/IHE/RAD.HL7IDR/branches/master/StructureDefinition-imaging-diagnosticreport.html). As this specification has not been published yet, the relevant extensions have been included in this specification.
"""
* insert SetFmmAndStatusRule( 1, draft )
// * insert MandateLanguageAndSecurity

* extension contains
  $artifact-version-url named artifactVersion 0..1

//business identifier and relation with the composition resource
* identifier 1..*
  * ^short = "Report identifier"
  * ^definition = "Identifiers assigned to this Imaging Report by the performer or other systems. It shall be common to several report versions"
  * ^comment = "Composition.identifier SHALL be equal to one of the DiagnosticReport.identifier, if at least one exists"

* status
  * ^short = "Status of the Report"
  * ^comment = "DiagnosticReport.status and Composition.status shall be aligned"

// reference to the order that has the Accession Number and including the Accession Number as identifier
* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains imorderaccession 0..*
* insert BasedOnImOrderReference( imorderaccession )

//* status
// code  --> TODO will likely change based on composition discussions
* code
  * coding 1..*
    * insert SliceElement( #value, $this )
  * coding contains eu-template 1..1
  * coding[eu-template] = Hl7EuDocumentTypes#imaging-report-v0-0-1 // "Imaging Report V0.0.1"

* category 1..*
  * insert SliceElement( #value, $this )
* category contains imaging 1..1
* category[imaging] = $loinc#18748-4 // "Diagnostic imaging study"
* category[imaging].coding 1..1

* subject only Reference($EuPatient)

// * issued 1..1  -> we use obligations instead

* note 
  * extension contains $annotation-type named annotation-type 0..*
  * extension[annotation-type].valueCodeableConcept from Hl7EuImagingSectionValueSet (preferred)

// * composition 0..0 -> we use composition
* media 0..0 // not in not in keyimages section

// at least one performer is an Organization, the practitioner must follow the profile in this guide
* performer 
  * insert SliceElementWithDescription( #profile, $this, [[Organization that delivered the report]] )
* performer contains organization 0..*
* performer[organization] only Reference($EuOrganization)
* performer[organization] ^short = "The organization producer of this report"
* performer[organization] ^definition = "The organization responsible for producing this report. In case practitioners produce them in their private practices, they will be accounted as an organization for this purpose."

// author etc.
* resultsInterpreter 0..*
  * insert SliceElementWithDescription( #profile, [[resolve()]], [[Primary interpreter of results]] )
* resultsInterpreter contains author 0..* 
* resultsInterpreter[author] only Reference($EuPractitionerRole)

* result 0..* MS
* result only Reference(ImFinding)
* result ^short = "Findings"
* result ^definition = """
Detailed description of the findings on the imaging study. The findings should be described in a clear and concise manner,
using standardized anatomic, pathologic, and radiologic terminology whenever possible.
"""

* study only Reference(ImImagingStudy)
* study ^short = "Study subject to this report"
* study ^definition = "Study subject to this report. Note: Any associated study (e.g. comparison studies) used during reporting should be tracked in the associatedStudy extension."



// refer to the mandatory composition
* composition 1..1
* composition ^short = "Imaging Diagnostic Report"
* composition only Reference(ImComposition)


* extension contains HL7IDRComparisonStudiesExt named comparison 0..* MS
* extension[comparison] ^short = "Comparison studies"
* extension[comparison] ^definition = """
Studies used for comparison in part of diagnostic reporting.
"""

* extension contains HL7IDRPatientHistoryExt named patientHistory 0..* MS
* extension[patientHistory] ^short = "Patient history items selected by radiologist"
* extension[patientHistory] ^definition = """
May have originally been extracted from the medical record by imaging staff,
automated tools, or by the radiologists themselves.
"""

* extension contains HL7IDRImagingProcedureExt named procedure 0..* MS
* extension[procedure] ^short = "Imaging procedure"
* extension[procedure] ^definition = """
Imaging procedure used to acquire the study.
"""


* extension contains HL7IDRImpressionExt named impression 0..* MS
* extension[impression] ^short = "Impression"
* extension[impression] ^definition = """
Impression in the imaging report.
"""

* extension contains HL7IDRRecommendationExt named recommendation 0..* MS
* extension[recommendation] ^short = "Recommendations"
* extension[recommendation] ^definition = """
Recommendations a radiologist provides in the report for possible follow up actions.
"""

* extension contains HL7IDRCommunicationExt named communication 0..* MS
* extension[communication] ^short = "Communications with other care providers"
* extension[communication] ^definition = """
Communications captures what communications have been made with other care providers.
"""

// We have changed these and they now deviate from IDR as they also need to include the notes related to those sections.
* obeys hl7eu-im-dr-code
* obeys hl7eu-im-dr-category
* obeys hl7eu-im-dr-subject
* obeys hl7eu-im-dr-study
* obeys hl7eu-im-dr-order
* obeys hl7eu-im-dr-history
* obeys hl7eu-im-dr-procedure
* obeys hl7eu-im-dr-impression
* obeys hl7eu-im-dr-recommendation
* obeys hl7eu-im-dr-communication
* obeys hl7eu-im-dr-finding


Extension: HL7IDRComparisonStudiesExt
Title: "HL7IDR DiagnosticReport Comparison Study"
Id: HL7IDRComparisonStudy
Description: "Studies used for comparison in part of diagnostic reporting"
Context: DiagnosticReport
* value[x] only Reference(ImImagingStudy or ImagingSelection)

Extension: HL7IDRPatientHistoryExt
Title: "HL7IDR Patient History"
Id: HL7IDRPatientHistory
Description: "Patient history that are relevant for the report"
Context: DiagnosticReport
* value[x] only Reference
// * value[x] only Reference(HL7IDRPatientHistoryCondition or HL7IDRPatientHistoryObservation or HL7IDRPatientHistoryProcedure or HL7IDRPatientHistoryFamilyMemberHistory)

Extension: HL7IDRImagingProcedureExt
Title: "HL7IDR Imaging Procedure"
Id: HL7IDRImagingProcedure
Description: "Imaging procedure used for the imaging acquisition"
Context: DiagnosticReport
* value[x] only Reference(ImProcedure)

Extension: HL7IDRImpressionExt
Title: "HL7IDR Impression"
Id: HL7IDRImpression
Description: "Impression in the imaging report"
Context: DiagnosticReport
* value[x] only Reference(ImFinding or Condition or ImKeyImageDocumentReference or ImKeyImageImagingSelection or ImKeyImageDocumentReference )

Extension: HL7IDRRecommendationExt
Title: "HL7IDR Recommendation"
Id: HL7IDRRecommendation
Description: "Recommendations for any follow up actions"
Context: DiagnosticReport
* value[x] only Reference($EuCarePlan or $EuServiceRequest )

Extension: HL7IDRCommunicationExt
Title: "HL7IDR Communication"
Id: HL7IDRCommunication
Description: "Communications captures what communications have been made with other care providers"
Context: DiagnosticReport
* value[x] only Reference

// ////////////////////////// Invariants ///////////////////////////////////////////////////////////////////

Invariant: hl7eu-im-dr-code
Description: "Composition.type equal to DiagnosticReport.code"
* severity = #error
* expression = "DiagnosticReport.composition.resolve().type = DiagnosticReport.code"

Invariant: hl7eu-im-dr-category
Description: "Composition.category must contain DiagnosticReport.category"
* severity = #error
* expression = "DiagnosticReport.composition.resolve().category = DiagnosticReport.category"

Invariant: hl7eu-im-dr-subject
Description: "Patient in composition must be the same."
* severity = #error
* expression = "DiagnosticReport.composition.resolve().patient.reference = DiagnosticReport.subject.reference"

Invariant: hl7eu-im-dr-study
Description: "Study must be present in composition."
* severity = #error
* expression = "DiagnosticReport.composition.resolve().section.entry.reference.superset(study.reference)"

Invariant: hl7eu-im-dr-order
Description: "Order must be present in composition."
* severity = #error
* expression = "DiagnosticReport.composition.resolve().section.entry.reference.superset(basedOn.reference)"

Invariant: hl7eu-im-dr-history
Description: "History must be present in composition."
* severity = #error
* expression = "DiagnosticReport.composition.resolve().section.entry.reference.superset(extension('http://hl7.eu/fhir/imaging-r5/StructureDefinition/HL7IDRPatientHistory').valueReference)"

Invariant: hl7eu-im-dr-procedure
Description: "Procedure must be present in composition."
* severity = #error
* expression = "DiagnosticReport.composition.resolve().section.entry.reference.superset(extension('http://hl7.eu/fhir/imaging-r5/StructureDefinition/HL7IDRPatientProcedure').valueReference)"

Invariant: hl7eu-im-dr-impression
Description: "Impression must be present in composition."
* severity = #error
* expression = "DiagnosticReport.composition.resolve().section.entry.reference.superset(extension('http://hl7.eu/fhir/imaging-r5/StructureDefinition/HL7IDRImpression').valueReference)"

Invariant: hl7eu-im-dr-recommendation
Description: "Recommendation must be present in composition."
* severity = #error
* expression = "DiagnosticReport.composition.resolve().section.entry.reference.superset(extension('http://hl7.eu/fhir/imaging-r5/StructureDefinition/HL7IDRRecommendation').valueReference)"

Invariant: hl7eu-im-dr-communication
Description: "Communication must be present in composition."
* severity = #error
* expression = "DiagnosticReport.composition.resolve().section.entry.reference.superset(extension('http://hl7.eu/fhir/imaging-r5/StructureDefinition/HL7IDRCommunication').valueReference)"

Invariant: hl7eu-im-dr-finding
Description: "Finding must be present in composition."
* severity = #error
* expression = "DiagnosticReport.composition.resolve().section.entry.reference.superset(result.reference)"

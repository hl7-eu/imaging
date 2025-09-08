Profile: ImDiagnosticReport
Parent: DiagnosticReport
Title: "DiagnosticReport: Imaging Report"
Description: """
Diagnostic Report profile for Imaging Reports. This document represents the report of an imaging study. It is the anchor resource that refers to all structured data as well as the `Composition` resource that contains the narrative text of the report.
"""
* insert SetFmmAndStatusRule( 1, draft )
// * insert MandateLanguageAndSecurity

* extension contains
  $artifact-version-url named artifactVersion 0..1

//business identifier and relation with the composition resource
* identifier
  * ^short = "Report identifier"
  * ^definition = "Identifiers assigned to this Imaging Report by the performer or other systems. It shall be common to several report versions"
  * ^comment = "Composition.identifier SHALL be equal to one of the DiagnosticReport.identifier, if at least one exists"

* status
  * ^short = "Status of the Report"
  * ^comment = "DiagnosticReport.status and Composition.status shall be aligned"

// reference to the order that has the Accession Number and including the Accession Number as identifier
* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains imorderaccession 0..1
* insert BasedOnImOrderReference( imorderaccession )

* category 1..*
  * insert SliceElement( #value, $this )
* category contains imaging 1..1
* category[imaging] = $loinc#18748-4 // "Diagnostic imaging study"
* category[imaging].coding 1..1

* subject only Reference(ImPatient)

* study only Reference(ImImagingStudy)

// supporting info
* supportingInfo
  * insert SliceElement( #value, reference )
  * type from DiagnosticReportSupportingInfoVCodes (extensible)
* supportingInfo contains
    procedure 0..*
* supportingInfo[procedure]
  * type = DiagnosticReportSupportingInfoCodeSystem#imaging-procedure
  * reference only Reference(ImProcedure)
// TODO only main elements or all elements of the eHN dataset?   

* performer 
  * insert SliceElement( #profile, $this )
* performer contains organization 0..*
* performer[organization] only Reference($EuOrganization)
* performer[organization] ^short = "The organization producer of this report"
* performer[organization] ^definition = "The organization responsible for producing this report. In case practitioners produce them in their private practices, they will be accounted as an organization for this purpose."

// author etc.
* resultsInterpreter 0..*
  * insert SliceElement( #profile, [[resolve()]] )
* resultsInterpreter contains 
    author 0..* 
* resultsInterpreter[author] only Reference($EuPractitionerRole)

// refer to the mandatory composition
* composition 1..1
* composition ^short = "Imaging Diagnostic Report"
* composition only Reference(ImComposition)

// code 
* code
  * coding 1..*
    * insert SliceElement( #value, $this )
  * coding contains eu-template 1..1
  * coding[eu-template] = Hl7EuDocumentTypes#imaging-report-v0-0-1 // "Imaging Report V0.0.1"

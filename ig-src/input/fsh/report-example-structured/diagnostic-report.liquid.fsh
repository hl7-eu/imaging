Instance: DiagnosticReportStructured
InstanceOf: DiagnosticReportEuImaging
Title: "DiagnosticReport: structured report"
Description: "Example of a DiagnosticReportEuImaging showing the report for a stress echo"
Usage: #example
* identifier
  * system = "http://example.org/myhosptital/reportidentifiers"
  * value = "dfkjewoieoijwoskdjf" // invented - not there in the report* 
* status = #final
* effectiveDateTime = "2003-06-01"
* language = #en-GB
* basedOn // order
  * type = #ServiceRequest
  * identifier
    * type
      * coding[+] = $v2-0203#ACSN 
      * coding[+] = http://dicom.nema.org/resources/ontology/DCM#121022 "Accession Number"
    * system = "http://example.org/myhosptital/accessionsystem"
    * value  = "87654321" // invented - not there in the report
* code = http://www.ama-assn.org/go/cpt#93351 "STRESS TTE COMPLETE"
* category[diagnostic-service] = http://terminology.hl7.org/CodeSystem/v2-0074#CUS "Cardiac Ultrasound"
* category[imaging] = http://hl7.eu/fhir/{% if isR5 %}eu-{% endif %}health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* category[imaging-report] = $loinc#85430-7 //Diagnostic imaging report

* subject = Reference (PatientStructuredReport)
* extension[anatomical-region].valueCodeableConcept.coding = $sct#67734004 

{{R4}}* imagingStudy[+] = Reference (ImagingStudyStructuredReport)
{{R5}}* study[+] = Reference (ImagingStudyStructuredReport)

* performer[organization] = Reference (OrganizationStructuredReport)
* resultsInterpreter[author] = Reference (PractitionerRoleStructuredReportAuthor)

{{R4}}* extension[composition].valueReference = Reference (CompositionStructured)
{{R5}}* composition = Reference (CompositionStructured)

// HISTORY
* extension[patientHistory][+].valueReference = Reference (WeightObservation)
* extension[patientHistory][+].valueReference = Reference (HeightObservation)
* extension[patientHistory][+].valueReference = Reference (BPObservation)
* extension[patientHistory][+].valueReference = Reference (HRObservation)

// Procedure

// Comparison

// FINDINGS
* result[+] = Reference (NarrativeFindingsAll)
* result[+] = Reference (RestWmsi01)
* result[+] = Reference (RestWmsi02)
* result[+] = Reference (RestWmsi03)
* result[+] = Reference (RestWmsi04)
* result[+] = Reference (RestWmsi05)
* result[+] = Reference (RestWmsi06)
* result[+] = Reference (RestWmsi07)
* result[+] = Reference (RestWmsi08)
* result[+] = Reference (RestWmsi09)
* result[+] = Reference (RestWmsi10)
* result[+] = Reference (RestWmsi12)
* result[+] = Reference (RestWmsi13)
* result[+] = Reference (RestWmsi14)
* result[+] = Reference (RestWmsi15)
* result[+] = Reference (RestWmsi16)
* result[+] = Reference (RestWmsi17)
* result[+] = Reference (StressWmsi01)
* result[+] = Reference (StressWmsi02)
* result[+] = Reference (StressWmsi03)
* result[+] = Reference (StressWmsi04)
* result[+] = Reference (StressWmsi05)
* result[+] = Reference (StressWmsi06)
* result[+] = Reference (StressWmsi07)
* result[+] = Reference (StressWmsi08)
* result[+] = Reference (StressWmsi09)
* result[+] = Reference (StressWmsi10)
* result[+] = Reference (StressWmsi12)
* result[+] = Reference (StressWmsi13)
* result[+] = Reference (StressWmsi14)
* result[+] = Reference (StressWmsi15)
* result[+] = Reference (StressWmsi16)
* result[+] = Reference (StressWmsi17)
// * media[+]
//   * comment = "Rest"
//   * link = Reference (StructuredKeyImageRest)
// * media[+]
//   * comment = "Stress"
//   * link = Reference (StructuredKeyImageStress)
// IMPRESSIONS
* conclusion = """
This was a normal stress echocardiogram.
Nothing wrong with this patient
See you next year.
"""
// RECOMMENDATION
* extension[recommendation].valueReference = Reference (ComeBackNextYearServiceRequest)

* presentedForm
  * contentType = #application/pdf
  * language = #de-DE
{{R5}}  * pages = 3
  * url = "Binary/BinaryStructuredReport"

// Loading the binary from .json in input/resources

// Instance: BinaryStructuredReport
// InstanceOf: Binary
// Title: "Binary: Structured report"
// Description: "Binary resource holding the report pdf."
// Usage: #example
// * id = "structured-pdf"
// * contentType = #application/pdf
// // * data = "ig-loader-9df9cc92-0f09-4dbb-8d5d-e74bd9eaac3a.pdf"
// * data = "ig-loader-structured_report.pdf"

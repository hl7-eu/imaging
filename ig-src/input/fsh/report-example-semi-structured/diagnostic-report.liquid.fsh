Instance: DiagnosticReportSemiStructured
InstanceOf: DiagnosticReportEuImaging
Title: "DiagnosticReport: semi-structured report"
Description: "Example of a DiagnosticReportEuImaging showing the report for the left/right foot study"
Usage: #example
// * extension[artifactVersion].valueString = "1.0.0" // invented - not there in the report
* identifier
  * system = "http://example.org/myhosptital/reportidentifiers"
  * value = "o32u4js8492ff" // invented - not there in the report* 
* status = #final
* effectiveDateTime = "2025-05-08"
* language = #de-DE
* basedOn // order
  * type = #ServiceRequest
  * identifier
    * type
      * coding[+] = $v2-0203#ACSN 
      * coding[+] = http://dicom.nema.org/resources/ontology/DCM#121022 "Accession Number"
    * system = "http://example.org/myhosptital/accessionsystem"
    * value  = "123456789" // invented - not there in the report
* code = $loinc#24802-1
* category[diagnostic-service] = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiologie"
* subject = Reference(PatientSemiStructuredReport)
{{R4}}* imagingStudy[+] = Reference(ImagingStudySemiStructuredReport1)
{{R5}}* study[+] = Reference(ImagingStudySemiStructuredReport1)
{{R4}}* imagingStudy[+] = Reference(ImagingStudySemiStructuredReport2)
{{R5}}* study[+] = Reference(ImagingStudySemiStructuredReport2)
* performer[organization] = Reference(OrganizationSemiStructuredReport)
* resultsInterpreter[author] = Reference(PractitionerRoleSemiStructuredReportAuthor)

{{R4}}* extension[composition].valueReference = Reference(CompositionSemiStructured)
{{R5}}* composition = Reference(CompositionSemiStructured)

* result = Reference(ObservationNarrative)
* conclusion = "Beginnende Großzehengrundgelenksarthrose, links mehr als rechts. Z.n. Umstellungsosteotomie des MFK1 links."

* presentedForm
  * contentType = #application/pdf
  * language = #de-DE
{{R5}}  * pages = 1
{{R4}}  * url = "http://hl7.eu/fhir/imaging-r5/Binary/BinarySemistructuredReport"
{{R5}}  * url = "http://hl7.eu/fhir/imaging-r5/Binary/BinarySemistructuredReport"

// Instance: BinarySemiStructuredReport
// InstanceOf: Binary
// Title: "Binary: semi-structured report"
// Description: "Binary resource holding the report pdf."
// Usage: #example
// * id = "semi-structured-pdf"
// * contentType = #application/pdf
// * data = "ig-loader-semistructured_report.pdf"

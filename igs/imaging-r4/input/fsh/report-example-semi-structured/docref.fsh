Instance: DocumentReferenceSemiStructured
InstanceOf: DocumentReferenceImagingReport
Title: "DocumentReference: Renderable format semi-structured"
Description: "MHD DocumentReference for semi-structured report."
Usage: #example
* masterIdentifier[+]
//R5* identifier[+]
  * system = "urn:ietf:rfc:3986"
  * use = #usual
  * value = "http://semi-structured-report.example.com"
* status = #current
* date = "2025-05-08T00:00:00Z"
* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#MR
//R5* modality = http://dicom.nema.org/resources/ontology/DCM#MR
* category[+]
  * coding[priority-area] = http://hl7.eu/fhir/health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* type
  * coding[imaging-report] = $loinc#85430-7 "Diagnostic imaging report - example sections and entries"
* subject = Reference(PatientSemiStructuredReport)
* custodian = Reference(OrganizationSemiStructuredReport)
* extension[bodysite]
  * extension[concept]
    * valueCodeableConcept
      * coding[+] = $sct#61685007
//R5* bodySite
//R5  * concept
//R5    * coding[+] = $sct#61685007
* content[+]
  * extension[profile]
    * valueCanonical = Canonical(BundleReportEuImaging)
//R5  * profile[bundle-report].valueCanonical = Canonical(BundleReportEuImaging)
  * attachment[0]
    * contentType = #application/fhir+json
    * url = "Bundle/bundle-report-semi-structured"
    * language = #de-DE
    * creation = "2025-05-08T00:00:00Z"

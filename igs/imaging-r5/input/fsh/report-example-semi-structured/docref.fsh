Instance: DocumentReferenceSemiStructured
InstanceOf: DocumentReferenceImagingReport
Title: "DocumentReference: Renderable format semi-structured"
Description: "MHD DocumentReference for semi-structured report."
Usage: #example
//R4* masterIdentifier[+]
* identifier[+]
  * system = "urn:ietf:rfc:3986"
  * use = #usual
  * value = "http://semi-structured-report.example.com"
* status = #current
* date = "2025-05-08T00:00:00Z"
//R4* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#MR
* modality = http://dicom.nema.org/resources/ontology/DCM#MR
* category[+]
  * coding[priority-area] = http://hl7.eu/fhir/eu-health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* type
  * coding[imaging-report] = $loinc#85430-7 "Diagnostic imaging report - example sections and entries"
* subject = Reference(PatientSemiStructuredReport)
* custodian = Reference(OrganizationSemiStructuredReport)
//R4* extension[bodysite]
//R4  * extension[concept]
//R4    * valueCodeableConcept
//R4      * coding[+] = $sct#61685007
* bodySite
  * concept
    * coding[+] = $sct#61685007
* content[+]
//R4  * extension[profile]
//R4    * valueCanonical = Canonical(BundleReportEuImaging)
  * profile[bundle-report].valueCanonical = Canonical(BundleReportEuImaging)
  * attachment[0]
    * contentType = #application/fhir+json
    * url = "Bundle/bundle-report-semi-structured"
    * language = #de-DE
    * creation = "2025-05-08T00:00:00Z"

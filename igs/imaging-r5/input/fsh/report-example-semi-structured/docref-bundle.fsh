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
    * url = "./Bundle/bundle-report-semi-structured"
    * language = #de-DE
    * creation = "2025-05-08T00:00:00Z"

Instance: BundleReportSemiStructured
InstanceOf: BundleReportEuImaging
Title: "Bundle: Imaging Report semi-structured"
Description: "Document bundle grouping resources in the semi-structured example."
Usage: #example
* id = "bundle-report-semi-structured"
* timestamp = "2025-05-08T00:00:00Z"
* identifier
  * system = "http://example.org/myhosptital/reportidentifiers"
  * value = "o32u4js8492ff"
* entry[CompositionEuImaging]
  * fullUrl = "urn:uuid:4f37ad0a-11f8-4389-88bb-78118d8f84db"
  * resource = CompositionSemiStructured
* entry[DiagnosticReportEuImaging]
  * fullUrl = "urn:uuid:464458ef-b366-4125-b8f2-b2c2716d3608"
  * resource = DiagnosticReportSemiStructured
* entry[Patient]
  * fullUrl = "urn:uuid:907c9bcf-94b5-4243-88ba-6f85ffec4bc8"
  * resource = PatientSemiStructuredReport
* entry[ImagingStudy][+]
  * fullUrl = "urn:uuid:b710ae7d-c8d7-4861-a01e-b1e34031de4f"
  * resource = ImagingStudySemiStructuredReport1
* entry[ImagingStudy][+]
  * fullUrl = "urn:uuid:118f57b8-a3ec-4b3e-90f7-47a7f5563218"
  * resource = ImagingStudySemiStructuredReport2
* entry[+]
  * fullUrl = "urn:uuid:cc78737c-f9a7-4253-b932-ccdb13f745cd"
  * resource = PractitionerRoleSemiStructuredReportAuthor
* entry[+]
  * fullUrl = "urn:uuid:ef64fa06-f761-4097-9af1-c9f7615f95ce"
  * resource = PractitionerSemiStructuredReportAuthor
* entry[+]
  * fullUrl = "urn:uuid:d6f6db53-9e8b-4b5a-9ccc-b06ad4b62d4b"
  * resource = OrganizationSemiStructuredReport
* entry[+]
  * fullUrl = "urn:uuid:f7f11c74-2c5b-4d56-b00e-c66f8e56da67"
  * resource = BinarySemiStructuredReport

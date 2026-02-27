Instance: RenderableFormatWithBasicMetadata
InstanceOf: DocumentReferenceImagingReport
Title: "DocumentReference: Renderable format with basic metadata"
Description: "MHD DocumentReference for unstructured report."
Usage: #example
* masterIdentifier[+]
//R5* identifier[+]
  * system = "urn:ietf:rfc:3986"
  * use = #usual
  * value = "http://unstructured-report.example.com"
* status = #current
* date = "2024-01-01T00:00:00Z"
* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#CT
//R5* modality = http://dicom.nema.org/resources/ontology/DCM#CT

* category[+]
  * coding[priority-area] = http://hl7.eu/fhir/eu-health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* type
  * coding[imaging-report] = $loinc#85430-7 "Diagnostic imaging report - example sections and entries"

* subject = Reference(PatientUnstructuredReport)
* custodian = Reference(OrganizationUnstructuredReport)

* extension[bodysite]
  * extension[concept]
    * valueCodeableConcept
      * coding[+] = $sct#774007
      * coding[+] = $sct#38266002
//R5* bodySite
//R5  * concept
//R5    * coding[+] = $sct#774007 
//R5    * coding[+] = $sct#38266002


* content[+]
  * extension[profile]
    * valueCanonical = Canonical(BundleReportMinimalMetadataEuImaging)
//R5  * profile[bundle-report-minimal-metadata].valueCanonical = Canonical(BundleReportMinimalMetadataEuImaging)
  * attachment[0]
    * contentType = #application/fhir+json
    * url = "./Bundle/bundle-report-minimal-metadata-unstructured"
    * language = #de
    * creation = "2024-01-01T00:00:00Z"
  
Instance: PatientUnstructuredReport
InstanceOf: $EuPatient 
Title: "Patient: unstructured report"
Description: "Patient used in the unstructured report"
Usage: #example
* name
  * use = #official
  * text = "Jane Doe"
  * family = "Doe"
  * given = "Jane"
* birthDate = "1976-04-29"

Instance: OrganizationUnstructuredReport
InstanceOf: $EuOrganization 
Title: "Organization: unstructured report"
Description: "Organization used in the unstructured report"
Usage: #example
* name = "Rediologie Zentrum Bremen"
* contact
  * telecom[+]
    * system = #phone
    * value = "0421 / 84 13 13 04"   
  * telecom[+]
    * system = #fax
    * value = "0421 / 84 13 13 84"
  * address[+]
    * type = #physical
    * text = "Schwachhauser Heerstr. 54, 28209 Bremen"
    * line[+] = "Schwachhauser Heerstr. 54"
      * extension[$street-name-url].valueString = "Schwachhauser Heerstr."
      * extension[$house-number-url].valueString = "54"
    * postalCode = "28209"
    * city = "Bremen"

Instance: BundleReportMinimalMetadata
InstanceOf: BundleReportMinimalMetadataEuImaging
Title: "Bundle: Imaging Report minimal metadata (unstructured example)"
Description: "Minimal metadata bundle carrying the report anchor and context resources."
Usage: #example
* id = "bundle-report-minimal-metadata-unstructured"
* entry[DiagnosticReportEuImagingMinimalMetadata]
  * fullUrl = "urn:uuid:8f6d9c62-1b2a-4f3c-9d0e-7a6b5c4d3e2f"
  * resource = DiagnosticReportMinimalMetadata
* entry[Patient]
  * fullUrl = "urn:uuid:1d3c5b7a-9e0f-4a2b-8c6d-5e4f3a2b1c0d"
  * resource = PatientUnstructuredReport

Instance: DiagnosticReportMinimalMetadata
InstanceOf: DiagnosticReportEuImagingMinimalMetadata
Title: "DiagnosticReport: unstructured minimal metadata"
Description: "Minimal metadata DiagnosticReport compliant with DiagnosticReportEuImaging profile."
Usage: #example
* identifier[+]
  * system = "http://example.org/myhospital/reportidentifiers"
  * value = "unstructured-report-001"
* status = #final
* code = $loinc#85430-7 "Diagnostic imaging report - example sections and entries"
* category[imaging] = http://hl7.eu/fhir/eu-health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* category[imaging-report] = $loinc#85430-7 //Diagnostic imaging report

* subject.reference = "urn:uuid:1d3c5b7a-9e0f-4a2b-8c6d-5e4f3a2b1c0d"
* performer[organization] = Reference(OrganizationUnstructuredReport)
* basedOn[order-identifier].identifier
  * system = "http://example.org/myhospital/accessionsystem"
  * value = "ACC-123456789"

* imagingStudy[study-identifier].identifier
  * system = "urn:dicom:uid"
  * value = "1.2.840.113619.2.55.3.604688123.783.1704067200.1"

//R5* study[study-identifier].identifier
//R5  * system = "urn:dicom:uid"
//R5  * value = "1.2.840.113619.2.55.3.604688123.783.1704067200.1"
* presentedForm[+]
  * contentType = #application/pdf
  * url = "Binary/BinaryUnstructuredReport"
  * language = #de
  * creation = "2024-01-01T00:00:00Z"

// Loadin the binary .json from input/resoures
// Instance: BinaryUnstructuredReport
// InstanceOf: Binary
// Title: "Binary: Unstructured report pdf"
// Description: "Binary resource holding the unstructured report pdf."
// Usage: #example
// * id = "unstructured-pdf"
// * contentType = #application/pdf
// * data = "ig-loader-unstructured_report.pdf"

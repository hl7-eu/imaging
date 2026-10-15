Instance: DocumentReferenceSemiStructured
InstanceOf: DocumentReferenceImagingReport
Title: "DocumentReference: Renderable format semi-structured"
Description: "MHD DocumentReference for the Imaging Report R4 semi-structured report example."
Usage: #example
* masterIdentifier
  * type = https://profiles.ihe.net/ITI/MHD/CodeSystem/IHE.MHD.MHDIdentifierType#uniqueId
  * system = "urn:ietf:rfc:3986"
  * use = #usual
  * value = "http://semi-structured-report.example.com"
* status = #current
* date = "2025-05-08T00:00:00Z"
* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#MR
* category.coding[priority-area] = http://hl7.eu/fhir/health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* type.coding[imaging-report] = $loinc#85430-7 "Diagnostic imaging report - example sections and entries"
* subject.reference = "http://hl7.eu/fhir/imaging/Patient/PatientSemiStructuredReport"
* custodian.reference = "http://hl7.eu/fhir/imaging/Organization/OrganizationSemiStructuredReport"
* content
  * extension[profile].valueCanonical = Canonical(BundleReportEuImaging)
  * attachment
    * contentType = #application/fhir+json
    * url = "http://hl7.eu/fhir/imaging/Bundle/bundle-report-semi-structured"
    * language = #de-DE
    * creation = "2025-05-08T00:00:00Z"

Instance: DocumentReferenceStructuredReport
InstanceOf: DocumentReferenceImagingReport
Title: "DocumentReference: Renderable format structured"
Description: "MHD DocumentReference for the Imaging Report R4 structured report example."
Usage: #example
* masterIdentifier
  * type = https://profiles.ihe.net/ITI/MHD/CodeSystem/IHE.MHD.MHDIdentifierType#uniqueId
  * system = "urn:ietf:rfc:3986"
  * use = #usual
  * value = "http://structured-report.example.com"
* status = #current
* date = "2025-09-05T00:00:00Z"
* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#US
* category.coding[priority-area] = http://hl7.eu/fhir/health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* type.coding[imaging-report] = $loinc#85430-7 "Diagnostic imaging report - example sections and entries"
* subject.reference = "http://hl7.eu/fhir/imaging/Patient/PatientStructuredReport"
* custodian.reference = "http://hl7.eu/fhir/imaging/Organization/OrganizationStructuredReport"
* content
  * extension[profile].valueCanonical = Canonical(BundleReportEuImaging)
  * attachment
    * contentType = #application/fhir+json
    * url = "http://hl7.eu/fhir/imaging/Bundle/bundle-report-structured"
    * language = #en-GB
    * creation = "2025-09-05T00:00:00Z"

Instance: RenderableFormatWithBasicMetadata
InstanceOf: DocumentReferenceImagingReport
Title: "DocumentReference: Renderable format with basic metadata"
Description: "MHD DocumentReference for the Imaging Report R4 unstructured report example."
Usage: #example
* masterIdentifier
  * type = https://profiles.ihe.net/ITI/MHD/CodeSystem/IHE.MHD.MHDIdentifierType#uniqueId
  * system = "urn:ietf:rfc:3986"
  * use = #usual
  * value = "http://unstructured-report.example.com"
* status = #current
* date = "2024-01-01T00:00:00Z"
* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#CT
* category.coding[priority-area] = http://hl7.eu/fhir/health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* type.coding[imaging-report] = $loinc#85430-7 "Diagnostic imaging report - example sections and entries"
* subject.reference = "http://hl7.eu/fhir/imaging/Patient/PatientUnstructuredReport"
* custodian.reference = "http://hl7.eu/fhir/imaging/Organization/OrganizationUnstructuredReport"
* content
  * extension[profile].valueCanonical = Canonical(BundleReportMinimalMetadataEuImaging)
  * attachment
    * contentType = #application/fhir+json
    * url = "http://hl7.eu/fhir/imaging/Bundle/bundle-report-minimal-metadata-unstructured"
    * language = #de
    * creation = "2024-01-01T00:00:00Z"

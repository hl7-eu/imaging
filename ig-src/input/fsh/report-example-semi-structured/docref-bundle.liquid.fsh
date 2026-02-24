Instance: DocumentReferenceSemiStructured
InstanceOf: DocumentReferenceImagingReport
Title: "DocumentReference: Renderable format semi-structured"
Description: "MHD DocumentReference for semi-structured report."
Usage: #example
{{R4}}* masterIdentifier[+]
{{R5}}* identifier[+]
  * system = "urn:ietf:rfc:3986"
  * use = #usual
  * value = "http://semi-structured-report.example.com"
* status = #current
* date = "2025-05-08T00:00:00Z"
{{R4}}* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#MR
{{R5}}* modality = http://dicom.nema.org/resources/ontology/DCM#MR
* category[+]
  * coding[priority-area] = http://hl7.eu/fhir/eu-health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* type
  * coding[imaging-report] = $loinc#85430-7 "Diagnostic imaging study"
* subject = Reference(PatientSemiStructuredReport)
* custodian = Reference(OrganizationSemiStructuredReport)
{{R4}}* extension[bodysite]
{{R4}}  * extension[concept]
{{R4}}    * valueCodeableConcept
{{R4}}      * coding[+] = $sct#61685007
{{R5}}* bodySite
{{R5}}  * concept
{{R5}}    * coding[+] = $sct#61685007
* content[+]
  * extension[profile].extension[+]
    * url = "value"
    * valueCanonical = Canonical(BundleReportEuImaging)
{{R5}}  * profile[bundle-report].valueCanonical = Canonical(BundleReportEuImaging)
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
  * fullUrl = "Composition/CompositionSemiStructured"
  * resource = CompositionSemiStructured
* entry[DiagnosticReportEuImaging]
  * fullUrl = "DiagnosticReport/DiagnosticReportSemiStructured"
  * resource = DiagnosticReportSemiStructured
* entry[Patient]
  * fullUrl = "Patient/PatientSemiStructuredReport"
  * resource = PatientSemiStructuredReport
* entry[ImagingStudy][+]
  * fullUrl = "ImagingStudy/ImagingStudySemiStructuredReport1"
  * resource = ImagingStudySemiStructuredReport1
* entry[ImagingStudy][+]
  * fullUrl = "ImagingStudy/ImagingStudySemiStructuredReport2"
  * resource = ImagingStudySemiStructuredReport2
* entry[+]
  * fullUrl = "PractitionerRole/PractitionerRoleSemiStructuredReportAuthor"
  * resource = PractitionerRoleSemiStructuredReportAuthor
* entry[+]
  * fullUrl = "Practitioner/PractitionerSemiStructuredReportAuthor"
  * resource = PractitionerSemiStructuredReportAuthor
* entry[+]
  * fullUrl = "Organization/OrganizationSemiStructuredReport"
  * resource = OrganizationSemiStructuredReport
* entry[+]
  * fullUrl = "Binary/semi-structured-pdf"
  * resource = BinarySemiStructuredReport

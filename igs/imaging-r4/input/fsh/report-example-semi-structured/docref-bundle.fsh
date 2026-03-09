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
  * coding[priority-area] = http://hl7.eu/fhir/eu-health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
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

Instance: BundleReportSemiStructured
InstanceOf: BundleReportEuImaging
Title: "Bundle: Imaging Report semi-structured"
Description: "Document bundle grouping resources in the semi-structured example."
Usage: #example
* id = "bundle-report-semi-structured"
* timestamp = "2025-05-08T00:00:00Z"
* type = #document
* identifier
  * system = "http://example.org/myhosptital/reportidentifiers"
  * value = "o32u4js8492ff"
* entry[CompositionEuImaging]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Composition/CompositionSemiStructured"
  * resource = CompositionSemiStructured
* entry[DiagnosticReportEuImaging]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/DiagnosticReport/DiagnosticReportSemiStructured"
  * resource = DiagnosticReportSemiStructured
* entry[Patient]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Patient/PatientSemiStructuredReport"
  * resource = PatientSemiStructuredReport
* entry[ImagingStudy][+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/ImagingStudy/ImagingStudySemiStructuredReport1"
  * resource = ImagingStudySemiStructuredReport1
* entry[ImagingStudy][+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/ImagingStudy/ImagingStudySemiStructuredReport2"
  * resource = ImagingStudySemiStructuredReport2
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/PractitionerRole/PractitionerRoleSemiStructuredReportAuthor"
  * resource = PractitionerRoleSemiStructuredReportAuthor
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Practitioner/PractitionerSemiStructuredReportAuthor"
  * resource = PractitionerSemiStructuredReportAuthor
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Organization/OrganizationSemiStructuredReport"
  * resource = OrganizationSemiStructuredReport
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Binary/BinarySemistructuredReport"
  * resource = BinarySemistructuredReport
* entry[findings]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/ObservationAnchor"
  * resource = ObservationAnchor 

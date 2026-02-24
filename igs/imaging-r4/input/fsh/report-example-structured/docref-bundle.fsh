Instance: DocumentReferenceStructuredReport
InstanceOf: DocumentReferenceImagingReport
Title: "DocumentReference: Renderable format structured"
Description: "MHD DocumentReference for structured report."
Usage: #example
* masterIdentifier[+]
//R5* identifier[+]
  * system = "urn:ietf:rfc:3986"
  * use = #usual
  * value = "http://structured-report.example.com"
* status = #current
* date = "2025-09-05T00:00:00Z"
* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#US
//R5* modality = http://dicom.nema.org/resources/ontology/DCM#US
* category[+]
  * coding[priority-area] = http://hl7.eu/fhir/eu-health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* type
  * coding[imaging-report] = $loinc#85430-7 "Diagnostic imaging study"
* subject = Reference(PatientStructuredReport)
* custodian = Reference(OrganizationStructuredReport)
* extension[bodysite]
  * extension[concept]
    * valueCodeableConcept
      * coding[+] = $sct#67734004
//R5* bodySite
//R5  * concept
//R5    * coding[+] = $sct#67734004
* content[+]
  * extension[profile].extension[+]
    * url = "value"
    * valueCanonical = Canonical(BundleReportEuImaging)
//R5  * profile[bundle-report].valueCanonical = Canonical(BundleReportEuImaging)
  * attachment[0]
    * contentType = #application/fhir+json
    * url = "./Bundle/bundle-report-structured"
    * language = #en-GB
    * creation = "2025-09-05T00:00:00Z"

Instance: BundleReportStructured
InstanceOf: BundleReportEuImaging
Title: "Bundle: Imaging Report structured"
Description: "Document bundle grouping resources in the structured example."
Usage: #example
* id = "bundle-report-structured"
* identifier
  * system = "http://example.org/myhosptital/reportidentifiers"
  * value = "dfkjewoieoijwoskdjf"
* entry[+]
  * fullUrl = "urn:uuid:composition-structured"
  * resource = CompositionStructured
* entry[+]
  * fullUrl = "urn:uuid:diagnostic-report-structured"
  * resource = DiagnosticReportStructured
* entry[+]
  * fullUrl = "urn:uuid:patient-structured"
  * resource = PatientStructuredReport
* entry[+]
  * fullUrl = "urn:uuid:imaging-study-structured"
  * resource = ImagingStudStructuredReport
* entry[+]
  * fullUrl = "urn:uuid:practitioner-role-structured"
  * resource = PractitionerRoleStructuredReportAuthor
* entry[+]
  * fullUrl = "urn:uuid:practitioner-structured"
  * resource = PractitionerStructuredReportAuthor
* entry[+]
  * fullUrl = "urn:uuid:organization-structured"
  * resource = OrganizationStructuredReport
* entry[+]
  * fullUrl = "urn:uuid:weight-observation"
  * resource = WeightObservation
* entry[+]
  * fullUrl = "urn:uuid:height-observation"
  * resource = HeightObservation
* entry[+]
  * fullUrl = "urn:uuid:bp-observation"
  * resource = BPObservation
* entry[+]
  * fullUrl = "urn:uuid:hr-observation"
  * resource = HRObservation
* entry[+]
  * fullUrl = "urn:uuid:wmsi-image"
  * resource = WMSIImage
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-01"
  * resource = RestWmsi01
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-02"
  * resource = RestWmsi02
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-03"
  * resource = RestWmsi03
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-04"
  * resource = RestWmsi04
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-05"
  * resource = RestWmsi05
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-06"
  * resource = RestWmsi06
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-07"
  * resource = RestWmsi07
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-08"
  * resource = RestWmsi08
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-09"
  * resource = RestWmsi09
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-10"
  * resource = RestWmsi10
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-11"
  * resource = RestWmsi11
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-12"
  * resource = RestWmsi12
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-13"
  * resource = RestWmsi13
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-14"
  * resource = RestWmsi14
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-15"
  * resource = RestWmsi15
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-16"
  * resource = RestWmsi16
* entry[+]
  * fullUrl = "urn:uuid:rest-wmsi-17"
  * resource = RestWmsi17
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-01"
  * resource = StressWmsi01
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-02"
  * resource = StressWmsi02
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-03"
  * resource = StressWmsi03
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-04"
  * resource = StressWmsi04
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-05"
  * resource = StressWmsi05
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-06"
  * resource = StressWmsi06
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-07"
  * resource = StressWmsi07
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-08"
  * resource = StressWmsi08
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-09"
  * resource = StressWmsi09
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-10"
  * resource = StressWmsi10
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-11"
  * resource = StressWmsi11
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-12"
  * resource = StressWmsi12
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-13"
  * resource = StressWmsi13
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-14"
  * resource = StressWmsi14
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-15"
  * resource = StressWmsi15
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-16"
  * resource = StressWmsi16
* entry[+]
  * fullUrl = "urn:uuid:stress-wmsi-17"
  * resource = StressWmsi17
* entry[+]
  * fullUrl = "urn:uuid:structured-key-image-rest"
  * resource = StructuredKeyImageRest
* entry[+]
  * fullUrl = "urn:uuid:structured-key-image-stress"
  * resource = StructuredKeyImageStress
* entry[+]
  * fullUrl = "urn:uuid:service-request-recommendation"
  * resource = ComeBackNextYearServiceRequest
* entry[+]
  * fullUrl = "urn:uuid:binary-structured"
  * resource = BinaryStructuredReport

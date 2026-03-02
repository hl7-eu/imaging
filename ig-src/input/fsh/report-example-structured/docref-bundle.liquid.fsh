Instance: DocumentReferenceStructuredReport
InstanceOf: DocumentReferenceImagingReport
Title: "DocumentReference: Renderable format structured"
Description: "MHD DocumentReference for structured report."
Usage: #example
{{R4}}* masterIdentifier[+]
{{R5}}* identifier[+]
  * system = "urn:ietf:rfc:3986"
  * use = #usual
  * value = "http://structured-report.example.com"
* status = #current
* date = "2025-09-05T00:00:00Z"
{{R4}}* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#US
{{R5}}* modality = http://dicom.nema.org/resources/ontology/DCM#US
* category[+]
  * coding[priority-area] = http://hl7.eu/fhir/eu-health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* type
  * coding[imaging-report] = $loinc#85430-7 "Diagnostic imaging report - example sections and entries"
* subject = Reference(PatientStructuredReport)
* custodian = Reference(OrganizationStructuredReport)
{{R4}}* extension[bodysite]
{{R4}}  * extension[concept]
{{R4}}    * valueCodeableConcept
{{R4}}      * coding[+] = $sct#67734004
{{R5}}* bodySite
{{R5}}  * concept
{{R5}}    * coding[+] = $sct#67734004
* content[+]
{{R4}}  * extension[profile]
{{R4}}    * valueCanonical = Canonical(BundleReportMinimalMetadataEuImaging)
{{R5}}  * profile[bundle-report].valueCanonical = Canonical(BundleReportEuImaging)
  * attachment[0]
    * contentType = #application/fhir+json
    * url = "Bundle/bundle-report-structured"
    * language = #en-GB
    * creation = "2025-09-05T00:00:00Z"

Instance: BundleReportStructured
InstanceOf: BundleReportEuImaging
Title: "Bundle: Imaging Report structured"
Description: "Document bundle grouping resources in the structured example."
Usage: #example
* id = "bundle-report-structured"
* timestamp = "2025-09-05T00:00:00Z"
* type = #document
* identifier
  * system = "http://example.org/myhosptital/reportidentifiers"
  * value = "dfkjewoieoijwoskdjf"
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000001"
  * resource = CompositionStructured
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000002"
  * resource = DiagnosticReportStructured
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000003"
  * resource = PatientStructuredReport
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000004"
  * resource = ImagingStudStructuredReport
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000005"
  * resource = PractitionerRoleStructuredReportAuthor
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000006"
  * resource = PractitionerStructuredReportAuthor
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000007"
  * resource = OrganizationStructuredReport
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000008"
  * resource = WeightObservation
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000009"
  * resource = HeightObservation
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000000a"
  * resource = BPObservation
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000000b"
  * resource = HRObservation
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000000c"
  * resource = WMSIImage
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000000d"
  * resource = RestWmsi01
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000000e"
  * resource = RestWmsi02
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000000f"
  * resource = RestWmsi03
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000010"
  * resource = RestWmsi04
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000011"
  * resource = RestWmsi05
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000012"
  * resource = RestWmsi06
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000013"
  * resource = RestWmsi07
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000014"
  * resource = RestWmsi08
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000015"
  * resource = RestWmsi09
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000016"
  * resource = RestWmsi10
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000017"
  * resource = RestWmsi11
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000018"
  * resource = RestWmsi12
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000019"
  * resource = RestWmsi13
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000001a"
  * resource = RestWmsi14
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000001b"
  * resource = RestWmsi15
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000001c"
  * resource = RestWmsi16
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000001d"
  * resource = RestWmsi17
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000001e"
  * resource = StressWmsi01
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000001f"
  * resource = StressWmsi02
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000020"
  * resource = StressWmsi03
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000021"
  * resource = StressWmsi04
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000022"
  * resource = StressWmsi05
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000023"
  * resource = StressWmsi06
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000024"
  * resource = StressWmsi07
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000025"
  * resource = StressWmsi08
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000026"
  * resource = StressWmsi09
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000027"
  * resource = StressWmsi10
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000028"
  * resource = StressWmsi11
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000029"
  * resource = StressWmsi12
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000002a"
  * resource = StressWmsi13
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000002b"
  * resource = StressWmsi14
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000002c"
  * resource = StressWmsi15
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000002d"
  * resource = StressWmsi16
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000002e"
  * resource = StressWmsi17
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-00000000002f"
  * resource = StructuredKeyImageRest
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000030"
  * resource = StructuredKeyImageStress
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000031"
  * resource = ComeBackNextYearServiceRequest
* entry[+]
  * fullUrl = "urn:uuid:11111111-2222-4333-8444-000000000032"
  * resource = BinaryStructuredReport

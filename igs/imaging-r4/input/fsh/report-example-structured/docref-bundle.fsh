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
  * coding[imaging-report] = $loinc#85430-7 "Diagnostic imaging report - example sections and entries"
* subject = Reference(PatientStructuredReport)
* custodian = Reference(OrganizationStructuredReport)
* extension[bodysite]
  * extension[concept]
    * valueCodeableConcept
      * coding[+] = $sct#67734004
//R5* bodySite
//R5  * concept
//R5    * coding = $sct#67734004
* content[+]
  * extension[profile]
    * valueCanonical = Canonical(BundleReportMinimalMetadataEuImaging)
//R5  * profile[bundle-report].valueCanonical = Canonical(BundleReportEuImaging)
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
  * value = "aspecificidentifier" // invented - not there in the report
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Composition/CompositionStructured"
  * resource = CompositionStructured
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/DiagnosticReport/DiagnosticReportStructured"
  * resource = DiagnosticReportStructured
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Patient/PatientStructuredReport"
  * resource = PatientStructuredReport
* entry[ImagingStudy][+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/ImagingStudy/ImagingStudStructuredReport"
  * resource = ImagingStudStructuredReport
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/PractitionerRole/PractitionerRoleStructuredReportAuthor"
  * resource = PractitionerRoleStructuredReportAuthor
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Practitioner/PractitionerStructuredReportAuthor"
  * resource = PractitionerStructuredReportAuthor
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Organization/OrganizationStructuredReport"
  * resource = OrganizationStructuredReport
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/WeightObservation"
  * resource = WeightObservation
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/HeightObservation"
  * resource = HeightObservation
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/BPObservation"
  * resource = BPObservation
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/HRObservation"
  * resource = HRObservation
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/DocumentReference/WMSIImage"
  * resource = WMSIImage
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi01"
  * resource = RestWmsi01
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi02"
  * resource = RestWmsi02
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi03"
  * resource = RestWmsi03
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi04"
  * resource = RestWmsi04
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi05"
  * resource = RestWmsi05
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi06"
  * resource = RestWmsi06
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi07"
  * resource = RestWmsi07
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi08"
  * resource = RestWmsi08
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi09"
  * resource = RestWmsi09
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi10"
  * resource = RestWmsi10
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi11"
  * resource = RestWmsi11
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi12"
  * resource = RestWmsi12
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi13"
  * resource = RestWmsi13
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi14"
  * resource = RestWmsi14
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi15"
  * resource = RestWmsi15
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi16"
  * resource = RestWmsi16
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/RestWmsi17"
  * resource = RestWmsi17
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi01"
  * resource = StressWmsi01
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi02"
  * resource = StressWmsi02
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi03"
  * resource = StressWmsi03
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi04"
  * resource = StressWmsi04
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi05"
  * resource = StressWmsi05
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi06"
  * resource = StressWmsi06
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi07"
  * resource = StressWmsi07
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi08"
  * resource = StressWmsi08
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi09"
  * resource = StressWmsi09
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi10"
  * resource = StressWmsi10
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi11"
  * resource = StressWmsi11
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi12"
  * resource = StressWmsi12
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi13"
  * resource = StressWmsi13
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi14"
  * resource = StressWmsi14
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi15"
  * resource = StressWmsi15
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi16"
  * resource = StressWmsi16
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/StressWmsi17"
  * resource = StressWmsi17
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/DocumentReference/StructuredKeyImageRest"
  * resource = StructuredKeyImageRest
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/DocumentReference/StructuredKeyImageStress"
  * resource = StructuredKeyImageStress
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/ServiceRequest/ComeBackNextYearServiceRequest"
  * resource = ComeBackNextYearServiceRequest
* entry[+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Binary/BinaryStructuredReport"
  * resource = BinaryStructuredReport

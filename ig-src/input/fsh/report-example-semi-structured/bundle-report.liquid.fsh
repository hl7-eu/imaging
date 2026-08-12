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
* entry[practitioner][+]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/PractitionerRole/PractitionerRoleSemiStructuredReportAuthor"
  * resource = PractitionerRoleSemiStructuredReportAuthor
* entry[practitioner][+]       
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Practitioner/PractitionerSemiStructuredReportAuthor"
  * resource = PractitionerSemiStructuredReportAuthor
* entry[organization]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Organization/OrganizationSemiStructuredReport"
  * resource = OrganizationSemiStructuredReport
* entry[binary]
  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Binary/BinarySemistructuredReport"
  * resource = BinarySemistructuredReport
{{R56}}* entry[findings]
{{R56}}  * fullUrl = "http://hl7.eu/fhir/imaging-r5/Observation/ObservationNarrative"
{{R56}}  * resource = ObservationNarrative
// * entry[order]
//   * fullUrl = "http://hl7.eu/fhir/imaging-r5/ServiceRequest/ServiceRequestSemiStructured"
//   * resource = ServiceRequestSemiStructured
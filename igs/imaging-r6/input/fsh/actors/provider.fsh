Instance: BundleReportEuImagingProvider
InstanceOf: ActorDefinition
Title: "ActorDefinition: Imaging Report Provider"
Description: "The actor responsible for providing the Imaging Report resources."
Usage: #definition
* name = "BundleReportEuImagingProvider"
* title = "Imaging Report provider"
* status = #draft
* description = "Provides the Imaging Report."
* documentation = """
This actor typically represents a system that provides access to radiology reports. Typically this would be systems like a Electronic Health Record (EHR), Radiology Information System (RIS) or a Picture Archiving and Communication System (PACS) that manages and provides access to imaging reports.
"""
* type = #system

// Instance: BundleReportEuImagingProviderCapabilityStatement
// InstanceOf: CapabilityStatement
// Title: "Imaging Report Provider Capability Statement"
// Description: "Capability Statement for an Imaging Report Provider."
// Usage: #definition
// * name = "BundleReportEuImagingProviderCapabilityStatement"
// * title = "Imaging Report Provider Capability Statement"
// * status = #draft
// * description = "Capability Statement for an Imaging Report Provider."
// * date = 2025-09-10 // YYYY-MM-DD
// * publisher = "HL7 EU"
// // * actorDefinition = Reference(BundleReportEuImagingProvider)
// * kind = #requirements
// * fhirVersion = #5.0.0
// * format = #json
// * rest[+]
//   * mode = #server
//   * resource[+]
//     * type = #Composition
//     * profile = Canonical(CompositionEuImaging)
//     * interaction[+]
//       * code = #read
//       * code = #search-type
//     * operation[+]
//       * name = "document"
//       * definition = "https://hl7.org/fhir/composition-operation-document.html"
//   * resource[+]
//     * type = #DiagnosticReport
//     * profile = Canonical(DiagnosticReportEuImaging)
//     * interaction[+]
//       * code = #read
//       * code = #search-type
//     * operation[+]
//       * name = "document"
//       * definition = Canonical(DiagnosticReport-fhir-report)
//   * resource[+]
//     * type = #ImagingStudy
//     * profile = Canonical(ImagingStudyEuImaging)
//     * interaction[+]
//       * code = #read
//       * code = #search-type
//   * resource[+]
//     * type = #Patient
//     * profile = Canonical(DiagnosticReportEuImaging)
//     * interaction[+]
//       * code = #read
//       * code = #search-type
//   * resource[+]
//     * type = #DocumentReference
//     * profile = Canonical(BundleReportEuImagingDocumentReference)
//     * interaction[+]
//       * code = #read
//       * code = #search-type

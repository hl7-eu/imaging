Instance: ImReportProvider
InstanceOf: ActorDefinition
Title: "Imaging Study Report Provider"
Description: "The actor responsible for providing the Imaging Report resources."
Usage: #definition
* name = "ImReportProvider"
* title = "Imaging study report provider"
* status = #draft
* description = "Provides the Imaging study report."
* documentation = """
This actor typically represents a system that provides access to radiology reports. Typically this would be systems like a Electronic Health Record (EHR), Radiology Information System (RIS) or a Picture Archiving and Communication System (PACS) that manages and provides access to imaging reports.
"""
* type = #system

// Instance: ImReportProviderCapabilityStatement
// InstanceOf: CapabilityStatement
// Title: "Imaging Study Report Provider Capability Statement"
// Description: "Capability Statement for an Imaging Study Report Provider."
// Usage: #definition
// * name = "ImReportProviderCapabilityStatement"
// * title = "Imaging Study Report Provider Capability Statement"
// * status = #draft
// * description = "Capability Statement for an Imaging Study Report Provider."
// * date = 2025-09-10 // YYYY-MM-DD
// * publisher = "HL7 EU"
// // * actorDefinition = Reference(ImReportProvider)
// * kind = #requirements
// * fhirVersion = #5.0.0
// * format = #json
// * rest[+]
//   * mode = #server
//   * resource[+]
//     * type = #Composition
//     * profile = Canonical(ImComposition)
//     * interaction[+]
//       * code = #read
//       * code = #search-type
//     * operation[+]
//       * name = "document"
//       * definition = "https://hl7.org/fhir/composition-operation-document.html"
//   * resource[+]
//     * type = #DiagnosticReport
//     * profile = Canonical(ImDiagnosticReport)
//     * interaction[+]
//       * code = #read
//       * code = #search-type
//     * operation[+]
//       * name = "document"
//       * definition = Canonical(DiagnosticReport-fhir-report)
//   * resource[+]
//     * type = #ImagingStudy
//     * profile = Canonical(ImImagingStudy)
//     * interaction[+]
//       * code = #read
//       * code = #search-type
//   * resource[+]
//     * type = #Patient
//     * profile = Canonical(ImDiagnosticReport)
//     * interaction[+]
//       * code = #read
//       * code = #search-type
//   * resource[+]
//     * type = #DocumentReference
//     * profile = Canonical(ImReportDocumentReference)
//     * interaction[+]
//       * code = #read
//       * code = #search-type

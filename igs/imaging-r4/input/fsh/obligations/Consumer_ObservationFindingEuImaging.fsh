


////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Consumer_ObservationFindingEuImaging
Parent: ObservationFindingEuImaging
Id: Consumer-ObservationFindingEuImaging
Title: "ObservationFindingEuImaging: obligations"
Description: "Consumer obligations for ObservationFindingEuImaging"
* text
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.examinationReport.results[x]"

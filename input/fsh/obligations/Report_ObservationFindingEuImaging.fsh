////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Report_ObservationFindingEuImaging
Parent: ObservationFindingEuImaging
Id: Report-ObservationFindingEuImaging
Title: "ObservationFindingEuImaging: obligations"
Description: "Report obligations for ObservationFindingEuImaging"
* derivedFrom
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.attachments[x]"

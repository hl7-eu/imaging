////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Report_ProcedureEuImaging
Parent: ProcedureEuImaging
Id: Report-ProcedureEuImaging
Title: "ProcedureEuImaging: obligations"
Description: "Report obligations for ProcedureEuImaging"
* location
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.header.eventType"

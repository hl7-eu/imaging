


////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ProcedureObligationEuImaging
Parent: ProcedureEuImaging
Id: procedure-obligation-eu-imaging
Title: "ProcedureEuImaging: Obligations"
Description: "Obligations for ProcedureEuImaging"
* code
  * ^requirements = "Fullfiling Xt-EHR logical model EHDSImagingReport.header.eventType"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.header.eventType"

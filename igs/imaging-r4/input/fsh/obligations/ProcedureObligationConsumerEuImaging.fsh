


////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ProcedureObligationConsumerEuImaging
Parent: ProcedureEuImaging
Id: procedure-obligation-consumer-eu-imaging
Title: "ProcedureEuImaging: Obligations Consumer"
Description: "Consumer obligations for ProcedureEuImaging"
* code
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #MAY:handle
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.header.eventType"

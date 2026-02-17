
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ObservationFindingObligationConsumerEuImaging
Parent: ObservationFindingEuImaging
Id: observation-finding-obligation-consumer-eu-imaging
Title: "Observation: Imaging Finding: Obligations Consumer"
Description: "Consumer obligations for Observation: Imaging Finding"
* text
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.examinationReport.results[x]"

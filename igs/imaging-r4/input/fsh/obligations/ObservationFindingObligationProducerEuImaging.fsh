


////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ObservationFindingObligationProducerEuImaging
Parent: ObservationFindingEuImaging
Id: observation-finding-obligation-producer-eu-imaging
Title: "Observation: Imaging Finding: Obligations Producer"
Description: "Producer obligations for Observation: Imaging Finding"
* text
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(BundleReportEuImagingProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.examinationReport.results[x]"

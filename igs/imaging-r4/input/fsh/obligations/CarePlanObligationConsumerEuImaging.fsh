


////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: CarePlanObligationConsumerEuImaging
Parent: $EuCarePlan
Id: care-plan-obligation-consumer-eu-imaging
Title: "EuCarePlan: Obligations Consumer"
Description: "Consumer obligations for EuCarePlan"
* description
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:handle
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.recommendation.description"

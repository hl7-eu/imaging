
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: CarePlanObligationEuImaging
Parent: $EuCarePlan
Id: care-plan-obligation-eu-imaging
Title: "EuCarePlan: Obligations"
Description: "Obligations for EuCarePlan"
* description
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(BundleReportEuImagingProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSCarePlan.description, EHDSImagingReport.body.recommendation.description"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:handle
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSCarePlan.description, EHDSImagingReport.body.recommendation.description"

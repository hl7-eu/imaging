{% if isR5 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: CarePlanObligationProducerEuImaging
Parent: $EuCarePlan
Id: care-plan-obligation-producer-eu-imaging
Title: "EuCarePlan: Obligations Producer"
Description: "Producer obligations for EuCarePlan"
* description
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(BundleReportEuImagingProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSCarePlan.description, EHDSImagingReport.body.recommendation.description"
{% endif %}

{% if isR4 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: CarePlanObligationProducerEuImaging
Parent: $EuCarePlan
Id: care-plan-obligation-producer-eu-imaging
Title: "EuCarePlan: Obligations Producer"
Description: "Producer obligations for EuCarePlan"
* description
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(BundleReportEuImagingProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.recommendation.description"
{% endif %}


{% if isR5 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: CarePlanObligationEuImaging
Parent: $EuCarePlan
Id: care-plan-obligation-eu-imaging
Title: "EuCarePlan: Obligations"
Description: "Obligations for EuCarePlan"
* description
  * ^requirements = "Fullfiling Xt-EHR logical model EHDSCarePlan.description; Fullfiling Xt-EHR logical model EHDSImagingReport.body.recommendation.description"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSCarePlan.description, EHDSImagingReport.body.recommendation.description"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:handle
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSCarePlan.description, EHDSImagingReport.body.recommendation.description"
{% endif %}

{% if isR4 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: CarePlanObligationEuImaging
Parent: $EuCarePlan
Id: care-plan-obligation-eu-imaging
Title: "EuCarePlan: Obligations"
Description: "Obligations for EuCarePlan"
* description
  * ^requirements = "Fullfiling Xt-EHR logical model EHDSImagingReport.body.recommendation.description"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.recommendation.description"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:handle
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.recommendation.description"
{% endif %}


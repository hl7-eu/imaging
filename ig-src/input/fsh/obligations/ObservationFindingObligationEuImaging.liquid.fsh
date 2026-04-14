{% if isR5 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ObservationFindingObligationEuImaging
Parent: ObservationFindingEuImaging
Id: observation-finding-obligation-eu-imaging
Title: "Observation: Imaging Finding: Obligations"
Description: "Obligations for Observation: Imaging Finding"
* derivedFrom
  * ^requirements = "EHDSImagingReport.attachments"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.attachments"
{% endif %}

{% if isR4 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ObservationFindingObligationEuImaging
Parent: ObservationFindingEuImaging
Id: observation-finding-obligation-eu-imaging
Title: "Observation: Imaging Finding: Obligations"
Description: "Obligations for Observation: Imaging Finding"
* derivedFrom
  * ^requirements = "EHDSImagingReport.attachments"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.attachments"
{% endif %}


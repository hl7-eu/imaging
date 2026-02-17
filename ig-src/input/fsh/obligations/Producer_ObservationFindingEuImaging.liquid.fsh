{% if isR5 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Producer_ObservationFindingEuImaging
Parent: ObservationFindingEuImaging
Id: Producer-ObservationFindingEuImaging
Title: "ObservationFindingEuImaging: obligations"
Description: "Producer obligations for ObservationFindingEuImaging"
* text
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(BundleReportEuImagingProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.examinationReport.results[x]"
{% endif %}

{% if isR4 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Producer_ObservationFindingEuImaging
Parent: ObservationFindingEuImaging
Id: Producer-ObservationFindingEuImaging
Title: "ObservationFindingEuImaging: obligations"
Description: "Producer obligations for ObservationFindingEuImaging"
* text
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(BundleReportEuImagingProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.examinationReport.results[x]"
{% endif %}


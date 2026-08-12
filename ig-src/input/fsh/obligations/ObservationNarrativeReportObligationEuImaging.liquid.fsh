{% if isR5 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ObservationNarrativeReportObligationEuImaging
Parent: ObservationNarrativeReport
Id: observation-narrative-report-obligation-eu-imaging
Title: "ObservationNarrativeReport: Obligations"
Description: "Obligations for ObservationNarrativeReport"
* value[x]
  * ^requirements = "EHDSImagingReport.body.examinationReport.results[x]"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.examinationReport.results[x]"
{% endif %}

{% if isR4 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ObservationNarrativeReportObligationEuImaging
Parent: ObservationNarrativeReport
Id: observation-narrative-report-obligation-eu-imaging
Title: "ObservationNarrativeReport: Obligations"
Description: "Obligations for ObservationNarrativeReport"
* value[x]
  * ^requirements = "EHDSImagingReport.body.examinationReport.results[x]"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.examinationReport.results[x]"
{% endif %}


////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Report_ObservationRadiationDoseEuImaging
Parent: ObservationRadiationDoseEuImaging
Id: Report-ObservationRadiationDoseEuImaging
Title: "ObservationRadiationDoseEuImaging: obligations"
Description: "Report obligations for ObservationRadiationDoseEuImaging"
* component.value[x]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.exposureInformation.effectiveDose, EHDSImagingReport.body.exposureInformation.equivalentDoseInformation, EHDSImagingReport.body.exposureInformation.equivalentDoseInformation.equivalentDose"
* bodySite
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.exposureInformation.equivalentDoseInformation.tissueType"

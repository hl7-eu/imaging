////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Report_ImRadiationDoseObservation
Parent: ImRadiationDoseObservation
Id: Report-ImRadiationDoseObservation
Title: "ImRadiationDoseObservation: obligations"
Description: "Report obligations for ImRadiationDoseObservation"
* component.value[x]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.exposureInformation.effectiveDose, EHDSImagingReport.body.exposureInformation.equivalentDoseInformation, EHDSImagingReport.body.exposureInformation.equivalentDoseInformation.equivalentDose"
* bodySite
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.exposureInformation.equivalentDoseInformation.tissueType"

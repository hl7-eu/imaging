
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ObservationRadiationDoseObligationEuImaging
Parent: ObservationRadiationDoseEuImaging
Id: observation-radiation-dose-obligation-eu-imaging
Title: "ObservationRadiationDoseEuImaging: Obligations"
Description: "Obligations for ObservationRadiationDoseEuImaging"
* value[x]
  * ^requirements = "Fullfiling Xt-EHR logical model EHDSImagingReport.body.exposureInformation"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.exposureInformation"

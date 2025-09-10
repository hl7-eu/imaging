////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Report_ServiceRequestOrderEuImaging
Parent: ServiceRequestOrderEuImaging
Id: Report-ServiceRequestOrderEuImaging
Title: "ServiceRequestOrderEuImaging: obligations"
Description: "Report obligations for ServiceRequestOrderEuImaging"
* identifier[accessionNumber]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.header.accessionNumber"
* insurance
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.header.healthInsuranceAndPaymentInformation"
* authoredOn
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.orderInformation.orderDateAndTime"
* requester
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.orderInformation.orderPlacer"
* reason.concept.text
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.orderInformation.orderReasonText"
* reason.concept
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.orderInformation.orderReason, EHDSImagingReport.body.orderInformation.clinicalQuestion"
* supportingInfo
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.orderInformation.supportingInformation, EHDSImagingReport.body.orderInformation.supportingInformation.observation, EHDSImagingReport.body.orderInformation.supportingInformation.condition, EHDSImagingReport.body.orderInformation.supportingInformation.devices"
* reason
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.orderInformation.supportingInformation.medicationAdministration"
* supportingInfo[pregnancy]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.orderInformation.supportingInformation.pregnancyStatus"

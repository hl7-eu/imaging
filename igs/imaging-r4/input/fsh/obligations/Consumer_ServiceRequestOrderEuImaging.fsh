


////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Consumer_ServiceRequestOrderEuImaging
Parent: ServiceRequestOrderEuImaging
Id: Consumer-ServiceRequestOrderEuImaging
Title: "ServiceRequestOrderEuImaging: obligations"
Description: "Consumer obligations for ServiceRequestOrderEuImaging"
* extension[reason].extension[concept].valueCodeableConcept
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.orderInformation.orderReason[x], EHDSImagingReport.body.orderInformation.clinicalQuestion"

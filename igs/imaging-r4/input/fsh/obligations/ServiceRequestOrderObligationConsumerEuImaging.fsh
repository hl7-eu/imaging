


////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ServiceRequestOrderObligationConsumerEuImaging
Parent: ServiceRequestOrderEuImaging
Id: service-request-order-obligation-consumer-eu-imaging
Title: "ServiceRequest: Imaging Order: Obligations Consumer"
Description: "Consumer obligations for ServiceRequest: Imaging Order"
* extension[reason].extension[concept].valueCodeableConcept
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.orderInformation.orderReason[x], EHDSImagingReport.body.orderInformation.clinicalQuestion"

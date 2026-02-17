


////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ServiceRequestOrderObligationProducerEuImaging
Parent: ServiceRequestOrderEuImaging
Id: service-request-order-obligation-producer-eu-imaging
Title: "ServiceRequest: Imaging Order: Obligations Producer"
Description: "Producer obligations for ServiceRequest: Imaging Order"
* extension[reason].extension[concept].valueCodeableConcept
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(BundleReportEuImagingProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.orderInformation.orderReason[x], EHDSImagingReport.body.orderInformation.clinicalQuestion"

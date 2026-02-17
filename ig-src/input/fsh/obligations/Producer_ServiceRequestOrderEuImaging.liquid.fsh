{% if isR5 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Producer_ServiceRequestOrderEuImaging
Parent: ServiceRequestOrderEuImaging
Id: Producer-ServiceRequestOrderEuImaging
Title: "ServiceRequestOrderEuImaging: obligations"
Description: "Producer obligations for ServiceRequestOrderEuImaging"
* reason.concept
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(BundleReportEuImagingProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.orderInformation.orderReason[x], EHDSImagingReport.body.orderInformation.clinicalQuestion"
{% endif %}

{% if isR4 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Producer_ServiceRequestOrderEuImaging
Parent: ServiceRequestOrderEuImaging
Id: Producer-ServiceRequestOrderEuImaging
Title: "ServiceRequestOrderEuImaging: obligations"
Description: "Producer obligations for ServiceRequestOrderEuImaging"
* extension[reason].extension[concept].valueCodeableConcept
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(BundleReportEuImagingProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.orderInformation.orderReason[x], EHDSImagingReport.body.orderInformation.clinicalQuestion"
{% endif %}


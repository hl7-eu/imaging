{% if isR5 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: PatientObligationEuImaging
Parent: $EuPatient
Id: patient-obligation-eu-imaging
Title: "EuPatient: Obligations"
Description: "Obligations for EuPatient"
* extension[sex-for-clinical-use]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(BundleReportEuImagingProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.supportingInformation.sexForClinicalUse"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:handle
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.supportingInformation.sexForClinicalUse"
{% endif %}


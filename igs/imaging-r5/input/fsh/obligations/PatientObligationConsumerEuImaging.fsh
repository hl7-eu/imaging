
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: PatientObligationConsumerEuImaging
Parent: $EuPatient
Id: patient-obligation-consumer-eu-imaging
Title: "EuPatient: Obligations Consumer"
Description: "Consumer obligations for EuPatient"
* extension[sex-for-clinical-use]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:handle
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.supportingInformation.sexForClinicalUse"

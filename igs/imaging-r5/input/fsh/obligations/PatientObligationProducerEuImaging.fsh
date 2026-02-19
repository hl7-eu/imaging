
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: PatientObligationProducerEuImaging
Parent: $EuPatient
Id: patient-obligation-producer-eu-imaging
Title: "EuPatient: Obligations Producer"
Description: "Producer obligations for EuPatient"
* extension[sex-for-clinical-use]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(BundleReportEuImagingProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.supportingInformation.sexForClinicalUse"

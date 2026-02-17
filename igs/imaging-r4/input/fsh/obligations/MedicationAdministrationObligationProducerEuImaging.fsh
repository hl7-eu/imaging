
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: MedicationAdministrationObligationProducerEuImaging
Parent: $EuMedicationAdministration
Id: medication-administration-obligation-producer-eu-imaging
Title: "MedicationAdministration: Obligations Producer"
Description: "Producer obligations for MedicationAdministration"
* partOf
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(BundleReportEuImagingProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.examinationReport.medicationAdministration"

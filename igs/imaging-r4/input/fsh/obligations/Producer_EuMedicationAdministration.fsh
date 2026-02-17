
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Producer_EuMedicationAdministration
Parent: $EuMedicationAdministration
Id: Producer-EuMedicationAdministration
Title: "EuMedicationAdministration: obligations"
Description: "Producer obligations for EuMedicationAdministration"
* partOf
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(BundleReportEuImagingProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.examinationReport.medicationAdministration"

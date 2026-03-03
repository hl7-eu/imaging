{% if isR4 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: MedicationAdministrationObligationEuImaging
Parent: $EuMedicationAdministration
Id: medication-administration-obligation-eu-imaging
Title: "MedicationAdministration: Obligations"
Description: "Obligations for MedicationAdministration"
* partOf
  * ^requirements = "EHDSImagingReport.body.examinationReport.medicationAdministration"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.examinationReport.medicationAdministration"
{% endif %}


{% if isR4 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Consumer_EuMedicationAdministration
Parent: $EuMedicationAdministration
Id: Consumer-EuMedicationAdministration
Title: "EuMedicationAdministration: obligations"
Description: "Consumer obligations for EuMedicationAdministration"
* partOf
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.examinationReport.medicationAdministration"
{% endif %}


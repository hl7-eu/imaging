{% if isR4 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: MedicationAdministrationObligationConsumerEuImaging
Parent: $EuMedicationAdministration
Id: medication-administration-obligation-consumer-eu-imaging
Title: "MedicationAdministration: Obligations Consumer"
Description: "Consumer obligations for MedicationAdministration"
* partOf
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHOULD:handle
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImConsumer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.body.examinationReport.medicationAdministration"
{% endif %}


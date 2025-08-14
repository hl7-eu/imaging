{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSMedicationAdministration {
  <<XtEHR dataset>>
  header
  header.subject
  header.identifier
  header.authorship
  header.authorship.author[x]
  header.authorship.datetime
  header.lastUpdate
  header.status
  header.statusReason[x]
  header.language
  header.version
  presentedForm
  medication
  occurrence[x]
  reason[x]
  note
  dosage
}
link EHDSMedicationAdministration "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSMedicationAdministration.html"
class EuMedicationAdministration{
  <<FHIR>>
  subject
  identifier
  performer
  performer.actor
  occurenceDateTime
  occurencePeriod
  meta.lastUpdated
  status
  statusReason
  language
  text
  medication
  reason
  note
  dosage
}

class EuPatient {
  <<FHIR>>
}
class EuMedication {
  <<FHIR>>
}
EHDSMedicationAdministration --> EuMedicationAdministration
EuMedicationAdministration --> EuPatient : subject
EuMedicationAdministration --> EuMedication : medication
```


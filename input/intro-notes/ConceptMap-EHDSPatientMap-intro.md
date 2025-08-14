{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSPatient {
  <<XtEHR dataset>>
  personalIdentifier
  name
  dateOfBirth
  administrativeGender
  address
  telecom
  maritalStatus
  communicationLanguage
}
link EHDSPatient "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSPatient.html"
class EuPatient{
  <<FHIR>>
  identifier
  name
  birthDate
  gender
  address
  telecom
  maritalStatus
  communication.language
}

EHDSPatient --> EuPatient
```


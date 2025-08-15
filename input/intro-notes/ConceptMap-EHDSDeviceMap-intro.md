{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSDevice {
  <<XtEHR dataset>>
  identifier
  manufacturer
  manufactureDate
  expiryDate
  lotNumber
  serialNumber
  name
  modelNumber
  version
  type
  note
}
link EHDSDevice "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSDevice.html"
class EuDevice{
  <<FHIR>>
  identifier
  manufacturer
  manufactureDate
  expirationDate
  lotNumber
  serialNumber
  name
  modelNumber
  version
  type
  note
}

EHDSDevice --> EuDevice
```


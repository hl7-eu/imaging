{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSOrganisation {
  <<XtEHR dataset>>
  identifier
  type
  name
  address
  telecom
  partOf
}
link EHDSOrganisation "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSOrganisation.html"
class EuOrganization{
  <<FHIR>>
  identifier
  type
  name
  contact.address
  contact.telecom
  partOf
}

class EuOrganization {
  <<FHIR>>
}
EHDSOrganisation --> EuOrganization
EuOrganization --> EuOrganization : partOf
```


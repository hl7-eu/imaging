{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSEndpoint {
  <<XtEHR dataset>>
  identifier
  status
  connectionType
  name
  managingOrganisation
  payload
  payload.type
  payload.mimeType
  payload.profileCanonical
  payload.profileUri
  address
  header
}
link EHDSEndpoint "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSEndpoint.html"
class EuEndpoint{
  <<FHIR>>
  identifier
  status
  connectionType
  name
  managingOrganization
  payload
  payload.type
  payload.mimeType
  address
  header
}

class EuOrganization {
  <<FHIR>>
}
EHDSEndpoint --> EuEndpoint
EuEndpoint --> EuOrganization : managingOrganization
```


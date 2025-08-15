{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSMedia {
  <<XtEHR dataset>>
  identifier
  type
  modality
  view
  subject[x]
  created[x]
  reason
  bodysite
  deviceName
  device
  content
  note
  performer
}
link EHDSMedia "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSMedia.html"
class EuDocumentReference{
  <<FHIR>>
  identifier
  type
  modality
  extension[view]
  subject
  period
  event
  bodySite.concept
  author
  content.attachment
  extension[note]
}

class EuDevice{
  <<FHIR>>
  name
}

class EuDevice {
  <<FHIR>>
}
class EuPractitionerRole {
  <<FHIR>>
}
class  EuPractitioner {
  <<FHIR>>
}
EHDSMedia --> EuDocumentReference
EuDocumentReference --> EuDevice : author
EuDocumentReference --> EuPractitionerRole : author
EuDocumentReference -->  EuPractitioner : author
EHDSMedia --> EuDevice
```


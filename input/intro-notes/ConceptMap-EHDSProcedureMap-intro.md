{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSProcedure {
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
  code
  date[x]
  performer
  bodySite
  reason[x]
  outcome
  complication
  deviceUsed
  focalDevice
  note
}
link EHDSProcedure "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSProcedure.html"
class EuProcedure{
  <<FHIR>>
  subject
  identifier
  performer
  performer.actor
  occurrenceDateTime
  meta.lastUpdated
  status
  statusReason.coding
  statusReason.text
  language
  meta.versionId
  text
  code
  occurrencePeriod
  bodySite
  reason
  outcome
  complication.concept
  used[device]
  focalDevice.manipulated
  note
}

class EuPatient {
  <<FHIR>>
}
class EuPractitionerRole {
  <<FHIR>>
}
class EuDevice {
  <<FHIR>>
}
EHDSProcedure --> EuProcedure
EuProcedure --> EuPatient : subject
EuProcedure --> EuPractitionerRole : performer.actor
EuProcedure --> EuDevice : used[device]
```


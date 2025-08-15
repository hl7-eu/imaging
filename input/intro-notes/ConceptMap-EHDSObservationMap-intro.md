{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSObservation {
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
  header.directSubject[x]
  observationDate[x]
  code
  originalName
  method
  order
  performer
  anatomicLocation
  result
  result.value[x]
  result.uncertainty
  dataAbsentReason
  referenceRange
  interpretation
  resultDescription
  component
  component.code
  component.result
  component.result.value[x]
  component.result.uncertainty
  component.dataAbsentReason
  component.referenceRange
  component.interpretation
  derivedFrom[x]
  triggeredBy[x]
  hasMember[x]
}
link EHDSObservation "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSObservation.html"
class EuObservation{
  <<FHIR>>
  subject
  identifier
  performer
  issued
  meta.lastUpdated
  status
  extension[status-reason]
  extension[status-reason].valueCodeableConcept.text
  language
  meta.versionId
  text
  focus
  effectiveDateTime
  effectivePeriod
  code
  method
  basedOn
  performer.extension[performerFunction]
  bodySite
  valueString
  valueQuantity
  valueRange
  valueCodeableConcept
  value[x].extension[dataAbsentReason]
  referenceRange
  interpretation
  note
  component
  component.referenceRange
  component.interpretation
  derivedFrom
  triggeredBy.observation
  triggeredBy.type
  hasMember
}

class EuQuantity{
  <<FHIR>>
  extension[uncertainty]
  extension[uncertaintyType]
}

class EuSimpleQuantity{
  <<FHIR>>
  extension[uncertainty]
  extension[uncertaintyType]
}

class Resource {
  <<FHIR>>
}
class EuPractitionerRole {
  <<FHIR>>
}
class EuObervation {
  <<FHIR>>
}
EHDSObservation --> EuObservation
EuObservation --> Resource : subject
EuObservation --> EuPractitionerRole : performer
EuObservation --> EuObervation : triggeredBy.observation
EuObservation --> EuObervation : hasMember
EHDSObservation --> EuQuantity
EHDSObservation --> EuSimpleQuantity
```


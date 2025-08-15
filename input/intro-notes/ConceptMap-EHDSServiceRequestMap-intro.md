{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSServiceRequest {
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
  serviceText
  serviceCode
  reasonCode
  quantity
  anatomicLocation
  reasonReference[x]
  priority
  supportingInformation[x]
  specimen
  encounter
  occurrence[x]
  patientInstructions
  coverage
}
link EHDSServiceRequest "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSServiceRequest.html"
class EuServiceRequest{
  <<FHIR>>
  subject
  identifier
  requester
  performer
  occurrenceDateTime
  meta.lastUpdated
  status
  extension[status-reason]
  extension[status-reason].valueCodeableConcept.text
  language
  meta.versionId
  text
  code.concept
  reason.concept
  quantityQuantity
  bodySite
  reason.reference
  priority
  supportingInfo
  specimen
  encounter
  occurrencePeriod
  patientInstruction.instructionMarkdown
  insurance
}

class EuCondition {
  <<FHIR>>
}
class  EuObservation {
  <<FHIR>>
}
class EuSpecimen {
  <<FHIR>>
}
class EuEncounter {
  <<FHIR>>
}
class EuCoverage {
  <<FHIR>>
}
EHDSServiceRequest --> EuServiceRequest
EuServiceRequest --> EuCondition : supportingInfo
EuServiceRequest -->  EuObservation : supportingInfo
EuServiceRequest --> EuSpecimen : specimen
EuServiceRequest --> EuEncounter : encounter
EuServiceRequest --> EuCoverage : insurance
```


{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSCondition {
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
  problem
  onsetDate
  endDate
  category
  problemStatus
  resolutionCircumstances
  severity
  anatomicLocation
  stage
  diagnosisAssertionStatus
  asserter
  assertedDate
  specialistContact
  externalResource
}
link EHDSCondition "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSCondition.html"
class EuCondition{
  <<FHIR>>
  subject
  identifier
  participant
  recordedDate
  meta.lastUpdated
  extension[status-reason]
  extension[status-reason].valueCodeableConcept.text
  language
  meta.versionId
  text
  code
  onset[x]
  abatement[x]
  category
  clinicalStatus
  evidence.concept
  severity
  bodySite
  stage
  verificationStatus
  participant.extension[specialist-contact]
  evidence
}

EHDSCondition --> EuCondition
```


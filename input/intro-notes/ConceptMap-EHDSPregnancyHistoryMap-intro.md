{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSPregnancyHistory {
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
  narrative
  outcomeDate
  outcome
  numberOfChildren
}
link EHDSPregnancyHistory "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSPregnancyHistory.html"
class ICD-11{
  <<FHIR>>
  SNOMED CT (preferred)
}

EHDSPregnancyHistory --> ICD-11
```


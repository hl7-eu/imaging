{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSCarePlan {
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
  title
  description
  period
  addresses
  activity[x]
}
link EHDSCarePlan "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSCarePlan.html"
class EuCarePlan{
  <<FHIR>>
  subject
  identifier
  contributor
  created
  meta.lastUpdated
  status
  language
  meta.versionId
  text
  title
  title.extension[http\://hl7.org/fhir/StructureDefinition/rendering-xhtml]
  description
  description.extension[http\://hl7.org/fhir/StructureDefinition/rendering-xhtml]
  activity
}

class EuPatient {
  <<FHIR>>
}
class EuPractitionerRole {
  <<FHIR>>
}
EHDSCarePlan --> EuCarePlan
EuCarePlan --> EuPatient : subject
EuCarePlan --> EuPractitionerRole : contributor
EuCarePlan --> EuPractitionerRole : meta.lastUpdated
```


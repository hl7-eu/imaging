{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSAllergyIntolerance {
  <<XtEHR dataset>>
  header
  header.subject
  header.identifier
  header.authorship
  authorEHDSHealthProfessional
  authorEHDSOrganisation
  authorEHDSDevice
  header.authorship.datetime
  header.lastUpdate
  header.status
  header.statusReasonCodeableConcept
  header.statusReasonString
  header.language
  header.version
  presentedForm
  agentOrAllergen
  typeOfPropensity
  description
  criticality
  certainty
  status
  onsetDate
  endDate
  reaction
  reaction.manifestation
  reaction.date
  reaction.severity
  reaction.onsetDate
}
link EHDSAllergyIntolerance "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSAllergyIntolerance.html"
class EuAllergyIntolerance{
  <<FHIR>>
  patient
  identifier
  recordedDate
  meta.lastUpdated
  verificationStatus
  verificationStatus.coding
  language
  meta.versionId
  text
  code
  reaction.substance
  type
  criticality
  clinicalStatus
  onsetPeriod
  onsetDateTime
  extension[abatement].valueDateTime
  reaction
  reaction.manifestation
  reaction.onset
  reaction.severity
}

class EuPractitioner
class EuOrganization
class EuDevice
class EuPatient {
  <<FHIR>>
}
EHDSAllergyIntolerance --> EuAllergyIntolerance
EuAllergyIntolerance --> EuPatient : patient
EHDSAllergyIntolerance --> EuPractitioner
EHDSAllergyIntolerance --> EuOrganization
EHDSAllergyIntolerance --> EuDevice
```


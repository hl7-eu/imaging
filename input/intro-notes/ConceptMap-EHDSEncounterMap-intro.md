{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSEncounter {
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
  priority
  type
  note
  episodeOfCare
  basedOn[x]
  partOf
  serviceProvider
  actualPeriod
  plannedStartDate
  plannedEndDate
  admission
  admission.admitter
  admission.admitSource
  admission.referringProfessional
  admission.reason[x]
  admission.reasonComment
  admission.legalStatus
  discharge
  discharge.destinationType
  discharge.destinationLocation[x]
  location
  location.period
  location.organisationPart[x]
}
link EHDSEncounter "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSEncounter.html"
class EuEncounter{
  <<FHIR>>
  subject
  identifier
  meta.lastUpdated
  status
  extension[status-reason]
  extension[status-reason].valueCodeableConcept.text
  language
  meta.versionId
  text
  priority
  type
  extension[note]
  episodeOfCare
  basedOn
  partOf
  serviceProvider
  actualPeriod
  plannedStartDate
  plannedEndDate
  admission
  participant[admitter].actor
  admission.admitSource
  participant[referrer].actor
  reason.value.reference
  admission.dischargeDisposition
  admission.destination
  location
  location.period
  location.location
}

class FLAG: CHANGED FROM admission.admissionReasonComment - REVIEW MAPPING
class FLAG: CHANGED FROM admission.admissionLegalStatus - REVIEW MAPPING
class FLAG: MULTIPLE discharge.destinationLocation[x] - REVIEW MAPPING
class FLAG: MULTIPLE location.organisationPart[x] - REVIEW MAPPING
class EuEpisodeOfCare {
  <<FHIR>>
}
class EuServiceRequest {
  <<FHIR>>
}
class EuEncounter {
  <<FHIR>>
}
class EuOrganization {
  <<FHIR>>
}
class EuLocation {
  <<FHIR>>
}
EHDSEncounter --> EuEncounter
EuEncounter --> EuEpisodeOfCare : episodeOfCare
EuEncounter --> EuServiceRequest : basedOn
EuEncounter --> EuEncounter : partOf
EuEncounter --> EuOrganization : serviceProvider
EuEncounter --> EuLocation : location.location
EHDSEncounter --> FLAG: CHANGED FROM admission.admissionReasonComment - REVIEW MAPPING
EHDSEncounter --> FLAG: CHANGED FROM admission.admissionLegalStatus - REVIEW MAPPING
EHDSEncounter --> FLAG: MULTIPLE discharge.destinationLocation[x] - REVIEW MAPPING
EHDSEncounter --> FLAG: MULTIPLE location.organisationPart[x] - REVIEW MAPPING
```


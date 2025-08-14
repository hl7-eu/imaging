{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSPatientSummary {
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
  header.documentType
  header.documentTitle
  header.documentStatus
  header.period
  header.attestation
  header.attestation.attester
  header.attestation.datetime
  header.legalAuthentication
  header.legalAuthentication.legalAuthenticator
  header.legalAuthentication.datetime
  header.eventType
  header.authorSpecialty
  header.custodian
  header.documentFormat
  header.confidentiality
  knowledgeResources
  knowledgeResources.externalReference
  knowledgeResources.relatedTo
  alerts
  alerts.narrative
  alerts.emptyReason
  alerts.medicalAlert
  allergiesAndIntolerances
  allergiesAndIntolerances.narrative
  allergiesAndIntolerances.allergyIntolerance
  allergiesAndIntolerances.emptyReason
  problems
  problems.narrative
  problems.emptyReason
  problems.problems
  medicationSummary
  medicationSummary.narrative
  medicationSummary.emptyReason
  medicationSummary.medicationTreatment
  medicalDevicesAndImplants
  medicalDevicesAndImplants.narrative
  medicalDevicesAndImplants.emptyReason
  medicalDevicesAndImplants.medicalDevice
  procedures
  procedures.narrative
  procedures.emptyReason
  procedures.procedure
  vaccination
  vaccination.narrative
  vaccination.vaccination
  functionalStatus
  functionalStatus.narrative
  functionalStatus.functionalStatusAssessment
  socialHistory
  socialHistory.narrative
  socialHistory.socialHistoryObservation
  pregnancyHistory
  pregnancyHistory.generatedNarrative
  pregnancyHistory.currentPregnancyStatus
  pregnancyHistory.previousPregnanciesStatus
  pregnancyHistory.previousPregnancies
  travelHistory
  travelHistory.narrative
  travelHistory.travelHistory
  patientStory
  patientStory.narrative
  advanceDirectives
  advanceDirectives.narrative
  advanceDirectives.advanceDirective
  results
  results.narrative
  results.resultObservation[x]
  carePlan
  carePlan.narrative
  carePlan.carePlanEntry
}
link EHDSPatientSummary "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSPatientSummary.html"
class Use if no Allergies are listed
EHDSPatientSummary --> Use if no Allergies are listed
```


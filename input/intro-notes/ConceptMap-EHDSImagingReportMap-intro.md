{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSImagingReport {
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
  header.accessionNumber
  header.healthInsuranceAndPaymentInformation
  header.intendedRecipient[x]
  body
  body.orderInformation
  body.orderInformation.orderId
  body.orderInformation.orderDateAndTime
  body.orderInformation.orderPlacer
  body.orderInformation.orderReasonText
  body.orderInformation.orderReason
  body.orderInformation.clinicalQuestion
  body.orderInformation.supportingInformation
  body.orderInformation.supportingInformation.observation
  body.orderInformation.supportingInformation.condition
  body.orderInformation.supportingInformation.medicationAdministration
  body.orderInformation.supportingInformation.devices
  body.orderInformation.supportingInformation.pregnancyStatus
  body.orderInformation.supportingInformation.sexForClinicalUse
  body.orderInformation.supportingInformation.otherSupportingInformation
  body.specimen
  body.serviceRequest
  body.exposureInformation
  body.exposureInformation.effectiveDose
  body.exposureInformation.equivalentDoseInformation
  body.exposureInformation.equivalentDoseInformation.equivalentDose
  body.exposureInformation.equivalentDoseInformation.tissueType
  body.examinationReport
  body.examinationReport.modality
  body.examinationReport.bodyPart
  examinationReport.bodyPart.bodyLocation
  examinationReport.bodyPart.laterality
  body.examinationReport.imagingProcedures
  body.examinationReport.medication
  body.examinationReport.adverseReaction
  body.examinationReport.resultData
  body.examinationReport.resultData.resultText
  body.examinationReport.resultData.observationResults
  body.examinationReport.conclusion
  body.examinationReport.conclusion.impression
  body.examinationReport.conclusion.conditionOrFinding[x]
  body.recommendation
  body.recommendation.description
  body.recommendation.carePlan
  body.comparisonStudy
  dicomStudyMetadata
  attachments[x]
}
link EHDSImagingReport "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSImagingReport.html"
class ImComposition{
  <<FHIR>>
  extension[diagnosticreport-reference]
  subject
  identifier
  author
  author[author]
  author[authoringDevice]
  date
  status
  language
  version
  category[imaging]
  title
  event.period
  attester[resultValidator]
  attester[resultValidator].party
  attester[resultValidator].time
  attester[legalAuthenticator]
  attester[legalAuthenticator].party
  attester[legalAuthenticator].time
  event[imagingstudy]
  event[procedure]
  custodian
  type
  meta.security
  extension[basedOn]
  extension[informationRecipient]
  section[order]
  section[order].entry[order]
  section[order].extension[note]
  section[history].entry
  section[procedure].entry[procedure]
  section[findings]
  section[findings].extension[note]
  section[findings].entry[ImFinding]
  section[impression]
  section[impression].entry[ImFinding]
  section[impression].entry[impression]
  section[recommendation]
  section[recommendation].entry[careplan]
  section[comparison].entry[comparedstudy]
}

class ImDiagnosticReport{
  <<FHIR>>
  composition
  subject
  identifier
  resultsInterpreter[author]
  issued
  status
  language
  presentedForm
  category[imaging]
  effectivePeriod
  meta.security
  basedOn
  result
  conclusion
  media
}

class ImProcedure{
  <<FHIR>>
  location
}

class ImImagingStudy{
  <<FHIR>>
  series.modality
  modality
  location
  series.specimen
  series.bodySite
}

class ImOrder{
  <<FHIR>>
  identifier[accessionNumber]
  insurance
  authoredOn
  requester
  reason.concept.text
  reason.concept
  supportingInfo
  reason
  supportingInfo[pregnancy]
}

class ImPatient{
  <<FHIR>>
  extension[sex-for-clinical-use]
  extension[sex-for-clinical-use].extension[value].valueCodeableConcept
  extension[sex-for-clinical-use].extension[period].valuePeriod
}

class ImRadiationDoseObservation{
  <<FHIR>>
  component.value[x]
  bodySite
}

class EuBodyStructure{
  <<FHIR>>
  morphology
  includedStructure.structure
  includedStructure.laterality
}

class EuMedicationAdministration{
  <<FHIR>>
  partOf
}

class ImAdverseEvent{
  <<FHIR>>
  suspectEntity[procedure]
  contributingFactor[allergy]
  status
  code
  subject
}

class EuAllergyIntolerance
class EuCarePlan{
  <<FHIR>>
  description
}

class ImImagingStudyManifest{
  <<FHIR>>
  entry[imagingstudy]
}

class ImFinding{
  <<FHIR>>
  derivedFrom
}

class ImDiagnosticReport {
  <<FHIR>>
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
class ImImagingStudy {
  <<FHIR>>
}
class ImProcedure {
  <<FHIR>>
}
class EuOrganization {
  <<FHIR>>
}
class ImOrder {
  <<FHIR>>
}
class EuObservation {
  <<FHIR>>
}
class EuCondition {
  <<FHIR>>
}
class EuMedicationAdministration {
  <<FHIR>>
}
class Observation-pregnancy-status-uv-ips {
  <<FHIR>>
}
class ImPatient {
  <<FHIR>>
}
class EuProcedure {
  <<FHIR>>
}
class ImFinding {
  <<FHIR>>
}
class ImImpression {
  <<FHIR>>
}
class EuCarePlan {
  <<FHIR>>
}
class ImImagingSelection {
  <<FHIR>>
}
class EuDocumentReference {
  <<FHIR>>
}
class ImComposition {
  <<FHIR>>
}
class  ImRadiationDoseObservation {
  <<FHIR>>
}
class EuLocation {
  <<FHIR>>
}
class EuSpecimen {
  <<FHIR>>
}
class EuBodyStructure {
  <<FHIR>>
}
class EuCoverage {
  <<FHIR>>
}
class  EuObservation {
  <<FHIR>>
}
class EuAllergyIntolerance {
  <<FHIR>>
}
EHDSImagingReport --> ImComposition
ImComposition --> ImDiagnosticReport : extension[diagnosticreport-reference]
ImComposition --> EuPatient : subject
ImComposition --> EuPractitionerRole : author
ImComposition --> EuDevice : author[author]
ImComposition --> EuPractitionerRole : author[authoringDevice]
ImComposition --> EuPractitionerRole : attester[resultValidator].party
ImComposition --> EuPractitionerRole : attester[legalAuthenticator].party
ImComposition --> ImImagingStudy : event[imagingstudy]
ImComposition --> ImProcedure : event[procedure]
ImComposition --> EuOrganization : custodian
ImComposition --> ImOrder : extension[basedOn]
ImComposition --> ImOrder : section[order].entry[order]
ImComposition --> EuObservation : section[history].entry
ImComposition --> EuCondition : section[history].entry
ImComposition --> EuMedicationAdministration : section[history].entry
ImComposition --> EuDevice : section[history].entry
ImComposition --> Observation-pregnancy-status-uv-ips : section[history].entry
ImComposition --> ImPatient : subject
ImComposition --> EuProcedure : section[procedure].entry[procedure]
ImComposition --> ImFinding : section[findings].entry[ImFinding]
ImComposition --> ImFinding : section[impression].entry[ImFinding]
ImComposition --> ImImpression : section[impression].entry[impression]
ImComposition --> EuCarePlan : section[recommendation].entry[careplan]
ImComposition --> ImImagingStudy : section[comparison].entry[comparedstudy]
ImComposition --> ImImagingSelection : section[comparison].entry[comparedstudy]
ImComposition --> EuDocumentReference : section[comparison].entry[comparedstudy]
EHDSImagingReport --> ImDiagnosticReport
ImDiagnosticReport --> ImComposition : composition
ImDiagnosticReport --> EuPatient : subject
ImDiagnosticReport --> EuPractitionerRole : resultsInterpreter[author]
ImDiagnosticReport --> ImOrder : basedOn
ImDiagnosticReport --> ImFinding : result
ImDiagnosticReport -->  ImRadiationDoseObservation : result
ImDiagnosticReport --> EuDocumentReference : media
EHDSImagingReport --> ImProcedure
ImProcedure --> EuLocation : location
EHDSImagingReport --> ImImagingStudy
ImImagingStudy --> EuSpecimen : series.specimen
ImImagingStudy --> EuBodyStructure : series.bodySite
EHDSImagingReport --> ImOrder
ImOrder --> EuCoverage : insurance
ImOrder --> EuPractitionerRole : requester
ImOrder --> EuCondition : supportingInfo
ImOrder -->  EuObservation : supportingInfo
ImOrder --> EuObservation : supportingInfo
ImOrder --> EuMedicationAdministration : reason
ImOrder --> EuDevice : supportingInfo
EHDSImagingReport --> ImPatient
EHDSImagingReport --> ImRadiationDoseObservation
EHDSImagingReport --> EuBodyStructure
EHDSImagingReport --> EuMedicationAdministration
EuMedicationAdministration --> ImProcedure : partOf
EHDSImagingReport --> ImAdverseEvent
ImAdverseEvent --> ImProcedure : suspectEntity[procedure]
ImAdverseEvent --> EuAllergyIntolerance : contributingFactor[allergy]
ImAdverseEvent --> ImPatient : subject
EHDSImagingReport --> EuAllergyIntolerance
EHDSImagingReport --> EuCarePlan
EHDSImagingReport --> ImImagingStudyManifest
EHDSImagingReport --> ImFinding
ImFinding --> ImImagingStudy : derivedFrom
ImFinding --> ImImagingSelection : derivedFrom
ImFinding --> EuDocumentReference : derivedFrom
```


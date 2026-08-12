Profile: ConditionEuCore
Parent: Condition
Id: condition-eu-core
Title: "Condition (EU core)"
Description: """This profile introduces essential constraints and extensions for the Condition resource that apply across multiple use cases."""
// * insert ImposeProfile ( $Condition-uv-ips, 0 )  // Check if this is appropriate (see MS support)
// follow the same approach of lab for collection or add laterality to the bodySite ?
* insert SetFmmandStatusRule (2, trial-use)
* extension contains $condition-assertedDate named assertedDate 0..1
* extension[assertedDate].valueDateTime ^short = "Date and time of the diagnosis assertion"
* extension contains $artifact-relatedArtifact named relatedArtifact 0..*
* extension[relatedArtifact] // reference to an external document (e.g. a guideline for this condition)
* category ^short = "Category" // to be updated
* severity from $condition-severity (preferred)
* participant.actor ^short = "Who or what participated in the activities related to the allergy (e.g. asserter, reporter)"
* language ^short = "Language of the condition content"
* code 1..1 
* code from $problems-uv-ips (preferred) 
  * ^binding.additional.purpose = #preferred
  * ^binding.additional.valueSet = "http://terminology.ehdsi.eu/ValueSet/eHDSIIllnessandDisorder"
  * ^binding.additional.documentation = "Additional conformance binding to a problem code when ICD-10 or Orphanet codes are used."
* bodySite from SNOMEDCTBodyStructures (preferred)
  * extension contains $bodySite-reference named bodySite 0..1
  * extension[bodySite].valueReference only Reference(BodyStructureEuCore)  
* bodySite obeys eu-bodysite-1
* identifier ^definition = "Globally unique identifier of this problem which remain constant as the resource is updated and propagates from server to server."
* text ^definition = "Human readable specification of the problem. This is a general notes/comments entry for description of the problem, its diagnosis and prognosis."
* clinicalStatus from ConditionClinicalStatusCodes (required)
  * ^definition = "The problem status describes the condition of the problem:\n\r
1.	Active problems are problems of which the patient experiences symptoms or for which evidence exists.\n\r
2.	If condition is abated, then clinicalStatus must be either inactive, resolved, or remission. \n\r
3.	Problems with the status 'Inactive' refer to problems that don't affect the patient anymore or that of which there is no evidence of existence anymore."
* verificationStatus from ConditionVerificationStatus (required)
  * ^definition = "The verification status to support the clinical status of the condition."
* subject only Reference(PatientEuCore)
* onset[x] only dateTime or Age or Period or Range or string
* onsetDateTime ^definition = "Onset of the symptom, complaint, functional limitation, complication or date of diagnosis. A ‘vague’ date, such as only the year or the month and the year, is permitted."
* abatement[x] only dateTime or Age or Period or Range or string
* abatementDateTime ^definition = "The date or estimated date that the condition resolved or went into remission. A ‘vague’ date, such as only the year or the month and the year, is permitted"
* participant.actor only Reference (PractitionerRoleEu or PractitionerEu or PatientEuCore or RelatedPerson or Device or OrganizationEuCore or CareTeam)
* recordedDate ^short = "Date when the condition record was created"
* stage ^short = "Stage/grade"
* stage.summary  ^short = "Most recent Stage Group"
* stage.assessment ^definition = "Reference to the evidence on which the staging assessment is based."
* stage.type ^short = "Staging system used."
* note ^definition = "Comment by the one who determined or updated the Problem."

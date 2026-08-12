Profile: AllergyIntoleranceEuCore
Parent: AllergyIntolerance
Id: allergyIntolerance-eu-core
Title:    "AllergyIntolerance (EU core)"
Description: """This profile introduces essential constraints and extensions for the AllergyIntolerance resource that apply across multiple use cases."""
* insert SetFmmandStatusRule (2, trial-use)
// * insert ImposeProfile($AllergyIntolerance-uv-ips, 0)
* extension contains $allergyintolerance-abatement named abatement 0..1
* extension[abatement].valueDateTime ^short = "End date"
* identifier ^short = "Business identifier for the allergy or intolerance"
* language ^short = "Language of the allergy or intolerance content"
* note.text ^short = "Additional information about the allergy or intolerance"
* onset[x] ^short = "Date of onset of the allergy or intolerance"
/* * onsetDateTime
  * extension contains PeriodsOfLife named periodOfLife 0..1
  * extension[periodOfLife].valueCodeableConcept from PeriodsOfLifeEuVs (preferred) */
* recordedDate ^short = "Date when the allergy or intolerance was recorded"
* patient ^short = "Who the allergy or intolerance concerns"
* participant.actor ^short = "Who or what participated in the activities related to the allergy (e.g. asserter, reporter)"
* verificationStatus ^short = "Certainty"
* clinicalStatus ^short = "Current allergy or Intolerance status"
* type ^short = "Type of propensity"
* code 1..1
* code from $allergy-intolerance-uv-ips (preferred)
  * ^binding.additional.purpose = #preferred
  * ^binding.additional.valueSet = $eHDSIAllergenNoDrug
  * ^binding.additional.documentation = "Type of the substance/product for MyHealth@EU"

  * ^binding.additional.purpose = #preferred
  * ^binding.additional.valueSet = "http://hl7.org/fhir/uv/ips/ValueSet/whoatc-uv-ips"
  * ^binding.additional.documentation = "Type of the substance/product, allergy or intolerance condition."
* criticality ^short = "Criticality"
* patient only Reference(PatientEuCore)
* onsetDateTime ^short = "Onset date"
* reaction.substance from $eHDSIAllergenNoDrug (example)
* reaction.manifestation from $allergy-reaction-uv-ips (preferred)
  * ^binding.additional.purpose = #preferred
  * ^binding.additional.valueSet = $eHDSIReactionAllergy
  * ^binding.additional.documentation = "Type of reaction (MyHealth@EU)"
* reaction.severity ^short = "Reaction severity"
* reaction.onset ^short = "Reaction onset"
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  ImmunizationEuCore
Parent:   Immunization
Id:       immunization-eu-core
Title:    "Immunization (EU core)"
Description: """This profile introduces essential constraints and extensions for the Immunization resource that apply across multiple use cases."""
//-------------------------------------------------------------------------------------------
* ^experimental = false
* ^purpose = "This profile constrains the Immunization resource for the purpose of this guide."
* insert SetFmmandStatusRule (2, trial-use)
* status ^short = "Immunization status."
* statusReason ^short = "Reason for not performing."
* identifier ^short = "Identifier of the immunization"
* language ^short = "Language of the immunization content"
* note.text ^short = "Additional notes about the immunization"
* administeredProduct ^short = "The product that was administered or was to be administered."
* reason.concept ^short = "Reasons for the administration."
* informationSource only CodeableReference ( PatientEuCore or PractitionerEuCore or PractitionerRoleEuCore or RelatedPerson or OrganizationEuCore )
* vaccineCode from $vaccines-uv-ips (preferred)
  * ^binding.additional.purpose = #preferred
  * ^binding.additional.valueSet = "http://hl7.org/fhir/uv/ips/ValueSet/vaccines-whoatc-uv-ips"
  * ^binding.additional.documentation = "Additional conformance binding to a vaccines value set from the WHO ATC code system for use in specific jurisdictional or other contexts where use of the ATC terminology is preferred."

  * ^binding.additional.purpose = #preferred
  * ^binding.additional.valueSet = "http://terminology.ehdsi.eu/ValueSet/eHDSIVaccine"
  * ^binding.additional.documentation = "Additional conformance binding to the cross-border vaccines value set."
* patient only Reference(PatientEuCore)
* occurrence[x] ^short = "Date of vaccination"
* occurrenceDateTime
  * extension contains PeriodsOfLife named periodOfLife 0..1
  * extension[periodOfLife].valueCodeableConcept from PeriodsOfLifeEuVs (preferred)
* location only Reference(LocationEuCore)
* manufacturer ^short = "Vaccine manufacturer/MAH"
* lotNumber ^short = "Batch/lot number"
* performer 
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "$this.function"
  * ^slicing.ordered = false
  * ^slicing.rules = #open
* performer contains administeringCentreOrHp 0..*
* performer[administeringCentreOrHp] ^short = "Administering centre"
* performer[administeringCentreOrHp].function = $v2-0443#AP	// "Administering Provider" code to be checked
* performer[administeringCentreOrHp].actor only Reference( OrganizationEuCore or PractitionerRoleEuCore or PractitionerEuCore )
* protocolApplied.targetDisease from $target-diseases-uv-ips (preferred) // Check Value Set
* protocolApplied.targetDisease
  * ^binding.additional.purpose = #preferred
  * ^binding.additional.valueSet = "http://terminology.ehdsi.eu/ValueSet/eHDSIIllnessandDisorder"
  * ^binding.additional.documentation = "Additional conformance binding to a diseases value set for use in specific jurisdictional or for cross-border settings."
* protocolApplied.doseNumber ^short = "Dose Number"
* protocolApplied.seriesDoses ^short = "Number of doses"

/* 
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  ImmunizationRecommendationEuCore
Parent:   ImmunizationRecommendation
Id:       immunizationRecommendation-eu-core
Title:    "ImmunizationRecommendation (EU core)"
Description: """This profile defines how to represent Immunization Recommendations for the purpose of this guide."""
//-------------------------------------------------------------------------------------------
* date ^short = "When recommendation was created"
* patient only Reference (PatientEuCore)
* recommendation
  * vaccineCode from http://hl7.org/fhir/uv/ips/ValueSet/vaccines-uv-ips (preferred)
  * vaccineCode ^binding.extension[+].extension[0].url = "purpose"
  * vaccineCode ^binding.extension[=].extension[=].valueCode = #preferred
  * vaccineCode ^binding.extension[=].extension[+].url = "valueSet"
  * vaccineCode ^binding.extension[=].extension[=].valueCanonical = "http://hl7.org/fhir/uv/ips/ValueSet/vaccines-whoatc-uv-ips"
  * vaccineCode ^binding.extension[=].extension[+].url = "documentation"
  * vaccineCode ^binding.extension[=].extension[=].valueMarkdown = "Additional conformance binding to a vaccines value set from the WHO ATC code system for use in specific jurisdictional or other contexts where use of the ATC terminology is preferred."
  * vaccineCode ^binding.extension[=].extension[+].url = "shortDoco"
  * vaccineCode ^binding.extension[=].extension[=].valueString = "For when WHO ATC code system is preferred"
  * vaccineCode ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
  * vaccineCode ^binding.description = "The type of vaccine for particular disease or diseases against which the patient has been immunised, or a code for absent/unknown immunization."
  * ^short = "Generic description of the vaccine/prophylaxis or its component(s)"
* recommendation.targetDisease from $eHDSIIllnessandDisorder (preferred) // Check Value Set
  * ^short = "Disease or agent that the vaccination provides protection against"
* recommendation.forecastStatus ^short = "Recommendation status"
* recommendation.dateCriterion ^slicing.discriminator[0].type = #value
* recommendation.dateCriterion ^slicing.discriminator[0].path = "code"
* recommendation.dateCriterion ^slicing.rules = #open
* recommendation.dateCriterion contains nextDose ..1
* recommendation.dateCriterion[nextDose].code = $loinc#30980-7
* recommendation.dateCriterion[nextDose].value 1..1
* recommendation.doseNumberPositiveInt ^short = "Dose Number"
* recommendation.seriesDosesPositiveInt ^short = "Number of doses"
 */
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  MedicationStatementEuCore
Parent:   MedicationStatement
Id:       medicationStatement-eu-core
Title:    "MedicationStatement (EU core)"
Description: """This profile introduces essential constraints and extensions for the MedicationStatement resource that apply across multiple use cases."""
//-------------------------------------------------------------------------------------------
* insert SetFmmandStatusRule (2, trial-use)
* derivedFrom ^short = "The reference to the source of the statement"
* language ^short = "Language of the statement"
* note.text ^short = "Textual note about the statement"
* identifier 
  * ^short = "Medication Statement Identifier"
// * status ^short = "Current state of the dispensation"
* subject only Reference( PatientEuCore or Group)
* status ^short = "State of the medication"
* category ^short = "Type of intended use"
  * ^binding.additional[+].purpose = #preferred
  * ^binding.additional[=].valueSet = Canonical(MedicationIntendedUseEuVs)
  * ^binding.additional[=].documentation = "When category is used for describing the intended use of the medication (e.g. Prophylactic use)."
/* Slice cannot be used in R4
* category insert SliceElement ( #value, $this )
* category contains intendedUse 0..*
* category[intendedUse] from medicationIntendedUseEuVs
*/
* dosage ^short = "Details of how medication is/was taken or should be taken."
  * route //copy the additional binding from the ips
* effectivePeriod ^short = "Period when the medication is/was or should be used."
* medication only CodeableReference(MedicationEuCore)
* medication from $medication-uv-ips (example) 
* reason.concept ^short = "Coded reason for use"
* adherence.code ^short = "Type of adherence."
* informationSource only Reference( PatientEuCore or PractitionerEuCore or PractitionerRoleEuCore or OrganizationEuCore or RelatedPerson )

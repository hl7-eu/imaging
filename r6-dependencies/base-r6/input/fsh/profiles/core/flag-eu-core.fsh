//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  FlagPatientEuCore
Parent:   Flag
Id:       flag-patient-eu-core
Title:    "Flag: Patient (EU core)"
Description: """This profile introduces essential constraints and extensions for the Flag resource - for patient related alerts - that apply across multiple use cases.
Other specialized flag profiles may be specified in the future for other kind of subjects (e.g. related to practitioners, devices, etc.)."""
//-------------------------------------------------------------------------------------------
// * insert SetFmmandStatusRule (2, trial-use)
* identifier ^short = "Alert business Identifier"
* language ^short = "Language of the alert content"
* extension contains $flag-detail named flagDetailExt 0..*
* extension contains $flag-priority named flagPriorityExt 0..1
* extension contains $note named note 0..*
* extension[flagDetailExt]
* extension[flagPriorityExt]
* extension[note].valueAnnotation.text ^short = "Additional information about the alert"
* author ^short = "Author of the alert"
* status ^short = "Alert status"
* code ^short = "Coded or textual message to display to user."
* subject only Reference(PatientEuCore)
* period ^short = "Time period when the alert is active"

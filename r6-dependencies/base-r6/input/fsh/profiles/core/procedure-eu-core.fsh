Profile: ProcedureEuCore
Parent: Procedure
// Parent: ProcedureUvIps
Id: procedure-eu-core
Title:    "Procedure (EU core)"
Description: """This profile introduces essential constraints and extensions for the Procedure resource that apply across multiple use cases."""
// * insert ImposeProfile ( $Procedure-uv-ips, 0 )  // Check if this is appropriate (see  support)
* insert SetFmmandStatusRule (2, trial-use)
* reportedReference ^short = "Reported rather than primary record."
* language ^short = "Language of the procedure"
* recorder ^short = "The person or organization who recorded the procedure"
/* * extension contains $procedure-targetBodyStructure named bodySite 0..1
* extension[bodySite].valueReference only Reference(BodyStructureEuCore) */
* recorded ^short = "Date when the procedure was recorded"
* identifier ^short = "Identifier for the procedure"
* text ^short = "Textual representation of the procedure"
 // textual representation of the procedure should be provided according to the EHN data set
* status
* code 1.. 
  * ^binding.description = "Codes describing the type of  Procedure"
  * ^definition = "Identification of the procedure or recording of \"absence of relevant procedures\" or of \"procedures unknown\"."
* code from $procedures-uv-ips (preferred) 
* subject only Reference(PatientEuCore)
* subject 1..1
// * subject.reference 1..1 Only for IPS ?
* occurrence[x] 1..1
/* * performed[x].extension contains $data-absent-reason named data-absent-reason 0..1
* performed[x].extension[data-absent-reason] ^short = "performed[x] absence reason"
* performed[x].extension[data-absent-reason] ^definition = "Provides a reason why the performed is missing." */
* performer.actor only Reference(PractitionerRoleEuCore or PractitionerEuCore or Device or PatientEuCore or RelatedPerson or  OrganizationEuCore)
* performer.onBehalfOf only Reference(OrganizationEuCore)
* reason only CodeableReference(ConditionEuCore or Observation or ProcedureEuCore or DiagnosticReport or DocumentReference)
  * ^short = "Why the procedure was performed"
* outcome ^short = "Outcome of the procedure"
* complication only CodeableReference(ConditionEuCore)
* used ^short = "Device used to perform the procedure"
* used only CodeableReference( Device or MedicationEuCore or Substance or BiologicallyDerivedProduct) // Specialize if needed
* focalDevice ^short = "Device implanted, removed or otherwise manipulated"
* focalDevice.manipulated only Reference ( Device ) // DeviceEuCore
* bodySite from SNOMEDCTBodyStructures (preferred)
* bodySite
  * ^definition = "Anatomical location which is the focus of the problem."
  * extension contains $bodySite-reference named bodySite 0..1
  * extension[bodySite].valueReference only Reference(BodyStructureEuCore)  
  //* extension contains LateralityQualifier named laterality 0..1
* bodySite obeys eu-bodysite-1
* note ^short = "Additional information about the procedure."

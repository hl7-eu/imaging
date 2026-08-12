Profile: PatientEuCore
Parent: PatientEu
Id: patient-eu-core
Title:    "Patient (EU core)"
Description: """This profile introduces essential constraints and extensions for the Patient resource that apply across multiple use cases.
When the ips-pat-1 invariant is satisfied \(Patient.name.given, Patient.name.family or Patient.name.text SHALL be present\) then this profile complies with the IPS patient profile."""
* insert SetFmmandStatusRule (2, trial-use)
* name 1..*
* name obeys eu-pat-1
* birthDate 1.. // MS according to IPS
// ==============================================================
// Invariants
// ips-pat-1 doesn't allow for data-absent-reason on name, 
// but we need it to be allowed for EU core compliance
// ==============================================================
Invariant: eu-pat-1
Description: "given, family, text or a data-absent-reason extension SHALL be present"
Severity: #error
Expression: "family.exists() or given.exists() or text.exists() or extension('http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
/* XPath: "f:given or f:family or f:text" */
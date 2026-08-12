//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  CompositionEuCore
Parent:   Composition
Id:       composition-eu-core
Title:    "Composition (EU core)"
Description: """This profile introduces essential constraints and extensions for the Composition resource for commonly used EHDS documents."""
//-------------------------------------------------------------------------------------------
* insert SetFmmandStatusRule (2, trial-use)
* ^experimental = false
* ^purpose = "This profile constrains the Composition resource for the purpose of this guide."
* event
  * detail.concept ^short = "Event code"
  * period ^short = "Event period"
* language ^short = "Language of the composition content"
* extension contains
    $information-recipient named informationRecipient 0..* and
    $composition-diagnosticReportReference named diagnosticReport 0..1
// to be changed when the information-recipient extension is migrated to UV extension package
* extension[informationRecipient].value[x] only Reference(PractitionerEuCore or PractitionerRoleEuCore or OrganizationEuCore or Device or PatientEuCore or RelatedPerson)
* extension[diagnosticReport].value[x] only Reference(DiagnosticReport)
* identifier 1..*
* identifier ^short = "Report identifier"
* identifier ^definition = "Identifiers assigned to this document by the performer or other systems. Should remain stable across versions of the report."
* status 1..1
* type 1..1
* type ^short = "Type of document/report (e.g. imaging report LOINC)"
* category ^short = "Document Category"
/*   * insert SliceElement( #value, $this )
* category contains ehds-category 0..*
* category[ehds-category] ^short = "EHDS Priority Category"
* category[ehds-category] from EhdsCategoriesEuVs */
* subject 1..1
* subject only Reference(PatientEuCore or Group or LocationEuCore or Device)
* encounter 0..1
* author 1..*
* author only Reference(PractitionerEuCore or PractitionerRoleEuCore or OrganizationEuCore or Device or PatientEuCore or RelatedPerson)
* date 1..1
* title 1..1
* custodian only Reference(OrganizationEuCore)
* attester 0..*
  * insert SliceElement( #value, mode )
* attester.mode 1..1
* attester.time 0..1
* attester.party only Reference(PatientEuCore or RelatedPerson or PractitionerEuCore or PractitionerRoleEuCore or OrganizationEuCore)
* attester contains legalAuthenticator 0..* and validator 0..*
* attester[legalAuthenticator].mode = http://hl7.org/fhir/composition-attestation-mode#legal
* attester[legalAuthenticator].time 1..1
* attester[legalAuthenticator].party 1..
* attester[legalAuthenticator].party only Reference(PractitionerRoleEuCore or PractitionerEuCore) // Check references...
* attester[validator].mode = http://hl7.org/fhir/composition-attestation-mode#professional
* attester[validator].time 1..1
* attester[validator].party only Reference(PractitionerRoleEuCore or PractitionerEuCore)
* attester[validator].party 1..
* section.extension contains $note named section-note 0..*
* section.extension[section-note] ^short = "Additional notes that apply to the section (but not to specific resource)."
* section.extension[section-note] ^definition = "Additional notes that apply to the section (but not to specific resource)."
* section.title 1..
* section.code 1..
* section.text 1..
* section.emptyReason ^short = "Empty reason"

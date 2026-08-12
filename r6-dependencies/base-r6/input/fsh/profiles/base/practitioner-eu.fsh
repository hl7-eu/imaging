//====== Profiles =====================================
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  PractitionerEu
Parent:   Practitioner
Id:       practitioner-eu
Title:    "Practitioner (EU base)"
Description: """This profile specifies how the HL7 FHIR Practitioner resource should be used for conveying commonly used concepts in the European context."""
//-------------------------------------------------------------------------------------------
* insert SetFmmandStatusRule (2, trial-use)
* . obeys name-or-identifier
* identifier ^short = "Practitioner identifier"
* address only AddressEu
* name ^short = "Practitioner Name" // only HumanNameEu
* telecom ^short = "Contact details for the practitioner"
//-------------------------------------------------------------------------------------------
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  PractitionerRoleEu
Parent:   PractitionerRole
Id:       practitionerRole-eu
Title:    "PractitionerRole (EU base)"
Description: """This profile specifies how the HL7 FHIR PractitionerRole resource should be used for conveying commonly used concepts in the European context."""
//-------------------------------------------------------------------------------------------
* insert SetFmmandStatusRule (2, trial-use)
* identifier ^short = "Business identifier"
* organization ^short = "The organization where the practitioner performs the role"
* practitioner ^short = "The practitioner providing services for the organization"
* location ^short = "The location(s) at which this practitioner provides care"
// * organization only Reference (OrganizationEu)
// * practitioner only Reference (PractitionerEu)
// * location only Reference (LocationEuCore)
* contact ^short = "Official contact details relating to this practitioner role"
* code ^short = "Roles which this practitioner may perform."
* specialty ^short = "Specialty of the practitioner"
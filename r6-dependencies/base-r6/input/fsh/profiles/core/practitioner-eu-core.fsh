//====== Profiles =====================================
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  PractitionerEuCore
Parent:   PractitionerEu
Id:       practitioner-eu-core
Title:    "Practitioner (EU core)"
Description: """This profile introduces essential constraints and extensions for the Practitioner resource that apply across multiple use cases."""
//-------------------------------------------------------------------------------------------
* insert SetFmmandStatusRule (2, trial-use)
/*
*/
* name 1..
//-------------------------------------------------------------------------------------------
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  PractitionerRoleEuCore
Parent:   PractitionerRoleEu // http://hl7.org/fhir/uv/ips/StructureDefinition/PractitionerRole-uv-ips
Id:       practitionerRole-eu-core
Title:    "PractitionerRole (EU core)"
Description: """This profile introduces essential constraints and extensions for the PractitionerRole resource that apply across multiple use cases."""
//-------------------------------------------------------------------------------------------
* insert SetFmmandStatusRule (2, trial-use)
/*
*/
* organization only Reference (OrganizationEuCore)
* practitioner only Reference (PractitionerEuCore)
//-------------------------------------------------------------------------------------------
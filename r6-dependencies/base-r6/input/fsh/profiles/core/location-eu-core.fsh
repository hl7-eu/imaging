Profile: LocationEuCore
Parent: Location
Id: location-eu-core
Title: "Location (EU core)"
Description: """This profile introduces essential constraints and extensions for the Location resource that apply across multiple use cases."""
* insert SetFmmandStatusRule (2, trial-use)
* description ^short = "Description of the location"
* managingOrganization	// only Reference(OrganizationEu) 
  * ^short = "Managing organization"
  * ^comment = "The managing organization is the organization responsible for the location, such as a hospital or clinic."
* identifier ^short = "Location identifier"
* type ^short = "Location type"
* contact.telecom ^short = "Location telecom"
* name ^short = "Location name"
* partOf ^short = "Location this one is physically a part of"
* address only AddressEu
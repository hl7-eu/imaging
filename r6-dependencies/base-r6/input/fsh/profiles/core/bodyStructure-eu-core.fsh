Profile: BodyStructureEuCore
Parent: BodyStructure
Id: bodyStructure-eu-core
Title: "BodyStructure (EU core)"
Description: """This profile introduces essential constraints and extensions for the BodyStructure resource that apply across multiple use cases."""
* insert SetFmmandStatusRule (2, trial-use)
* identifier ^short = "Body structure identifier"
* text ^short = "Textual description of the body structure"
* includedStructure
  * laterality from SiteLateralityEuVs (preferred)
  * structure from http://hl7.org/fhir/ValueSet/body-site (preferred)
  * qualifier from SiteQualifierEuVs (preferred) 
* morphology from http://hl7.org/fhir/ValueSet/bodystructure-code (preferred)
// * image 0..0
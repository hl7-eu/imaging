Profile: ImReportDocumentReference
Parent: DocumentReference
Title: "DocumentReference: -MHD Imaging Report"
Description: """
A DocumentReference profile for the Report DocumentReference used in MHD deployments. """
* insert SetFmmAndStatusRule( 1, draft )
* modifierExtension 0..0

* identifier
  * insert SliceElement( #value, system )
* identifier contains entry-uuid 1..1
* identifier[entry-uuid] only IheEntryUUIDIdentifier

* status 1..1 
* type 1..1 
* type from ImImagingReportTypesEuVS (preferred) 
  * ^short = "Type of Imaging Diagnostic Report"
  * ^definition = "Specifies that it refers to a Imaging Report"
  * ^comment = "Corresponds to the type of the Imaging resource."
* category 1..* 
  * insert SliceElement( #value, $this )
* category contains imaging 1..1 
* category[imaging] = $loinc#18748-4 // "Diagnostic imaging study"
* subject 1..1 
* custodian 0..1 
* author 
* relatesTo 0..* 
* securityLabel 0..* 
* custodian only Reference(OrganizationEu)
  * ^short = "Organization that manages the Imaging Report"
* content 1..1
  * attachment 1..1
    * contentType 1..1
    * language 
    * creation 
  * profile 1..*
    * insert SliceElement( #value, value )
  * profile contains hl7eu-imaging-report 1..1 
  * profile[hl7eu-imaging-report].valueCanonical = Canonical( ImReport )
* bodySite 0..*
* modality 1..* 


Profile: IheEntryUUIDIdentifier
Parent: Identifier
Title: "Identifier: IHE-MHD Entry UUID"
Description: """entryUUID Identifier holding a UUID, based on [IHE-MHD R4](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.EntryUUID.Identifier.html).
"""
* insert SetFmmAndStatusRule( 1, draft )
* use = #official
* type 0..1
* system 1..1
* system = "urn:ietf:rfc:3986"
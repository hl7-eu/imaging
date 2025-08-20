Profile: Report_ImReportDocumentReference
Id: Report-ImReportDocumentReference
Parent: ImReportMhdDocumentReference
Title: "Report Obligations for ImReportIheMhdDocumentReference"
Description: """Report Obligations for ImReportIheMhdDocumentReference"""
* insert SetFmmAndStatusRule( 1, draft )
* identifier[entry-uuid]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* status 1..1 
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* category
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* type
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* subject
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* custodian
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* author
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* relatesTo
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* securityLabel
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* content
  * attachment
    * language
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
    * creation
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* bodySite
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* modality
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)

Profile: ImReportMhdDocumentReference
Parent: ImMhdDocumentReference
Title: "DocumentReference: -MHD Imaging Report"
Description: """
A DocumentReference profile for the Report DocumentReference used in MHD deployments. """
* insert SetFmmAndStatusRule( 1, draft )
* modifierExtension 0..0
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
    * language 
    * creation 
  * profile 1..*
    * insert SliceElement( #value, value )
  * profile contains hl7eu-imaging-report 1..1 
  * profile[hl7eu-imaging-report].valueCanonical = Canonical( ImReport )
* bodySite 0..*
* modality 1..* 

Profile: Manifest_ImManifestDocumentReference
Id: Manifest-ImManifestDocumentReference
Parent: ImManifestIheMhdDocumentReference
Title: "Manifest Obligations for ImManifestMhdDocumentReference"
Description: """Manifest Obligations for ImManifestMhdDocumentReference"""
* insert SetFmmAndStatusRule( 1, draft )
* identifier[entry-uuid]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImManifestProvider)
* status 1..1 
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImManifestProvider)
* type
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImManifestProvider)
* subject
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImManifestProvider)
* custodian
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImManifestProvider)
* author
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImManifestProvider)
* relatesTo
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImManifestProvider)
* securityLabel
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImManifestProvider)
* content
  * attachment
    * language
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImManifestProvider)
    * creation
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImManifestProvider)
* bodySite
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImManifestProvider)
* modality
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImManifestProvider)

Profile: ImManifestIheMhdDocumentReference
Parent: ImMhdDocumentReference
Title: "DocumentReference: IHE-MHD Imaging Manifest"
Description: """
A DocumentReference profile for the Manifest DocumentReference used in MHD deployments. """
* insert SetFmmAndStatusRule( 1, draft )
* modifierExtension 0..0
* type 1..1 
* type = $loinc#19005-8
* category 1..* 
  * insert SliceElement( #value, $this )
* category contains imaging 1..1 
* category[imaging] = $loinc#18748-4 // "Diagnostic imaging study"
* type from ImImagingManifestTypesEuVS (preferred) 
  * ^short = "Type of Imaging Manifest"
  * ^definition = "Specifies that it refers to a Imaging Manifest"
  * ^comment = "Corresponds to the type of the Imaging Manifest resource."
* subject 1..1 
* custodian 0..1 
* author 
* relatesTo 0..* 
* securityLabel 0..* 
* custodian only Reference(OrganizationEu)
  * ^short = "Organization that manages the Imaging Report"
* content 1..1
  * attachment 1..1
    * language 
    * creation 
  * profile 1..*
    * insert SliceElement( #value, value )
  * profile contains hl7eu-imaging-manifest 1..1 
  * profile[hl7eu-imaging-manifest].valueCanonical = Canonical( ImImagingStudyManifest )
* bodySite 0..*
* modality 1..* 

Profile: ImMhdDocumentReference
Parent: DocumentReference
Title: "DocumentReference: IHE-MHD Document"
Description: """A placeholder for a DocumentReference profile for the IHE-MHD in R5. """
* insert SetFmmAndStatusRule( 1, draft )
* modifierExtension 0..0
* identifier
  * insert SliceElement( #value, system )
* identifier contains entry-uuid 1..1
* identifier[entry-uuid] only IheMhdEntryUUIDIdentifier
* status 1..1 
* content 1..1
  * attachment 1..1
    * contentType 1..1



Profile: IheMhdEntryUUIDIdentifier
Parent: Identifier
Title: "Identifier: IHE-MHD Entry UUID"
Description: """entryUUID Identifier holding a UUID, based on [IHE-MHD R4](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.EntryUUID.Identifier.html).
"""
* insert SetFmmAndStatusRule( 1, draft )
* use = #official
* type 0..1
* system 1..1
* system = "urn:ietf:rfc:3986"

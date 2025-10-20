Profile: UnstructuredDocumentReferenceEuImaging
Parent: DocumentReference
Title: "DocumentReference: Unstructured Imaging Report"
Description: """
A DocumentReference profile for the Report DocumentReference used in MHD deployments for unstructured reports. """
* insert SetFmmAndStatusRule( 1, draft )
* modifierExtension 0..0

* identifier
  * insert SliceElement( #value, system )
* identifier contains entry-uuid 1..1
* identifier[entry-uuid] only IheEntryUUIDIdentifier

* status 1..1 
* type 1..1 
* type from ImagingReportTypesEuVSEuImaging (preferred) 
  * ^short = "Type of Imaging Diagnostic Report"
  * ^definition = "Defines the document type, it is recommended to take this from the suggested LOINC set. It should correspond with the value on DiagnosticReport.code."

* category 1..* 
  * insert SliceElement( #value, $this )
* category contains class-code 1..1 
* category[class-code] from XdsClassCodeVs (preferred) 
  * ^short = "XDS Class Code"
  * ^definition = "XDS Class Code for the document, see [XDS_classCode_MetaData_Coding_System](https://wiki.ihe.net/index.php/XDS_classCode_Metadata_Coding_System)."
  * ^comment = "This code identifies the high-level classification of the document, e.g. Report, Summary, Image, Prescription, Dispensation, Plan, Health, Patient or Workflow."
* category[class-code] = $xds-class-code#REPORTS // "Reports"  
// * category[imaging] = $loinc#18748-4 // "Diagnostic imaging study"

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
{{R4}}* extension contains 	http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.bodySite named bodySite  0..* and http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.modality named modality 0..*

{{R5}}* bodySite 0..*
{{R5}}* modality 0..* 


Profile: BundleReportEuImagingDocumentReference
Parent: UnstructuredDocumentReferenceEuImaging
Title: "DocumentReference: EU Imaging Report"
Description: """
A DocumentReference profile for the Report DocumentReference used in MHD deployments. """
* insert SetFmmAndStatusRule( 1, draft )
{{R4}}* content 1..1
{{R4}}  * extension contains  http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.content.profile named profile 1..*
{{R4}}  * extension[profile]
{{R4}}  * ^short = "Contains the profile of the referred report"
// TODO fix this! we had to comment it out as it did not run
// {{R4}}  * extension[BundleReportEuImagingProfile].valueCanonical = Canonical( BundleReportEuImaging )
  
{{R5}}* content 1..1
{{R5}}  * profile 1..*
{{R5}}    * insert SliceElement( #value, value )
{{R5}}  * profile contains hl7eu-imaging-report 1..1 
{{R5}}  * profile[hl7eu-imaging-report].valueCanonical = Canonical( BundleReportEuImaging )


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
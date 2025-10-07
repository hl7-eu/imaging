Profile: ImUnstructuredDocumentReference
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
* type from ImImagingReportTypesEuVS (preferred) 
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


Profile: ImReportDocumentReference
Parent: ImUnstructuredDocumentReference
Title: "DocumentReference: EU Imaging Report"
Description: """
A DocumentReference profile for the Report DocumentReference used in MHD deployments. """
* insert SetFmmAndStatusRule( 1, draft )
* content 1..1
  * profile 1..*
    * insert SliceElement( #value, value )
  * profile contains hl7eu-imaging-report 1..1 
  * profile[hl7eu-imaging-report].valueCanonical = Canonical( ImReport )


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
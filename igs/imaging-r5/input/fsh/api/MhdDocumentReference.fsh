Profile: DocumentReferenceImagingReport
//R4Parent: EehrxfMhdDocumentReference
Parent: DocumentReference
Title: "EEHRxF MHD DocumentReference Profile"
Description: """
Profile for DocumentReference resources used in the EEHRxF context, based on the IHE MHD Minimal DocumentReference profile.
"""
* insert SetFmmAndStatusRule( 1, draft )
* category = $loinc#18748-4 // TODO replace with correct version from API
* type from ImagingReportTypesEuVSEuImaging (preferred)  // TODO align with API

// practice setting
//R4* context.practiceSetting ^short = "Clinical specialty (e.g., radiology, laboratory) - SHOULD be used for lab vs imaging differentiation"
* practiceSetting ^short = "Clinical specialty (e.g., radiology, laboratory) - SHOULD be used for lab vs imaging differentiation"

// subject
* subject 1..1
* subject only Reference( $EuPatient )

// date
* date 1..1

* category 1..1
  * coding
    * insert SliceElement( #value, $this )
  * coding contains imaging 1..1 and report 1..1
  * coding[imaging] = $loinc#18748-4	// Diagnostic imaging study
  * coding[report] =  $xds-class-code#REPORTS // TODO - get a better code here

* type from ImagingReportTypesEuVSEuImaging (preferred)

// bodysite
* bodySite
// * bodySite only CodeableReferenceAnatomicalRegion
  * ^short = "The anatomical region of the patient that is the focus of the imaging manifest, concept field is required."
  * ^definition = "This field may be used to provide additional information about the anatomical region of interest for the imaging manifest."
  * concept 1..1
    * coding
      * insert SliceElement( #value, concept )
    * coding contains anatomical-region 1..*
    * coding[anatomical-region] from ValueSetAnatomicalRegion (extensible)
// * bodySite
//   * concept 1..1
//     * valueCoding
//       * insert SliceElement( #value, concept )
//     * valueCoding contains anatomical-region 1..*
//     * valueCoding[anatomical-region] from AnatomicalRegionVs (extensible)
//     * ^short = "The anatomical region of the patient that is the focus of the imaging manifest, concept field is required."
//     * ^definition = "This field may be used to provide additional information about the anatomical region of interest for the imaging manifest."
//R4* extension contains $CrossVersion-R5-DocumentReference.bodySite-for-R4 named bodysite 0..1 
//R4* extension[bodysite].extension[concept] 1..1
//R4* extension[bodysite].extension[concept]
//R4  * valueCodeableConcept from ValueSetAnatomicalRegion (extensible)
//R4  * ^short = "The anatomical region of the patient that is the focus of the imaging manifest, concept field is required."
//R4  * ^definition = "This field may be used to provide additional information about the anatomical region of interest for the imaging manifest."

// modality
//R4* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.modality named modality 1..1 



//    * ^comment = "This element corresponds to ImagingStudy anatomical"

// * bodySite only CodeableReferenceWithRequiredCoding
//   * insert SliceElement( #value, concept )
// * bodySite
//   * ^short = "The concept field is required for all bodySites."
// * bodySite.concept 1..1

// * bodySite contains anatomical-region 0..*
// * bodySite[anatomical-region] from AnatomicalRegionVs (required)
//   * ^short = "The anatomical region of the patient that is the focus of the imaging manifest, concept field is required."
//   * ^definition = "This field may be used to provide additional information about the anatomical region of interest for the imaging manifest."
//   * ^comment = "This element corresponds to ImagingStudy.series.bodySite."


// Title: "Imaging Report DocumentReference for MHD deployments"
// Description: """
// A DocumentReference profile for the Manifest DocumentReference used in MHD deployments. """
// * insert SetFmmAndStatusRule( 1, draft )

// * modifierExtension 0..0

// * identifier
//   * insert SliceElement( #value, system )
// * identifier contains entry-uuid 1..1
// * identifier[entry-uuid] only IheMhdEntryUUIDIdentifier

// * category 1..* 
//   * insert SliceElement( #value, $this )
// * category contains class-code 1..1 and service-section 0..*
// * category[class-code] from XdsClassCodeVs (required)
// * category[class-code] = $xds-class-code#IMAGES //"Images"
//   * ^short = "The class code of this DocumentReference, for manifest this set to IMAGES."
// * category[service-section] from http://hl7.org/fhir/ValueSet/diagnostic-service-sections (extensible)
  

// * practiceSetting from PracticeSettingsVs (extensible)
//   * ^short = "The practice setting of the imaging manifest."
//   * ^definition = "This field may be used to provide additional information about the practice setting where the imaging manifest was created."

// * type 1..1 
// * type from ImImagingManifestTypesEuVS (preferred) 
//   * ^short = "Type of Imaging Manifest"
//   * ^definition = "Specifies that it refers to a Imaging Manifest"
//   * ^comment = "Corresponds to the type of the Imaging Manifest resource."

// * subject 1..1 

// * custodian 0..1 
//   * identifier 1..1
//     * type = MissingDicomTerminology#0040E031  // HomeCommunityId 

// * bodySite only CodeableReferenceWithRequiredCoding
//   * insert SliceElement( #value, concept )
// * bodySite
//   * ^short = "The concept field is required for all bodySites."
// * bodySite.concept 1..1

// * bodySite contains anatomical-region 0..*
// * bodySite[anatomical-region] from AnatomicalRegionVs (required)
//   * ^short = "The anatomical region of the patient that is the focus of the imaging manifest, concept field is required."
//   * ^definition = "This field may be used to provide additional information about the anatomical region of interest for the imaging manifest."
//   * ^comment = "This element corresponds to ImagingStudy.series.bodySite."

// * period
// * author 

// * relatesTo 0..* 
// * securityLabel 0..* 
// * custodian only Reference(Organization)
//   * ^short = "Organization that manages the Imaging Manifest"

// * content 1..*
//   * insert SliceElementWithDescription( #value, value, [[Manifest can be KOS or FHIR.]] )
// * content contains kos 0..1 and fhir 0..1
// * content[kos]
//   * attachment 1..1
//     * contentType = #application/dicom
//     * data 0..1
//     * url 1..1
//   * profile 1..*
//     * insert SliceElement( #value, value )
//   * profile contains kos-manifest 1..1 
//   * profile[kos-manifest]
//     * valueCoding = $dcm#113030 // Manifest
// * content[fhir]
//   * attachment 1..1
//     * contentType = #application/fhir+json
//     * data 0..1
//     * url 1..1
//   * profile 1..*
//     * insert SliceElement( #value, value )
//   * profile contains fhir-manifest 1..1 
//   * profile[fhir-manifest].valueCanonical = Canonical( ImImagingStudyManifest )

// * modality 1..* 
// * modality from https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html (required) 
//   // * ^binding.additional[0].purpose = #preferred
//   // * ^binding.additional[0].valueSet = "https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html"
//   // * ^binding.additional[0].documentation = "When the manifest represents a study generated by diagnostic equipment "

// * obeys im-docref-1

// Profile: IheMhdEntryUUIDIdentifier
// Parent: Identifier
// Title: "Placeholder for IHE MHD Entry UUID Identifier in FHIR R5."
// Description: """entryUUID Identifier holding a UUID, based on [IHE-MHD R4](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.EntryUUID.Identifier.html).
// """
// * insert SetFmmAndStatusRule( 1, draft )
// * use = #official
// * type 0..1
// * system 1..1
// * system = "urn:ietf:rfc:3986"

// Invariant:   im-docref-1
// Description: "At least a KOS or FHIR manifest needs to be present."
// Severity:    #error
// Expression:  "content.value.subsumes( $dcm#113030) or content.value.endsWith('ImManifestDocumentReference')"

// Profile: CodeableReferenceWithRequiredCoding
// Parent: CodeableReference
// * concept 1..1

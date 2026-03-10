Profile: DocumentReferenceImagingReport
//R4Parent: EehrxfMhdDocumentReference
Parent: DocumentReference
Title: "EEHRxF MHD DocumentReference Profile for Imaging Reports"
Description: """
Profile for DocumentReference resources used in the EEHRxF context, based on the IHE MHD Minimal DocumentReference profile. This profile is used for the DocumentReference resources that represent imaging reports in the EEHRxF context. It includes additional constraints and extensions specific to imaging reports, such as the type of report, the clinical specialty, the anatomical region of interest and the profile of the imaging report.
"""
* insert SetFmmAndStatusRule( 1, draft )


// practice setting
//R4* context.practiceSetting ^short = "Clinical specialty (e.g., radiology, laboratory) - SHOULD be used for lab vs imaging differentiation"
* practiceSetting ^short = "Clinical specialty (e.g., radiology, laboratory) - SHOULD be used for lab vs imaging differentiation"

* status 1..1

//R4* extension contains 	http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.version named version 0..1
//R4* extension[version]
//R4  * ^short = "Version of the document referenced by this DocumentReference." 

// subject
* subject 1..1
* subject only Reference( $EuPatient )

// date
* date 1..1

* category 1..1
  * coding
    * insert SliceElement( #value, $this )
  * coding contains priority-area 1..1
  * coding[priority-area] = http://hl7.eu/fhir/eu-health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging

* type 1..1
  * ^short = "Type of Imaging Diagnostic Report"
  * ^definition = "Defines the document type, it is recommended to take this from the suggested LOINC set. It should correspond with the value on DiagnosticReport.code."
  * coding
    * insert SliceElement( #value, $this )
  * coding contains imaging-report 1..1
  * coding[imaging-report] = $loinc#85430-7
  // * coding[imaging-report-type] from ImagingReportTypesEuVSEuImaging (preferred)  

* custodian only Reference(OrganizationEu)
  * ^short = "Organization that manages the Imaging Report"

// bodysite
* bodySite
// * bodySite only CodeableReferenceAnatomicalRegion
  * ^short = "The anatomical region of the patient that is the focus of the imaging manifest, concept field is required."
  * ^definition = "This field may be used to provide additional information about the anatomical region of interest for the imaging manifest."
  * concept 1..1
    * coding from ValueSetAnatomicalRegion (extensible)
//       * insert SliceElement( #pattern, $this )
//     * coding contains anatomical-region 1..*
//     * coding[anatomical-region] from ValueSetAnatomicalRegion (required)
//R4* extension contains $CrossVersion-R5-DocumentReference.bodySite-for-R4 named bodysite 0..1 
//R4* extension[bodysite].extension[concept] 1..1
//R4* extension[bodysite].extension[concept]
//R4  * valueCodeableConcept from ValueSetAnatomicalRegion (extensible)
//R4  * ^short = "The anatomical region of the patient that is the focus of the imaging manifest, concept field is required."
//R4  * ^definition = "This field may be used to provide additional information about the anatomical region of interest for the imaging manifest."

// modality
//R4* extension contains $CrossVersion-R5-DocumentReference.modality-for-R4 named modality 1..1

// content profile representation. Defining a custom extension as the CV spanshot 2 fails. TBD replace with CV snapshot 3 when available.
// //R4* content 1..1
// //R4  * extension contains  http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.content.profile named profile 1..*
// //R4  * extension[profile]
// //R4  * ^short = "Contains the profile of the referred report"
//R4* content 1..1
//R4  * extension contains ImDocumentReferenceContentProfile named profile 1..*
//R4  * extension[profile] ^short = "Contains the profile of the referred report"
  
* content 1..1
  * profile 1..*
    * insert SliceElement( #value, value )
  * profile contains bundle-report 0..1 and bundle-report-minimal-metadata 0..1
  * profile[bundle-report].valueCanonical = Canonical(BundleReportEuImaging)
  * profile[bundle-report-minimal-metadata].valueCanonical = Canonical(BundleReportMinimalMetadataEuImaging)


//R4Extension: ImDocumentReferenceContentProfile
//R4Id: im-documentreference-content-profile
//R4Title: "Extension: DocumentReference content profile"
//R4Description: "Canonical URL of the profile represented by the //R4referenced content."
//R4Context: DocumentReference.content
//R4* value[x] only canonical

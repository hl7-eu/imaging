Profile: DocumentReferenceImagingReport
{{R4}}Parent: EehrxfMhdDocumentReference
{{R5}}Parent: DocumentReference
Title: "EEHRxF MHD DocumentReference Profile for Imaging Reports"
Description: """
Profile for DocumentReference resources used in the EEHRxF context, based on the IHE MHD Minimal DocumentReference profile. This profile is used for the DocumentReference resources that represent imaging reports in the EEHRxF context. It includes additional constraints and extensions specific to imaging reports, such as the type of report, the clinical specialty, the anatomical region of interest and the profile of the imaging report.
"""
{{R }}* insert SetFmmAndStatusRule( 1, draft )
{{R }}* insert MhdDocumentReference

// content profile representation
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

Profile: DocumentReferenceUnstructuredImagingReport
{{R4}}Parent: EehrxfMhdDocumentReference
{{R5}}Parent: DocumentReference
Title: "EEHRxF MHD DocumentReference Profile for unstructured imaging reports"
Description: """
Profile for DocumentReference resources used in the EEHRxF context, based on the IHE MHD Minimal DocumentReference profile. This profile is used for the DocumentReference resources that represent imaging reports in the EEHRxF context. It includes additional constraints and extensions specific to imaging reports, such as the type of report, the clinical specialty, and the anatomical region of interest. It is intended for unstructured reports needed to support legacy reports, where the content is provided as an attachment without a specific structure or format.
"""
* insert SetFmmAndStatusRule( 1, draft )
* insert MhdDocumentReference


RuleSet: MhdDocumentReference
// practice setting
{{R4}}* context.practiceSetting ^short = "Clinical specialty (e.g., radiology, laboratory) - SHOULD be used for lab vs imaging differentiation"
{{R5}}* practiceSetting ^short = "Clinical specialty (e.g., radiology, laboratory) - SHOULD be used for lab vs imaging differentiation"

* status 1..1

// subject
* subject 1..1
{{R5}}* subject only Reference( $EuPatient )

// date
* date 1..1

* category 1..1
  * coding
    * insert SliceElement( #value, $this )
  * coding contains imaging 1..1 and report 1..1
  * coding[imaging] = $loinc#18748-4	// Diagnostic imaging study
  * coding[report] =  $xds-class-code#REPORTS // TODO - get a better code here

* type from ImagingReportTypesEuVSEuImaging (preferred)  
  * ^short = "Type of Imaging Diagnostic Report"
  * ^definition = "Defines the document type, it is recommended to take this from the suggested LOINC set. It should correspond with the value on DiagnosticReport.code."

* custodian only Reference(OrganizationEu)
  * ^short = "Organization that manages the Imaging Report"


// bodysite
{{R5}}* bodySite
// {{R5}}* bodySite only CodeableReferenceAnatomicalRegion
{{R5}}  * ^short = "The anatomical region of the patient that is the focus of the imaging manifest, concept field is required."
{{R5}}  * ^definition = "This field may be used to provide additional information about the anatomical region of interest for the imaging manifest."
{{R5}}  * concept 1..1
{{R5}}    * coding
{{R5}}      * insert SliceElement( #value, concept )
{{R5}}    * coding contains anatomical-region 1..*
{{R5}}    * coding[anatomical-region] from ValueSetAnatomicalRegion (extensible)
{{R4}}* extension contains $CrossVersion-R5-DocumentReference.bodySite-for-R4 named bodysite 0..1 
{{R4}}* extension[bodysite].extension[concept] 1..1
{{R4}}* extension[bodysite].extension[concept]
{{R4}}  * valueCodeableConcept from ValueSetAnatomicalRegion (extensible)
{{R4}}  * ^short = "The anatomical region of the patient that is the focus of the imaging manifest, concept field is required."
{{R4}}  * ^definition = "This field may be used to provide additional information about the anatomical region of interest for the imaging manifest."

// modality
{{R4}}* extension contains $CrossVersion-R5-DocumentReference.modality-for-R4 named modality 1..1 

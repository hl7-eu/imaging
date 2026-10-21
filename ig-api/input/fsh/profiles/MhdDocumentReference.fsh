Profile: DocumentReferenceImagingReport
Parent: EehrxfMhdDocumentReference
Title: "EEHRxF MHD DocumentReference Profile for Imaging Reports"
Description: "R4 DocumentReference for indexing imaging report Bundles in the EEHRxF API."
* insert SetFmmAndStatusRule( 1, draft )


// practice setting
* context.practiceSetting ^short = "Clinical specialty (e.g., radiology, laboratory) - SHOULD be used for lab vs imaging differentiation"

* status 1..1

* extension contains $CrossVersion-R5-DocumentReference.version-for-R4 named version 0..1
* extension[version]
  * ^short = "Version of the document referenced by this DocumentReference." 

// subject
* subject 1..1

// date
* date 1..1

* category 1..1
  * coding
    * insert SliceElement( #value, $this )
  * coding contains priority-area 1..1
  * coding[priority-area] = http://hl7.eu/fhir/health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging

* type 1..1
  * ^short = "Type of Imaging Diagnostic Report"
  * ^definition = "Defines the document type, it is recommended to take this from the suggested LOINC set. It should correspond with the value on DiagnosticReport.code."
  * coding
    * insert SliceElement( #value, $this )
  * coding contains imaging-report 1..1
  * coding[imaging-report] = $loinc#85430-7
  // * coding[imaging-report-type] from ImagingReportTypesEuVSEuImaging (preferred)  

* custodian only Reference($EuOrganization)
  * ^short = "Organization that manages the Imaging Report"

// bodysite
* extension contains $ihe-mado-docref-bodysite named bodysite 0..*
* extension[bodysite]
  * valueCodeableConcept from http://hl7.eu/fhir/imaging/ValueSet/im-anatomical-region-valueset (extensible)
  * ^short = "The anatomical region of the patient that is the focus of the imaging manifest, concept field is required."
  * ^definition = "This field may be used to provide additional information about the anatomical region of interest for the imaging manifest."

// modality
* extension contains $ihe-mado-docref-modality named modality 1..*

* content 1..1
  * extension contains ImDocumentReferenceContentProfile named profile 1..*
  * extension[profile] ^short = "Contains the profile of the referred report"
  


Extension: ImDocumentReferenceContentProfile
Id: im-documentreference-content-profile
Title: "Extension: DocumentReference content profile"
Description: "Canonical URL of the profile represented by the referenced content."
Context: DocumentReference.content
* value[x] only canonical

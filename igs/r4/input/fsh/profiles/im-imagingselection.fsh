

// Basic version of ImagingSelection
// https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/Lookup-R5-ImagingSelection-R4.html
Profile: ImImagingSelection
Parent: Basic
Title: "Basic-ImagingSelection: General"
Description: "Imaging Selection"
* insert SetFmmAndStatusRule( 1, draft )
* subject only Reference( $EuPatient )

* code = #ImagingSelection
* extension contains 	http://hl7.org/fhir/5.0/StructureDefinition/extension-ImagingSelection named iamgingselection 1..1
* extension[iamgingselection].extension[derivedFrom] 1..*
// * extension[iamgingselection].extension[derivedFrom].valueReference 
//   * insert SliceElement( #profile, $this )
// * extension[iamgingselection].extension[derivedFrom].value contains study 1..1
// * extension[iamgingselection].extension[derivedFrom].value[study] only only Reference( ImImagingStudy )
// * derivedFrom 1..*
//   * insert SliceElement( #profile, $this )
// * derivedFrom contains study 1..1
// * derivedFrom[study] only Reference( ImImagingStudy )

// https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/Lookup-R5-ImagingSelection-R4.html

Profile: ImKeyImageImagingSelection
Parent: ImImagingSelection
Title: "ImagingSelection: Key Image"
Description: "Key images represented as an ImagingSelection"
* insert SetFmmAndStatusRule( 1, draft )

* extension contains 
    $artifact-title-url        named title 0..1 and
    $artifact-description-url  named description 0..1
  
* performer
  * insert SliceElement( #type, actor )
* performer contains performer 0..1 and device 0..1
* performer[performer]
  * actor only Reference( $EuPractitionerRole )
* performer[device]
  * actor only Reference( ImImagingDevice )

//R4Profile: ImKeyImageImagingSelection
//R4Parent: ImImagingSelection
//R4Title: "Key images represented as an ImagingSelection for R4"
//R4Description: "Key images represented as an ImagingSelection for R4"
//R4* insert SetFmmAndStatusRule( 1, draft )
//R4
//R4* extension contains 
//R4    $artifact-title-url        named title 0..1 and
//R4    $artifact-description-url  named description 0..1

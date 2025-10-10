// https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/Lookup-R5-ImagingSelection-R4.html

//R5Profile: ImagingSelectionKeyImageEuImaging
//R5Parent: ImagingSelectionEuImaging
//R5Title: "ImagingSelection: Key Image"
//R5Description: "Key images represented as an ImagingSelection"
//R5* insert SetFmmAndStatusRule( 1, draft )
//R5
//R5* extension contains 
//R5    $artifact-title-url        named title 0..1 and
//R5    $artifact-description-url  named description 0..1
//R5  
//R5* performer
//R5  * insert SliceElement( #type, actor )
//R5* performer contains performer 0..1 and device 0..1
//R5* performer[performer]
//R5  * actor only Reference( $EuPractitionerRole )
//R5* performer[device]
//R5  * actor only Reference( DeviceEuImaging )

Profile: ImagingSelectionKeyImageEuImaging
Parent: ImagingSelectionEuImaging
Title: "Key images represented as an ImagingSelection for R4"
Description: "Key images represented as an ImagingSelection for R4"
* insert SetFmmAndStatusRule( 1, draft )

* extension contains 
    $artifact-title-url        named title 0..1 and
    $artifact-description-url  named description 0..1

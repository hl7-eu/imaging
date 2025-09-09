Profile: ImagingSelectionKeyImageEuImaging
Parent: ImagingSelectionEuImaging
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
  * actor only Reference( DeviceImagingEuImaging )
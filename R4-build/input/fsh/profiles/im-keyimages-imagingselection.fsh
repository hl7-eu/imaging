Profile: ImKeyImagesSelection
Parent: ImImagingSelection
Id: im-keyimages-imaging-selection
Title: "Key images represented as an ImagingSelection"
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* extension contains 
    $artifact-title-url        named title 0..1 MS and
    $artifact-description-url  named description 0..1 MS
* extension[title]
  * insert SetPopulateIfKnown
* extension[description]
  * insert SetPopulateIfKnown

* bodySite 0..1 MS
  * insert SetPopulateIfKnown

* performer 0..* MS
* performer
  * insert SliceElement( #type, actor )
* performer contains performer 0..1 MS and device 0..1 MS
* performer[performer]
  * insert SetPopulateIfKnown
  * actor only Reference( ImPerformer )
* performer[device]
  * insert SetPopulateIfKnown
  * actor only Reference( ImImagingDevice )

// https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/Lookup-R5-ImagingSelection-R4.html

{{R5}}Profile: ImKeyImageImagingSelection
{{R5}}Parent: ImImagingSelection
{{R5}}Title: "ImagingSelection: Key Image"
{{R5}}Description: "Key images represented as an ImagingSelection"
{{R5}}* insert SetFmmAndStatusRule( 1, draft )
{{R5}}
{{R5}}* extension contains 
{{R5}}    $artifact-title-url        named title 0..1 and
{{R5}}    $artifact-description-url  named description 0..1
{{R5}}  
{{R5}}* performer
{{R5}}  * insert SliceElement( #type, actor )
{{R5}}* performer contains performer 0..1 and device 0..1
{{R5}}* performer[performer]
{{R5}}  * actor only Reference( $EuPractitionerRole )
{{R5}}* performer[device]
{{R5}}  * actor only Reference( ImImagingDevice )

{{R4}}Profile: ImKeyImageImagingSelection
{{R4}}Parent: ImImagingSelection
{{R4}}Title: "Key images represented as an ImagingSelection for R4"
{{R4}}Description: "Key images represented as an ImagingSelection for R4"
{{R4}}* insert SetFmmAndStatusRule( 1, draft )
{{R4}}
{{R4}}* extension contains 
{{R4}}    $artifact-title-url        named title 0..1 and
{{R4}}    $artifact-description-url  named description 0..1
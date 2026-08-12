// https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/Lookup-R5-ImagingSelection-R4.html

{{R56}}Profile: ImagingSelectionKeyImageEuImaging
{{R56}}Parent: ImagingSelectionEuImaging
{{R56}}Title: "ImagingSelection: Key Image"
{{R56}}Description: "Key images represented as an ImagingSelection"
{{R56}}* insert SetFmmAndStatusRule( 1, draft )
{{R56}}
{{R56}}* extension contains 
{{R56}}    $artifact-title-url        named title 0..1 and
{{R56}}    $artifact-description-url  named description 0..1
{{R56}}  
{{R56}}* performer
{{R56}}  * insert SliceElement( #type, actor )
{{R56}}* performer contains performer 0..1 and device 0..1
{{R56}}* performer[performer]
{{R56}}  * actor only Reference( $EuPractitionerRole )
{{R56}}* performer[device]
{{R56}}  * actor only Reference( DeviceEuImaging )

{{R4}}Profile: ImagingSelectionKeyImageEuImaging
{{R4}}Parent: ImagingSelectionEuImaging
{{R4}}Title: "Key images represented as an ImagingSelection for R4"
{{R4}}Description: "Key images represented as an ImagingSelection for R4"
{{R4}}* insert SetFmmAndStatusRule( 1, draft )
{{R4}}
{{R4}}* extension contains 
{{R4}}    $artifact-title-url        named title 0..1 and
{{R4}}    $artifact-description-url  named description 0..1
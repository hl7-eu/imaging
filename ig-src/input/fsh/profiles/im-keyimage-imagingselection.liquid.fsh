// https://hl7.org/fhir/uv/xver-r5.r4/0.1.0/StructureDefinition-profile-ImagingSelection.html

{{R5}}Profile: ImagingSelectionKeyImageEuImaging
{{R5}}Parent: ImagingSelectionEuImaging
{{R5}}Title: "ImagingSelection: Key Image"
{{R5}}Description: "Represents a key image by identifying DICOM selection data (study, series and instance). Use this profile when the key image is a reference to DICOM content rather than image content represented in a `DocumentReference`."
{{R5}}* insert SetFmmAndStatusRule( 1, draft )
{{R5}}
{{R5}}* extension contains 
{{R5}}    $artifact-title-url        named title 0..1 and
{{R5}}    $artifact-description-url  named description 0..1
{{R5}}  
{{R5}}* performer.function from ImagingStudyEuImagingPerformerTypeVS (extensible)
{{R5}}* performer
{{R5}}  * insert SliceElement( #value, function )
{{R5}}* performer contains pracRole 0..1 and device 0..1
{{R5}}* performer[pracRole]
{{R5}}  * function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PRF
{{R5}}  * actor only Reference( $EuPractitionerRole )
{{R5}}* performer[device]
{{R5}}  * function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#DEV
{{R5}}  * actor only Reference( DeviceEuImaging )

{{R4}}Profile: ImagingSelectionKeyImageEuImaging
{{R4}}Parent: ImagingSelectionEuImaging
{{R4}}Title: "Key images represented as an ImagingSelection for R4"
{{R4}}Description: "Represents a key image by identifying DICOM selection data (study, series and instance) for R4. Use this profile when the key image is a reference to DICOM content rather than image content represented in a `Media` resource."
{{R4}}* insert SetFmmAndStatusRule( 1, draft )
{{R4}}
{{R4}}* extension contains 
{{R4}}    $artifact-title-url        named title 0..1 and
{{R4}}    $artifact-description-url  named description 0..1

{{R4}}// Requires a SUSHI fix for reslicing an inherited named extension slice.
{{R4}}//* extension[performer]
{{R4}}//  * ^slicing.discriminator[0].type = #value
{{R4}}//  * ^slicing.discriminator[0].path = "url"
{{R4}}//  * ^slicing.discriminator[+].type = #pattern
{{R4}}//  * ^slicing.discriminator[=].path = "extension('function').value"
{{R4}}//  * ^slicing.rules = #open
{{R4}}//  * ^slicing.ordered = false
{{R4}}//* extension[performer] contains pracRole 0..1 and device 0..1
{{R4}}//* extension[performer][pracRole].extension[function].value[x] = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PRF
{{R4}}//* extension[performer][pracRole].extension[actor].value[x] only Reference($EuPractitionerRole)
{{R4}}//* extension[performer][device].extension[function].value[x] = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#DEV
{{R4}}//* extension[performer][device].extension[actor].value[x] only Reference(DeviceEuImaging)

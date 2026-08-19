{{R4}}Profile: MediaKeyImageEuImaging
{{R4}}Parent: Media
{{R4}}Title: "Media: Key Image"
{{R4}}Description: """Represents a key image for a patient as image content in an R4 `Media` resource. Use this profile to include or directly link the image (DICOM or non-DICOM); use `ImagingSelectionKeyImageEuImaging` when the key image is identified using DICOM selection data.\n
{{R4}}When the resource represents a DICOM artifact it SHALL contain the applicable DICOM identifier in the identifier element: the SOP Instance UID for a DICOM instance, the Series Instance UID for a DICOM series, and/or the Study Instance UID for a DICOM study. Such a resource MAY also reference an `ImagingSelectionKeyImageEuImaging` to indicate the DICOM source.
{{R4}}"""
{{R4}}* insert SetFmmAndStatusRule( 1, draft )
{{R4}}* status = #completed

{{R4}}* identifier
{{R4}}  * insert SliceElement( #value, type )
{{R4}}* identifier contains seriesInstanceUid 0..1 and sopClassInstanceUid 0..1 and studyInstanceUid 0..1
{{R4}}* identifier[sopClassInstanceUid]
{{R4}}  * type 1..1
{{R4}}  * type = MissingDicomTerminology#00080018
{{R4}}  * system 1..1
{{R4}}  * system = "urn:ietf:rfc:3986"
{{R4}}  * value 1..1
{{R4}}* identifier[seriesInstanceUid]
{{R4}}  * type 1..1
{{R4}}  * type = http://dicom.nema.org/resources/ontology/DCM#112002
{{R4}}  * system 1..1
{{R4}}  * value 1..1
{{R4}}* identifier[studyInstanceUid]
{{R4}}  * type 1..1
{{R4}}  * type = http://dicom.nema.org/resources/ontology/DCM#110180
{{R4}}  * system 1..1
{{R4}}  * value 1..1

{{R4}}* type from http://hl7.org/fhir/ValueSet/media-type (extensible)
{{R4}}* subject 1..1
{{R4}}* subject only Reference( $EuPatient )
{{R4}}* content 1..1
{{R4}}* content.contentType 1..1
{{R4}}* content.url 0..1

{{R5}}Profile: DocumentReferenceKeyImageEuImaging
{{R5}}Parent: $EuDocumentReference
{{R5}}Title: "DocumentReference: Key Image"
{{R5}}Description: """Represents a key image for a patient as image content in a `DocumentReference`. Use this profile to include or directly link the image (DICOM or non-DICOM); use `ImagingSelectionKeyImageEuImaging` when the key image is identified using DICOM selection data.\n
{{R5}}When referring to a DICOM image, the `DocumentReference.content.attachment.url` should be a WADO-URI. When referring to a non-DICOM image, the `DocumentReference.content.attachment.url` should be a direct URL to the image.\n
{{R5}}When the resource represents a DICOM artifact it SHALL contain the applicable DICOM identifier in the identifier element: the SOP Instance UID for a DICOM instance, the Series Instance UID for a DICOM series, and/or the Study Instance UID for a DICOM study. Such a resource MAY also reference an `ImagingSelectionKeyImageEuImaging` to indicate the DICOM source.
{{R5}}"""
{{R5}}* insert SetFmmAndStatusRule( 1, draft )

{{R5}}* identifier
{{R5}}  * insert SliceElement( #value, type )
{{R5}}* identifier contains seriesInstanceUid 0..1 and sopClassInstanceUid 0..1 and studyInstanceUid 0..1
{{R5}}* identifier[sopClassInstanceUid]
{{R5}}  * type 1..1
{{R5}}  * type = MissingDicomTerminology#00080018
{{R5}}  * system 1..1
{{R5}}  * system = "urn:ietf:rfc:3986"
{{R5}}  * value 1..1
{{R5}}* identifier[seriesInstanceUid]
{{R5}}  * type 1..1
{{R5}}  * type = http://dicom.nema.org/resources/ontology/DCM#112002
{{R5}}  * system 1..1
{{R5}}  * value 1..1
{{R5}}* identifier[studyInstanceUid]
{{R5}}  * type 1..1
{{R5}}  * type = http://dicom.nema.org/resources/ontology/DCM#110180
{{R5}}  * system 1..1
{{R5}}  * value 1..1

{{R5}}* basedOn
{{R5}}  * insert SliceElement( #type, $this )
{{R5}}* basedOn contains ServiceRequestOrderEuImagingaccession 0..1
{{R5}}* insert BasedOnServiceRequestOrderEuImagingReference( ServiceRequestOrderEuImagingaccession )
{{R5}}* modality 1..1

// type of image reference
{{R5}}* type from http://terminology.hl7.org/ValueSet/image-reference-type (preferred)

{{R5}}* category 1..*
{{R5}}  * insert SliceElement( #profile, $this )
{{R5}}* category contains imkeyimages 1..1
{{R5}}* category[imkeyimages]
{{R5}}  * coding
{{R5}}    insert SliceElement( #value, $this )
{{R5}}  * coding contains keyimagecode 1..1
{{R5}}  * coding[keyimagecode] = $loinc#55113-5 // "Key images Document Radiology"

  
{{R5}}* subject 1..1
{{R5}}* subject only Reference( $EuPatient )

{{R5}}* author
{{R5}}  * insert SliceElement( #profile, $this )
{{R5}}* author contains performer 0..*
{{R5}}* author[performer] only Reference( $EuPractitionerRole )
  
{{R5}}* content
{{R5}}  * attachment 1..1
{{R5}}* content
{{R5}}  * insert SliceElement( #value, [[extension.value]] )
{{R5}}* content contains
{{R5}}    thumbnail 0..1 and
{{R5}}    content 1..1
{{R5}}* content[thumbnail]
{{R5}}  * extension contains $document-reference-thumbnail-url named thumbnail 1..1
{{R5}}  * extension[thumbnail].valueBoolean = true
{{R5}}* content[content]
{{R5}}  * extension contains $document-reference-thumbnail-url named thumbnail 1..1
{{R5}}  * extension[thumbnail].valueBoolean = false
{{R5}}  * attachment 1..1
{{R5}}    * url 1..1
      
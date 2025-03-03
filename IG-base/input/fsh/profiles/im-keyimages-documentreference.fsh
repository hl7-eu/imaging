Profile: ImKeyImageDocumentReference
Parent: DocumentReference
Id: im-keyimages-document-reference
Title: "Imaging Key Image Document Reference"
Description: """A document containing key images for a patient. It can refer to a DICOM or non-DICOM image. When referring to a DICOM image, the DocumentReference.content.attachment.url should be a WADO-URI. When referring to a non-DICOM image, the DocumentReference.content.attachment.url should be a direct URL to the image.\n
When the resource represents a DICOM instance it SHALL contain a the SOP Instance UID in the identifier element. When the resource represents a DICOM series it SHALL contain the Series Instance UID in the identifier element. 
"""

* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* identifier MS
* identifier 
  * insert SliceElement( #value, $this )
* identifier contains seriesInstanceUid 0..1 MS and sopClassInstanceUid 0..1 MS
* identifier[seriesInstanceUid] 
  * type 1..1 MS 
  * type = MissingDicomTerminology#00080018
  * system 1..1 MS 
  * system = "urn:ietf:rfc:3986"
  * value 1..1 MS
* identifier[sopClassInstanceUid] 
  * type 1..1 MS
  * type = http://dicom.nema.org/resources/ontology/DCM#112002
  * system 1..1 MS 
  * system = "urn:ietf:rfc:3986"
  * value 1..1 MS

* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains imorderaccession 0..1 MS
* insert BasedOnImOrderReference( imorderaccession )

* status MS

* category 1..* MS
  * insert SliceElement( #profile, $this )
* category contains imkeyimages 1..1 MS
* category[imkeyimages]
  * coding
    insert SliceElement( #value, $this )
  * coding contains keyimagecode 1..1 MS
  * coding[keyimagecode] = $loinc#55113-5 "Imaging Key Images Document"

* modality 1..1 MS
  * insert SetPopulateIfKnown

* bodySite 0..1 MS
  * insert SetPopulateIfKnown

* subject 1..1 MS
  * insert SetPopulateIfKnown  
* subject only Reference( ImPatient )

* date MS
  * insert SetPopulateIfKnown

* author MS
  * insert SetPopulateIfKnown
  * insert SliceElement( #profile, $this )
* author contains performer 0..* MS
* author[performer] only Reference( ImPractitionerRole )

* description MS 
  * insert SetPopulateIfKnown

* content MS
  * attachment 1..1 MS
* content 
  * insert SliceElement( #value, [[extension.where( url = 'http://hl7.org/fhir/StructureDefinition/documentreference-thumbnail']] )
* content contains 
    thumbnail 0..1 MS and 
    content 1..1 MS
* content[thumbnail] 
  * extension contains $document-reference-thumbnail-url named thumbnail 1..1 MS
  * extension[thumbnail].valueBoolean = true
* content[content] 
  * insert SetPopulateIfKnown
  * extension contains $document-reference-thumbnail-url named thumbnail 1..1 MS
  * extension[thumbnail].valueBoolean = true
  * attachment 1..1 MS
    * insert SetPopulateIfKnown
    * contentType MS
      * insert SetPopulateIfKnown 
    * url 1..1 MS
      * insert SetPopulateIfKnown
    * title MS
      * insert SetPopulateIfKnown 
    * width MS
      * insert SetPopulateIfKnown
    * height MS
      * insert SetPopulateIfKnown
    * frames MS
      * insert SetPopulateIfKnown
    * duration MS
      * insert SetPopulateIfKnown


Profile: ImImagingStudy
Parent: ImagingStudy
Id: im-imagingstudy
Title: "ImagingStudy"
Description: """ 
This profile represents an imaging study instance.
"""
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity
* obeys im-imagingstudy-01

// reference to the order that has the Accession Number and including the Accession Number as identifier
* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains imorderaccession 0..1 MS
* insert BasedOnImOrderReference( imorderaccession )

* status MS
  * insert SetPopulateIfKnown

* identifier MS
  * insert SliceElement( #value, system )
* identifier contains studyInstanceUid 1..1 MS
* identifier[studyInstanceUid]
  * system MS
  * system = "urn:dicom:uid"
  * value 1.. MS

* description 0..1 MS
  * insert SetPopulateIfKnown


* endpoint 0..* MS  
  * insert SliceElement( #profile, $this )
* endpoint contains wado 0..1 MS and iid 0..1 MS
* endpoint[wado] only Reference( ImWadoEndpoint )
* endpoint[iid] only Reference( ImImageIidViewerEndpoint )

* series MS
  * performer 0..1 MS
    * insert SliceElement( #type, actor )
  * performer contains performer 0..1 MS and device 0..1 MS and custodian 0..1 MS
  * performer[performer]
    * insert SetPopulateIfKnown
    * actor only Reference( ImPractitionerRole )
  * performer[custodian]
    * insert SetPopulateIfKnown
    * actor only Reference( ImOrganization )
  * performer[device]
    * insert SetPopulateIfKnown
    * actor only Reference( ImImagingDevice )
  * uid 1..1 MS
  * description 0..1 MS
  * modality 1..1 MS
  * number 0..1 MS
    
  * endpoint 0..* MS  
    * insert SliceElement( #profile, $this )
  * endpoint contains wado 0..1 MS and iid 0..1 MS
  * endpoint[wado] only Reference( ImWadoEndpoint )
  * endpoint[iid] only Reference( ImImageIidViewerEndpoint )
  
  * instance MS
    * uid 1..1 MS
    * sopClass 1..1 MS
    * number 0..1 MS

* subject 1..1 MS
* subject only Reference(ImPatient)

Invariant: im-imagingstudy-01
Description: "A DICOM instance UID must start with 'urn:oid:'"
Severity: #warning
Expression: "identifier.where(system='urn:dicom:uid').value.startsWith('urn:oid:')"
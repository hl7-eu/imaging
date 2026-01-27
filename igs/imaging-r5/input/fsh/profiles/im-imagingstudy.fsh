Profile: ImagingStudyEuImaging
Parent: ImagingStudy
Title: "ImagingStudy: General"
Description: """ 
This profile represents an imaging study instance.
"""
* insert SetFmmAndStatusRule( 1, draft )
* obeys im-imagingstudy-01

* extension contains
  $workflow-status-reason-url named status-reason 0..1

* identifier
  * insert SliceElement( #value, system )
* identifier contains studyInstanceUid 1..1
* identifier[studyInstanceUid] only StudyInstanceUidIdentifierEuImaging

* subject 1..1
* subject only Reference( $EuPatient or $EuDevice )

// reference to the order that has the Accession Number and including the Accession Number as identifier
* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains ServiceRequestOrderEuImagingaccession 0..1
* insert BasedOnServiceRequestOrderEuImagingReference( ServiceRequestOrderEuImagingaccession )

// * insert EndpointTypes 

* series

// bodySite profiling to require one or more AnatomicalRegion code
  * bodySite only BodysiteCodeableReferenceEuImaging
//R4  * bodySite
//R4    * extension contains AnatomicalRegion named anatomical-region 1..1
   
  * performer.function from ImagingStudyEuImagingPerformerTypeVS (extensible)
  * performer
    * insert SliceElement( #value, function )
  * performer contains performer 0..1 and device 0..1 and custodian 0..1 and organization 0..1
  * performer[performer]
    * ^short = "The practitioner/device/organization that preformed the imaging."
    * ^definition = "The performer of the series. Device or Organization SHALL only be used when a practitioner is not involved in the imaging acquisition or the practitioner is not known."
    * function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PRF
    * actor only Reference( $EuPractitionerRole or $EuDevice or $EuOrganization )
  * performer[custodian]
    * ^short = "The custodian of the report."
    * function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CST
    * actor only Reference( $EuOrganization )
  * performer[device]
    * ^short = "The device that did the imaging."
    * function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#DEV
    * actor only Reference( DeviceEuImaging )
  * performer[organization]
    * ^short = "The organization representing the location where the imaging was performed."
    * function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#LOC
    * actor only Reference( $EuOrganization ) 

  // * insert EndpointTypes 

  * instance
    * extension contains 
      ImagingStudyEuImagingInstanceDescription named instance-description 0..1 and
      NumberOfFrames named number-of-frames 0..1

Extension: ImagingStudyEuImagingInstanceDescription
Title: "Extension: Instance Description"
Description: "A description of the instance in an ImagingStudy."
Context: ImagingStudy.series.instance
* insert SetFmmAndStatusRule( 1, draft )
* value[x] only string

Extension: NumberOfFrames
Title: "Extension: Number of Frames"
Description: "The number of frames in an ImagingStudy instance as required by Xt-EHR logical ImagingStudy logical model."
Context: ImagingStudy.series.instance
* insert SetFmmAndStatusRule( 1, draft )
* value[x] only integer

Extension: AnatomicalRegion
Title: "Extension: Anatomical Region"
Description: "The anatomical region in an ImagingStudy instance. This is additional information next to ImagingStudy.series.bodySite."
Context: Coding
* insert SetFmmAndStatusRule( 1, draft )
* value[x] only BodysiteCodeableConceptEuImaging

Profile: BodysiteCodeableConceptEuImaging
Parent: CodeableConcept
Title: "CodeableConcept: ImagingStudy body site"
Description: "This profile represents a `CodeableConcept` requirement for ImagingStudy body sites. "
* insert SetFmmAndStatusRule( 1, draft )
* coding
  * insert SliceElement( #value, $this )
* coding contains anatomical-region 1..*
* coding[anatomical-region] from AnatomicalRegionVs (required)
  

Profile: BodysiteCodeableReferenceEuImaging
Parent: CodeableReference
Title: "ImagingStudy: General"
Description: "This profile represents an imaging study instance."
* insert SetFmmAndStatusRule( 1, draft )
* concept 1..1
* concept only BodysiteCodeableConceptEuImaging


Invariant: im-imagingstudy-01
Description: "A DICOM instance UID must start with 'urn:oid:'"
Severity: #warning
Expression: "identifier.where(system='urn:dicom:uid').value.startsWith('urn:oid:')"

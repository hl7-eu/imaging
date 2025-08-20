Profile: ImImagingStudy
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
* identifier[studyInstanceUid] only ImStudyInstanceUidIdentifier

* subject 1..1
* subject only Reference( $EuPatient or $EuDevice )

// reference to the order that has the Accession Number and including the Accession Number as identifier
* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains imorderaccession 0..1
* insert BasedOnImOrderReference( imorderaccession )

* insert EndpointTypes 

* series
  * performer.function from ImImagingStudyPerformerTypeVS (extensible)
  * performer
    * insert SliceElement( #type, actor )
  * performer contains performer 0..1 and device 0..1 and custodian 0..1 and organization 0..1
  * performer[performer]
    * function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PRF
    * actor only Reference( $EuPractitionerRole )
  * performer[custodian]
    * function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CST
    * actor only Reference( $EuOrganization )
  * performer[device]
    * function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#DEV
    * actor only Reference( ImImagingDevice )
  * performer[organization]
    * function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#DEV
    * actor only Reference( $EuOrganization ) 

  * insert EndpointTypes 

  * instance
    * extension contains 
      ImImagingStudyInstanceDescription named instance-description 0..1 and
      NumberOfFrames named number-of-frames 0..1

Extension: ImImagingStudyInstanceDescription
Id: instance-description
Title: "Instance Description"
Description: "A description of the instance in an ImagingStudy."
Context: ImagingStudy.series.instance
* value[x] only string

Extension: NumberOfFrames
Id: number-of-frames
Title: "Number of Frames"
Description: "The number of frames in an ImagingStudy instance as required by Xt-EHR logical ImagingStudy logical model."
Context: ImagingStudy.series.instance
* value[x] only integer

Invariant: im-imagingstudy-01
Description: "A DICOM instance UID must start with 'urn:oid:'"
Severity: #warning
Expression: "identifier.where(system='urn:dicom:uid').value.startsWith('urn:oid:')"

RuleSet: EndpointTypes
* endpoint 0..*  
  * insert SliceElement( #profile, $this )
* endpoint contains wado 0..1 and iid 0..1
* endpoint[wado] only Reference( ImWadoEndpoint )
* endpoint[iid] only Reference( ImImageIidViewerEndpoint )
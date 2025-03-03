Logical: MedicalImagingReportOrderMediaEhn
Id: ehn-medical-imaging-report-order-media
Title: "A.6 Key images associated with this report"
Description: "Key images associated with this report"
* insert SetFmmAndStatusRule( 2, informative)
* view 0..1 string "A.6.1 View" """
  The name of the imaging view e.g. Lateral or Antero-posterior (AP).
  """
* bodyLocation 0..1 CodeableConcept "A.6.2 Body location" """
  Anatomic location (body location, laterality) where the material is collected, e.g. Elbow, left. SNOMED CT
  """
* mediaType 0..1 CodeableConcept "A.6.3 Media type" """
  Classification of media as image, video, or audio. hl7:media-type
  """
* modality 0..1 CodeableConcept "A.6.4 Modality" """
  The type of acquisition equipment/process. This element is relevant for the interactive selection of the available studies. DICOM Modality
  """
* device 0..1 CodeableConcept "A.6.5 Device" """
  The device used to perform an imaging study. SNOMED CT, EMDN
  """
* format 0..1 string "A.6.6 Format" """
  Height, width, and number of frames of the image in pixels (photo/video). UCUM
  """
* duration 0..1 string "A.6.7 Duration" """
  The duration of the recording in seconds - for audio and video. UCUM
  """
* performer 0..1 Base "A.6.8 Performer" """
  Identifies the performer of the imaging acquisition process. 
  Performer may include: performer identifier, performer name, performer type, performer medical specialty, performer organization, and performer contact details.
  """
  * performerId 0..1 Identifier "A.6.8.1 Performer Id" """
    Performer identifier unique within a given context (namespace). Either an internal identifier assigned by a healthcare provider institution or (preferably) a national health professional ID such as the license or registration number.
    """
  * performerName 0..* HumanName "A.6.8.2 Performer Name" """
    Person name.
    """
  * performerType 0..1 CodeableConcept "A.6.8.3 Performer Type" """
    Type of performer (e.g., radiologist, technician).
    """
  * performerMedicalSpecialty 0..1 CodeableConcept "A.6.8.4 Performer Medical Specialty" """
    Medical specialty of the performer. SNOMED CT
    """
  * performerOrganization 0..1 string "A.6.8.5 Performer Organization" """
    The healthcare provider organization information.
    """
  * performerContactDetails 0..1 ContactPoint "A.6.8.6 Performer Contact Details" """
    Contact details of the performer (address and telecom details).
    """
* comment 0..1 string "A.6.9 Comment" """
  A comment about the image. Typically, this is used to provide an explanation for why the image is included, or to draw the viewer's attention to important features.
  """
* content 0..* Attachment "A.6.10 Content" """
  The actual Media, such as selected key image data inline or a reference. Consider FHIR Attachment resource.
  """

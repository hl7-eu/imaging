Logical: ImagingStudyManifestDataSetEhn
Id: ehn-imaging-study-manifest-dataset
Title: "B Imaging study manifest data set (eHN)"
Description: """The data set defines the contents of the key information about the imaging study as conveyed by the imaging study manifest data set. 
The imaging study manifest contains key information about the imaging study that is referenced, including the “pointers” that allow 
access to the series of images.
It is important to note that the metadata used in expressing the filters associated with the querying for a list of imaging studies and/or 
imaging reports are defined in Section 2 Article 10: Selection List and filtering Parameters. These parameters are expressed as coded 
values from standardised value sets to ensure a robust search for a list of relevant imaging studies. Such metadata filtering parameters 
are associated with imaging studies, but may not be present in the content of the imaging study manifest.
"""
* insert SetFmmAndStatusRule( 2, informative)
* manifest 0..1 Base "B.1 Imaging study Manifest Dataset"
  * studyInstanceUid 0..1 id "B.1.1 Study instance UID" """
  Globally unique identifier of the study. If one or more series elements are 
  present in the Imaging Study, then there shall be one DICOM Study UID 
  identifier.
  This element is relevant for the interactive selection of the available studies.
  """
  * description 0..1 string "B.1.2 Description" """
  The Imaging Manager description of the study. Institution-generated description 
  or classification of the Study (component) performed.
  This element is relevant for the interactive selection of the available studies, 
  preferably in English.
  """
  * studyCustodian 0..1 Base "B.1.3 Study custodian" """
  Organisation name, address, and contact information.
  """
    * organizationName 0..1 string "B.1.3.1 Organization name" """
        Name of the organization responsible for the study.
        """
    * address 0..1 Address "B.1.3.2 Address" """
        Address of the organization.
        """
    * contact 0..1 ContactPoint "B.1.3.3 Contact information" """
        Contact information of the organization.
        """
* series 0..* Base "B.1.4 List of Series" """
  Note: The number of series in an imaging study is derived by counting the number of items in the list of series.
  """
  * seriesDescription 0..1 string "B.1.4.1 Series Description" """
    For each imaging Study Series includes descriptive information about the series 
    (e.g. phase). This element is relevant for the interactive selection of the available 
    studies.
    """
  * seriesInstanceUid 0..1 id "B.1.4.2 Series Unique Identifier" """
    A globally Unique ID for the series. All images belonging to such a series will bear 
    this element.
    This element is relevant for the interactive selection of a specific series within an 
    available study.
    """
  * modality 0..1 CodeableConcept "B.1.4.3 Modality" """
    The acquisition modality (acquire on a patient) or technical modality (computer 
    generated instance such as a presentation state) associated with the images of 
    the series.
    """
  * radiationDoseInformation 0..1 string "B.1.4.4 Radiation dose information" """
    Kerma area product (KAP), Total KAP, Kerma at the end of tube (dental X-ray), 
    Thickness of breast for the calculation of Average absorbed breast dose. Further 
    work is needed to refine this definition of dose data in the imaging study 
    manifest. The presence of the dose management reports within the imaging 
    study as standardized by DICOM may be an alternative to consider in later 
    revision of this guideline.
    """
  * otherSeriesInformation 0..1 Base "B.1.4.5 Other series information" """Imaging Series information such as series number.""" 
    * seriesNumber 0..1 integer "Series Number" """
      Number of the series.
      """
    * other 0..* string "Other" """
      Other information about the series.
      """
  * seriesEndpoint 0..1 Endpoint "B.1.4.6 Series endpoint" """  
    An endpoint describes the technical details of a location that can be connected 
    to for the delivery/retrieval of imaging information. Sufficient information is 
    required to ensure that a connection can be made securely, and appropriate 
    data transmitted as defined by the endpoint owner. These may be locally hosted 
    services, regional services, or national services.  
    """
  * instance 0..* Base "B.1.4.7 List of Instances in the series" """  
    List of Instances in the series
    Note: The number of instances in a series is derived by counting the number of instances in the present list.
    """
    * instanceGlobalUid 0..1 id "B.1.4.7.1 Instance Globally Unique Identifier" """ 
      Unique Identifier for the image instance 
      """
    * instanceClassUid 0..1 id "B.1.4.7.2 Instance Class Globally Unique Identifier" """
      Unique identifier for the class of image instance
      """
    * instanceNumber 0..1 integer "B.1.4.7.3 Instance Number" """
      Integer assigned to an image by the acquisition modality.
      """

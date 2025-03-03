Instance: B-ImagingstudyMnifestDataset 
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of B Imaging study manifest data set "
Description: """Maps the B Imaging study manifest data set  section of the eHN Medical Imaging Report to the FHIR profiles.
"""
* name = "B"
* title = "B Comparison Study"
* status = #draft
* experimental = true
* description = """
This concept map defines the mapping between the eHN B Comparison Study section and the FHIR profiles.
"""
* sourceScopeUri = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-imaging-study-manifest-dataset"

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-imaging-study-manifest-dataset"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-imagingstudy" 
  // * insert ElementMapping( #manifest, "B.1 Imaging study Manifest Dataset"                         , #ImImagingStudy, "", #equivalent )
  * insert ElementMapping( #studyInstanceUid, "B.1.1 Study instance UID"                           , #identifier[studyInstanceUid], "", #equivalent )
  * insert ElementMapping( #description, "B.1.2 Description"                                       , #description, "", #equivalent )
  * insert ElementMapping( #studyCustodian, "B.1.3 Study custodian"                                , #performer[custodian].actor, "", #equivalent )
  * insert ElementMapping( #organizationName, "B.1.3.1 Organization name"                          , #performer[custodian].actor->name, "", #equivalent )
  * insert ElementMapping( #address, "B.1.3.2 Address"                                             , #performer[custodian].actor->address, "", #equivalent )
  * insert ElementMapping( #contact, "B.1.3.3 Contact information"                                 , #performer[custodian].actor->telecom, "", #equivalent )
  * insert ElementMapping( #series, "B.1.4 List of Series"                                         , #series, "", #equivalent )
  * insert ElementMapping( #seriesDescription, "B.1.4.1 Series Description"                        , #series.description, "", #equivalent )
  * insert ElementMapping( #seriesInstanceUid, "B.1.4.2 Series Unique Identifier"                  , #series.uid, "", #equivalent )
  * insert ElementMapping( #modality, "B.1.4.3 Modality"                                           , #series.modality, "", #equivalent )
  // * insert ElementMapping( #radiationDoseInformation, "B.1.4.4 Radiation dose information"         , #series, "", #equivalent )
  // * insert ElementMapping( #otherSeriesInformation, "B.1.4.5 Other series information"             , #series.number, "", #equivalent )
  * insert ElementMapping( #seriesNumber, "B.1.4.5.1 Series Number"                                , #series.number, "", #equivalent )
  * insert ElementMapping( #seriesEndpoint, "B.1.4.6 Series endpoint"                              , #endpoint, "", #equivalent )
  * insert ElementMapping( #seriesEndpoint, "B.1.4.6 Series endpoint"                              , #series.endpoint, "", #equivalent )
  * insert ElementMapping( #instance, "B.1.4.7 List of Instances in the series"                    , #series.instance, "", #equivalent )
  * insert ElementMapping( #instanceGlobalUid, "B.1.4.7.1 Instance Globally Unique Identifier"     , #series.instance.uid, "", #equivalent )
  * insert ElementMapping( #instanceClassUid, "B.1.4.7.2 Instance Class Globally Unique Identifier", #series.instance.sopClass, "", #equivalent )
  * insert ElementMapping( #instanceNumber, "B.1.4.7.3 Instance Number"                            , #series.instance.number, "", #equivalent )

  
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-imaging-study-manifest-dataset"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-radiation-dose-information" 
  // * insert ElementMapping( #manifest, "B.1 Imaging study Manifest Dataset"                         , #ImImagingStudy, "", #equivalent )
  // * insert ElementMapping( #studyInstanceUid, "B.1.1 Study instance UID"                           , #identifier[studyInstanceUid], "", #equivalent )
  // * insert ElementMapping( #description, "B.1.2 Description"                                       , #description, "", #equivalent )
  // * insert ElementMapping( #studyCustodian, "B.1.3 Study custodian"                                , #performer[custodian].actor, "", #equivalent )
  // * insert ElementMapping( #organizationName, "B.1.3.1 Organization name"                          , #performer[custodian].actor->organization, "", #equivalent )
  // * insert ElementMapping( #address, "B.1.3.2 Address", #performer                                 , #performer[custodian].actor->practitioner.address, "", #equivalent )
  // * insert ElementMapping( #contact, "B.1.3.3 Contact information"                                 , #performer[custodian].actor->practitioner.telecom, "", #equivalent )
  // * insert ElementMapping( #series, "B.1.4 List of Series", #series                                , #series, "", #equivalent )
  // * insert ElementMapping( #seriesDescription, "B.1.4.1 Series Description"                        , #series.description, "", #equivalent )
  // * insert ElementMapping( #seriesInstanceUid, "B.1.4.2 Series Unique Identifier"                  , #series.uid, "", #equivalent )
  // * insert ElementMapping( #modality, "B.1.4.3 Modality", #series, ""                              , #series.modality, "", #equivalent )
  * insert ElementMapping( #radiationDoseInformation, "B.1.4.4 Radiation dose information" , #code, "Code the radiation dose.", #equivalent )
  * insert ElementMapping( #radiationDoseInformation, "B.1.4.4 Radiation dose information" , #valueQuantity, "Dose value.", #equivalent )
  // * insert ElementMapping( #otherSeriesInformation, "B.1.4.5 Other series information"             , #series.number, "", #equivalent )
  // * insert ElementMapping( #seriesNumber, "B.1.4.5.1 Series Number"                                , #series.number, "", #equivalent )
  // * insert ElementMapping( #seriesEndpoint, "B.1.4.6 Series endpoint"                              , #endpoint, "", #equivalent )
  // * insert ElementMapping( #seriesEndpoint, "B.1.4.6 Series endpoint"                              , #series.endpoint, "", #equivalent )
  // * insert ElementMapping( #instance, "B.1.4.7 List of Instances in the series"                    , #series.instance, "", #equivalent )
  // * insert ElementMapping( #instanceGlobalUid, "B.1.4.7.1 Instance Globally Unique Identifier"     , #series.instance.uid, "", #equivalent )
  // * insert ElementMapping( #instanceClassUid, "B.1.4.7.2 Instance Class Globally Unique Identifier", #series.instance.sopClass, "", #equivalent )
  // * insert ElementMapping( #instanceNumber, "B.1.4.7.3 Instance Number"                            , #series.instance.number, "", #equivalent )
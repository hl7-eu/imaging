Instance: ImagingStudStructuredReport
InstanceOf: ImagingStudyEuImaging
Title: "ImagingStudy: structured-report study"
Description: "Transthoracic echocardiogram for 3D TEE 2D"
Usage: #example
* identifier[studyInstanceUid]
  * type = http://dicom.nema.org/resources/ontology/DCM#110180 "Study Instance UID"
  * system = "urn:dicom:uid"
  * value = "urn:oid:1.3.46.670589.58.10.10562925256214266678.11674839624289915183" // invented - not there in the report
* basedOn[ServiceRequestOrderEuImagingaccession]
  * identifier
    * type
      * coding[+][v2-0203-coding] = $v2-0203#ACSN 
      * coding[+][dcm] = http://dicom.nema.org/resources/ontology/DCM#121022 "Accession Number"
    * system = "http://example.org/myhosptital/accessionsystem"
    * value  = "87654321" // invented - not there in the report
* modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
* extension[anatomical-region].valueCodeableConcept.coding = $sct#67734004 "Upper trunk"
* status = #available
* subject = Reference(PatientStructuredReport)
* started = "2025-04-29"
* series[+]
  * uid = "1.3.46.670589.58.10.10562925256214266678.11674839624289915183.1" // invented - not there in the report
  * number = 1
  * modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"

  * description = "Stress"
  * bodySite = $sct#67734004
  //R5* bodySite.concept = $sct#67734004
  * performer[custodian].actor = Reference(OrganizationStructuredReport)
  * performer[organization].actor = Reference(OrganizationStructuredReport)
* series[+]
  * uid = "1.3.46.670589.58.10.10562925256214266678.11674839624289915183.2" // invented - not there in the report
  * number = 2
  * modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"

  * description = "Rest"
  * bodySite = $sct#80891009 "Heart structure (body structure)"
  //R5* bodySite.concept = $sct#80891009 "Heart structure (body structure)"
  * performer[custodian].actor = Reference(OrganizationStructuredReport)
  * performer[organization].actor = Reference(OrganizationStructuredReport)

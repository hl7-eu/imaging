Instance: ImagingStudStructuredReport
InstanceOf: ImagingStudyEuImaging
Title: "ImagingStudy: structured-report study"
Description: "Transthoracic echocardiogram for 3D TEE 2D"
Usage: #example
* identifier[studyInstanceUid]
  * type = MissingDicomTerminology#0020000D "Study Instance UID" 
  * system = "urn:dicom:uid"
  * value = "urn:oid:1.3.46.670589.58.10.10562925256214266678.11674839624289915183" // invented - not there in the report
* basedOn[ServiceRequestOrderEuImagingaccession]
  * identifier
    * type   = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
    * system = "http://example.org/myhosptital/accessionsystem"
    * value  = "87654321" // invented - not there in the report
* modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
* extension[anatomical-region].valueCodeableConcept.coding = $sct#67734004 "Upper trunk"
* status = #available
* subject.reference = "urn:uuid:11111111-2222-4333-8444-000000000003"
* started = "2025-04-29"
* series[+]
  * uid = "1.3.46.670589.58.10.10562925256214266678.11674839624289915183.1" // invented - not there in the report
  * number = 1
  * modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"

  * description = "Stress"
  * bodySite = $sct#67734004
  //R5* bodySite.concept = $sct#67734004
  * performer[custodian].actor.reference = "urn:uuid:11111111-2222-4333-8444-000000000007"
  * performer[organization].actor.reference = "urn:uuid:11111111-2222-4333-8444-000000000007"
* series[+]
  * uid = "1.3.46.670589.58.10.10562925256214266678.11674839624289915183.2" // invented - not there in the report
  * number = 2
  * modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"

  * description = "Rest"
  * bodySite = $sct#80891009 "Heart structure (body structure)"
  //R5* bodySite.concept = $sct#80891009 "Heart structure (body structure)"
  * performer[custodian].actor.reference = "urn:uuid:11111111-2222-4333-8444-000000000007"
  * performer[organization].actor.reference = "urn:uuid:11111111-2222-4333-8444-000000000007"

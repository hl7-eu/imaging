Instance: ImagingStudySemiStructuredReport1
InstanceOf: ImagingStudyEuImaging
Title: "ImagingStudy: semi-structured report 1"
Description: "Example ImagingStudy showing an MRI for the left foot"
Usage: #example
* identifier[studyInstanceUid]
  * type = MissingDicomTerminology#0020000D "Study Instance UID" 
  * system = "urn:dicom:uid"
  * value = "urn:oid:1.2.276.2000010.784732" // invented - not there in the report
* basedOn[ServiceRequestOrderEuImagingaccession]
  * identifier
    * system = "http://example.org/myhosptital/accessionsystem"
    * type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN 
    * value = "123456789" // invented - not there in the report
* modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
* status = #available
* subject = Reference( PatientSemiStructuredReport)
* started = "2025-04-29"
* series[+]
  * uid = "1.2.276.2000010.784732.1" // invented - not there in the report
  * number = 1
  * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
  * description = "PD FatSat 3D (1.0mm) sagittal"
  * bodySite = $sct#239919000 "Entire left foot (body structure)"	
  * performer[custodian].actor = Reference( OrganizationSemiStructuredReport )
  * performer[organization].actor = Reference( OrganizationSemiStructuredReport )
  * laterality = $sct#7771000 "Left lateral"
  

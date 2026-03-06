Instance: ImagingStudySemiStructuredReport2
InstanceOf: ImagingStudyEuImaging
Title: "ImagingStudy: semi-structured report 2"
Description: "Example ImagingStudy showing an MRI for the right foot"
Usage: #example
* identifier[studyInstanceUid]
  * type = http://dicom.nema.org/resources/ontology/DCM#110180 "Study Instance UID"
  * system = "urn:dicom:uid"
  * value = "urn:oid:1.2.276.2000010.784733" // invented - not there in the report
* basedOn[ServiceRequestOrderEuImagingaccession]
  * identifier
    * system = "http://example.org/myhosptital/accessionsystem"
    * type
      * coding[+][v2-0203-coding] = $v2-0203#ACSN 
      * coding[+][dcm] = http://dicom.nema.org/resources/ontology/DCM#121022 "Accession Number"
    * value = "123456789" // invented - not there in the report
* extension[anatomical-region].valueCodeableConcept.coding = $sct#61685007 "Lower extremity"
* modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
* status = #available
* subject.reference = "urn:uuid:907c9bcf-94b5-4243-88ba-6f85ffec4bc8"
* started = "2025-04-29"
* series[+]
  * uid = "1.2.276.2000010.784733.1" // invented - not there in the report
  * number = 1
  * description = "PD FatSat 3D (1.0mm) sagittal"
  * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
  * bodySite = $sct#239830003 "Entire right foot (body structure)"	
  * laterality = $sct#7771000 "Left lateral"
  * performer[custodian].actor.reference = "urn:uuid:d6f6db53-9e8b-4b5a-9ccc-b06ad4b62d4b"
  * performer[organization].actor.reference = "urn:uuid:d6f6db53-9e8b-4b5a-9ccc-b06ad4b62d4b"
* series[+]
  * uid = "1.2.276.2000010.784733.2" // invented - not there in the report
  * number = 2
  * description = "T1 (2.5mm) axial"
  * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
  * bodySite = $sct#239830003 "Entire right foot (body structure)"	
  * laterality = $sct#24028007 "Right lateral"
  * performer[custodian].actor.reference = "urn:uuid:d6f6db53-9e8b-4b5a-9ccc-b06ad4b62d4b"
  * performer[organization].actor.reference = "urn:uuid:d6f6db53-9e8b-4b5a-9ccc-b06ad4b62d4b"
  

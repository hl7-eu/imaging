Instance: ImagingStudySemiStructuredReport2
InstanceOf: ImagingStudyEuImaging
Title: "ImagingStudy: semi-structured report"
Description: "Example ImagingStudy showing an MRI for the right foot"
Usage: #example
* identifier[studyInstanceUid]
  * type = MissingDicomTerminology#0020000D "Study Instance UID" 
  * system = "urn:dicom:uid"
  * value = "urn:oid:1.2.276.2000010.784733" // invented - not there in the report
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
  * uid = "1.2.276.2000010.784733.1" // invented - not there in the report
  * number = 1
  * description = "PD FatSat 3D (1.0mm) sagittal"
  * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
{{R4}}  * bodySite = 
{{R5}}  * bodySite.concept = 
            $sct#239919000 "Entire left foot (body structure)"	
  * laterality = $sct#7771000 "Left lateral"
  * performer[custodian].actor = Reference( OrganizationSemiStructuredReport )
  * performer[organization].actor = Reference( OrganizationSemiStructuredReport )
* series[+]
  * uid = "1.2.276.2000010.784733.2" // invented - not there in the report
  * number = 2
  * description = "T1 (2.5mm) axial"
  * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
{{R4}}  * bodySite = 
{{R5}}  * bodySite.concept = 
        $sct#239919000 "Entire left foot (body structure)"	
  * laterality = $sct#7771000 "Left lateral"
  * performer[custodian].actor = Reference( OrganizationSemiStructuredReport )
  * performer[organization].actor = Reference( OrganizationSemiStructuredReport )
* series[+]
  * uid = "1.2.276.2000010.784733.3" // invented - not there in the report
  * number = 3
  * description = "T2 (2.5mm) axial"
  * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
{{R4}}  * bodySite = 
{{R5}}  * bodySite.concept = 
        $sct#239919000 "Entire left foot (body structure)"	
  * laterality = $sct#7771000 "Left lateral"
  * performer[custodian].actor = Reference( OrganizationSemiStructuredReport )
  * performer[organization].actor = Reference( OrganizationSemiStructuredReport )
* series[+]
  * uid = "1.2.276.2000010.784733.4" // invented - not there in the report
  * number = 4
  * description = "PDW FatSat (2.5mm) axial"
  * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
{{R4}}  * bodySite = 
{{R5}}  * bodySite.concept = 
        $sct#239919000 "Entire left foot (body structure)"	
  * laterality = $sct#7771000 "Left lateral"
  * performer[custodian].actor = Reference( OrganizationSemiStructuredReport )
  * performer[organization].actor = Reference( OrganizationSemiStructuredReport )

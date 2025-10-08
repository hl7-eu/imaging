

// Instance: BinarySemiStructuredReport
// InstanceOf: Binary
// Title: "Binary: Unstructured report pdf"
// * id = "semi-structured-pdf"
// * contentType = #application/pdf
// * data = "ig-loader-75a08e62-1c93-47d0-ab7e-46f6524fa73b.pdf"

// // //////////////////////////////////////////////////////////////////////////////////////////////////

// Instance: PatientSemiStructuredReport
// InstanceOf: $EuPatient 
// Title: "Example of a Patient"
// // Usage: #inline
// * name
//   * use = #official
//   * text = "Frau GuteFrage Test-Schusti"
//   * family = "Test-Schusti"
//   * given = "GuteFrage"
// * birthDate = "1976-04-29"

// // //////////////////////////////////////////////////////////////////////////////////////////////////

// Instance: ImagingStudySemiStructuredReport1
// InstanceOf: ImImagingStudy
// Title: "ImagingStudy for the left/right foot"
// Description: "Example ImagingStudy showing an MRI for the left foot"
// Usage: #example
// * identifier[studyInstanceUid]
//   * type = MissingDicomTerminology#0020000D "Study Instance UID" 
//   * system = "urn:dicom:uid"
//   * value = "urn:oid:1.2.276.2000010.784732" // invented - not there in the report
// * basedOn[imorderaccession]
//   * identifier
//     * system = "http://example.org/myhosptital/accessionsystem"
//     * type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN 
//     * value = "123456789" // invented - not there in the report
// * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
// * status = #available
// * subject = Reference( PatientSemiStructuredReport)
// * started = "2025-04-29"
// * series[+]
//   * uid = "1.2.276.2000010.784732.1" // invented - not there in the report
//   * number = 1
//   * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
//   * description = "PD FatSat 3D (1.0mm) sagittal"
//   * bodySite.concept = $sct#239919000 "Entire left foot (body structure)"	
//   * laterality = $sct#7771000 "Left lateral"
//   * performer[custodian].actor = Reference( OrganizationSemiStructuredReport )
//   * performer[organization].actor = Reference( OrganizationSemiStructuredReport )
// * series[+]
//   * uid = "1.2.276.2000010.784732.2" // invented - not there in the report
//   * number = 2
//   * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
//   * description = "T1 (2.5mm) axial"
//   * bodySite.concept = $sct#239919000 "Entire left foot (body structure)"	
//   * laterality = $sct#7771000 "Left lateral"
//   * performer[custodian].actor = Reference( OrganizationSemiStructuredReport )
//   * performer[organization].actor = Reference( OrganizationSemiStructuredReport )
// * series[+]
//   * uid = "1.2.276.2000010.784732.3" // invented - not there in the report
//   * number = 3
//   * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
//   * description = "T2 (2.5mm) axial"
//   * bodySite.concept = $sct#239919000 "Entire left foot (body structure)"	
//   * laterality = $sct#7771000 "Left lateral"
//   * performer[custodian].actor = Reference( OrganizationSemiStructuredReport )
//   * performer[organization].actor = Reference( OrganizationSemiStructuredReport )
// * series[+]
//   * uid = "1.2.276.2000010.784732.4" // invented - not there in the report
//   * number = 4
//   * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
//   * description = "PDW FatSat (2.5mm) axial"
//   * bodySite.concept = $sct#239919000 "Entire left foot (body structure)"	
//   * laterality = $sct#7771000 "Left lateral"
//   * performer[custodian].actor = Reference( OrganizationSemiStructuredReport )
//   * performer[organization].actor = Reference( OrganizationSemiStructuredReport )
  
// //////////////////////////////////////////////////////////////////////////////////////////////////////////

// Instance: ImagingStudySemiStructuredReport2
// InstanceOf: ImImagingStudy
// Description: "ImagingStudy for the right foot"
// // Usage: #inline
// * identifier[studyInstanceUid]
//   * type = MissingDicomTerminology#0020000D "Study Instance UID" 
//   * system = "urn:dicom:uid"
//   * value = "urn:oid:1.2.276.2000010.784733" // invented - not there in the report
// * basedOn[imorderaccession]
//   * identifier
//     * system = "http://example.org/myhosptital/accessionsystem"
//     * type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN 
//     * value = "123456789" // invented - not there in the report
// * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
// * status = #available
// * subject = Reference( PatientSemiStructuredReport)
// * started = "2025-04-29"
// * series[+]
//   * uid = "1.2.276.2000010.784733.1" // invented - not there in the report
//   * number = 1
//   * description = "PD FatSat 3D (1.0mm) sagittal"
//   * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
//   * bodySite.concept = $sct#239919000 "Entire left foot (body structure)"	
//   * laterality = $sct#7771000 "Left lateral"
//   * performer[custodian].actor = Reference( OrganizationSemiStructuredReport )
//   * performer[organization].actor = Reference( OrganizationSemiStructuredReport )
// * series[+]
//   * uid = "1.2.276.2000010.784733.2" // invented - not there in the report
//   * number = 2
//   * description = "T1 (2.5mm) axial"
//   * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
//   * bodySite.concept = $sct#239919000 "Entire left foot (body structure)"	
//   * laterality = $sct#7771000 "Left lateral"
//   * performer[custodian].actor = Reference( OrganizationSemiStructuredReport )
//   * performer[organization].actor = Reference( OrganizationSemiStructuredReport )
// * series[+]
//   * uid = "1.2.276.2000010.784733.3" // invented - not there in the report
//   * number = 3
//   * description = "T2 (2.5mm) axial"
//   * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
//   * bodySite.concept = $sct#239919000 "Entire left foot (body structure)"	
//   * laterality = $sct#7771000 "Left lateral"
//   * performer[custodian].actor = Reference( OrganizationSemiStructuredReport )
//   * performer[organization].actor = Reference( OrganizationSemiStructuredReport )
// * series[+]
//   * uid = "1.2.276.2000010.784733.4" // invented - not there in the report
//   * number = 4
//   * description = "PDW FatSat (2.5mm) axial"
//   * modality = http://dicom.nema.org/resources/ontology/DCM#MR "Magnetic Resonance"
//   * bodySite.concept = $sct#239919000 "Entire left foot (body structure)"	
//   * laterality = $sct#7771000 "Left lateral"
//   * performer[custodian].actor = Reference( OrganizationSemiStructuredReport )
//   * performer[organization].actor = Reference( OrganizationSemiStructuredReport )


// //////////////////////////////////////////////////////////////////////////////////////////////////////////
// Instance: PractitionerRoleSemiStructuredReportAuthor
// InstanceOf: PractitionerRoleEu
// // Usage: #inline
// * practitioner = Reference(PractitionerSemiStructuredReportAuthor)
// * organization = Reference(OrganizationSemiStructuredReport)

// Instance: PractitionerSemiStructuredReportAuthor
// InstanceOf: PractitionerEu
// // Usage: #inline
// * name
//   * use = #official
//   * text = "Dr. Lucas Gasenzer"
//   * family = "Gasenzer"
//   * given = "Lucas"

// Instance: OrganizationSemiStructuredReport
// InstanceOf: OrganizationEu
// // Usage: #inline
// * name = "Radiology Zentrum Bremen"
// * contact
//   * telecom
//     * system = #phone
//     * value = "+49 421 1234567"
//     * use = #work
//   * address
//     * use = #work
//     * line[+] = "Schwachhauser Heerstraße 54"
//       * extension[+]
//         * url = $street-name-url
//         * valueString = "Schwachhauser Heerstraße"
//       * extension[+]
//         * url = $house-number-url 
//         * valueString = "54"
//     * postalCode = "28209"
//     * city = "Bremen"
//     * country = "Germany"

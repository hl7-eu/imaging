CodeSystem: MissingDicomTerminology
Id: codesystem-missing-dicom-terminology
Title: "CodeSystem: Missing DICOM Terminology"
Description: "Code system for codes that are defined in DICOM but for which no matching code system is available in FHIR."
* insert SetFmmAndStatusRule( 1, draft )
* ^experimental = false
* ^caseSensitive = true
* ^hierarchyMeaning = #is-a
* ^content = #fragment

// FHIR-56757: This CodeSystem is temporary and will be removed once DICOM publishes the
// equivalents in the DICOM FHIR Terminology repo. Concepts with an existing DCM ontology
// equivalent have been removed (SOP Class UID=DCM#110181, Modality=DCM#121139,
// Irradiation Event UID=DCM#113769, Device Serial Number=DCM#113880, Study Instance UID=DCM#110180,
// Series Instance UID=DCM#112002, Accession Number=DCM#121022, Specimen UID=DCM#121039,
// Tracking UID=DCM#112040). Unused concepts without a DCM equivalent were also removed
// (Device UID, Manufacturer Device Class UID, Observation UID). Only SOP Instance UID is
// retained, as it is referenced by profiles and has no DCM equivalent yet.
// (DICOM PS3.16 2026b defines no unqualified "SOP Instance UID" DCM concept; the nearest is
// DCM#121126 "Performed Procedure Step SOP Instance UID", and CID 10001 UID Type has no
// unqualified SOP Instance UID entry.)
* #elements "DICOM Elements" "DICOM Element definitions"	
  * #00080018 "SOP Instance UID" "Uniquely identifies the SOP Instance."
CodeSystem: MissingDicomTerminology
Id: codesystem-missing-dicom-terminology
Title: "Missing DICOM Terminology"
Description: "Code system for codes that are defined in DICOM but for which no matching code system is available in FHIR."
* ^experimental = true
* ^caseSensitive = true
* ^hierarchyMeaning = #is-a

* #elements "DICOM Elements" "DICOM Element definitions"	
  * #00080018 "SOP Instance UID" "SOP Instance UID"
  * #00080016 "SOP Class UID" "SOP Class UID"
  * #00080060 "Modality" "Modality"
  * #00080061 "Series Instance UID" "Series Instance UID"
  * #00080062 "Study Instance UID" "Study Instance UID"

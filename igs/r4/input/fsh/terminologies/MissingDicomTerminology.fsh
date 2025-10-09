CodeSystem: MissingDicomTerminology
Id: codesystem-missing-dicom-terminology
Title: "Missing DICOM Terminology"
Description: "Code system for codes that are defined in DICOM but for which no matching code system is available in FHIR."
* insert SetFmmAndStatusRule( 1, draft )
* ^experimental = false
* ^caseSensitive = true
* ^hierarchyMeaning = #is-a
* ^content = #fragment
* ^url = "http://hl7.eu/fhir/imaging/codesystem-missing-dicom-terminology"

* #elements "DICOM Elements" "DICOM Element definitions"	
  * #00080016 "SOP Class UID" "Uniquely identifies the SOP Class."
  * #00080018 "SOP Instance UID" "Uniquely identifies the SOP Instance."
  * #00080060 "Modality" "Type of device, process or method that originally acquired or produced the data used to create the Instances in this Series."
  * #00083010 "Irradiation Event UID" "Irradiation Event UID"
  * #00181000 "Device Serial Number" "Device Serial Number"
  * #00181002 "Device UID" "Unique identifier of the equipment."
  * #00181008 "Manufacturer Device Class UID" "Manufacturer Device Class UID"
  * #0020000D "Study Instance UID" "Unique identifier for the Study."
  * #0020000E "Series Instance UID" "Unique identifier of the Series."
  * #00080050 "Accession Number" "A departmental Information System generated number that identifies the Imaging Service Request."
  * #0040A171 "Observation UID" "Unique identifier for the observation Content Item (and its subsidiary Content Items, if any). The UID represents the semantic content of the observation; an encoding of the same observation with the same context into another representation (e.g., a CDA Entry) may use the same UID."
  * #00400554 "Specimen UID" "Unique identifier for the Specimen."
  * #00620021 "Tracking UID" "A unique identifier used for tracking a finding or feature, potentially across multiple reporting objects, over time."
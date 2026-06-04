Instance: ObservationRadiationDoseCtExample
InstanceOf: ObservationRadiationDoseEuImaging
Title: "Observation: radiation dose summary - CT"
Description: "Example radiation dose Observation using narrative summary text for CT."
Usage: #example
* status = #final
* code = $loinc#73569-6 "Radiation exposure and protection information [Description] Document Diagnostic imaging"
* subject = Reference(PatientSemiStructuredReport)
* derivedFrom[+].type = "ImagingStudy"
* derivedFrom[=].identifier.system = "urn:dicom:uid"
* derivedFrom[=].identifier.value = "urn:oid:1.2.840.113619.2.312.4120.7932814.15731.20260501100001"
* derivedFrom[=].identifier.type = http://dicom.nema.org/resources/ontology/DCM#110180 "Study Instance UID"
//R5* derivedFrom[dicomSrInstance].type = "ImagingSelection"
//R5* derivedFrom[dicomSrInstance].identifier.system = "urn:dicom:uid"
//R5* derivedFrom[dicomSrInstance].identifier.value = "urn:oid:1.2.840.113619.2.312.4120.7932814.15731.20260501101500"

* valueString = "CT examination of the abdomen and pelvis. CTDIvol 9.8 mGy; DLP 520 mGy.cm. Dose values represent scanner output metrics and not patient absorbed dose."

Instance: ObservationRadiationDoseFluoroExample
InstanceOf: ObservationRadiationDoseEuImaging
Title: "Observation: radiation dose summary - fluoroscopy"
Description: "Example radiation dose Observation using narrative summary text for fluoroscopy."
Usage: #example
* status = #final
* code = $loinc#73569-6 "Radiation exposure and protection information [Description] Document Diagnostic imaging"
* subject = Reference(PatientSemiStructuredReport)

* derivedFrom[+].type = "ImagingStudy"
* derivedFrom[=].identifier.system = "urn:dicom:uid"
* derivedFrom[=].identifier.value = "urn:oid:1.2.840.113619.2.312.4120.7932814.15731.20260501100002"
* derivedFrom[=].identifier.type = http://dicom.nema.org/resources/ontology/DCM#110180 "Study Instance UID"
//R5* derivedFrom[dicomSrInstance].type = "ImagingSelection"
//R5* derivedFrom[dicomSrInstance].identifier.system = "urn:dicom:uid"
//R5* derivedFrom[dicomSrInstance].identifier.value = "urn:oid:1.2.840.113619.2.312.4120.7932814.15731.20260501103000"

* valueString = "Fluoroscopic coronary angiography. Dose area product (DAP) 45 Gy.cm2; fluoroscopy time 6.2 minutes. Reported values summarize scanner output and are not patient absorbed dose."

Instance: ObservationRadiationDoseXrayExample
InstanceOf: ObservationRadiationDoseEuImaging
Title: "Observation: radiation dose summary - plain radiography"
Description: "Example radiation dose Observation using narrative summary text for plain radiography."
Usage: #example
* status = #final
* code = $loinc#73569-6 "Radiation exposure and protection information [Description] Document Diagnostic imaging"
* subject = Reference(PatientStructuredReport)

* derivedFrom[+].type = "ImagingStudy"
* derivedFrom[=].identifier.system = "urn:dicom:uid"
* derivedFrom[=].identifier.value = "urn:oid:1.2.840.113619.2.312.4120.7932814.15731.20260501100003"
* derivedFrom[=].identifier.type = http://dicom.nema.org/resources/ontology/DCM#110180 "Study Instance UID"
//R5* derivedFrom[+].type = "ImagingSelection"
//R5* derivedFrom[+].identifier.system = "urn:dicom:uid"
//R5* derivedFrom[+].identifier.value = "urn:oid:1.2.840.113619.2.312.4120.7932814.15731.20260501104500"

* valueString = "Chest radiography (PA and lateral). Estimated dose indicators within typical range for this examination. This summary is suitable for reporting and does not imply patient-specific absorbed dose."

// Profile-focused key-image examples (not wired into a report bundle).

{{R4}}Instance: KeyImageDicomInstanceExampleR4
{{R4}}InstanceOf: MediaKeyImageEuImaging
{{R4}}Title: "Media: DICOM key image instance"
{{R4}}Description: "Profile example: a key image representing a DICOM instance, carrying the SOP Instance UID, Series Instance UID and Study Instance UID identifiers."
{{R4}}Usage: #example
{{R4}}* subject = Reference(PatientStructuredReport)
{{R4}}* type = http://terminology.hl7.org/CodeSystem/media-type#image "Image"
{{R4}}* modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
{{R4}}* identifier[sopClassInstanceUid]
// FHIR-56757: MissingDicomTerminology#00080018 is temporary; replace with the DICOM terminology IG equivalent once published.
{{R4}}  * type = MissingDicomTerminology#00080018
{{R4}}  * system = "urn:ietf:rfc:3986"
{{R4}}  * value = "urn:oid:1.2.840.113619.2.5.1762583153.215519.978957063.121"
{{R4}}* identifier[seriesInstanceUid]
{{R4}}  * type = http://dicom.nema.org/resources/ontology/DCM#112002
{{R4}}  * system = "urn:dicom:uid"
{{R4}}  * value = "urn:oid:1.2.840.113619.2.5.1762583153.215519.978957063.120"
{{R4}}* identifier[studyInstanceUid]
{{R4}}  * type = http://dicom.nema.org/resources/ontology/DCM#110180
{{R4}}  * system = "urn:dicom:uid"
{{R4}}  * value = "urn:oid:1.2.840.113619.2.5.1762583153.215519.978957063.110"
{{R4}}* content
{{R4}}  * contentType = #application/dicom
{{R4}}  * url = "https://pacs.example.org/wado?requestType=WADO&studyUID=1.2.840.113619.2.5.1762583153.215519.978957063.110&seriesUID=1.2.840.113619.2.5.1762583153.215519.978957063.120&objectUID=1.2.840.113619.2.5.1762583153.215519.978957063.121&contentType=application/dicom"

{{R5}}Instance: KeyImageDicomInstanceExample
{{R5}}InstanceOf: DocumentReferenceKeyImageEuImaging
{{R5}}Title: "DocumentReference: DICOM key image instance"
{{R5}}Description: "Profile example: a key image representing a DICOM instance, carrying the SOP Instance UID, Series Instance UID and Study Instance UID identifiers."
{{R5}}Usage: #example
{{R5}}* status = #current
{{R5}}* subject = Reference(PatientStructuredReport)
{{R5}}* identifier[sopClassInstanceUid]
// FHIR-56757: MissingDicomTerminology#00080018 is temporary; replace with the DICOM terminology IG equivalent once published.
{{R5}}  * type = MissingDicomTerminology#00080018
{{R5}}  * system = "urn:ietf:rfc:3986"
{{R5}}  * value = "urn:oid:1.2.840.113619.2.5.1762583153.215519.978957063.121"
{{R5}}* identifier[seriesInstanceUid]
{{R5}}  * type = http://dicom.nema.org/resources/ontology/DCM#112002
{{R5}}  * system = "urn:dicom:uid"
{{R5}}  * value = "urn:oid:1.2.840.113619.2.5.1762583153.215519.978957063.120"
{{R5}}* identifier[studyInstanceUid]
{{R5}}  * type = http://dicom.nema.org/resources/ontology/DCM#110180
{{R5}}  * system = "urn:dicom:uid"
{{R5}}  * value = "urn:oid:1.2.840.113619.2.5.1762583153.215519.978957063.110"
{{R5}}* content[content]
{{R5}}  * attachment
{{R5}}    * contentType = #application/dicom
{{R5}}    * url = "https://pacs.example.org/wado?requestType=WADO&studyUID=1.2.840.113619.2.5.1762583153.215519.978957063.110&seriesUID=1.2.840.113619.2.5.1762583153.215519.978957063.120&objectUID=1.2.840.113619.2.5.1762583153.215519.978957063.121&contentType=application/dicom"
{{R5}}  * extension[thumbnail]
{{R5}}    * url = $document-reference-thumbnail-url
{{R5}}    * valueBoolean = false
{{R5}}* modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
{{R5}}* category[imkeyimages]
{{R5}}  * coding[keyimagecode] = $loinc#55113-5 "Key images Document Radiology"

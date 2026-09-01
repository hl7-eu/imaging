// Profile-focused key-image examples (not wired into a report bundle).

{{R4}}Instance: KeyImageDicomInstanceExample
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

{{R4}}Instance: ImagingSelectionStudyExample
{{R4}}InstanceOf: ImagingSelectionEuImaging
{{R4}}Title: "ImagingSelection: referenced imaging study"
{{R4}}Description: "Profile example: an ImagingSelection represented in R4 Basic form, pointing to the source imaging study."
{{R4}}Usage: #example
{{R4}}* code = http://dicom.nema.org/resources/ontology/DCM#113000 "Of Interest"
{{R4}}* subject = Reference(PatientStructuredReport)
{{R4}}* modifierExtension[status].valueCode = #available
{{R4}}* extension[code].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#113000 "Of Interest"
{{R4}}* extension[derivedFrom][study].valueReference = Reference(ImagingStudyStructuredReport)

{{R5}}Instance: ImagingSelectionStudyExample
{{R5}}InstanceOf: ImagingSelectionEuImaging
{{R5}}Title: "ImagingSelection: referenced imaging study"
{{R5}}Description: "Profile example: an ImagingSelection pointing to the source imaging study."
{{R5}}Usage: #example
{{R5}}* status = #available
{{R5}}* subject = Reference(PatientStructuredReport)
{{R5}}* code = http://dicom.nema.org/resources/ontology/DCM#113000 "Of Interest"
{{R5}}* derivedFrom[study] = Reference(ImagingStudyStructuredReport)

{{R4}}Instance: SrInstanceImagingSelectionExample
{{R4}}InstanceOf: SrInstanceImagingSelectionEuImaging
{{R4}}Title: "ImagingSelection: DICOM SR instance"
{{R4}}Description: "Profile example: an ImagingSelection represented in R4 Basic form for a selected DICOM Structured Report instance."
{{R4}}Usage: #example
{{R4}}* code = http://dicom.nema.org/resources/ontology/DCM#113000 "Of Interest"
{{R4}}* subject = Reference(PatientStructuredReport)
{{R4}}* modifierExtension[status].valueCode = #available
{{R4}}* extension[code].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#113000 "Of Interest"
{{R4}}* extension[derivedFrom].valueReference = Reference(ImagingStudyStructuredReport)
{{R4}}* identifier[sopInstanceUid]
{{R4}}  * type = MissingDicomTerminology#00080018
{{R4}}  * system = "urn:dicom:uid"
{{R4}}  * value = "urn:oid:1.2.840.113619.2.55.3.604688435.781.1599602484.467"
{{R4}}* extension[studyUid].valueId = "1.2.840.113619.2.55.3.604688435.781.1599602484.400"
{{R4}}* extension[seriesUid].valueId = "1.2.840.113619.2.55.3.604688435.781.1599602484.460"
{{R4}}* extension[instance].extension[uid].valueId = "1.2.840.113619.2.55.3.604688435.781.1599602484.467"

{{R5}}Instance: SrInstanceImagingSelectionExample
{{R5}}InstanceOf: SrInstanceImagingSelectionEuImaging
{{R5}}Title: "ImagingSelection: DICOM SR instance"
{{R5}}Description: "Profile example: an ImagingSelection for a selected DICOM Structured Report instance."
{{R5}}Usage: #example
{{R5}}* status = #available
{{R5}}* subject = Reference(PatientStructuredReport)
{{R5}}* code = http://dicom.nema.org/resources/ontology/DCM#113000 "Of Interest"
{{R5}}* derivedFrom[study] = Reference(ImagingStudyStructuredReport)
{{R5}}* identifier[sopInstanceUid]
{{R5}}  * type = MissingDicomTerminology#00080018
{{R5}}  * system = "urn:dicom:uid"
{{R5}}  * value = "urn:oid:1.2.840.113619.2.55.3.604688435.781.1599602484.467"
{{R5}}* studyUid = "1.2.840.113619.2.55.3.604688435.781.1599602484.400"
{{R5}}* seriesUid = "1.2.840.113619.2.55.3.604688435.781.1599602484.460"
{{R5}}* instance.uid = "1.2.840.113619.2.55.3.604688435.781.1599602484.467"

{{R4}}Instance: KeyImageImagingSelectionDicomInstanceExample
{{R4}}InstanceOf: ImagingSelectionKeyImageEuImaging
{{R4}}Title: "ImagingSelection: DICOM key image instance"
{{R4}}Description: "Profile example: a key image represented as an ImagingSelection, carrying DICOM study, series and selected SOP Instance UID data."
{{R4}}Usage: #example
{{R4}}* code = http://dicom.nema.org/resources/ontology/DCM#113000 "Of Interest"
{{R4}}* subject = Reference(PatientStructuredReport)
{{R4}}* modifierExtension[status].valueCode = #available
{{R4}}* extension[code].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#113000 "Of Interest"
{{R4}}* extension[title].valueMarkdown = "Representative ultrasound key image"
{{R4}}* extension[description].valueString = "Frame selected by the reporting radiologist for follow-up comparison."
{{R4}}* extension[derivedFrom][study].valueReference = Reference(ImagingStudyStructuredReport)
{{R4}} // pracRole
{{R4}}* extension[performer][+].extension[actor].valueReference = Reference(PractitionerRoleStructuredReportAuthor)
{{R4}}* extension[performer][=].extension[function].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PRF "Performer"
{{R4}} // device
{{R4}}* extension[performer][+].extension[actor].valueReference = Reference(UltrasoundScannerExample)
{{R4}}* extension[performer][=].extension[function].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#DEV "Device"
{{R4}}* extension[studyUid].valueId = "1.2.840.113619.2.5.1762583153.215519.978957063.110"
{{R4}}* extension[seriesUid].valueId = "1.2.840.113619.2.5.1762583153.215519.978957063.120"
{{R4}}* extension[instance].extension[uid].valueId = "1.2.840.113619.2.5.1762583153.215519.978957063.121"

{{R5}}Instance: KeyImageImagingSelectionDicomInstanceExample
{{R5}}InstanceOf: ImagingSelectionKeyImageEuImaging
{{R5}}Title: "ImagingSelection: DICOM key image instance"
{{R5}}Description: "Profile example: a key image represented as an ImagingSelection, carrying DICOM study, series and selected SOP Instance UID data."
{{R5}}Usage: #example
{{R5}}* status = #available
{{R5}}* subject = Reference(PatientStructuredReport)
{{R5}}* code = http://dicom.nema.org/resources/ontology/DCM#113000 "Of Interest"
{{R5}}* extension[title].valueMarkdown = "Representative ultrasound key image"
{{R5}}* extension[description].valueString = "Frame selected by the reporting radiologist for follow-up comparison."
{{R5}}* derivedFrom[study] = Reference(ImagingStudyStructuredReport)
{{R5}}* performer[pracRole].actor = Reference(PractitionerRoleStructuredReportAuthor)
{{R5}}* performer[pracRole].function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PRF "Performer"
{{R5}}* performer[device].actor = Reference(UltrasoundScannerExample)
{{R5}}* performer[device].function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#DEV "Device"
{{R5}}* studyUid = "1.2.840.113619.2.5.1762583153.215519.978957063.110"
{{R5}}* seriesUid = "1.2.840.113619.2.5.1762583153.215519.978957063.120"
{{R5}}* instance.uid = "1.2.840.113619.2.5.1762583153.215519.978957063.121"

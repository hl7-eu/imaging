{{R4}}Instance: StructuredKeyImageRestR4
{{R4}}InstanceOf: MediaKeyImageEuImaging
{{R4}}Title: "Media: key image rest"
{{R4}}Description: "Key image showing the ultrasound at rest."
{{R4}}Usage: #example
{{R4}}* subject = Reference(PatientStructuredReport)
{{R4}}* type = http://terminology.hl7.org/CodeSystem/media-type#image "Image"
{{R4}}* modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
{{R4}}* content
{{R4}}  * contentType = #image/png
{{R4}}  * id = "ig-loader-structured-keyimage-rest.png"
{{R4}}  * url = "Media/StructuredKeyImageRestR4"

{{R4}}Instance: StructuredKeyImageStressR4
{{R4}}InstanceOf: MediaKeyImageEuImaging
{{R4}}Title: "Media: key image stress"
{{R4}}Description: "Key image showing the ultrasound during stress."
{{R4}}Usage: #example
{{R4}}* subject = Reference(PatientStructuredReport)
{{R4}}* type = http://terminology.hl7.org/CodeSystem/media-type#image "Image"
{{R4}}* modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
{{R4}}* content
{{R4}}  * contentType = #image/png
{{R4}}  * id = "ig-loader-structured-keyimage-stress.png"
{{R4}}  * url = "Media/StructuredKeyImageStressR4"

{{R5}}Instance: StructuredKeyImageRest
{{R5}}InstanceOf: DocumentReferenceKeyImageEuImaging
{{R5}}Title: "DocumentReference: key image rest"
{{R5}}Description: "Key image showing the ultrasound at rest."
{{R5}}Usage: #example
{{R5}}* status = #current
{{R5}}* subject = Reference(PatientStructuredReport)
{{R5}}* content[content]
{{R5}}  * attachment
{{R5}}    * contentType = #image/png
{{R5}}    * id = "ig-loader-structured-keyimage-rest.png"
{{R5}}    * url = "DocumentReference/StructuredKeyImageRest"
{{R5}}  * extension[thumbnail]
{{R5}}    * url = $document-reference-thumbnail-url
{{R5}}    * valueBoolean = false
{{R5}}* modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
{{R5}}* category[imkeyimages]
{{R5}}  * coding[keyimagecode] = $loinc#55113-5 "Key images Document Radiology"

{{R5}}Instance: StructuredKeyImageStress
{{R5}}InstanceOf: DocumentReferenceKeyImageEuImaging
{{R5}}Title: "DocumentReference: key image stress"
{{R5}}Description: "Key image showing the ultrasound during stress."
{{R5}}Usage: #example
{{R5}}* status = #current
{{R5}}* subject = Reference(PatientStructuredReport)
{{R5}}* content[content]
{{R5}}  * attachment
{{R5}}    * contentType = #image/png
{{R5}}    * id = "ig-loader-structured-keyimage-stress.png"
{{R5}}    * url = "DocumentReference/StructuredKeyImageStress"
{{R5}}  * extension[thumbnail]
{{R5}}    * url = $document-reference-thumbnail-url
{{R5}}    * valueBoolean = false
{{R5}}* modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
{{R5}}* category[imkeyimages]
{{R5}}  * coding[keyimagecode] = $loinc#55113-5 "Key images Document Radiology"
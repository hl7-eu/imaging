Instance: StructuredKeyImageRest
InstanceOf: DocumentReferenceKeyImageEuImaging
Title: "DocumentReference: key image rest"
Description: "Key image showing the ultrasound at rest."
Usage: #example
//R4* status = #completed
* status = #current

* subject = Reference(PatientStructuredReport)
* content[content]
  * attachment
    * contentType = #image/.png
    * id = "ig-loader-structured-keyimage-rest.png"
    * url = "DocumentReference/StructuredKeyImageRest"
  * extension[thumbnail]
    * url = $document-reference-thumbnail-url
    * valueBoolean = false


//R4* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
* modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
* category[imkeyimages]
  * coding[keyimagecode] = $loinc#55113-5 "Key images Document Radiology"

    
Instance: StructuredKeyImageStress
InstanceOf: DocumentReferenceKeyImageEuImaging
Title: "DocumentReference: key image stress"
Description: "Key image showing the ultrasound during stress."
Usage: #example
//R4* status = #completed
* status = #current
* subject = Reference(PatientStructuredReport)

* content[content]
  * attachment
    * contentType = #image/.png
    * id = "ig-loader-structured-keyimage-stress.png"
    * url = "DocumentReference/StructuredKeyImageStress"
  * extension[thumbnail]
    * url = $document-reference-thumbnail-url
    * valueBoolean = false


//R4* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
* modality = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
* category[imkeyimages]
  * coding[keyimagecode] = $loinc#55113-5 "Key images Document Radiology"

Instance: StructuredKeyImageRest
InstanceOf: Media
//R5InstanceOf: DocumentReference
Title: "DocumentReference: key image rest"
Description: "Key image showing the ultrasound at rest."
Usage: #example
* status = #completed
//R5* status = #current
* subject = Reference( PatientStructuredReport )
* content
  * id = "ig-loader-structured-keyimage-rest.png"
//R5  * attachment
//R5    * id = "ig-loader-structured-keyimage-rest.png"
    
Instance: StructuredKeyImageStress
InstanceOf: Media
//R5InstanceOf: DocumentReference
Title: "DocumentReference: key image stress"
Description: "Key image showing the ultrasound during stress."
Usage: #example
* status = #completed
//R5* status = #current
* subject = Reference( PatientStructuredReport )
* content
  * id = "ig-loader-structured-keyimage-stress.png"
//R5  * attachment
//R5    * id = "ig-loader-structured-keyimage-stress.png"
    

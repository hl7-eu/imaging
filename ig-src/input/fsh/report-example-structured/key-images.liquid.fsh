Instance: StructuredKeyImageRest
{{R4}}InstanceOf: Media
{{R5}}InstanceOf: DocumentReference
Title: "DocumentReference: key image rest"
Description: "Key image showing the ultrasound at rest."
Usage: #example
{{R4}}* status = #completed
{{R5}}* status = #current
* subject.reference = "urn:uuid:11111111-2222-4333-8444-000000000003"
* content
{{R4}}  * id = "ig-loader-structured-keyimage-rest.png"
{{R5}}  * attachment
{{R5}}    * id = "ig-loader-structured-keyimage-rest.png"
    
Instance: StructuredKeyImageStress
{{R4}}InstanceOf: Media
{{R5}}InstanceOf: DocumentReference
Title: "DocumentReference: key image stress"
Description: "Key image showing the ultrasound during stress."
Usage: #example
{{R4}}* status = #completed
{{R5}}* status = #current
* subject.reference = "urn:uuid:11111111-2222-4333-8444-000000000003"
* content
{{R4}}  * id = "ig-loader-structured-keyimage-stress.png"
{{R5}}  * attachment
{{R5}}    * id = "ig-loader-structured-keyimage-stress.png"
    
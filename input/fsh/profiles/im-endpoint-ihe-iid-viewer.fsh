Profile: EndpointImageIidViewerEuImaging //ImImageIidViewerEndpoint
Parent: EndpointEu
Title: "Endpoint: IHE IID Image Viewer"
Description: """
This profile defines a placeholder for an Endpoint for a viewer that can be used to access the study, serie it is present on.
The application is based on [IHE-IID](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_IID.pdf).
"""
* insert SetFmmAndStatusRule( 1, "draft" )

* connectionType 
  * insert SliceElement( #value, coding )
* connectionType contains iid 1..1
* connectionType[iid] = Hl7EuImagingEndpointTerminologyCodeSystem#ihe-iid "IHE IID endpoint"

* payload 1..*
* payload
  * type 1..1
    * text = "IHE IID"
  * mimeType
    * insert SliceElement( #value, $this )
  * mimeType contains 
      text-html 1..1
  * mimeType[text-html] = #text/html

* address 1..1


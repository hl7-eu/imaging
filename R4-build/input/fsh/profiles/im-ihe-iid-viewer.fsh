Profile: ImImageIidViewerEndpoint
Parent: Endpoint
Id: im-viewer-endpoint
Title: "Viewer endpoint"
Description: """
This profile defines a placeholder for an Endpoint for a viewer that can be used to access the study, serie it is present on.
The application is based on [IHE-IID](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_IID.pdf).
"""
* insert SetFmmAndStatusRule( 1, "draft" )
* insert MandateLanguageAndSecurity

* status MS

* connectionType 
  * insert SliceElement( #value, coding )
* connectionType contains iid 1..1 MS
* connectionType[iid] = Hl7EuImagingEndpointTerminologyCodeSystem#ihe-iid "IHE IID endpoint"

* name MS
  * insert SetPopulateIfKnown
* description 0..1 MS
* managingOrganization 0..1 MS

* payload 1..*
* payload MS
  * type 1..1 MS
    * text = "IHE IID"
  * mimeType MS
    * insert SliceElement( #value, $this )
  * mimeType contains 
      text-html 1..1 MS
  * mimeType[text-html] = #text/html

* address 1..1 MS


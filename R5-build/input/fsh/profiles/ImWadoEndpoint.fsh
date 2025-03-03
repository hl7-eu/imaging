Profile: ImWadoEndpoint
Parent: Endpoint
Id: im-wado-endpoint
Title: "WADO endpoint"
Description: """
This profile defines the WADO endpoint for accessing imaging study content.
"""
* insert SetFmmAndStatusRule( 1, "draft" )
* insert MandateLanguageAndSecurity

* status MS

* connectionType 
  * insert SliceElement( #value, coding )
* connectionType contains wado 1..1 MS
* connectionType[wado] = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs "DICOM WADO-RS"

* name MS
  * insert SetPopulateIfKnown
* description 0..1 MS
* managingOrganization 0..1 MS
* payload MS
  * insert SliceElement( #value, type )
* payload contains wadors 1..1 MS
* payload[wadors]
  * type 1..1 MS
  * type = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs "DICOM WADO-RS"
  * mimeType MS
    * insert SliceElement( #value, $this )
  * mimeType contains 
      // source dicom
      dicom 1..1 MS and 
      dicom-octet 1..1 MS and
      dicom-xml 1..1 MS and 
      dicom-json 1..1 MS and 
      // image
      image-jpg 1..1 MS and
      image-gif 1..1 MS and
      image-jp2 1..1 MS and
      image-jph 1..1 MS and
      image-jxl 1..1 MS and
      // multiframe
      // image-gif 0..1 MS and
      // image-jxl 0..1 MS and
      // video
      video-mpeg 1..1 MS and
      video-mp4 1..1 MS and
      video-H265 1..1 MS and
      // text
      text-html 1..1 MS and
      text-plain 1..1 MS and
      text-xml 1..1 MS and  
      text-rtf 1..1 MS and
      application-pdf 1..1 MS

  * mimeType[dicom]           = #application/dicom
  * mimeType[dicom-octet]     = #application/octet-stream
  * mimeType[dicom-xml]       = #application/dicom+xml
  * mimeType[dicom-json]      = #application/json
  * mimeType[image-jpg]       = #image/jpg
  * mimeType[image-gif]       = #image/gif
  * mimeType[image-jp2]       = #image/jp2
  * mimeType[image-jph]       = #image/jph
  * mimeType[image-jxl]       = #image/jxl
  * mimeType[video-mpeg]      = #video/mpeg
  * mimeType[video-mp4]       = #video/mp4
  * mimeType[video-H265]      = #video/H265
  * mimeType[text-html]       = #text/html
  * mimeType[text-plain]      = #text/plain
  * mimeType[text-xml]        = #text/xml
  * mimeType[text-rtf]        = #text/rtf
  * mimeType[application-pdf] = #application/pdf


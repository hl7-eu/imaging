Instance: Example-WadoEndpoint
InstanceOf: ImWadoEndpoint
* status = #active
* name = "Example WADO-RS Endpoint"
* connectionType[wado] = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs "DICOM WADO-RS"
* payload[wadors]
  * type = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs "DICOM WADO-RS"
  * mimeType[dicom] = #application/dicom
  * mimeType[dicom-octet] = #application/octet-stream
  * mimeType[dicom-xml] = #application/dicom+xml
  * mimeType[dicom-json] = #application/json
  * mimeType[image-jpg] = #image/jpg
  * mimeType[image-gif] = #image/gif
  * mimeType[image-jp2] = #image/jp2
  * mimeType[image-jph] = #image/jph
  * mimeType[image-jxl] = #image/jxl
  * mimeType[video-mpeg] = #video/mpeg
  * mimeType[video-mp4] = #video/mp4
  * mimeType[video-H265] = #video/H265
  * mimeType[text-html] = #text/html
  * mimeType[text-plain] = #text/plain
  * mimeType[text-xml] = #text/xml
  * mimeType[text-rtf] = #text/rtf
  * mimeType[application-pdf] = #application/pdf
* address = "http://example.org/wado-rs/endpoint"

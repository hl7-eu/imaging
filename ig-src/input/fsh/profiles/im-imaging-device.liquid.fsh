
Profile: DeviceEuImaging
Parent: Device
Title: "Device: Imaging Device"
Description: """The device the made the image."""	
* insert SetFmmAndStatusRule( 1, draft )
* status 1..1

{{R4}}* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Device.category named imagingCategory 1..1
{{R4}}* extension[imagingCategory].valueCodeableConcept = $sct#314789007 // "Diagnostic imaging equipment"

{{R56}}* category 
{{R56}}  * insert SliceElement( #value, $this )
{{R56}}* category contains imaging 1..1
{{R56}}* category[imaging] = $sct#314789007 // "Diagnostic imaging equipment"

* type from http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html (extensible)

Mapping: DicomToDeviceEuImaging
Source: DeviceEuImaging
Target: "http://nema.org/dicom"
Title: "Mapping from DICOM to Imaging Device"
Description: "Mapping from DICOM to Imaging Device."
* identifier -> "DeviceUID (0018,1002), (0018,1003) Device ID"
{{R4}}* version -> "Software Versions (0018,1020)"
{{R5}}* version -> "Software Versions (0018,1020)"
{{R6}}* deviceVersion -> "Software Versions (0018,1020)"
* type -> "ManufacturerDeviceClassUID (0018,1008) | Modality (0008,0060)"
{{R4}}* deviceName -> "StationName (0008,1010) | ManufacturerModelName (0008,1090)"
{{R56}}* name -> "StationName (0008,1010) | ManufacturerModelName (0008,1090)"
* udiCarrier.deviceIdentifier -> "UniqueDeviceIdentifier (0018,1009)"
* manufacturer -> "StationName (0008,1010) | ManufacturerModelName (0008,1090)"
* serialNumber -> "(0018,1000) Device Serial Number"

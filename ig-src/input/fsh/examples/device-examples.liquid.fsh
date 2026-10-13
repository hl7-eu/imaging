// Shared device examples used by imaging examples.

Instance: UltrasoundScannerExample
InstanceOf: DeviceEuImaging
Title: "Device: ultrasound scanner"
Description: "Example imaging device used to acquire a representative ultrasound key image."
Usage: #example
* identifier
  * system = "urn:dicom:uid"
  * value = "urn:oid:1.2.840.113619.6.184.3.20260831.1"
* manufacturer = "Example Medical Imaging"
* serialNumber = "US-2026-0001"
* type = http://dicom.nema.org/resources/ontology/DCM#US "Ultrasound"
{{R4}}* extension[imagingCategory].valueCodeableConcept = $sct#314789007 "Diagnostic imaging equipment"
{{R4}}* deviceName
{{R4}}  * name = "Example ultrasound scanner"
{{R4}}  * type = #model-name
{{R5}}* category[imaging] = $sct#314789007 "Diagnostic imaging equipment"

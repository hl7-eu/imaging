


// Basic version of ImagingSelection
// https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/Lookup-R5-ImagingSelection-R4.html
Profile: ImImagingSelection
Parent: Basic
Title: "Basic-ImagingSelection: General"
Description: "Imaging Selection"
* insert SetFmmAndStatusRule( 1, draft )
* subject only Reference( $EuPatient )

* code = #ImagingSelection
* extension contains 	http://hl7.org/fhir/5.0/StructureDefinition/extension-ImagingSelection named imagingSelection 1..1

Profile: ImSrInstanceImagingSelection
Parent: ImImagingSelection
Title: "ImagingSelection: DICOM SR Instance"
Description: "Imaging Selection referring to a DICOM SR instance"
* insert SetFmmAndStatusRule( 1, draft )

* identifier 1..*
  * insert SliceElement( #value, type )
* identifier contains sopInstanceUid 1..1
* identifier[sopInstanceUid] only ImSopInstanceUidIdentifier

* extension[imagingSelection].extension[studyUid].value[x] 1..1
* extension[imagingSelection].extension[seriesUid].value[x] 1..1
* extension[imagingSelection].extension[instance] 1..1
* extension[imagingSelection].extension[instance].extension[uid].value[x] 1..1
* extension[imagingSelection].extension[instance].extension[subset].value[x] 0..0
* extension[imagingSelection].extension[instance].extension[imageRegion2D] 0..0
* extension[imagingSelection].extension[instance].extension[imageRegion3D] 0..0

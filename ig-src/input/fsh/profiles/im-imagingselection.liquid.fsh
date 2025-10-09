{% if isR5 %}
Profile: ImImagingSelection
Parent: ImagingSelection
Title: "ImagingSelection: General"
Description: "Imaging Selection"
* insert SetFmmAndStatusRule( 1, draft )
* subject only Reference( $EuPatient )

* derivedFrom 1..*
  * insert SliceElement( #profile, $this )
* derivedFrom contains study 1..1
* derivedFrom[study] only Reference( ImImagingStudy )
{% endif %}

{% if isR4 %}
// https://hl7.org/fhir/uv/xver-r5.r4/0.0.1-snapshot-2/Lookup-R5-ImagingSelection-R4.html
Profile: ImImagingSelection
Parent: $CrossVersion-R5-ImagingSelection-for-R4
Title: "Basic-ImagingSelection: General"
Description: "Imaging Selection"
* insert SetFmmAndStatusRule( 1, draft )
* subject only Reference( $EuPatient )

Profile: ImSrInstanceImagingSelection
Parent: http://hl7.org/fhir/4.0/StructureDefinition/R5-ImagingSelection-for-R4
Title: "ImagingSelection: DICOM SR Instance"
Description: "Imaging Selection referring to a DICOM SR instance"
* insert SetFmmAndStatusRule( 1, draft )

* identifier 1..*
  * insert SliceElement( #value, type )
* identifier contains sopInstanceUid 1..1
* identifier[sopInstanceUid] only ImSopInstanceUidIdentifier

* extension[ImagingSelection].extension[studyUid].value[x] 1..1
* extension[ImagingSelection].extension[seriesUid].value[x] 1..1
* extension[ImagingSelection].extension[instance] 1..1
* extension[ImagingSelection].extension[instance].extension[uid].value[x] 1..1
* extension[ImagingSelection].extension[instance].extension[subset].value[x] 0..0
* extension[ImagingSelection].extension[instance].extension[imageRegion2D] 0..0
* extension[ImagingSelection].extension[instance].extension[imageRegion3D] 0..0

{% endif %}

{% if isR5 %}
Profile: ImSrInstanceImagingSelection
Parent: ImImagingSelection
Title: "ImagingSelection: DICOM SR Instance"
Description: "Imaging Selection referring to a DICOM SR instance"
* insert SetFmmAndStatusRule( 1, draft )
* identifier 1..*
  * insert SliceElement( #value, type )
* identifier contains sopInstanceUid 1..1
* identifier[sopInstanceUid] only ImSopInstanceUidIdentifier

* studyUid 1..1
* seriesUid 1..1
* instance 1..1
  * uid 1..1
  * subset 0..0
  * imageRegion2D 0..0
  * imageRegion3D 0..0

{% endif %}

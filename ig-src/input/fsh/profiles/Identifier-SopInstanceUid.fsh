Profile: SopInstanceUidIdentifierEuImaging
Parent: Identifier
Title: "Identifier: SOP Instance UID"
Description: "This profile on Identifier represents the SOP Instance UID	(0008,0018) for the Imaging Order."
* insert SetFmmAndStatusRule( 1, draft )
* system = "urn:dicom:uid"
* value 1..1
* type 1..1
* type = MissingDicomTerminology#00080018 // "SOP Instance UID"

RuleSet: ImagingInstanceEuImagingReference( slicename )
* basedOn[{slicename}] only Reference( SrInstanceImagingSelectionEuImaging )
  * identifier 1..1
  * identifier only StudyInstanceUidIdentifierEuImaging

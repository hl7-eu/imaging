Profile: StudyInstanceUidIdentifierEuImaging
Parent: Identifier
Title: "Identifier: Study Instance UID"
Description: "This profile on Identifier represents the Study Instance UID (0020,000D) for the Imaging Order."
* insert SetFmmAndStatusRule( 1, draft )
* system = "urn:dicom:uid"
* value 1..1
* type 1..1
* type
  * coding
    * insert SliceElement( #value, $this )
  * coding contains dcm 1..1
  * coding[dcm] = http://dicom.nema.org/resources/ontology/DCM#110180 "Study Instance UID"

RuleSet: ImagingStudyEuImagingReference( slicename )
* basedOn[{slicename}] only Reference( ImagingStudyEuImaging )
  * identifier 1..1
  * identifier only StudyInstanceUidIdentifierEuImaging


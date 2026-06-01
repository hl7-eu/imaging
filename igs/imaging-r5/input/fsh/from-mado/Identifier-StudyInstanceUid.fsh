Profile: MadoStudyInstanceUidIdentifier
Parent: Identifier
Title: "MADO Study Instance UID Identifier"
Description: """
Profile for the Study Instance UID Identifier used in the MADO context. This profile is used for the Identifier that represents the Study Instance UID in the MADO context. It includes additional
constraints and extensions specific to the MADO context, such as the value set for the type of identifier and the fixed value for the system of the identifier.
"""
* insert SetFmmAndStatusRule( 1, draft )
* system = "urn:dicom:uid"
* value 1..1
* type 1..1
* type
  * coding
    * insert SliceElement( #value, $this )
  * coding contains dcm 1..1
  * coding[dcm] = $dicomOntology#110180 //"Study Instance UID"

Profile: MadoReferencedStudyInstanceUidIdentifier
Parent: Reference
Title: "MADO Referenced Study Instance UID Identifier"
Description: """
Profile for the Reference that contains the Study Instance UID Identifier used in the MADO context. This profile is used for the Reference that contains the Identifier that represents the Study Instance UID in the MADO context. It includes additional
constraints and extensions specific to the MADO context, such as the value set for the type of identifier and the fixed value for the system of the identifier.
"""
* insert SetFmmAndStatusRule( 1, draft )
* identifier 1..1
* identifier only MadoStudyInstanceUidIdentifier
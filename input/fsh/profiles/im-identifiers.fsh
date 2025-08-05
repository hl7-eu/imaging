Profile: ImAccessionNumberIdentifier
Parent: Identifier
Id: im-accession-number-identifier
Title: "Imaging Accession Number Identifier"
Description: "This profile on Identifier represents the Accession Number for the Imaging Order."
* insert SetFmmAndStatusRule( 1, draft )
* system 1..1
* value 1..1
* type 1..1
* type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN

RuleSet: BasedOnImOrderReference( slicename )
* basedOn[{slicename}] only Reference( ImOrder )
  * identifier 1..1
  * identifier only ImAccessionNumberIdentifier

Profile: ImStudyInstanceUidIdentifier
Parent: Identifier
Id: im-study-instance-uid-identifier
Title: "Study Instance UID Identifier"
Description: "This profile on Identifier represents the Study Instance UID (0020,000D) for the Imaging Order."
* insert SetFmmAndStatusRule( 1, draft )
* system = "urn:dicom:uid"
* value 1..1
* type 0..1
* type = MissingDicomTerminology#0020000D

Profile: ImSopInstanceUidIdentifier
Parent: Identifier
Id: im-sop-instance-uid-identifier
Title: "Imaging SOP Class UID Identifier"
Description: "This profile on Identifier represents the SOP Class UID (0008,0018) for the Imaging Order."
* insert SetFmmAndStatusRule( 1, draft )
* system = "urn:dicom:uid"
* value 1..1
* type 1..1
* type = MissingDicomTerminology#00080018

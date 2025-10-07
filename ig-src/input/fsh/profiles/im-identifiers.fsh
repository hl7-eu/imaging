Profile: ImAccessionNumberIdentifier
Parent: Identifier
Id: im-accession-number-identifier
Title: "Identifier: Accession Number"
Description: """
This profile on Identifier represents the Accession Number for the Imaging Order.

Within a Hospital Information System environment, accession numbers will **usually** uniquely identify a manifest or report but are not required to **always** map 1:1 with a report or manifest due to certain imaging workflows. The imaging report may not be uniquely identified by accession number in an overread scenario (two radiologists reading a single imaging study). The manifest may not be uniquely identified by accession number in the case that the RIS imaging request (accession number assigner) requires two imaging modalities to perform the exam, and thus produces two image manifests.

In order to ensure uniqueness **across** Hospital Information Systems, accession numbers are required to have a system value that identifies the namespace for the issuing authority (ensuring their global uniqueness).
"""
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
Title: "Identifier: Study Instance UID"
Description: "This profile on Identifier represents the Study Instance UID (0020,000D) for the Imaging Order."
* insert SetFmmAndStatusRule( 1, draft )
* system = "urn:dicom:uid"
* value 1..1
* type 0..1
* type = MissingDicomTerminology#0020000D // "Study Instance UID"

Profile: ImSopInstanceUidIdentifier
Parent: Identifier
Id: im-sop-instance-uid-identifier
Title: "Identifier: SOP Instance UID"
Description: "This profile on Identifier represents the SOP Instance UID	(0008,0018) for the Imaging Order."
* insert SetFmmAndStatusRule( 1, draft )
* system = "urn:dicom:uid"
* value 1..1
* type 1..1
* type = MissingDicomTerminology#00080018 // "SOP Instance UID"

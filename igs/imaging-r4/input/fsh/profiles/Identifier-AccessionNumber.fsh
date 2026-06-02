Profile: AccessionNumberIdentifierEuImaging
Parent: Identifier
Title: "Identifier: Accession Number"
Description: """
This profile on Identifier represents the Accession Number for the Imaging Order.

Within a Hospital Information System environment, accession numbers will **usually** uniquely identify a manifest or report but are not required to **always** map 1:1 with a report or manifest due to certain imaging workflows. The imaging report may not be uniquely identified by accession number in an overread scenario (two radiologists reading a single imaging study). The manifest may not be uniquely identified by accession number in the case that the RIS imaging request (accession number assigner) requires two imaging modalities to perform the exam, and thus produces two image manifests.

In order to ensure uniqueness **across** Hospital Information Systems, accession numbers are required to have a system value that identifies the namespace for the issuing authority (ensuring their global uniqueness).
"""
* insert SetFmmAndStatusRule( 1, draft )
* system 1..1
* value 1..1
* value ^short = "The unique identifier value within the namespace defined by system"
* value ^definition = "The unique identifier value within the namespace defined by system. For accession numbers, uniqueness within that namespace is intended but may not always be achievable in practice (for example due to legacy conversions, shared accessions, or workflow variations). Consumers should not rely on value alone as a globally unique key."
* type 1..1
* type
  * coding
    * insert SliceElement( #value, $this )
  * coding contains v2-0203-coding 1..1 and dcm 0..1
  * coding[v2-0203-coding] = $v2-0203#ACSN 
  * coding[dcm] = http://dicom.nema.org/resources/ontology/DCM#121022 "Accession Number"

RuleSet: BasedOnServiceRequestOrderEuImagingReference( slicename )
* basedOn[{slicename}] only Reference( ServiceRequestOrderEuImaging )
  * identifier 1..1
  * identifier only AccessionNumberIdentifierEuImaging


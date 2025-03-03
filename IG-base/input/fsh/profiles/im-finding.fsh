Profile: ImFinding
Parent: Observation
Id: im-finding
Title: "Finding"
Description: "Finding during imaging procedure."
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains imorderaccession 0..1 MS
* insert BasedOnImOrderReference( imorderaccession )
  
* partOf MS
  * insert SliceElement( #type, $this )
* partOf contains 
    imagingstudy 0..* MS and
    procedure 0..* MS
* partOf[imagingstudy] only Reference( ImImagingStudy )
  * ^short = "Imaging study that produced this observation"
  * insert SetPopulateIfKnown
* partOf[procedure] only Reference( ImProcedure )
  * ^short = "Procedure that produced this observation"
  * insert SetPopulateIfKnown

* status MS

* category MS
  * insert SliceElement( #value, $this )
* category contains imaging 1..1 MS
* category[imaging] = http://terminology.hl7.org/CodeSystem/observation-category#imaging

* code MS

* subject MS
* subject only Reference( ImPatient )

* effective[x] MS
  * insert SetPopulateIfKnown

* performer MS
* performer only Reference( ImPractitionerRole )
  * insert SetPopulateIfKnown

* value[x] MS
  * insert SetPopulateIfKnown

* note MS
  * insert SetPopulateIfKnown

* method MS
  * insert SetPopulateIfKnown

* derivedFrom MS
  * insert SliceElement( #type, $this )
* derivedFrom contains 
    imagingstudy 0..* MS and
    imagingselection 0..* MS
* derivedFrom[imagingstudy] only Reference( ImImagingStudy )
  * ^short = "Imaging study that produced this observation"
  * insert SetPopulateIfKnown
* derivedFrom[imagingselection] only Reference( ImImagingSelection )
  * ^short = "Series or image that produced this observation"
  * insert SetPopulateIfKnown   

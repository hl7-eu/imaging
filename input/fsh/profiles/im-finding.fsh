Profile: ImFinding
Parent: $EuObservation
Title: "Observation: Imaging Finding"
Description: "Finding during imaging procedure."
* insert SetFmmAndStatusRule( 1, draft )

* identifier
  * insert SliceElement( #value, type )
* identifier contains observationUid 0..1
* identifier[observationUid].type = MissingDicomTerminology#00080018 // "SOP Instance UID"

* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains imorderaccession 0..1
* insert BasedOnImOrderReference( imorderaccession )
  
// * partOf
//   * insert SliceElement( #type, $this )
// * partOf contains 
//     imagingstudy 0..* and
//     procedure 0..*
// * partOf[imagingstudy] only Reference( ImImagingStudy )
//   * ^short = "Imaging study that produced this observation"
//   * insert SetPopulateIfKnown
// * partOf[procedure] only Reference( ImProcedure )
//   * ^short = "Procedure that produced this observation"
//   * insert SetPopulateIfKnown

// * status

// * category
//   * insert SliceElement( #value, $this )
// * category contains imaging 1..1
// * category[imaging] = http://terminology.hl7.org/CodeSystem/observation-category#imaging

// * code

// * subject
// * subject only Reference( ImPatient )

// * effective[x]
//   * insert SetPopulateIfKnown

// * performer
// * performer only Reference( ImPractitionerRole )
//   * insert SetPopulateIfKnown

// * value[x]
//   * insert SetPopulateIfKnown

// * note
//   * insert SetPopulateIfKnown

// * method
//   * insert SetPopulateIfKnown

// * derivedFrom
//   * insert SliceElement( #type, $this )
// * derivedFrom contains 
//     imagingstudy 0..* and
//     imagingselection 0..*
// * derivedFrom[imagingstudy] only Reference( ImImagingStudy )
//   * ^short = "Imaging study that produced this observation"
//   * insert SetPopulateIfKnown
// * derivedFrom[imagingselection] only Reference( ImImagingSelection )
//   * ^short = "Series or image that produced this observation"
//   * insert SetPopulateIfKnown   

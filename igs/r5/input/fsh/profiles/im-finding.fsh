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
* basedOn contains imorderaccession 0..*
* insert BasedOnImOrderReference( imorderaccession )
  
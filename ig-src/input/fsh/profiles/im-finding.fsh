Profile: ObservationFindingEuImaging
Parent: $EuObservation
Title: "Observation: Imaging Finding"
Description: "Finding during imaging procedure."
* insert SetFmmAndStatusRule( 1, draft )

* identifier
  * insert SliceElement( #value, type )
* identifier contains observationUid 0..1
* identifier[observationUid].type = MissingDicomTerminology#0040A171 // "Observation UID"
* identifier[observationUid] ^short = "DICOM Observation UID"
* identifier[observationUid] ^definition = "Observation UID (DICOM tag 0040,A171) is the tag used in DICOM to identify observations."

* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains ServiceRequestOrderEuImagingaccession 0..*
* insert BasedOnServiceRequestOrderEuImagingReference( ServiceRequestOrderEuImagingaccession )
  
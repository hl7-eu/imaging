Profile: ObservationFindingEuImaging
Parent: $EuObservation
Title: "Observation: Imaging Finding"
Description: """
Finding during imaging procedure.

When the accession number is known, it SHALL be included as the identifier on the reference to the imaging order. The accession number is optional when it is not available on the referenced order.
"""
* insert SetFmmAndStatusRule( 1, draft )

* identifier
  * insert SliceElement( #value, type )
* identifier contains observationUid 0..1
* identifier[observationUid].type = MissingDicomTerminology#00080018 // "SOP Instance UID"

* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains ServiceRequestOrderEuImagingaccession 0..*
* insert BasedOnServiceRequestOrderEuImagingReference( ServiceRequestOrderEuImagingaccession )
* basedOn[ServiceRequestOrderEuImagingaccession].identifier 0..1
* obeys eu-imaging-finding-accession

Invariant: eu-imaging-finding-accession
Description: "If a referenced imaging order has an accession number, the reference identifier SHALL match it."
Severity: #error
Expression: "basedOn.all(reference.exists().not() or resolve().ofType(ServiceRequest).identifier.where(type.coding.code = 'ACSN').empty() or (identifier.exists() and identifier.system = resolve().ofType(ServiceRequest).identifier.where(type.coding.code = 'ACSN').system and identifier.value = resolve().ofType(ServiceRequest).identifier.where(type.coding.code = 'ACSN').value))"
  
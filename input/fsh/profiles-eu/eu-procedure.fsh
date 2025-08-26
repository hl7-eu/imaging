Profile: ProcedureEu
Parent: Procedure
Title: "Procedure: EU Procedure"
Description: "A procedure profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )

* subject only Reference( $EuPatient )
* used
  * insert SliceElement( #type, concept )
* used contains device 0..1 
* used[device] only CodeableReference( $EuDevice )
* bodySite 
  * extension contains $body-site-url named bodyStructure 0..1
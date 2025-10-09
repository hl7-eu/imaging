Profile: ImProcedure
Parent: $EuProcedure
Title: "Procedure: Imaging Acquisition"
Description: "This profile on Procedure represents the imaging procedure."
* insert SetFmmAndStatusRule( 1, draft )

// reference to the order that has the Accession Number and including the Accession Number as identifier
// * basedOn
//   * insert SliceElement( #type, $this )
// * basedOn contains imorderaccession 0..1
// * insert BasedOnImOrderReference( imorderaccession )

* code 1..1
* code from ImProcedureType (extensible)

* performer 0..*
  * insert SliceElementWithDescription( #value, function, [[Different performers can be added to the procedure.]] )
  * function 1..1
* performer contains performer 0..* and imaging-device 0..*
* performer[performer]
  * function
    * coding
      * insert SliceElement( #value, "$this" )
    * coding contains healthcare-professional 0..1
    * coding[healthcare-professional] = $sct#223366009 // "Healthcare professional" // TODO check this code
  * actor only Reference($EuPractitionerRole)
* performer[imaging-device]
  * function
    * coding
      * insert SliceElement( #value, "$this" )
    * coding contains imaging-equipment 0..1
    * coding[imaging-equipment] = $sct#314789007 // "Diagnostic imaging equipment" // TODO check this code
  * actor only Reference(ImImagingDevice)

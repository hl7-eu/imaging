Profile: ImProcedure
Parent: Procedure
Id: im-procedure
Title: "Imaging Procedure"
Description: "This profile on Procedure represents the imaging procedure."
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

// reference to the order that has the Accession Number and including the Accession Number as identifier
* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains imorderaccession 0..1 MS
* insert BasedOnImOrderReference( imorderaccession )

* performer 0..* MS
  * insert SliceElementWithDescription( #value, "function", [[Different performers can be added to the procedure.]] )
  * function 1..1 MS
* performer contains performer 0..* MS and imaging-device 0..* MS
* performer[performer]
  * insert SetPopulateIfKnown
  * function
    * coding
      * insert SliceElement( #value, "$this" )
    * coding contains healthcare-professional 0..1 MS 
    * coding[healthcare-professional] = $sct#223366009 "Healthcare professional" // TODO check this code
  * actor only Reference(ImPerformer)
* performer[imaging-device]
  * insert SetPopulateIfKnown
  * function
    * coding
      * insert SliceElement( #value, "$this" )
    * coding contains imaging-equipment 0..1 MS 
    * coding[imaging-equipment] = $sct#314789007 "Diagnostic imaging equipment" // TODO check this code
  * actor only Reference(ImImagingDevice)

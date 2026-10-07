Profile: ProcedureEuImaging
Parent: $EuProcedure
Title: "Procedure: Imaging Acquisition"
Description: """
This profile on Procedure represents the imaging procedure. In this DICOM this is
referred as the 'Performed Procedure Step' (PPS). This profile is used to capture metadata about the imaging procedure itself.
"""
* insert SetFmmAndStatusRule( 1, draft )

// reference to the order that has the Accession Number and including the Accession Number as identifier
// * basedOn
//   * insert SliceElement( #type, $this )
// * basedOn contains ServiceRequestOrderEuImagingaccession 0..1
// * insert BasedOnServiceRequestOrderEuImagingReference( ServiceRequestOrderEuImagingaccession )

* code 1..1
* code from ProcedureEuImagingType (extensible)

* performer 0..*
  * insert SliceElementWithDescription( #value, function, [[Different performers can be added to the procedure.]] )
  * function 1..1
* performer contains performer 0..* and imaging-device 0..*
// The discriminating value must sit on `function` itself; a fixed value on a nested
// `function.coding` slice leaves the discriminator unevaluable for validators.
* performer[performer]
  * function = $sct#223366009 // "Healthcare professional"
  * actor only Reference($EuPractitionerRole)
* performer[imaging-device]
  * function = $sct#314789007 // "Diagnostic imaging equipment"
  * actor only Reference(DeviceEuImaging)

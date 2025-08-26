Profile: SpecimenEu
Parent: Specimen
Title: "Specimen: EU Specimen"
Description: """This profile defines how to represent Specimens in HL7 FHIR for the purpose of this guide."""

* insert SetFmmAndStatusRule( 1, draft )
* . ^short = "Laboratory Specimen"
* . ^definition = "Laboratory specimen"

* subject only Reference ( $EuPatient or Group  or $EuDevice or Substance or $EuLocation )
* parent only Reference( $EuSpecimen )

* collection
  * bodySite only CodeableReference( $EuBodyStructure )
  * collected[x] 1..1

* container
  * device only Reference( $EuDevice )
  * location only Reference( $EuLocation )
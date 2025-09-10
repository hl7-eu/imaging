Profile: AdverseEventEuImaging //ImAdverseEvent
Parent: AdverseEvent
Title: "AdverseEvent: Imaging Adverse Event"
Description: """Adverse Event that occurred during an imaging procedure."""
* insert SetFmmAndStatusRule( 1, draft )

* subject only Reference($EuPatient or Group or $EuPractitioner or $EuRelatedPerson or ResearchSubject )

* suspectEntity
  * insert SliceElement( #profile, instance )
* suspectEntity contains procedure 0..*
* suspectEntity[procedure].instanceReference only Reference(ProcedureEuImaging)

* contributingFactor
  * insert SliceElement( #profile, $this )
* contributingFactor contains allergy 0..*
* contributingFactor[allergy]
  * itemReference only Reference($EuAllergyIntolerance)
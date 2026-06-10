Profile: AdverseEventEuImaging
Parent: AdverseEvent
Title: "AdverseEvent: Imaging Adverse Event"
Description: """Adverse Event that occurred during an imaging procedure."""
* insert SetFmmAndStatusRule( 1, draft )

* suspectEntity
  * insert SliceElement( #profile, instance )
* suspectEntity contains procedure 0..*
* suspectEntity[procedure].instance only Reference(ProcedureEuImaging)
//R5* suspectEntity[procedure].instanceReference only Reference(ProcedureEuImaging)

* subjectMedicalHistory
  * insert SliceElement( #profile, $this )
* subjectMedicalHistory contains allergy 0..*
* subjectMedicalHistory[allergy]
* subjectMedicalHistory only Reference($EuAllergyIntolerance)

//R5* contributingFactor
//R5  * insert SliceElement( #profile, $this )
//R5* contributingFactor contains allergy 0..*
//R5* contributingFactor[allergy]
//R5  * itemReference only Reference($EuAllergyIntolerance)

Profile: AdverseEventEuImaging
Parent: AdverseEvent
Title: "AdverseEvent: Imaging Adverse Event"
Description: """Adverse Event that occurred during an imaging procedure."""
* insert SetFmmAndStatusRule( 1, draft )

* suspectEntity
  * insert SliceElement( #profile, instance )
* suspectEntity contains procedure 0..*
//R4* suspectEntity[procedure].instance only Reference(ProcedureEuImaging)
* suspectEntity[procedure].instanceReference only Reference(ProcedureEuImaging)

//R4* subjectMedicalHistory
//R4  * insert SliceElement( #profile, $this )
//R4* subjectMedicalHistory contains allergy 0..*
//R4* subjectMedicalHistory[allergy]
//R4* subjectMedicalHistory only Reference($EuAllergyIntolerance)

* contributingFactor
  * insert SliceElement( #profile, $this )
* contributingFactor contains allergy 0..*
* contributingFactor[allergy]
  * itemReference only Reference($EuAllergyIntolerance)

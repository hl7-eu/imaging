Profile: ImAdverseEvent
Parent: AdverseEvent
Title: "AdverseEvent: Imaging Adverse Event"
Description: """Adverse Event that occurred during an imaging procedure."""
* insert SetFmmAndStatusRule( 1, draft )

* suspectEntity
  * insert SliceElement( #profile, instance )
* suspectEntity contains procedure 0..*
{{R4}}* suspectEntity[procedure].instance only Reference(ImProcedure)
{{R5}}* suspectEntity[procedure].instanceReference only Reference(ImProcedure)

{{R4}}* subjectMedicalHistory
{{R4}}  * insert SliceElement( #profile, $this )
{{R4}}* subjectMedicalHistory contains allergy 0..*
{{R4}}* subjectMedicalHistory[allergy]
{{R4}}* subjectMedicalHistory only Reference($EuAllergyIntolerance)

{{R5}}* contributingFactor
{{R5}}  * insert SliceElement( #profile, $this )
{{R5}}* contributingFactor contains allergy 0..*
{{R5}}* contributingFactor[allergy]
{{R5}}  * itemReference only Reference($EuAllergyIntolerance)
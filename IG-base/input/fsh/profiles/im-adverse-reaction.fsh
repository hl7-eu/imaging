Profile: ImAdverseReaction
Parent: AdverseEvent
Id: im-adversereaction
Title: "Adverse Event"
Description: "Adverse event during imaging procedure."
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* extension contains ImAdverseEventCriticality named criticality 0..1

* code MS

* category 0..* MS

* resultingEffect 0..* MS

* seriousness 0..1 MS

* occurrence[x] 0..1 MS
* occurrence[x] only dateTime

* suspectEntity ^slicing.discriminator.type = #type
* suspectEntity ^slicing.discriminator.path = ".instanceReference[x]"
* suspectEntity ^slicing.rules = #open
* suspectEntity ^slicing.description = "Slice references to the Procedure instance in which it the adverse event occurred."
* suspectEntity ^slicing.ordered = false
* suspectEntity contains procedureEvent 1..1 MS
and medicationAdministered 0..1 MS

* suspectEntity[procedureEvent] 
  * instance[x] only Reference(ImProcedure)

* suspectEntity[medicationAdministered]
  * instance[x] only CodeableConcept or Reference(ImMedicationAdministration)

* suspectEntity.causality 0..1 MS
  // * causality
  //   * entityRelatedness 0..1 MS
  // * instance[x] 1..1 MS
  // * instance[x] only CodeableConcept or Reference(ImProcedure or Substance or Medication or MedicationAdministration)

* contributingFactor 0..* MS
  * item[x] 1..1 MS
  * item[x] only Reference(ImAllergicReaction)

* note MS

Extension: ImAdverseEventCriticality
Id: im-adverse-event-criticality
Title: "Imaging Adverse Event Criticality"
Description: "Replicates AllergyIntolerance.criticality to introduce functionality in AdverseEvent resource."
* insert SetFmmAndStatusRule(1, draft)
* ^context[+].type = #element
* ^context[=].expression = "AdverseEvent"
* value[x] only code
* value[x] from http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality
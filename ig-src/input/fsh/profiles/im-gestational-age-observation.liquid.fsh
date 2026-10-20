
Profile: ObservationGestationalAgeEuImaging
Parent: $EuObservation
Title: "Observation: Gestational Age"
Description: "Represents the gestational age of the current pregnancy, expressed as a time duration (typically completed weeks and/or months)."
* insert SetFmmAndStatusRule( 1, draft )

* code 1..1
* code from ValueSetGestationalAgeEuImaging (required)
* value[x] only Quantity
* valueQuantity 1..1 
* valueQuantity from http://hl7.org/fhir/ValueSet/units-of-time (required)
  * ^short = "The age of the fetus."
{{R4}}  * ^binding.extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
{{R4}}  * ^binding.extension[=].extension[+].url =  #key
{{R4}}  * ^binding.extension[=].extension[=].valueId =  "gestational-age-preferred-ucum"
{{R4}}  * ^binding.extension[=].extension[+].url =  #purpose
{{R4}}  * ^binding.extension[=].extension[=].valueCode =  #preferred
{{R4}}  * ^binding.extension[=].extension[+].url = #valueSet
{{R4}}  * ^binding.extension[=].extension[=].valueCanonical =  Canonical( ValueSetGestationalAgeTimeUnitsEuImaging )

{{R5}}  * ^binding.additional[+].purpose = #preferred
{{R5}}  * ^binding.additional[=].valueSet = Canonical( ValueSetGestationalAgeTimeUnitsEuImaging )
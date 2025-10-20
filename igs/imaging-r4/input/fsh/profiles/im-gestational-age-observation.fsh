Profile: ObservationGestationalAgeEuImaging
Parent: $EuObservation
Title: "Observation: Gestational Age"
Description: "Gestational Age Observation"
* insert SetFmmAndStatusRule( 1, draft )

* code 1..1
* code = $sct#598151000005105 // "Gestational age"
* value[x] only Quantity
* valueQuantity 1..1 
* valueQuantity from CommonUCUMCodesForAge (extensible)
  * ^short = "The age of the patient."
  * ^binding.extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
  * ^binding.extension[=].extension[+].url =  #purpose
  * ^binding.extension[=].extension[=].valueCode =  #maximum
  * ^binding.extension[=].extension[+].url = #valueSet
  * ^binding.extension[=].extension[=].valueCanonical =  Canonical( http://hl7.org/fhir/ValueSet/all-time-units )

//R5  * ^binding.additional[+].purpose = #maximum
//R5  * ^binding.additional[=].valueSet = Canonical( http://hl7.org/fhir/ValueSet/all-time-units )
    

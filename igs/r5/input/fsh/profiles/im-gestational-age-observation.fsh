Profile: ImGestationalAgeObservation
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
//R4  * ^binding.extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
//R4  * ^binding.extension[=].extension[+].url =  #purpose
//R4  * ^binding.extension[=].extension[=].valueCode =  #maximum
//R4  * ^binding.extension[=].extension[+].url = #valueSet
//R4  * ^binding.extension[=].extension[=].valueCanonical =  Canonical( http://hl7.org/fhir/ValueSet/all-time-units )

  * ^binding.additional[+].purpose = #maximum
  * ^binding.additional[=].valueSet = Canonical( http://hl7.org/fhir/ValueSet/all-time-units )
    

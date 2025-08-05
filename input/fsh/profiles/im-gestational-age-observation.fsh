Profile: ImGestationalAgeObservation
Parent: $EuObservation
Title: "Gestational Age Observation"
Description: "Gestational Age Observation"
* insert SetFmmAndStatusRule( 1, draft )

* code 1..1
* code = $sct#598151000005105
* value[x] only QuantityEu
* valueQuantity 1..1 
* valueQuantity from CommonUCUMCodesForAge (extensible)
  * ^short = "The age of the patient."
  * ^binding.additional[+].purpose = #maximum
  * ^binding.additional[=].valueSet = Canonical( http://hl7.org/fhir/ValueSet/all-time-units )
    

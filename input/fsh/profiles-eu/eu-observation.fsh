Profile: ObservationEu
Parent: Observation
Title: "Observation: EU Observation"
Description: "A observation profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )
* effective[x] 1..1

* code 1..1
//* code from $sct (preferred)

//* method from $sct (preferred)

* performer.extension contains $performer-function-url named performerFunction 0..1

* value[x] 1..1 
* value[x] only QuantityEu or RangeEu or CodeableConcept or string or integer or Ratio or SampledData or time or dateTime or Period or Attachment or Reference
  * extension contains $data-absent-reason-url named dataAbsentReason 0..1

* component
  * value[x] 1..1
  * value[x] only QuantityEu or RangeEu or CodeableConcept or string or integer or Ratio or SampledData or time or dateTime or Period or Attachment or Reference
    * extension contains $data-absent-reason-url named dataAbsentReason 0..1

Profile: QuantityEu
Parent: Quantity
Id: quantity-eu
Title: "Quantity: QuantityEu"
Description: "A quantity profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )
* extension contains $iso21090-uncertainty-url named uncertainty 0..1
* extension contains $iso21090-uncertainty-type-url named uncertaintyType 0..1

Profile: SimpleQuantityEu
Parent: SimpleQuantity
Title: "SimpleQuantity: SimpleQuantityEu"
Description: "A simple quantity profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )
* extension contains $iso21090-uncertainty-url named uncertainty 0..1
* extension contains $iso21090-uncertainty-type-url named uncertaintyType 0..1

Profile: RangeEu
Parent: Range
Id: range-eu
Title: "Range: RangeEu"
Description: "A range profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )
* low only SimpleQuantityEu
* high only SimpleQuantityEu
Profile: ImAllergicReaction
Parent: AllergyIntolerance
Id: im-allergic-reaction
Title: "Allergic Reaction"
Description: "This profile represents a suspected allergic reaction occurred during or due to an imaging study procedure."
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* verificationStatus 0..1 MS
  * ^short = "Verification status of the allergic reaction"
  * ^definition = "The verification status to support the allergic origin of the observed reaction"

* criticality 0..1 MS
  * ^short = "Criticality of the allergic reaction"
  * ^definition = "Potential risk for future life-threatening adverse reactions when exposed to a substance known to cause an adverse reaction."

* reaction 0..* MS
  * extension contains $allergy-intolerance-certainty-url named allergyCertainty 0..1 MS
  * substance 0..1 MS
  * manifestation 1..1 MS
  * severity 0..1 MS
  * onset 0..1 MS

* type 0..1 MS
  * ^short = "The type of the allergic reaction"
  * ^definition = "Type of underlying pathogenic mechanism for the reaction"

* note 0..1 MS
  * ^short = "Free text to capture additional information about the allergic reaction"
  * ^definition = "Additional information about the allergic reaction"
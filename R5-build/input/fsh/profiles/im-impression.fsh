Profile: ImImpression
Parent: Condition
Id: im-impression
Title: "Impression"
Description: "Impression of the imaging study. A conclusion drawn by the author based on the findings of the study."
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* clinicalStatus MS

// TODO do we need to define a category for an impression?

* subject MS
* subject only Reference( ImPatient )

* code MS
  * insert SetPopulateIfKnown

* stage MS
  * summary MS

// do we have to add evidence to the impression?
// TODO further refinement of this model.
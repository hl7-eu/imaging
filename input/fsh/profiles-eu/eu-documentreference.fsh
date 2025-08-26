Profile: DocumentReferenceEu
Parent: DocumentReference
Title: "DocumentReference: EU DocumentReference"
Description: "A DocumentReference profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )
// * extension contains $workflow-reason-url named reason 0..* // does not compile remove for now
* extension contains $note-url named note 0..1 and CrossVersionMediaViewExtension named view 0..1

Extension: CrossVersionMediaViewExtension
Title: "Media.view extension"
Description: "This cross version extension includes the FHIR R4 version of the Media.view field which has at this point in time (April 18, 2025), not yet been included in the extension pack."
Context: DocumentReference
* extension 0..0
* value[x] only CodeableConcept
* valueCodeableConcept from CrossVersionMediaView

ValueSet: CrossVersionMediaView
Id: media-view
Title: "Media View types - placeholder for cross-version extension"
Description: "Codes defined in SNOMED CT that can be used to record Media Recording views."
* insert SNOMEDCopyrightForVS
* ^experimental = false
* ^version = "4.0.1"
* include codes from system $sct where concept is-a #260419006

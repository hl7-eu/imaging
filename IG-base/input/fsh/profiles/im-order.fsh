Profile: ImOrder
Parent: ServiceRequest
Id: im-order
Title: "Imaging Order"
Description: "This profile on ServiceRequest represents the order for the Imaging Study and report."
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* identifier 
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
  * ^slicing.description = "Slice on identifier"
  * ^slicing.ordered = false
* identifier contains accessionNumber 0..1 MS  
* identifier[accessionNumber]
  * insert SetPopulateIfKnown
  * type 1..1 MS
  * type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
  * value 1..1 MS
  * system 1..1 MS

* status 1..1 MS

* subject 1..1 MS
* subject only Reference(ImPatient)

// TODO obligation for client?
* intent 1..1 MS

* insurance 0..1 MS
  * insert SetPopulateIfKnown
* insurance only Reference(ImCoverage)

* requester 0..1 MS
  * insert SetPopulateIfKnown
* requester only Reference(ImOrderPlacer or ImPatient)

* authoredOn 0..1 MS
  * insert SetPopulateIfKnown

* reason 0..* MS
  * insert SetPopulateIfKnown
  * ^short = "Clinical question/reason for the order"
  * ^definition = "The reason for the order. Can be coded, textual or a reference to a structured element."


Profile: ImAccessionNumberIdentifier
Parent: Identifier
Id: im-accession-number-identifier
Title: "Imaging Accession Number Identifier"
Description: "This profile on Identifier represents the Accession Number for the Imaging Order."
* insert SetFmmAndStatusRule( 1, draft )
* system 1..1 MS
* value 1..1 MS
* type 1..1 MS
* type = http://terminology.hl7.org/5.1.0/CodeSystem-v2-0203.html#ACSN

Profile: ImOrderReference
Parent: Reference
Id: im-order-reference
Title: "Imaging Accession Number Reference"
Description: "This profile on Reference represents a reference to an Imaging Order."
* insert SetFmmAndStatusRule( 1, draft )
* reference 1..1 MS
* identifier 0..1 MS
* identifier only ImAccessionNumberIdentifier
  * insert SetPopulateIfKnown

RuleSet: BasedOnImOrderReference( slicename )
* basedOn[{slicename}] only Reference( ImOrder )
* identifier 0..1 MS
* identifier only ImAccessionNumberIdentifier
  * insert SetPopulateIfKnown
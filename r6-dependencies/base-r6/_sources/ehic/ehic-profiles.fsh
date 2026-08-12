//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  CoverageEhic
Parent:   Coverage
Id:       coverage-eu-ehic
Title:    "Coverage (EHIC)"
Description: "Coverage profile for the European Health Insurance Card"
//-------------------------------------------------------------------------------------------
* insert SetFmmandStatusRule (2, trial-use)
* identifier 1..* // #8 card number
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[0].path = "system"
  * ^slicing.ordered = false
  * ^slicing.rules = #open
  * ^short = "EHIC Id"
  * ^definition = "Identifier for the EHIC card number"
* identifier contains ehic 0..1 // should be 1..1 when the value set will be completed
* identifier[ehic]
  * ^short = "EHIC#8 - Identification number of the card"
  * ^definition = "Logical number of the card"
  * system 1..1 
  * system from VsEHICCardIdUri (required)
  * value 1..1
* status 1..1 // 
* type 1..
* type = EuV3ActCode#ehic "European Health Insurance Card"  // to be added
* beneficiary 1..1 // #3, 4 ,5, 6
* beneficiary ^short = "EHIC fields #3 to #6 (Name, Id, birthDate)"
* beneficiary only Reference(PatientEhic)
* period 1..1 
* period.end 1..1 // #9 - Expiry date
* period.end ^short = "EHIC#9 - Expiry date"
* period.end ^definition = "Expiry date of the card"
* insurer 1..1
* insurer only Reference(Organization)
* insurer.display 1..1 // #7
* insurer.display ^short = "EHIC#7 - Identification number of the institution"
* insurer.display ^definition = "Identification number and acronym of the competent institution"
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile: PatientEhic
Parent: PatientEuCore
Id: patient-eu-ehic
Title: "Patient (EHIC)"
Description: "This profile represents the constraints applied to the Patient resource when used with the EHIC coverage profile."
* insert SetFmmandStatusRule (2, trial-use)
* identifier 1.. 
* identifier
  * system from VsEHICPersonalIdUri (extensible)
  * system 1..1
  * value 1..1
* name 1..*
* name.family 1..1 // #3
* name.family ^short = "EHIC#3 - Name"
* name.family ^definition = "Forename of the card holder"
* name.given 1.. // #4
* name.given ^short = "EHIC#4 - Given names"
* name.given ^definition = "Surname of the card holder"
* birthDate 1..1 // #5
* birthDate ^short = "EHIC#5 - Date of birth"
* birthDate ^definition = "Date of birth of the card holder"

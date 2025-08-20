Profile: AllergyIntoleranceEu
Parent: AllergyIntolerance
Title: "AllergyIntolerance: EU AllergyIntolerance"
Description: "A allergyintolerance profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )
* extension contains $allergyintolerance-abatement-url named abatement 0..1
* onset[x]
  * extension contains PeriodsOfLifeExtension named periodsOfLife 0..1


Extension: PeriodsOfLifeExtension
Id: periods-of-life-extension
Title: "Periods of Life Extension"
Description: "Allows to indicate a time period in a person's life as a reference to a coded value for that life period."
Context: AllergyIntolerance.onset[x]
* value[x] only CodeableConcept
* valueCodeableConcept from PeriodsOfLifeValueSet (extensible)


ValueSet: PeriodsOfLifeValueSet
Id: periods-of-life-value-set
Title: "Periods of Life"
Description: "A value set of periods of life extension ([SNOMED tree](https://browser.ihtsdotools.org/?perspective=full&conceptId1=767023003&edition=MAIN/2025-04-01&release=&languages=en))."
* insert SNOMEDCopyrightForVS
* ^experimental = false
* include codes from system $sct where concept is-a #282032007 "Periods of life (qualifier value)"
* exclude $sct#282032007

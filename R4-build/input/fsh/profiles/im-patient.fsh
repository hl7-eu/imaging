Profile: ImPatient
Parent: http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core
Id: im-patient
Title: "Imaging Patient"
Description: "Human patient representing the subject of a medical imaging study for the scope of the HL7 Europe project."
* . ^short = "Patient Im"
* . ^definition = "Human patient representing the subject of a medical imaging study for the scope of the HL7 Europe project."
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity

* extension contains $individual-genderIdentity named genderIdentity 1..1 MS

* name 1..* MS
  * use 0..1 MS
  * insert SetPopulateIfKnown
  * family 0..1 MS
    * insert SetPopulateIfKnown
  * given 0..* MS
    * insert SetPopulateIfKnown

* birthDate 1..1 MS
  * insert SetPopulateIfKnown

* identifier 0..* MS
  * insert SetPopulateIfKnown
  * ^definition = """ 
    An identifier of the patient that is unique within a defined
    scope. Example: Example: National ID (citizen card / eID),
    health number, passport, etc. Multiple identifiers could be
    provided.
    """
* gender 0..1 MS
  * insert SetPopulateIfKnown

* address 0..* MS
  * insert SetPopulateIfKnown
  * ^definition = """ 
    Mailing and home or office addresses. The addresses are always sequences of address parts (e.g., street address line, country, ZIP code, city) even if postal address formats may vary depending on the country. An address may or may not include a specific use code; if this attribute is not present it is assumed to be the default address useful for any purpose.
    """

* telecom 0..* MS
  * insert SetPopulateIfKnown
Profile: ImMedicationAdministration
Parent: MedicationAdministration
Id: im-medication-administration
Title: "Medication Administration"
Description: "Record of medication administration during imaging procedure."
* insert SetFmmAndStatusRule( 1, draft )
* insert MandateLanguageAndSecurity


* partOf MS
  * insert SetPopulateIfKnown
* partOf only Reference( ImProcedure )

* status MS

* medication MS
  * insert SetPopulateIfKnown
* medication only CodeableReference( ImMedication )

* subject MS
  * insert SetPopulateIfKnown
* subject only Reference( ImPatient )

* occurence[x] MS
  * insert SetPopulateIfKnown

* dosage MS
  * insert SetPopulateIfKnown
  * route MS
    * insert SetPopulateIfKnown
// TODO define valueset with route of administration codes from EQDM

  
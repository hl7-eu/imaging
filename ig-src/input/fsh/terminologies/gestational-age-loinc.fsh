ValueSet:   GestationalAgeLoincEuImaging
Id:             gestational-age-loinc-eu-imaging
Title:      "ValueSet: Gestational Age (LOINC)"
Description:   "LOINC codes with component Gestational age (LP19507-0), aligned with the European Patient Summary gestational-age value set."
* insert SetFmmAndStatusRule( 1, draft )
* insert LOINCCopyrightForVS
* ^experimental = false
* include codes from system $loinc where COMPONENT = #LP19507-0 "Gestational age"

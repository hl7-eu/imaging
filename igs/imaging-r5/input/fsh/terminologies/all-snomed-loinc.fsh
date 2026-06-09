ValueSet:   ImEUValueSetAllSnomedLoinc
Title:	    "ValueSet: All SNOMED CT and LOINC Codes"
Description:   """All SNOMED CT and LOINC Codes"""
* insert SetFmmAndStatusRule( 1, draft )
* ^experimental = false
* include codes from system $loinc
* include codes from system $sct
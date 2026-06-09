ValueSet: AllSnomedAndLoincCodes
Id: valueset-all-snomed-and-loinc-codes
Title: "ValueSet: All SNOMED CT and LOINC codes"
Description: "This value set includes all SNOMED CT and LOINC codes. This value set is to indicate recommended code systems in line with XtEHR recommendations."
* insert SNOMEDCopyrightForVS
* insert LOINCCopyrightForVS
* include codes from system $loinc
* include codes from system $sct

ValueSet: AllLoincCodes
Id: valueset-all-loinc-codes
Title: "ValueSet: All LOINC codes"
Description: "This value set includes all LOINC codes. This value set is to indicate recommended code systems in line with XtEHR recommendations."
* insert LOINCCopyrightForVS
* include codes from system $loinc

ValueSet: AllSnomedCodes
Id: valueset-all-snomed-codes
Title: "ValueSet: All SNOMED CT codes"
Description: "This value set includes all SNOMED CT codes. This value set is to indicate recommended code systems in line with XtEHR recommendations."
* insert SNOMEDCopyrightForVS
* include codes from system $sct

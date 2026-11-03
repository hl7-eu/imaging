ValueSet: ProcedureEuImagingTypeLoinc
Id: im-procedure-type-loinc
Title: "ValueSet: LOINC Radiology Procedure/Orderable Types"
Description: """
LOINC radiology procedure and orderable codes in class RAD, aligned with the
LOINC/RSNA Radiology Playbook.
"""
* insert SetFmmAndStatusRule( 1, draft )
* insert LOINCCopyrightForVS
* ^experimental = false
* include codes from system $loinc where CLASS regex "^RAD$"


/////////////////////////////////////////////////

ValueSet: ProcedureEuImagingTypeSnomed
Id: im-procedure-type
Title: "ValueSet: Imaging Procedure Type"
Description: """
This value set includes all imaging procedure types defined in SNOMED CT. The codes represent
combinations of the modality to be used and the procedure to be performed.

"""
* insert SetFmmAndStatusRule( 1, draft )
* insert SNOMEDCopyrightForVS
* ^experimental = false
* include codes from system $sct where concept is-a #363679005
* exclude $sct#363679005
* include codes from system $sct where concept is-a #423827005
* exclude $sct#423827005

/////////////////////////////////////////////////

ValueSet: ProcedureEuImagingTypeAllowed
Id: im-procedure-type-allowed
Title: "ValueSet: Allowed Imaging Procedure Types"
Description: """
Imaging procedure types defined by the SNOMED CT imaging procedure value set
or by the LOINC radiology procedure/orderable value set.
"""
* insert SetFmmAndStatusRule( 1, draft )
* ^experimental = false
* include codes from valueset ProcedureEuImagingTypeLoinc
* include codes from valueset ProcedureEuImagingTypeSnomed

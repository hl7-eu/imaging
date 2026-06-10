ValueSet: ProcedureEuImagingType
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
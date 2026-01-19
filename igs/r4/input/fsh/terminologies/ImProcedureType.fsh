ValueSet: ProcedureEuImagingType
Id: im-procedure-type
Title: "Imaging Procedure Type"
Description: "This value set includes all imaging procedure types."
* insert SetFmmAndStatusRule( 1, draft )
* insert SNOMEDCopyrightForVS
* ^experimental = false
* include codes from system $sct where concept is-a #363679005
* exclude $sct#363679005
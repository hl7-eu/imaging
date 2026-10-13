ValueSet: ImagingReportPracticeSetting
Id: imaging-report-practice-setting
Title: "ValueSet: Practice settings for imaging reports Value Set"
Description: "This value set includes dynamically all SNOMED CT codes descendants of Medical specialty (Snomed CT code #394733009) and Clinical specialty (Snomed CT code #394658006)."
* insert SetFmmAndStatusRule( 1, draft )
* ^experimental = false

// "<" is the SNOMED ECL descendant-of operator: all concepts at every level below the term (term itself not included).
* include codes from system $sct where constraint = "<! 394733009"
* include codes from system $sct where constraint = "<! 394658006"
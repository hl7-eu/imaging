ValueSet: Hl7EuImagingSectionValueSet
Id: valueset-diagnosticreport-notes
Title: "Section codes used to label annotations."
Description: "These codes define what an annotation annotates."
* insert SetFmmAndStatusRule( 1, draft )
* ^experimental = false
* $loinc#18726-0 "Imaging Study"
* $loinc#55115-0 "Order"
* $loinc#11329-0 "History"
* $loinc#55111-9 "Procedure"
* $loinc#18834-2 "Comparison"
* $loinc#59776-5 "Findings"
// * $loinc#19005-8 "Impression"
* $loinc#18783-1 "Recommendation"
* $loinc#73568-8 "Communication"

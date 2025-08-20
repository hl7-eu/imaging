Profile: ImReport
Parent: Bundle
Title: "Bundle: Imaging Report"
Description: "Document Bundle for Imaging Report"
* insert SetFmmAndStatusRule( 1, draft )
* type = #document
* entry 2..*
  * insert SliceElement( #profile, resource )
* entry contains 
    imComposition 1..1 and
    imDiagnosticReport 1..1
* entry[imComposition]
  * resource only ImComposition
* entry[imDiagnosticReport]
  * resource only ImDiagnosticReport
Profile: ImReport
Parent: Bundle
Title: "Bundle: Imaging Report"
Description: "Document Bundle for Imaging Report"
* insert SetFmmAndStatusRule( 1, draft )
* type = #document
* total ..0
* link ..0
* entry 2..*
  * insert SliceElement( #profile, resource )
  * link ..0
  * fullUrl 1..1
  * resource 1..
  * search ..0
  * request ..0
  * response ..0
* entry contains 
    imComposition 1..1 and
    imDiagnosticReport 1..1
* entry[imComposition]
  * resource only ImComposition
* entry[imDiagnosticReport]
  * resource only ImDiagnosticReport